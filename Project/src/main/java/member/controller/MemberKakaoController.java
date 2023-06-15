package member.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;


@Controller
public class MemberKakaoController {
	
	@Autowired
	private Member_Service ms;
	
	@Autowired 
	MemberDao mdao;
	
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	@RequestMapping(value = "kakao.mb", method = RequestMethod.GET)
	public String kakaoLogin(
					@RequestParam(value = "code", required = false) String code,
					@RequestParam("member_email") String email,
					HttpServletResponse response,HttpSession session)throws Throwable {

		// 1번
		System.out.println("code:" + code);
		
			
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
		String access_Token = ms.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		//System.out.println("가입한이메일:"+join_email);
		
		HashMap<String, Object> loginInfo = ms.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + loginInfo.get("nickname"));
		System.out.println("###email#### : " + loginInfo.get("email"));
		
		MemberBean mb = mdao.getMemberByEmail(email);
		System.out.println("mb:" + mb);
		
		
		session.setAttribute("nickname", loginInfo.get("nickname"));
		
		return "redirect:/main.mn";
	}

	@RequestMapping(value="/kakaologout.mb")
	public String logout(HttpSession session) {
		ms.logout((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:/main.mn";
	}
	
}