package mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import mypage.model.MypageDao;
import store.model.StoreCouponBean;

@Controller
public class MypageMainController {
	/*
	
	private final String command = "/mypage_main.mp";
	private final String getPage = "mypageMain";
	
	@Autowired
	MypageDao pdao;
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	StoreCouponBean sdao;
	
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam("member_id") String member_id,
			Model model, HttpServletRequest request) {
		
		System.out.println("member_id: "+member_id);
		
		ModelAndView mav = new ModelAndView();
		MemberBean mybean = pdao.GetMypageById(member_id);
		
		mav.addObject("mybean", mybean);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
	*/
	
	
}