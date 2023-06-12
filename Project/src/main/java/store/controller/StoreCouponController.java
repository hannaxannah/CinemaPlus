package store.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreCouponBean;
import store.model.StoreCouponDao;

@Controller
public class StoreCouponController {
	private final String command = "/getCoupon.store";
	private final String getCouponPage = "couponGetPage";
	
	private final String admin_command = "/couponAdmin.store";
	private final String getCouponAdminPage = "couponAdmin";
	
	@Autowired
	StoreCouponDao storeCouponDao;
	
	@RequestMapping(command)
	public String doAction() {
		
		return getCouponPage; //쿠폰발급페이지로 넘어가기
	}
	
	@RequestMapping(value=admin_command,method = RequestMethod.GET)
	public String admin_Page() {
		
		return getCouponAdminPage; //관리자의 쿠폰생성 페이지로 넘어가기
	}

	@RequestMapping(value=admin_command,method = RequestMethod.POST)
	public String admin_Page(
				@ModelAttribute("storeCouponBean") @Valid StoreCouponBean storeCouponBean
			) {
		
		int confirm = storeCouponDao.createCoupon(storeCouponBean); //삽입하고 삽입됬는지 확인하는 confirm변수
		
		
		
		return getCouponPage; //관리자의 쿠폰생성 페이지로 넘어가기
	}
	
	
	
}
