package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "memberlogin.mb";
	private final String getPage = "memberLoginForm";
	private final String gotoPage = "redirect:/mainLogined.mn";

	@Autowired 
	MemberDao mdao;
	
	/* 로그인 폼으로 이동 */
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String login() {
		return getPage;
	} 

	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam("member_id") String input_id,
			@RequestParam("member_pw") String input_pw,
			HttpServletResponse response, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		
		MemberBean mb = mdao.getMemberById(input_id);
		System.out.println("mb:" + mb);
		
		if(mb == null) {
			System.out.println("가입하지 않은 회원");
			
			try {
				out = response.getWriter();
				out.println("<script>alert('해당 아이디는 존재하지 않습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
				mav.setViewName(getPage);
			
		}else {
			System.out.println("가입한 회원");
			
			if(mb.getMember_pw().equals(input_pw)) {
				// 로그인
				session.setAttribute("loginInfo", mb);//세션설정
				
				//mav.setViewName((String) session.getAttribute("destination")); //productInsertController에서 작성했음(redirect:/insert.prd)
				mav.setViewName(gotoPage);
			}else { // 가입은 했는데 비번이 일치하지 않는다.
				
				try {
					out = response.getWriter();
					out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				mav.setViewName(getPage);
			}
		}
		
		return mav;
	}
	
	
	
}