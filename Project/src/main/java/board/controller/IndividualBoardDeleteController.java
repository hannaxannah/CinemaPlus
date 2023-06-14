package board.controller;

import board.model.IndividualBoardDao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class IndividualBoardDeleteController {
	private final String command = "/delete.in";
	private String gotoPage = "redirect:/list.in";
	
	@Autowired
   IndividualBoardDao idao;
	
	@RequestMapping(value=command)
	public String delete(
			@RequestParam("movie_code") String moviecode,			
			@RequestParam("pageNumber") int pageNumber,
			HttpServletResponse response,
			Model model) {
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=UTF-8");
		
		int cnt = -1;
		cnt = idao.deleteInBoard(moviecode);
		
		if(cnt!=-1) {
			try {
				out = response.getWriter();
				System.out.println("delete 성공");
				out.print("<script>alert('문의글이 삭제되었습니다.');location.href='list.in';</script>");
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
		
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
}