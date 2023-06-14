package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import board.model.IndividualBoardBean;
import board.model.IndividualBoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import utility.Paging;


@Controller
public class IndividualBoardMyListController {
	private final String command = "/myList.in";
	private final String getPage = "individualBoardMyList";
	
	@Autowired
   IndividualBoardDao idao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam("customer_id") String customer_id,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			Model model, HttpServletRequest request) {
		
		System.out.println("나의 문의내역 customer_id: "+customer_id);
		System.out.println("pageNumber:"+pageNumber);
		
		String url = request.getContextPath()+command;
		System.out.println("url:" + url);
		
		IndividualBoardBean board = idao.getBoardMyList(customer_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", board);
		mav.addObject("pageNumber", pageNumber);
		
		if(pageNumber == null) {
			pageNumber = "1";
			System.out.println("pageNumber2:"+pageNumber);
		}
		
		mav.setViewName(getPage);
		
		return mav; //getPage설정한 곳으로 이동
		
	}
}
