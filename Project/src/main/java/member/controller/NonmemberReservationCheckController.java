package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.NonmemberDao;

@Controller
public class NonmemberReservationCheckController {

	private final String command = "nonmember-reservation.mb";
	private final String getPage = "nonmemberReservationCheckForm";
	private final String gotoPage = "nonmemberReservationCheck";
	
	@Autowired
	NonmemberDao ndao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionByGet() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionByPost() {
		
		return gotoPage;
	}
}
