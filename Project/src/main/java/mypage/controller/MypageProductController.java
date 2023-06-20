package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mypage.model.MypageDao;

@Controller
public class MypageProductController {
	
	private final String command = "/myProductList.mp";
	private final String gotopage = "myProductList";
	
	private final String detail_command = "/order_detail.mp";//주문 상세페이지
	private final String detail_page = "orderdetail"; //주문 상세페이지 이동
	
	@Autowired
	MypageDao pdao;
	
	@RequestMapping(command)
	public ModelAndView doAction(HttpSession session, Model model) {
		
	session.getAttribute("loginInfo");
		
		ModelAndView mav = new ModelAndView();
		
		//Payment 테이블에서 member_code기준으로 구매일/결제번호/구매 품목수/결제금액(card_number로 어디회사 카드인지 표시)/상세보기
		
		String productList = null;
		
		mav.addObject("productList", productList);
		mav.setViewName(gotopage);
		
		return mav;
		}
	
	//주문상세보기는 payment_code 기준으로 card의 정보(카드번호/카드회사/유효기간/비밀번호/할부개월)과
	//상품목록도 payment_code 기준으로 product_code를 불러와서 product_code기준으로 (사진/이름/가격/포인트/갯수)
	//갯수랑 가격으로 총금액을 넣고 payment_sale_pay가 들어가있다면 그 금액을 총금액-sale_pay해서 계산금액을 출력시킨다.
	
	}