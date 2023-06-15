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
	
	@Autowired
	MypageDao pdao;
	
	@RequestMapping(command)
	public ModelAndView doAction(HttpSession session, Model model) {
		
	session.getAttribute("loginInfo");
		
		ModelAndView mav = new ModelAndView();
		
		String productList = null;
		
		mav.addObject("productList", productList);
		mav.setViewName(gotopage);
		
		return mav;
		}
	}