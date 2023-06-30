package movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import movie.model.MovieDao;
import movie.model.ReservationBean;
import movie.model.ScreenDao;
import movie.model.VodBean;

@Controller
public class VodBuyController {
	private final String command = "/vodBuy.mv";
	private final String getPage = "vodBuy";
	
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value = command)
	public String doAction(Model model,
			@RequestParam(value = "movie_code") String movie_code,
			HttpSession session, HttpServletResponse response) throws IOException {
		
		 response.setCharacterEncoding("EUC-KR");
	     PrintWriter writer;
	     
			writer = response.getWriter();
			if(session.getAttribute("loginInfo") == null) {
			     writer.println("<script type='text/javascript'>");
			     writer.println("alert('로그인 후 이용가능한 서비스입니다. 로그인 페이지로 이동합니다.');");
			     writer.println("location.href = 'memberlogin' ");
			     writer.println("</script>");
			     writer.flush();
			     return null;
			}
		
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
        LocalDate now = LocalDate.now();
 
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        String formatedNow = now.format(formatter);
        
		VodBean vodBean = movieDao.getVodByCode(movie_code);
		ReservationBean reservationBean = new ReservationBean();
		reservationBean.setMember_id(memberBean.getMember_id());
		reservationBean.setReservation_date(formatedNow);
		reservationBean.setMovie_title(vodBean.getVod_title());
		reservationBean.setScreen_name("home");
		reservationBean.setScreen_time("whenever");
		reservationBean.setSeat_number("bed");
		
		screenDao.insertReservation(reservationBean);
		model.addAttribute("vodBean", vodBean);
		model.addAttribute("reservationBean",reservationBean);
		
		return getPage;
	}
}
