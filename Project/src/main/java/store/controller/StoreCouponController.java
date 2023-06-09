package store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreCouponController {
	private final String command = "/getCoupon.store";
	private final String getCouponPage = "couponGetPage";
	
	
	@RequestMapping(command)
	public String doAction() {
		
		return getCouponPage;
	}
	
}
