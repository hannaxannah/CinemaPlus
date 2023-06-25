package mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageMemberInfoController {

	private final String command = "memberinfo.mp";
	private final String getPage = "mypageMemberInfo";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionByGet() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionByPost() {
		
		/*alert : 수정이 완료되었습니다*/
		
		return getPage;
	}
	
}
