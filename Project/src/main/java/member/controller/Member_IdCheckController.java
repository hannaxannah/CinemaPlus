package member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;


@Controller
public class Member_IdCheckController {
	
	private final String command = "/id_check_proc.mb";
	
	@Autowired
	MemberDao mdao;

	@RequestMapping(command)
	@ResponseBody
	public String doAction(@RequestParam("inputid") String inputid, 
			HttpServletResponse response) {

		System.out.println("id_check_proc.mv");
		boolean result = mdao.searchId(inputid); 

		if(result) {
			return "N"; 
		
		}else
			return "Y";

	}
	
	
	
	
	
	
	
}
