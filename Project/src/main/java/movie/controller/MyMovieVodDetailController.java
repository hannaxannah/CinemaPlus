package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyMovieVodDetailController {

	private final String command = "mymovievoddetail.mv";
	private final String getPage = "mymovieVodDetail";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
	
}
