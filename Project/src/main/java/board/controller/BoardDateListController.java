package board.controller;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import board.model.BoardBean;
import board.model.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import utility.Paging;


@Controller
public class BoardDateListController {

	private final String command = "/date.bd";
	private final String getPage = "boardList";
	
	@Autowired
   BoardDao boardDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn, 
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			Model model, HttpServletRequest request) {
		
		System.out.println("whatColumn:"+whatColumn);
		System.out.println("keyWord:"+keyword);
		System.out.println("pageNumber:"+pageNumber);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword",  "%" + keyword + "%");
		
		int totalCount = boardDao.getTotalCount(map);
		System.out.println("totalCount:" + totalCount);
		
		String url = request.getContextPath()+command;
		System.out.println("url:" + url);
		
		Paging pageInfo = new Paging(pageNumber,"7",boardDao.getTotalCount(map),url,whatColumn,keyword,null);
		List<BoardBean> boardLists = boardDao.getBoardDateList(map,pageInfo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardLists", boardLists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		
		return mav;
	}
	
}//BoardListController


