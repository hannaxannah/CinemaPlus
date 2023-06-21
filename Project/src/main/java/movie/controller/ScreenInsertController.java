package movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class ScreenInsertController {
	private final String command = "/screenInsert.mv";
	private final String getPage = "screenInsertForm";


	@Autowired
	ScreenDao screenDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "movie_title") String movie_title,
			@RequestParam(value = "movie_runtime") String movie_runtime,
			@RequestParam(value = "rating") String rating,
			Model model){

		System.out.println(movie_runtime);
		System.out.println(movie_title);
		System.out.println(rating);
		List<ScreenBean> screenList = screenDao.getAllScreen();
		model.addAttribute("movie_runtime", movie_runtime);
		model.addAttribute("movie_title", movie_title);
		model.addAttribute("rating", rating);
		String[] opendScreenTimes = new String[screenList.size()];


		for(int i=0; i<screenList.size(); i++) {
			opendScreenTimes[i] = (screenList.get(i)).getScreen_time();
		}
		model.addAttribute("opendScreenTimes", opendScreenTimes);
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(@ModelAttribute("screenBean") ScreenBean screenBean,
			Model model){
		int discountPrice = 0;
		String[] time = (screenBean.getScreen_time()).split(":");
		screenBean.setTime(time[0]);
		System.out.println(screenBean.getDiscount());
		if((screenBean.getDiscount()).equals("first")) {
			discountPrice = (int) Math.round(screenBean.getTicket_price() * 0.8);//조조 20% 할인
			screenBean.setTicket_price(discountPrice);

		}else if((screenBean.getDiscount()).equals("last")) {
			discountPrice = (int) Math.round(screenBean.getTicket_price() * 0.9);//심야 10% 할인
			screenBean.setTicket_price(discountPrice);

		}else {

		}

		screenDao.insertScreen(screenBean);

		return null;
	}
}
