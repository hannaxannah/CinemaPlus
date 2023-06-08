package store.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import store.model.StoreProductBean;
import store.model.StoreProductDao;


@Controller
public class StoreListController {// 전체 상품 목록 불러오는 컨트롤러
	
	private final String command = "/list.store";
	private final String list = "storeProductList";
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(command)
	public String doAction(Model model) {
		
		List<StoreProductBean> products = storeProductDao.getAllProduct();
		
		model.addAttribute("products", products);
		
		return list;
	}
}
