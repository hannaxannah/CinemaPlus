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

import store.model.StoreCartList;
import store.model.StorePayDao;
import store.model.StorePayDetailBean;

@Controller
public class StorePayController {
	private final String command = "/pay.store";
	private final String getCouponPage = "couponGetPage";

	@Autowired
	StorePayDao storePayDao;
	
	@RequestMapping(command)
	public String getCoupon(
			@ModelAttribute("card") StorePayDetailBean storePayDetailBean,
			@RequestParam("pay_price") int pay_price,
			HttpSession session
			) {
		
		System.out.println("카드회사 : "+storePayDetailBean.getCard_company());
		System.out.println("카드번호 : "+storePayDetailBean.getCard_number());
		System.out.println("월월/년년 : "+storePayDetailBean.getCard_mmyy());
		System.out.println("패스워드2자리 : "+storePayDetailBean.getCard_pw());
		System.out.println("할부개월 : "+storePayDetailBean.getCard_installment());
		System.out.println("총 금액 : "+pay_price);
		
		StoreCartList cart = (StoreCartList)session.getAttribute("cart");
		
//		String customer_id = (String)session.getAttribute("id");
//		int pay_price = Integer.parseInt(request.getParameter("pay_price"));//총결제금액
//		String pay_type = request.getParameter("pay_type");
//		
//		//랜덤 생성되는 값
//	//	String pay_code = storeService.createPayCode();//결제코드15자리 (멤버변수로 빼놓음!!!)
//	
//
//		PayBean payBean = new PayBean();
//		payBean.setPay_code(pay_code);
//		payBean.setCustomer_id(customer_id);
//		payBean.setPay_type(pay_type);
//		payBean.setPay_price(pay_price);
//		payBean.setPay_date(pay_date);
//	//	payBean.setCancel_date(cancel_date);//취소일은 취소할 때 입력
//	//	payBean.setPay_status(pay_status);//디폴트 0:결제/1:취소신청/2:취소완료
//		
//		PayDetailBean payDetailBean = new PayDetailBean();
//	//	payDetailBean.setPayde_code(payde_code);//Auto increment
//	//	payDetailBean.setPay_code(pay_code);//pay테이블에서 갖고오기
//	//	payDetailBean.setItem_code(item_code);//cart테이블에서 갖고오기
//	//	payDetailBean.setCart_qty(cart_qty);//cart테이블에서 갖고오기
		
		
		return ""; //쿠폰발급페이지로 넘어가기
	}
	
	
	
	
	
	
	
}
