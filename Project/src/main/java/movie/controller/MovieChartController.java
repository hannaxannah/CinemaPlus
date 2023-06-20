package movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieChartController {
	
	private final String command = "movie.mv";
	private final String getPage = "movie";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
}
