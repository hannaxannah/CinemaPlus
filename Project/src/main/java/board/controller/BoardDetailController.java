package board.controller;

import board.model.BoardBean;
import board.model.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardDetailController {

	private final String command = "detail.bd";
	private final String getPage = "boardDetailView";
	@Autowired
   BoardDao boardDao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam("movienum") int movienum, 
			@RequestParam("pageNumber") int pageNumber,
			Model model) {

		boardDao.UpdateCount(movienum);
		BoardBean board = boardDao.getBoardByNum(movienum);
		model.addAttribute("board", board);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
}