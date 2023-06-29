package movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.ScreenBean;
import movie.model.ScreenDao;
import theater.model.TheaterDao;

@Controller
public class ScreenFastReservationController {
	private final String command = "/fastReservation.mv";
	private final String getPage = "fastReservationForm";
	
	@Autowired
	TheaterDao tdao;

	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(
							@RequestParam(value="movie_title") String movie_title,
							Model model){
		
		List<String> area = tdao.getAllArea();
		
		List<String> seoul = tdao.getAllBranch("A1");		
		List<String> gyeonggi = tdao.getAllBranch("A2");
		List<String> incheon = tdao.getAllBranch("A3");
		List<String> kangwon = tdao.getAllBranch("A4");
		List<String> daejeon = tdao.getAllBranch("A5");
		List<String> daegu = tdao.getAllBranch("A6");
		List<String> busan = tdao.getAllBranch("A7");
		List<String> gyeongsang = tdao.getAllBranch("A8");
		List<String> gwangju = tdao.getAllBranch("A9");
		
		
		System.out.println(movie_title);
		List<ScreenBean>fastReservationList = screenDao.getScreenByMovieTitle(movie_title);
		
		
		model.addAttribute("area", area);
		model.addAttribute("seoul", seoul);
		model.addAttribute("gyeonggi", gyeonggi);
		model.addAttribute("incheon", incheon);
		model.addAttribute("kangwon", kangwon);
		model.addAttribute("daejeon", daejeon);
		model.addAttribute("daegu", daegu);
		model.addAttribute("busan", busan);
		model.addAttribute("gyeongsang", gyeongsang);
		model.addAttribute("gwangju", gwangju);
		
		
		model.addAttribute("fastReservationList", fastReservationList);
		return getPage;
	}
}