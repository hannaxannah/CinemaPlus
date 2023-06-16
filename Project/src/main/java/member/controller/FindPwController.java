package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;


@Controller
public class FindPwController {

	private final String command = "findpw.mb";
	private final String getPage = "findPwForm";
	private final String gotoPage = "memberLoginForm";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionByGet() {
		
		return getPage;
	}
	
	
	@RequestMapping(value=command, method= RequestMethod.POST)
	public String doAction(
			@RequestParam("member_id")String id,
			@RequestParam("member_name")String name,
			@RequestParam("member_birth")String birth,
			@RequestParam("member_phone")String phone,
			HttpServletResponse response) {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		MemberBean mbpw = new MemberBean(id,name,birth,phone);
		MemberBean m_pw = mdao.findPw(mbpw);

		
		
		if(m_pw == null) {
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
				out.println("<script>alert('회원님의 비밀번호는 "+ m_pw.getMember_pw() +" 입니다.');</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return gotoPage;
	}

}
