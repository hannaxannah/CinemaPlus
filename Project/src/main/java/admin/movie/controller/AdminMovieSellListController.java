package admin.movie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenDao;

@Controller
public class AdminMovieSellListController {
	private final String command = "/adminSell.admin";
	private final String getPage = "adminMovieSellList";

	@Autowired
	ScreenDao screenDao;
	@RequestMapping(value = command)
	public String doAction(Model model) {
		
		List<ReservationBean> reservationList = screenDao.getAllReservationList();
		List<ReservationBean> vodCellList = new ArrayList<ReservationBean>();
		List<ReservationBean> movieCellList = new ArrayList<ReservationBean>();
		int totalPrice = 0;
		for(int i=0; i<reservationList.size(); i++) {
			ReservationBean reservationBean = reservationList.get(i);
			totalPrice += reservationBean.getTicket_price();
			if(reservationBean.getMovie_title().contains("Vod")) {
				vodCellList.add(reservationList.get(i));
			}else {
				movieCellList.add(reservationList.get(i));
			}
		}
		
		model.addAttribute("movieCellList", movieCellList);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("vodCellList", vodCellList);
		model.addAttribute("totalPrice", totalPrice);
		
		return getPage;
	}
	
}
