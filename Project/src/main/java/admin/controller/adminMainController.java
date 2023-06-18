package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminMainController {
	private final String command = "/admin.admin";
	private final String mainPage = "adminTest"; //테스트용 페이지
	
	//테스트용
	@RequestMapping(command)
	public String adminMain() {
		
		return mainPage;
	}
	
}
