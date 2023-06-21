package movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class ScreenFastReservationController {
	private final String command = "/fastReservation.mv";
	private final String getPage = "fastReservationForm";


	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(
							@RequestParam(value="movie_title") String movie_title,
							Model model){
		
		List<ScreenBean>fastReservationList = screenDao.getScreenByMovieTitle(movie_title);
		model.addAttribute("fastReservationList", fastReservationList);
		return getPage;
	}
}