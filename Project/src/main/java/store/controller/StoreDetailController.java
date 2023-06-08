package store.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreProductBean;
import store.model.StoreProductDao;


@Controller
public class StoreDetailController { //상품 상세보기 컨트롤러
	
	private final String command = "/productDetail.store";
	private final String detail = "storeDetail";
	private final String list = "storeProductList";
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(@RequestParam("product_code") int p_code, Model model) {
		//list에서 product_code를 p_code로 넘겨받고 p_code를 바탕으로 물건 정보를 불러옴
		
		StoreProductBean productDetail = storeProductDao.getProducDetailByNum(p_code);
		
		model.addAttribute("productDetail", productDetail);
		
		return detail;
	}
}
