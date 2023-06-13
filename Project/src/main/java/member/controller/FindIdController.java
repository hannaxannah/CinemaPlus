package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class FindIdController {

	private final String command = "findid.mb";
	private final String getPage = "findIdForm";
	private final String gotoPage = "redirect:/main.mn";
	@Autowired
	MemberDao mdao;

	
	 @RequestMapping(value = command, method = RequestMethod.GET)
	 public String doActionByGet() {
	 
		 return getPage; 
		 
	 }
	 
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String findId(Model model,
			@RequestParam("member_name") String member_name,
			@RequestParam("member_birth") String member_birth,
			@RequestParam("member_phone") String member_phone, MemberBean MemberBean,
			HttpServletResponse response)throws Exception {

		model.addAttribute("id", find_id(response, member_name,member_birth,member_phone));
		return "/member/find_id";
			
		}

	private Object find_id(HttpServletResponse response, String member_name, String member_birth, String member_phone) {
		// TODO Auto-generated method stub
		return null;
	}
		
}
