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
import mypage.model.ReservationReviewBean;
import mypage.model.ReservationReviewDao;

@Controller
public class MypageMovieRecordDeleteController {
	
	private final String command = "MovieRecordDelete.mp";
	private final String gotoPage = "redirect:/myMovieRecord.mp";

	@Autowired
	ReservationReviewDao reservationReviewDao;

	@RequestMapping(command)
	public String doAction(@RequestParam("review_content") String review_content,
			
			HttpServletResponse response,
			Model model) {
		
		
		System.out.println("my reservation_num: " + review_content);
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=UTF-8");
		
		int cnt = reservationReviewDao.ReviewDelete(review_content);
		System.out.println("return cnt: " + cnt);
		
		
		if(cnt != 0) {
			
			try {
				
				out = response.getWriter();
				System.out.println("취소내역 삭제 성공");
				out.print("<script>alert('리뷰내역이 삭제되었습니다.');location.href='myMovieRecord.mp';</script>");
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
				out.print("<script>alert('리뷰 삭제가 실패하였습니다.');location.href='history.go(-1)' ");
				out.print("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return gotoPage;
	}
}




