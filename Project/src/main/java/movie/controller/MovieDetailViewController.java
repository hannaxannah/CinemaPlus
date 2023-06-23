package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieBean;
import movie.model.MovieDao;
import movie.model.VodBean;

@Controller
public class MovieDetailViewController {
	private final String command = "/detail.mv";
	private final String getPage = "movieDetailViewVod";
	@Autowired
	MovieDao movieDao;

	@RequestMapping(command)
	public String doAction(@RequestParam("movie_code") String movie_code, Model model) {

		MovieBean movie = movieDao.getMovieByCode(movie_code);
		VodBean vodBean = movieDao.getVodByCode(movie_code);
		
		boolean vod_on = false;
		
		if(vodBean != null) {
			model.addAttribute("vodBean",vodBean);
			vod_on = true;
		}else {
			vod_on = false;
		}
		model.addAttribute("movie",movie);
		model.addAttribute("vod_on",vod_on);
		
		return getPage;

	}
}
