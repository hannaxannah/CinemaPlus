package movie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import movie.model.MovieBean;
import movie.model.MovieDao;
import movie.model.VodBean;

@Controller
public class VodListController {
	private final String command = "vodList.mv";
	private final String getPage = "vodList";
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping(value = command)
	public String doAction(Model model) {
		
		List<MovieBean> list = movieDao.getAllMovie();	
		List<MovieBean> movieList = new ArrayList<MovieBean>();
		List<VodBean> vodList = new ArrayList<VodBean>();
		for(int i=0; i<list.size(); i++) {
			MovieBean movieBean = list.get(i);
			String movie_code = movieBean.getMovie_code();
			
			VodBean vodBean = movieDao.getVodByCode(movie_code);
			
			if(vodBean != null) {
				vodList.add(vodBean);
				movieList.add(movieBean);
			}else {
				
			}
			model.addAttribute("vodList", vodList);
			model.addAttribute("movieList", movieList);
		}
		return getPage;
	}
	
}
