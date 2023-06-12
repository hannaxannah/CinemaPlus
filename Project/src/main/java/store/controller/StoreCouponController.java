package store.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import store.model.StoreCouponBean;
import store.model.StoreCouponDao;
import store.model.StoreProductBean;

@Controller
public class StoreCouponController {
	private final String command = "/getCoupon.store";
	private final String getCouponPage = "couponGetPage";
	
	private final String create_command = "/couponCreate.store";
	private final String getCouponCreatePage = "couponCreate";
	
	private final String management_command = "/couponManagement.store";
	private final String getCouponManagementPage = "couponManagement";
	
	@Autowired
	StoreCouponDao storeCouponDao;
	
	@RequestMapping(command)
	public String doAction(Model model) {
		
		List<StoreCouponBean> couponList = storeCouponDao.getAllCoupon(); //전체 쿠폰 리스트
		
		model.addAttribute("couponList", couponList);//쿠폰 list
		
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
		
		return getCouponManagementPage;
	}
	
	
}
