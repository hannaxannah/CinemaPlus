package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.model.IndividualBoardBean;
import member.model.MemberBean;
import mypage.model.MypageDao;
import store.model.StoreCouponBean;
import store.model.StoreCouponDao;

@Controller
public class MypageCouponController {
	
	private final String command = "/myCouponList.mp";
	private final String getPage = "myCouponList";
	
	@Autowired
	StoreCouponDao storeCouponDao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session, Model model) {
		
		if(session.getAttribute("loginInfo") == null) { //로그인 X
			return "redirect:/memberlogin";
		}
		else { //로그인 O
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			String member_code = loginInfo.getMember_code();

			List<StoreCouponBean> myCouponLists = storeCouponDao.getCouponByCode(member_code);
			System.out.println("myCouponLists  : "+myCouponLists );
			model.addAttribute("myCouponLists",myCouponLists);
			return getPage;
		}
	}
}