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
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenDao;
import mypage.model.MypageDao;

@Controller
public class MypageMembershipController {
	
	private final String command = "/membership.mp";
	private final String gotopage = "membership";
	
	@Autowired
	MypageDao pdao;
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session, Model model) {
		
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		String id = memberBean.getMember_id();
		
		System.out.println("멤버쉽 id: " + id);
		int reservCount = screenDao.getReservCountById(id);
		
		model.addAttribute("reservCount", reservCount);
		return gotopage;
		}
	}
