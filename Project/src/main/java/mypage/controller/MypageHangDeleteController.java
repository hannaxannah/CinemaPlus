package mypage.controller;

import board.model.IndividualBoardDao;
import movie.model.ScreenDao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MypageHangDeleteController {
	private final String command = "/hangDelete.mp";
	private String gotoPage = "redirect:/myreservDelete.mp";
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value=command)
	public String delete(
			@RequestParam("reservation_num") String reservation_num,			
			HttpServletResponse response,
			Model model) {
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=UTF-8");
		
		int cnt = -1;
		cnt = screenDao.deleteAll(reservation_num);
		
		if(cnt!=-1) {
			try {
				out = response.getWriter();
				System.out.println("delete 성공");
				out.print("<script>alert('내역이 완전 삭제되었습니다.');location.href='myreservation.mp';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				out = response.getWriter();
				System.out.println("delete 실패");
				out.print("<script>alert('삭제가 실패하였습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return gotoPage;
	}
}