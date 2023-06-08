package store.controller;


import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreCartBean;
import store.model.StoreCartList;
import store.model.StoreProductBean;
import store.model.StoreProductDao;

@Controller
public class StoreCartController { //장바구니 컨트롤러
	
	private final String command = "/addCart.store"; //장바구니 추가
	private final String command2 = "redirect:/list.mall"; //장바구니 리스트 불러오기
	private final String cartPage = "storeCart";
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(	@RequestParam("product_code") int product_code,
							@RequestParam("cart_qty") int cart_qty,
							HttpSession session
							) {
		
		StoreCartList cart = (StoreCartList)session.getAttribute("cart");
		//장바구니 cart이 존재하는지 조회
		
		if(cart==null) {//장바구니 조회했는데 없을때 객체를 생성
			cart = new StoreCartList();
		}
		
		cart.addOrder(product_code, cart_qty);//장바구니에 상품코드랑 수량 입력
		
		session.setAttribute("cart", cart);//StoreCartList 세션설정
		
		return cartPage;
	}
	
	@RequestMapping(command2)
	public String doAction(HttpSession session,Model model) {
		
		StoreCartList cart = (StoreCartList)session.getAttribute("cart");
		//장바구니 cart이 존재하는지 조회
		
		Map<Integer,Integer> cartList = cart.getAllCartList();
		//map으로 등록되있는 cartlist 조회
		
		List<StoreCartBean> cartBeanlist = new ArrayList<StoreCartBean>();
		//StoreCartBean에 저장된 변수기준으로 list생성
		
		Set<Integer> keylist = cartList.keySet();
		//map에 저장되있는 key값 설정
		
		int totalAmount = 0;
		
		for(Integer product_code:keylist) {
			StoreCartBean shop = new StoreCartBean();//장바구니 bean 객체 생성
			StoreProductBean storeProductBean = storeProductDao.getProducDetailByNum(product_code);//상품코드 기준으로 정보 불러오기
			
		}
		
		model.addAttribute("cartBeanlist", cartBeanlist);
		model.addAttribute("totalAmount", totalAmount);
		
		
		return cartPage;
	}
}
