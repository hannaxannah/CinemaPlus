package admin.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;
import movie.model.VodBean;

@Controller
public class AdminVodUpdateController {
	private final String command = "/updateVod.admin";
	private final String getPage = "adminVodUpdateForm";
	private final String gotoPage = "redirect:/movieList.admin";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "movie_code") String movie_code,
							Model model) {
		
		VodBean vodBean = movieDao.getVodByCode(movie_code);
		//vodBean.getMovie_code();
		model.addAttribute("vodBean", vodBean);
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(@ModelAttribute("vodBean") VodBean vodBean,
							Model model) {
		
		movieDao.updateVod(vodBean);
		return gotoPage;
	}
}
