package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieDetailController {

	private final String command = "movieDetail.mv";
	private final String getPage = "movieDetail";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
	
}
