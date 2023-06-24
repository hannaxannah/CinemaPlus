package store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreCouponBean;
import store.model.StoreCouponDao;
import store.model.StoreCoupon_UserBean;

@Controller
public class StoreCouponController {
	private final String command = "/getCoupon.store";
	private final String getCouponPage = "couponGetPage";
	private final String re_getCouponPage = "redirect:/getCoupon.store";
	
	private final String create_command = "/couponCreate.store";
	private final String getCouponCreatePage = "adminCouponCreate";
	
	private final String management_command = "/couponManagement.store";
	private final String getCouponManagementPage = "adminCouponList";
	
	private final String issue_command = "/couponIssue.store";

	@Autowired
	StoreCouponDao storeCouponDao;
	
	@RequestMapping(command)
	public String getCoupon(
			@RequestParam(value="member_code",required = false) String member_code,
			Model model
			) {
		
		List<StoreCouponBean> couponList = storeCouponDao.getAllCoupon(); //전체 쿠폰 리스트
		List<String> myCouponList = storeCouponDao.checkUserAvailableCoupon(member_code);
		
		model.addAttribute("couponList", couponList);//쿠폰 list
		model.addAttribute("myCouponList", myCouponList);//쿠폰 list
		
		return getCouponPage; //쿠폰발급페이지로 넘어가기
	}
	
	@RequestMapping(value=create_command,method = RequestMethod.GET)
	public String admin_Page() {
		
		return getCouponCreatePage; //관리자의 쿠폰생성 페이지로 넘어가기
	}
	
	@RequestMapping(value=create_command,method = RequestMethod.POST)
	public String admin_Page(
				@ModelAttribute("storeCouponBean") @Valid StoreCouponBean storeCouponBean
			) {
		
		int confirm = storeCouponDao.createCoupon(storeCouponBean); //삽입하고 삽입됬는지 확인하는 confirm변수
		
		if(confirm == 1) {
			System.out.println("쿠폰 생성 성공");
			
			return getCouponPage; //쿠폰 발급페이지로 넘어가기 
		}else {
			System.out.println("쿠폰 생성 실패");
			
			return getCouponCreatePage; //쿠폰 생성 실패 생성페이지로 돌아가기
		}
		
	}
	
	@RequestMapping(management_command)
	public String management_Page(Model model) {
		 
		List<StoreCouponBean> couponList = storeCouponDao.getAllCoupon(); //전체 쿠폰 리스트
		
		model.addAttribute("couponList", couponList);//쿠폰 list
		
		return getCouponManagementPage;//property설정 해줘야되서 store폴더의 send로 admin href 실행
	}
	
	@RequestMapping(issue_command)
	public String management_Page(
			@RequestParam("coupon_code") String coupon_code,
			@RequestParam("member_code") String member_code,
			Model model,
			HttpServletResponse response,
			HttpSession session
			)throws IOException {//로그인한 세션 회원에게 쿠폰발급
		
		response.setCharacterEncoding("EUC-KR");
		PrintWriter writer;
		
		writer = response.getWriter();
		if(session.getAttribute("loginInfo") == null) {
		     writer.println("<script type='text/javascript'>");
		     writer.println("alert('로그인 후 이용가능한 서비스입니다. 로그인 페이지로 이동합니다.');");
		     writer.println("location.href = 'memberlogin' ");
		     writer.println("</script>");
		     writer.flush();
		     return null;
		}
		else if(session.getAttribute("loginInfo") != null) {
			StoreCoupon_UserBean storeCoupon_UserBean = new StoreCoupon_UserBean(); 
			storeCoupon_UserBean.setMember_code(member_code);
			storeCoupon_UserBean.setCoupon_code(coupon_code);
			
			Boolean flag = storeCouponDao.checkDuplicateCoupon(storeCoupon_UserBean);//로그인한 회원의 쿠폰보유 여부
			if(flag != true) {//로그인한 회원이 발급버튼을 누른 쿠폰을 가지고 있지않다면
				int confirm = storeCouponDao.issueCoupon(storeCoupon_UserBean);
				
				if(confirm == 1) {
					storeCouponDao.decreaseCouponQty(coupon_code);
					writer.println("<script type='text/javascript'>");
					writer.println("alert('쿠폰 발급되었습니다.');");
					writer.println("location.href = 'getCoupon.store?member_code="+member_code+"' ");
					writer.println("</script>");
					writer.flush();
					return null;
				}else {
					writer.println("<script type='text/javascript'>");
					writer.println("alert('쿠폰 발급에 실패했습니다.');");
					writer.println("location.href = 'getCoupon.store?member_code="+member_code+"' ");
					writer.println("</script>");
					writer.flush();
					return null;
				}
			}else {//회원이 만약 쿠폰을 가지고 있다면 회원 페이지에서는 접근 불가능하지만 비정상적 접근으로 쿠폰 발급하려할때 나오는 메세지
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비정상적인 접근입니다. 이미 가지고 있는 쿠폰입니다.');");
				writer.println("location.href = 'getCoupon.store?member_code="+member_code+"' ");
				writer.println("</script>");
				writer.flush();
				return null;
			}
		}
		
		return re_getCouponPage;
	}
	
	
}
