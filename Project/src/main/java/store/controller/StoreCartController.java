package store.controller;


import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import store.model.StoreCartBean;
import store.model.StoreCartList;
import store.model.StoreCouponBean;
import store.model.StoreCouponDao;
import store.model.StoreProductBean;
import store.model.StoreProductDao;

@Controller
public class StoreCartController { //장바구니 컨트롤러
	
	private final String command = "/addCart.store"; //장바구니 추가
	private final String list_command = "/cart.store"; //장바구니 리스트 불러오기
	private final String reload_command = "redirect:/cart.store"; //장바구니 리스트 불러오기
	private final String order_command = "order.store"; //결제
	private final String empty_command = "emptyAll.store"; //장바구니 전체 비우기
	
	private final String cartPage = "storeCart";//장바구니페이지
	private final String orderPage = "orderPage"; //결제페이지
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@Autowired
	StoreCouponDao storeCouponDao;
	
//장바구니에 상품추가
	@RequestMapping(command)
	public String doAction(	
							@RequestParam("product_code") int product_code,
							@RequestParam("cart_qty") int cart_qty,
							HttpSession session,
							HttpServletResponse response
							)throws IOException {
			
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
				
		StoreCartList cart = (StoreCartList)session.getAttribute("cart");
		//장바구니 cart이 존재하는지 조회
		
		if(cart==null) {//장바구니 조회했는데 없을때 객체를 생성
			
			cart = new StoreCartList();
			
		}else {//장바구니가 존재한다면
			if(cart.getAllCartList().containsKey(product_code)) { //장바구니세션에 삽입할 상품코드와 같은 key값이 존재한다면
				int before_qty = cart.getAllCartList().get(product_code); //기존에 존재하던 수량에
				int after_qty = before_qty+cart_qty; //삽입할 수량을 더해서 after_qty로 만들고
				cart.getAllCartList().put(product_code, after_qty); //장바구니에 담겨있는 상품코드의 수량을 삽입한다.
				return reload_command;
			}
		}
		
		cart.addOrder(product_code, cart_qty);//장바구니에 상품코드랑 수량 입력
		
		session.setAttribute("cart", cart);//StoreCartList 세션설정
		
		return reload_command;
	}
	
//	장바구니
	@RequestMapping(list_command)
	public String doAction(HttpSession session,
							Model model,
							HttpServletResponse response
							)throws IOException {
		
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
		StoreCartList cart = (StoreCartList)session.getAttribute("cart");
		//장바구니 cart이 존재하는지 조회
		Map<Integer,Integer> product_order_qty = null;
		if(cart.getAllCartList() == null) {
			return null;	
		}else {
			product_order_qty = cart.getAllCartList();
		}
		//상품의 주문 갯수가 저장되있는 map
		
		List<StoreCartBean> cartBeanList = new ArrayList<StoreCartBean>();
		//StoreCartBean에 저장된 변수기준으로 주문 list생성
		
		Set<Integer> keylist = product_order_qty.keySet();
		//map에 저장되있는 key값 설정
		
		for(Integer product_code:keylist) {
			StoreCartBean shop = new StoreCartBean();//장바구니 bean 객체 생성
			StoreProductBean storeProductBean = storeProductDao.getProducDetailByNum(product_code);//상품코드 기준으로 정보 불러오기
			shop.setProduct_image(storeProductBean.getProduct_image());
			shop.setProduct_code(storeProductBean.getProduct_code());
			shop.setProduct_name(storeProductBean.getProduct_name());
			if(storeProductBean.getProduct_price() != 0) {
				shop.setProduct_price(storeProductBean.getProduct_price());
			}
			shop.setProduct_sprice(storeProductBean.getProduct_sprice());
			shop.setProduct_point(storeProductBean.getProduct_point());
			shop.setCart_qty(product_order_qty.get(product_code));
			cartBeanList.add(shop);
		}
		
		
		model.addAttribute("cartBeanList", cartBeanList); //물품리스트
		
		session.setAttribute("cartSize", cartBeanList.size()); //장바구니에 담겨있는 물품 갯수를 담은 세션
		
		return cartPage;
	}

//결제페이지	
	@RequestMapping(order_command)
	public String doOrder(HttpSession session,Model model,HttpServletResponse response
			)throws IOException {
		
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
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String loginMember_code = member.getMember_code();
		
		List<StoreCouponBean> myCoupon = storeCouponDao.checkUserAvailableCoupon2(loginMember_code);
		//내 회원코드로 사용하지않은 쿠폰 불러오기
		
		StoreCartList cart = (StoreCartList)session.getAttribute("cart");
		//장바구니 cart이 존재하는지 조회
		
		Map<Integer,Integer> product_order_qty = cart.getAllCartList();
		//상품의 주문 갯수가 저장되있는 map
		
		List<StoreCartBean> cartBeanList = new ArrayList<StoreCartBean>();
		//StoreCartBean에 저장된 변수기준으로 주문 list생성
		
		Set<Integer> keylist = product_order_qty.keySet();
		//map에 저장되있는 key값 설정
		 
		
		for(Integer product_code:keylist) {
			StoreCartBean shop = new StoreCartBean();//장바구니 bean 객체 생성
			StoreProductBean storeProductBean = storeProductDao.getProducDetailByNum(product_code);//상품코드 기준으로 정보 불러오기
			shop.setProduct_image(storeProductBean.getProduct_image());
			shop.setProduct_code(storeProductBean.getProduct_code());
			shop.setProduct_name(storeProductBean.getProduct_name());
			if(storeProductBean.getProduct_price() != 0) { //할인되기 전 가격이 있다면
				shop.setProduct_price(storeProductBean.getProduct_price()); //할인되기 전 가격 설정
			}
			shop.setProduct_sprice(storeProductBean.getProduct_sprice());
			shop.setProduct_point(storeProductBean.getProduct_point());
			shop.setCart_qty(product_order_qty.get(product_code));
			cartBeanList.add(shop);
		}
		
		
		model.addAttribute("cartBeanList", cartBeanList); //물품리스트
		model.addAttribute("myCoupon", myCoupon); //내 쿠폰리스트
		
		return orderPage;
	}
	
	/*
	 * //카트 상품 수량 수정
	 * 
	 * @RequestMapping(modify_command) public String modifyCart(
	 * 
	 * @RequestParam() int ) {
	 * 
	 * 
	 * response.setCharacterEncoding("EUC-KR"); PrintWriter writer;
	 * 
	 * writer = response.getWriter(); if(session.getAttribute("loginInfo") == null)
	 * { writer.println("<script type='text/javascript'>");
	 * writer.println("alert('수량이 변경되었습니다.');");
	 * writer.println("location.href = 'redirect:/cart.store' ");
	 * writer.println("</script>"); writer.flush(); return null; }
	 * 
	 * 
	 * return cartPage; //결제페이지 }
	 */
	
//카트에 등록되있는 상품 제거	
	@RequestMapping(empty_command)
	public String emptyCart(HttpSession session) {
		
		StoreCartList storeCartList = new StoreCartList();
		storeCartList.removeCartList();
		session.removeAttribute("cart");
		session.removeAttribute("cartSize");
		
		return cartPage; //결제페이지
	}
}
