package admin.movie.controller;

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
public class AdminMovieListController {
	private final String command = "/movieList.admin";
	private final String getPage = "adminMovieList";

	@Autowired
	MovieDao movieDao;

	@RequestMapping(value = command)
	public String doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn, 
			@RequestParam(value="keyword",required = false) String keyword,
			Model model, HttpServletRequest request) {

		Map<String,String> map= new HashMap<String,String>();

		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");

		List<MovieBean> movieLists = movieDao.getAllMovie(map);
			
		model.addAttribute("movieLists", movieLists);
		return getPage;
	}
}
