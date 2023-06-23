package admin.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class AdminMovieListController {
	private final String command = "/movieList.admin";
	private final String getPage = "adminMovieList";

	@Autowired
	MovieDao movieDao;

	@RequestMapping(value = command)
	public String doAction(
			Model model, HttpServletRequest request) {



		List<MovieBean> movieLists = movieDao.getAllMovie();
			
		model.addAttribute("movieLists", movieLists);
		return getPage;
	}
}
