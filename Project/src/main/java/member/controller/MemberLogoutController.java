package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {
	
	private final String command = "logout.mb";
	private final String getPage = "redirect:/main.mn";
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session) {
		
		session.setAttribute("loginInfo", null);
		return getPage;
	}
}
