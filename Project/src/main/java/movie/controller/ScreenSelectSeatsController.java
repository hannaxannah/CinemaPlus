package movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import movie.model.ReservationBean;
import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class ScreenSelectSeatsController {
	private final String command = "/selectSeats.mv";
	private final String getPage = "selectSeats";

	@Autowired
	ScreenDao screenDao;

	@RequestMapping(value = command)
	public String doAction(
			@ModelAttribute("screenBean") ScreenBean screenBean,
			Model model) {
		
		List<ReservationBean> reservationList = screenDao.getReservationByTime(screenBean.getScreen_time());
		for(int i=0; i<reservationList.size(); i++) {
			ReservationBean reservation = reservationList.get(i);
			System.out.println(reservation.getSeat_number2());
		}
		model.addAttribute("reservationList", reservationList);
		
		return getPage;
	}

}
