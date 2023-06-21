package movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieBean;
import movie.model.MovieDao;
import utility.Paging;

@Controller
public class MovieListController {
	private final String command = "/list.mv";
	private final String gotoPage = "movieList";

	@Autowired
	MovieDao movieDao;

	@RequestMapping(value = command)
	public String doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn, 
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			Model model, HttpServletRequest request) {

		Map<String,String> map= new HashMap<String,String>();

		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		int totalCount=movieDao.getTotalCount(map);
		
		System.out.println("totalCount:"+totalCount);
		String url = request.getContextPath()+command;
		
		Paging pageInfo= new Paging(pageNumber,"2",totalCount,url,whatColumn,keyword,null);
		System.out.println("offset:"+pageInfo.getOffset());
		System.out.println("limit:"+pageInfo.getLimit());


		List<MovieBean> movieLists = movieDao.getAllMovie(pageInfo,map);

		model.addAttribute("movieLists", movieLists);
		model.addAttribute("pageInfo", pageInfo);

		return gotoPage;
	}
}
