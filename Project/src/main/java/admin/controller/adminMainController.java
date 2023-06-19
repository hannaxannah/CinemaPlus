package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminMainController {
	private final String command = "/adminTest1.admin";
	private final String command2 = "/adminTest2.admin";
	private final String mainPage = "adminTest"; //테스트용 페이지
	private final String mainPage2 = "adminTest2"; //테스트용 페이지
	
	//테스트용
	@RequestMapping(command)
	public String adminMain() {
		
		return mainPage;
	}
	
	//테스트용2
	@RequestMapping(command2)
	public String adminMain2() {
		
		return mainPage2;
	}
	
}
