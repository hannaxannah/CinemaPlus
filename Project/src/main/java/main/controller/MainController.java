package main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movie.model.MovieDao;
import movie.model.ScreenDao;

@Controller
public class MainController {

	private final String command = "main.mn";
	private final String getPage = "main";
	
	@Autowired
	MovieDao movieDao;

	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
}
