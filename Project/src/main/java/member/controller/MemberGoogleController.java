package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class MemberGoogleController {

	@Autowired
	private member_googleService gs;
	
	@Autowired 
	MemberDao mdao;
	
	HttpServletResponse response;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "member.model.MemberBean";
	
	
	@RequestMapping(value = "google.mb", method = RequestMethod.GET)
	public String googleLogin(
					@RequestParam(value = "code", required = false) String code,
					HttpServletResponse response,HttpSession session, Model model, HttpServletRequest request)throws Throwable {

		// 1번
		System.out.println("code:" + code);
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
				String access_Token = gs.getGoogleAccessToken(code);
				System.out.println("###access_Token#### : " + access_Token);
				//System.out.println("가입한이메일:"+join_email);
				
				HashMap<String, Object> loginInfo = gs.getUserInfo(access_Token);
				
				System.out.println("###name#### : " + loginInfo.get("name"));
				System.out.println("###email#### : " + loginInfo.get("email"));
				System.out.println("###id#### : " + loginInfo.get("id"));
				
				String email = (String) loginInfo.get("email");
				String name = (String) loginInfo.get("name");
				String id = (String) loginInfo.get("id");
				
				System.out.println("email:"+ email);
				System.out.println("name:"+ name);
				System.out.println("id:"+ id);
				/*
				List<MemberBean> lists = mdao.getAllMember();
				model.addAttribute("lists",lists);
				request.setAttribute("lists", lists);
				*/
				
				//session.setAttribute("nickname", loginInfo.get("nickname"));
				
				model.addAttribute("email",email);
				model.addAttribute("name",name);
				model.addAttribute("id", id);
				
				
				member.model.MemberBean mb = sqlSessionTemplate.selectOne(namespace+".GetMemberByEmail",email);
				session.setAttribute("loginInfo", mb);//세션설정
				 
					
				if (mb == null)
				{
					sqlSessionTemplate.insert(namespace+".googleInsertMember",model);
					
				    mb = sqlSessionTemplate.selectOne(namespace+".GetMemberById",id);
					session.setAttribute("loginInfo", mb);//세션설정
				}
				else if(mb.getMember_email() == email) {
					session.setAttribute("loginInfo", mb);//세션설정
				}
				return "redirect:/main.mn";
			}
				
	
}
