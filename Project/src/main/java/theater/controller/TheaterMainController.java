package theater.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import theater.model.LocationBean;
import theater.model.TheaterDao;

@Controller
public class TheaterMainController {

	private final String command = "theater.th";
	private final String getPage = "theaterMain";
	
	@Autowired
	TheaterDao tdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionByGet(Model model) {
		List<LocationBean> lists = tdao.getAllTheaterLocation();
		System.out.println("lists.size:"+lists.size());
		
		List<String> area = tdao.getAllTheaterArea();
		System.out.println("area.size:"+area.size());
		
		List<String> seoul = tdao.getAllTheaterBranch("서울");
		System.out.println("seoul.size:"+seoul.size());
		
		List<String> gyeonggi = tdao.getAllTheaterBranch("경기");
		List<String> incheon = tdao.getAllTheaterBranch("인천");
		List<String> kangwon = tdao.getAllTheaterBranch("강원");
		List<String> daejeon = tdao.getAllTheaterBranch("대전/충청");
		List<String> daegu = tdao.getAllTheaterBranch("대구");
		List<String> busan = tdao.getAllTheaterBranch("부산/울산");
		List<String> gyeongsang = tdao.getAllTheaterBranch("경상");
		List<String> gwangju = tdao.getAllTheaterBranch("광주/전라/제주");
		
		model.addAttribute("area", area);
		
		return getPage;
	}
	
}
