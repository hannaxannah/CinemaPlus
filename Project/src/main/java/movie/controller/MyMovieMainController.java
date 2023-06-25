package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyMovieMainController {
	
	private final String command = "mymovie.mv";
	private final String getPage = "mymovieMain";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
}
