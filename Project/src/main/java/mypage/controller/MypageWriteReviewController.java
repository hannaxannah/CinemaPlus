package mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenDao;

@Controller
public class MypageWriteReviewController {
	
	private final String command = "writeReview.mp";
	private final String getPage = "mypageWriteReview";
	
	
	@Autowired 
	ScreenDao screenDao;
	
	@RequestMapping(value=command)
		public String doAction(
				@RequestParam("reservation_num") String reservation_num,
				HttpSession session, Model model) {
			
			System.out.println(reservation_num);
		
			MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
			String id = mb.getMember_id();
			
			
			List<ReservationBean> List = screenDao.writeReview(reservation_num);
			model.addAttribute("List", List);
		     
			return getPage;
	}
}
