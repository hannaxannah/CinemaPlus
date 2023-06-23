package theater.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import theater.model.LocationBean;
import theater.model.TheaterCrawlingBean;
import theater.model.TheaterCrawlingDao;
import theater.model.TheaterDao;

@Controller
public class TheaterMainController {

	private final String command = "theater.th";
	private final String getPage = "theater";
	
	@Autowired
	TheaterDao tdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionByGet(Model model) {
		
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
				

		System.out.println("area.size:"+area.size());
		System.out.println("seoul.size:"+seoul.size());
		System.out.println("incheon.size:"+incheon.size());
		System.out.println("kangwon.size:"+kangwon.size());
		System.out.println("daejeon.size:"+daejeon.size());
		System.out.println("daegu.size:"+daegu.size());
		System.out.println("busan.size:"+busan.size());
		System.out.println("gyeongsang.size:"+gyeongsang.size());
		System.out.println("gwangju.size:"+gwangju.size());

		
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
		
		
		//tcd.getLocationList();
		
		return getPage;
	}
	
	
	
}
