package mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageReservationListController {

	private final String command = "myreservation.mp";
	private final String getPage = "mypageReservationList";
	
	@RequestMapping(value=command)
	public String doActionByGet() {
		
		return getPage;
	}
}
