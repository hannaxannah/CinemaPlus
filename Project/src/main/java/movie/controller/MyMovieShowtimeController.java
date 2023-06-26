package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyMovieShowtimeController {

	private final String command = "mymovieshowtime.mv";
	private final String getPage = "mymovieShowtime";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
}
