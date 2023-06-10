package board.controller;

import board.model.IndividualBoardDao;
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
			@RequestParam("pageNumber") int pageNumber, Model model) {
		
		int cnt = -1;
		cnt = idao.deleteInBoard(moviecode); 
		
		if(cnt!=-1) {
			System.out.println("delete 성공");
		}else {
			System.out.println("delete 실패");
		}
		
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
}