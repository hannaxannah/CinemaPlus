package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyMovieVodController {
	
	private final String command = "mymovievod.mv";
	private final String getPage = "mymovieVod";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
}
