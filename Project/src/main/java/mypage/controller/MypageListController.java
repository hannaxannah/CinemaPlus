package mypage.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mypage.model.MypageDao;
import store.model.StoreProductBean;
import store.model.StoreProductDao;


@Controller
public class MypageListController {
	
	private final String command = "/main.mp";
	private final String gotopage = "mypageList";
	
	@Autowired
	MypageDao pdao;
	
	@RequestMapping(command)
	public String doAction(
			HttpServletResponse response,
			HttpSession session) throws IOException {
		
		 response.setCharacterEncoding("EUC-KR");
	     PrintWriter writer;
	     
			writer = response.getWriter();
			if(session.getAttribute("loginInfo") == null) {
			     writer.println("<script type='text/javascript'>");
			     writer.println("alert('로그인된 정보가 없습니다.');");
			     writer.println("history.back();");
			     writer.println("</script>");
			     writer.flush();
			     return null;
			}
			
		
		return gotopage;
	}
}
