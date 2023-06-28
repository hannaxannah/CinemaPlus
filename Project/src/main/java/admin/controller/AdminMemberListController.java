package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import movie.model.MovieBean;

@Controller
public class AdminMemberListController {
	
	private final String command = "memberList.admin";
	private final String getPage = "adminMemberAllList";
	
	@Autowired
	MemberDao mdao;
		
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(Model model) {
		
		List<MemberBean> memberList = mdao.getAllMemberList();
		
		model.addAttribute("memberList", memberList);
		
		
		return getPage;
	}
		
}
