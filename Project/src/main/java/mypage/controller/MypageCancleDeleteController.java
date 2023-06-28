package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.IndividualBoardBean;
import movie.model.ReservationBean;
import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class MypageCancleDeleteController {
	
	private final String command = "cancleDelete.mp";
	private final String gotoPage = "redirect:/myreservation.mp";

	@Autowired
	ScreenDao screenDao;

	@RequestMapping(command)
	public String doAction(@RequestParam("reservation_num") String reservation_num,
			
			HttpServletResponse response,
			Model model) {
		
		
		System.out.println("my reservation_num: " + reservation_num);
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=UTF-8");
		ReservationBean reservationBean = screenDao.getReservationDelByNum(reservation_num);
		int cnt = screenDao.deleteToCancle(reservation_num);
		
		/*
		 * List<ScreenBean> delList = screenDao.deleteMyReserList(reservation_num);
		 */		
		
		if(cnt != 0) {
			
			try {
				
				out = response.getWriter();
				System.out.println("취소내역 삭제 성공");
				int cnt2 = screenDao.insertCancleToReservation(reservationBean);
				System.out.println("cnt " + cnt2);
				out.print("<script>alert('취소목록이 삭제되었습니다.');location.href='myreservation.mp';</script>");
				out.flush();
				/*
				ModelAndView mav = new ModelAndView();
				mav.addObject("delList", delList);
				*/
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else {
			
			try {
				out = response.getWriter();
				System.out.println("예매내역 삭제 실패");
				out.print("<script>alert('예매내역 삭제가 실패하였습니다.');location.href='history.go(-1)' ");
				out.print("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return gotoPage;
	}
}




