package store.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import store.model.StoreProductDao;

@Controller
public class StoreCartController { //장바구니 컨트롤러
	
	private final String command = "/addCart.store";

	private final String cart = "storeCart";
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction() {
		//cart페이지로 넘어감
		
		return cart;
	}
}
