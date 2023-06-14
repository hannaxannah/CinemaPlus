package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import board.model.IndividualBoardBean;
import board.model.IndividualBoardDao;
import member.model.MemberBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import utility.Paging;


@Controller
public class IndividualBoardMyListController {
	private final String command = "/myList.in";
	private final String getPage = "individualBoardMyList";
	
	@Autowired
   IndividualBoardDao idao;
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session, Model model) {
		
		if(session.getAttribute("loginInfo") == null) { //로그인 X
			return "redirect:/memberlogin.mb";
		}
		else { //로그인 O
			MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
			String member_id = loginInfo.getMember_id();

			List<IndividualBoardBean> lists = idao.getBoardById(member_id);
			model.addAttribute("lists",lists);
			return getPage;
		}
	}
}
