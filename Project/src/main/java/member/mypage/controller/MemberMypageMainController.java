package member.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.IndividualBoardDao;
import member.model.MemberBean;
import member.model.MemberDao;
import mypage.model.MypageDao;
import store.model.StoreCouponBean;

@Controller
public class MemberMypageMainController {
	
	private final String command = "/mypage_main.mb";
	private final String getPage = "mypage_Main";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam("member_id") String member_id,
			Model model, HttpServletRequest request,
			HttpSession session) {
		
		System.out.println("member_id: "+member_id);
		
		ModelAndView mav = new ModelAndView();
		MemberBean mybean = mdao.GetMemberById(member_id);
		MemberBean id = (MemberBean) session.getAttribute("loginInfo");
		int couponSize = mdao.MyUsableCouponCount(id.getMember_code());
		mav.addObject("mybean", mybean);
		mav.addObject("couponSize", couponSize);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
}