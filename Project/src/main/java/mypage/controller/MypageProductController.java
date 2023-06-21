package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import mypage.model.MypageDao;
import store.model.StoreCouponDao;
import store.model.StorePaymentBean;
import store.model.StorePaymentDao;
import store.model.StoreProductDao;

@Controller
public class MypageProductController {
	
	private final String command = "/myProductList.mp";
	private final String gotopage = "myProductList";
	
	private final String detail_command = "/order_detail.mp";//주문 상세페이지
	private final String detail_page = "orderdetail"; //주문 상세페이지 이동
	
	@Autowired
	MypageDao pdao;
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@Autowired
	StorePaymentDao storePaymentDao;

	@Autowired
	StoreCouponDao storeCouponDao;
	
	
	@RequestMapping(command)
	public String doAction(HttpServletResponse response,HttpSession session, Model model)throws IOException {
		
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		
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
		
		String member_code = mb.getMember_code();
		
		List<StorePaymentBean> myPaylist = storePaymentDao.myPayment_code(member_code);	
		//System.out.println("결제 내역 코드"+myPaylist);
		
		if(myPaylist.size() == 0) {
			System.out.println("결제내역 없음");
			model.addAttribute("order",myPaylist);
			return gotopage;
		}else {
			//Payment 테이블에서 member_code기준으로 구매일/결제번호/구매 품목수/결제금액(card_number로 어디회사 카드인지 표시)/상세보기
//				List<StorePaymentBean> order = storePaymentDao.myOrderInfo(myPaylist);//나의 주문내역에서 결제코드를 순서대로 넣어서 정보 받아오기
//			
				System.out.print("오더1 : "+myPaylist.get(0).getPayment_code());
				System.out.print("오더2 : "+myPaylist.get(1).getPayment_code());
				System.out.print("오더3 : "+myPaylist.get(2).getPayment_code());
				
				model.addAttribute("order", myPaylist);
		}
		
		return gotopage;
	}
	
	//주문상세보기는 payment_code 기준으로 card의 정보(카드번호/카드회사/유효기간/비밀번호/할부개월)과
	//상품목록도 payment_code 기준으로 product_code를 불러와서 product_code기준으로 (사진/이름/가격/포인트/갯수)
	//갯수랑 가격으로 총금액을 넣고 payment_sale_pay가 들어가있다면 그 금액을 총금액-sale_pay해서 계산금액을 출력시킨다.
	
	}