package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class MypageReservationListController {

	private final String command = "myreservation.mp";
	private final String getPage = "mypageReservationList";
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value=command)
	public String doActionByGet(
			HttpSession session, Model model) {
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		
		String id = memberBean.getMember_id();
		
		List<ReservationBean> reservationList = screenDao.getReservationById(id);
		
		model.addAttribute("reservationList", reservationList);
		
		return getPage;
	}
}
