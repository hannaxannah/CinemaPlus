package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mypage.model.MypageDao;

@Controller
public class MypageCouponController {
	
	private final String command = "/myCouponList.mp";
	private final String gotopage = "membership";
	
	@Autowired
	MypageDao pdao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session) {
		
		session.getAttribute("loginInfo");
		
		return gotopage;
		}
	}
