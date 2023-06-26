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
public class MypageMovieRecordController {
	
	private final String command = "myMovieRecord.mp";
	private final String getPage = "myMovieRecord";
	
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value=command)
	
		public String doAction(HttpSession session, Model model) {
			MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
			String id = memberBean.getMember_id();
			List<ReservationBean> reservationList = screenDao.getReservationById(id);
			model.addAttribute("reservationList", reservationList);
			return getPage;
	}
}
