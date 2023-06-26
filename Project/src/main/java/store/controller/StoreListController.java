package store.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreProductBean;
import store.model.StoreProductDao;
import store.model.StoreProduct_CategoryBean;


@Controller
public class StoreListController {// 전체 상품 목록 불러오는 컨트롤러
	
	private final String command = "/list.store";
	private final String list = "storeProductList";
	
	private final String category_command = "/categorylist.store";
	private final String category_list = "categoryProductList";

	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(command)
	public String doAction(Model model) {
		
		List<StoreProductBean> products = storeProductDao.getAllProduct(); //전체 상품목록리스트
		
		model.addAttribute("products", products);//전체 상품을 담은 products
		
		return list;
	}
	
	@RequestMapping(category_command)
	public String categoryAction(
			@RequestParam("category_name") String category_name,
			Model model) {
		
		List<StoreProductBean> products = storeProductDao.getProductByCategory(category_name);
		
		model.addAttribute("products",products );//전체 상품을 담은 products
		model.addAttribute("category_name",category_name );//전체 상품을 담은 products
		
		
		return category_list;
	}
}
