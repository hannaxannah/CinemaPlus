package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenBean;
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
			List<ReservationBean> reservationList = screenDao.getReservation(id);
			ReservationBean reservationBean = reservationList.get(0);
			
			List<ScreenBean> List = screenDao.getScreenByMovieTitle(reservationBean.getMovie_title());
			ScreenBean screenBean = List.get(0);
			model.addAttribute("reservationList", reservationList);
			model.addAttribute("poster", screenBean.getPoster());
			return getPage;
	}
}
