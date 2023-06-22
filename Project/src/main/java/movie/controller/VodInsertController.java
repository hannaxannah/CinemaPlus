package movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;
import movie.model.VodBean;

@Controller
public class VodInsertController {
	private final String command = "/insertVod.mv";
	private final String getPage = "redirect:/movieList.admin";

	@Autowired
	MovieDao movieDao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam String movie_code, @RequestParam String movie_title)
	{
		VodBean vodBean = new VodBean();
		vodBean.setMovie_code(movie_code);
		vodBean.setVod_title(movie_title + "Vod");
		int cnt = movieDao.insertVod(vodBean);
		if(cnt == 1) {
			movieDao.vodOn(movie_code);
		}
		return getPage +"?movie_code="+ movie_code;
	}
}
