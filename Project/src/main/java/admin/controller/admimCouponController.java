package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import store.model.StoreCouponBean;
import store.model.StoreCouponDao;


@Controller
public class admimCouponController {
	private final String command = "/coupon.admin";
	private final String mainPage = "adminCouponList";
	
	@Autowired
	StoreCouponDao storeCouponDao;
	
	@RequestMapping(command)
	public String adminCouponList(Model model) {
		
		List<StoreCouponBean> CouponList = storeCouponDao.getAllCoupon(); //전체 상품목록리스트
		
		model.addAttribute("couponList", CouponList);//전체 상품을 담은 products
		
		return mainPage;
	}
}
