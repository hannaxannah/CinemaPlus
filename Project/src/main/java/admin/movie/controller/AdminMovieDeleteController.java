package admin.movie.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;

@Controller	
public class AdminMovieDeleteController {
	private final String command = "/movieDelete.admin";
	private final String gotoPage = "redirect:/movieList.admin";

	@Autowired
	MovieDao movieDao;

	@RequestMapping(value = command)
	public String doAction(
			@RequestParam(value="movie_code") String movie_code) {
		
		int cnt = movieDao.deleteMovie(movie_code);
		return gotoPage;
	}
}
