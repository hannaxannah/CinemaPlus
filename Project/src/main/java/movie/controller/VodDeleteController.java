package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;

@Controller
public class VodDeleteController {
	
	private final String command = "/deleteVod.mv";
	private final String getPage = "redirect:/detail.mv";

	@Autowired
	MovieDao movieDao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam String movie_code)
	{
		int cnt = movieDao.deleteVod(movie_code);
		if(cnt == 1) {
			movieDao.vodOff(movie_code);
		}
		return getPage +"?movie_code="+ movie_code;
	}
}
