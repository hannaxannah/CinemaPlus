package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class FindIdController {

	private final String command = "findid.mb";
	private final String getPage = "findIdForm";
	private final String gotoPage = "memberLoginForm";
	
	@Autowired
	MemberDao mdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionByGet(HttpSession session) {
	 
		session.getAttribute("loginInfo");
		
		 return getPage;
	 }
	
	
	@RequestMapping(value=command, method= RequestMethod.POST)
	public String doAction(
			@RequestParam("member_name")String name,
			@RequestParam("member_birth")String birth,
			@RequestParam("member_phone")String phone,
			HttpServletResponse response) {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		MemberBean mbid = new MemberBean(name,birth,phone);
		MemberBean m_id = mdao.findId(mbid);

		
		
		if(m_id == null) {
			System.out.println("가입정보가 없는 회원");

			try {
				out = response.getWriter();
				out.println("<script>alert('가입정보가 없습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return getPage;
		}
		else {
			System.out.println("가입된 회원");

			try {
				out = response.getWriter();
				out.println("<script>alert('회원님의 아이디는 "+ m_id.getMember_id() +" 입니다.');</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return gotoPage;
	}

}
