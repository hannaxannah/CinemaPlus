package admin.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class AdminScreenOnListController {
	private final String command = "screenOnList.admin";
	private final String getPage = "adminScreenOnList";
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value = command)
	public String doAction(Model model) {
		
		List<ScreenBean> screenList = screenDao.getAllScreen();
		
		model.addAttribute("screenList", screenList);
		
		return getPage;
	}
	
}
