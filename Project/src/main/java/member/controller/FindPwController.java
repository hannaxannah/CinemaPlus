package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberDao;


@Controller
public class FindPwController {

	private final String command = "findpw.mb";
	private final String getPage = "findPwForm";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionByGet() {
		
		return getPage;
	}
}
