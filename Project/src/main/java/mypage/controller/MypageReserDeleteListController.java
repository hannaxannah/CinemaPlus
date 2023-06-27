package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenDao;

@Controller
public class MypageReserDeleteListController {

	private final String command = "myreservDelete.mp";
	private final String getPage = "mypageReservDeleteList";
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(command)
	public String doActionByGet(HttpSession session, Model model) {
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		String id = memberBean.getMember_id();
		
		List<ReservationBean> reservationDelList = screenDao.getReservationById(id);
		model.addAttribute("reservationDelList", reservationDelList);
		return getPage;
	}
}
