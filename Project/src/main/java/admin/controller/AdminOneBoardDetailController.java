package admin.controller;

import board.model.IndividualBoardBean;

import board.model.IndividualBoardDao;
import member.model.MemberBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AdminOneBoardDetailController {
	private final String command = "inBoarddetail.admin";
	private final String getPage = "adminOneDetailBoard";
	
	@Autowired
   IndividualBoardDao idao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam("moviecode") int moviecode,
			@RequestParam("pageNumber") int pageNumber,
			HttpSession session, Model model) {
		
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");

		IndividualBoardBean board = idao.getBoardByCode(moviecode);

		if(mb.getMember_id().equals("admin")) {
			model.addAttribute("board", board);
			model.addAttribute("pageNumber", pageNumber);
			return getPage;
		}
		
		if (board.getIssecret().equals("Y")) {
			if (mb == null || !mb.getMember_id().equals(board.getCustomer_id())) {
				return "individualDetailBoardError";
			}
		}

		model.addAttribute("board", board);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
}
