package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
public class IndividualBoardListController {
	private final String command = "/list.in";
	private final String getPage = "individualBoardList";
	
	@Autowired
   IndividualBoardDao idao;
	
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
		
		int totalCount = idao.getTotalCount(map);
		System.out.println("totalCount:" + totalCount);
		
		String url = request.getContextPath()+command;
		System.out.println("url:" + url);
		
		Paging pageInfo = new Paging(pageNumber,"7",idao.getTotalCount(map),url,whatColumn,keyword,null);
		List<IndividualBoardBean> inboardLists = idao.getBoardList(map,pageInfo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("inboardLists", inboardLists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		
		return mav; //getPage설정한 곳으로 이동
	}
}
