package movie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class ScreenReservationInsertController {
	private final String command = "/screenReservationInsert.mv";
	private final String getPage = "";


	@Autowired
	ScreenDao screenDao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("seatnum") String[] seatnum,
			@ModelAttribute("screen_time") String screen_time, HttpSession session) {

		//System.out.println(seatnum.length);
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		//System.out.println(screen_time);
		List<ScreenBean> screenList = screenDao.getScreenByTime(screen_time);
		
		ScreenBean screenBean = screenList.get(0);
		ReservationBean reservationBean = new ReservationBean();
		reservationBean.setMember_id(memberBean.getMember_id());
		reservationBean.setMovie_title(screenBean.getMovie_title());
		reservationBean.setScreen_name(screenBean.getScreen_name());
		reservationBean.setScreen_time(screenBean.getScreen_time());
		reservationBean.setTicket_price(screenBean.getTicket_price());
		for(int i=0; i<seatnum.length; i++) {
			while(true) {
					reservationBean.setSeat_number(seatnum[i]);
					int cnt = screenDao.insertReservation(reservationBean);
					if(cnt == 1) {
						screenDao.removeSeat(screenBean.getScreen_time());
					}
					break;
			}
		}
		return getPage;
	}
}
