package theater.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import theater.model.TheaterCrawlingBean;
import theater.model.TheaterDao;

@Controller
public class TheaterBranchController {
	@Autowired
	TheaterDao tdao;
	private final String command = "branch.th";
	private final String getPage= "redirect:/howtoget.th";
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionByGet(Model model,
			@RequestParam("branch") String branch
			) {

		TheaterCrawlingBean branchInfo = tdao.getHowtogetByBranch(branch);
		//String howtoget = tcb.getHowtoget1() + tcb.getHowtoget2();
		//http://www.cgv.co.kr/theaters/?page=location&theaterCode=0056#menu 

		//model.addAttribute("howtoget", howtoget);
		model.addAttribute("branchInfo", branchInfo);

		return "getPage";
	}
}
