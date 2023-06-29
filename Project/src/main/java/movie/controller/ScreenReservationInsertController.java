package movie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	private final String getPage = "reservationComplete";


	@Autowired
	ScreenDao screenDao;

	@RequestMapping(value = command)
	public String doAction(@RequestParam("seatnum") String[] seatnum,
			@RequestParam("adults") int adults,
			@RequestParam("teens") int teens,
			@RequestParam("handicaps") int handicaps,
			@ModelAttribute("screen_time") String screen_time, HttpSession session,
			Model model) {
		
		
		//System.out.println(seatnum.length);
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		//System.out.println(screen_time);
		List<ScreenBean> screenList = screenDao.getScreenByTime(screen_time);
		System.out.println(adults);
		
		
		ScreenBean screenBean = screenList.get(0);
		int price = screenBean.getTicket_price();
		int totalPrice = 0;
		ReservationBean reservationBean = new ReservationBean();
		reservationBean.setMember_id(memberBean.getMember_id());
		reservationBean.setMovie_title(screenBean.getMovie_title());
		reservationBean.setScreen_name(screenBean.getScreen_name());
		reservationBean.setScreen_time(screenBean.getScreen_time());
		for(int i=0; i<seatnum.length; i++) {
			while(true) {
				reservationBean.setSeat_number(seatnum[i]);
				
					if(adults != 0) {
						reservationBean.setTicket_price(price);
						reservationBean.setTicket_type("성인");
						totalPrice += price;
						adults --;
					}
					else if(adults == 0 && teens != 0) {
						Double teenPrice = price*0.8;
						
						reservationBean.setTicket_price((int)Math.round(teenPrice));
						reservationBean.setTicket_type("청소년");
						totalPrice += (int)Math.round(teenPrice);
						teens --;
					}
					else if(adults == 0 && teens == 0 && handicaps != 0) {
						Double handicapPrice = price*0.5;
						
						reservationBean.setTicket_price((int)Math.round(handicapPrice));
						reservationBean.setTicket_type("우대");
						totalPrice += (int)Math.round(handicapPrice);
						handicaps --;
					}
					
					
					int cnt = screenDao.insertReservation(reservationBean);
					if(cnt == 1) {
						screenDao.removeSeat(screenBean.getScreen_time());
						
					}
					break;
			}
			
		}
		model.addAttribute("seatnum", seatnum);
		model.addAttribute("screenBean", screenBean);
		model.addAttribute("totalPrice", totalPrice);
		return getPage;
	}
}
