package admin.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import store.model.StoreCouponBean;
import store.model.StoreCouponDao;
import store.model.StoreProductBean;
import store.model.StoreProductDao;


@Controller
public class adminStoreController {
	private final String command = "/productList.admin";
	
	private final String listPage = "adminProductList";
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(command)
	public String adminProductList(Model model) {
		
		List<StoreProductBean> ProductList = storeProductDao.getAllProduct(); //전체 상품목록리스트
		
		model.addAttribute("ProductList", ProductList);//전체 상품을 담은 products
		
		return listPage;
	}
	
	
}
