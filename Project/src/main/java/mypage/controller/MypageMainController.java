package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import movie.model.ReservationBean;
import movie.model.ScreenDao;

@Controller
public class MypageMainController {

	private final String command = "main.mp";
	private final String getPage = "mypageMain";
	
	@Autowired
	MemberDao mdao;

	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam("member_id") String member_id,
			Model model, HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws IOException {
		
		System.out.println("member_id: "+member_id);
		
		ModelAndView mav = new ModelAndView();
		
		response.setCharacterEncoding("EUC-KR");
	    PrintWriter writer;
	     
			writer = response.getWriter();
			if(session.getAttribute("loginInfo") == null) {
			     writer.println("<script type='text/javascript'>");
			     writer.println("alert('로그인된 정보가 없습니다.');");
			     writer.println("location.href = 'memberlogin'");
			     writer.println("</script>");
			     writer.flush();
			     return null;
			}
		
		
		
		MemberBean mybean = mdao.GetMemberById(member_id);
		MemberBean id = (MemberBean) session.getAttribute("loginInfo");
		
		int couponSize = mdao.MyUsableCouponCount(id.getMember_code());
		
		int MembershipCount = screenDao.getReservCountById(id);
		
		List<ReservationBean> delList = screenDao.deleteMyMainList(id);
		
		List<ReservationBean> reservationList = screenDao.getReservationMainById(id);
		
		mav.addObject("mybean", mybean);
		model.addAttribute("delList", delList);
		mav.addObject("couponSize", couponSize);
		mav.addObject("MembershipCount", MembershipCount);
		model.addAttribute("reservationList", reservationList);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
}