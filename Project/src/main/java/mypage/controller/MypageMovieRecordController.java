package mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.IndividualBoardBean;
import mypage.model.ReservationReviewBean;
import mypage.model.ReservationReviewDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import movie.model.ReservationBean;
import movie.model.ScreenDao;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageMovieRecordController {

   private final String command = "myMovieRecord.mp";
   private final String reviewInsertCommand = "myMovieReviewInsert.mp";
   private final String getPage = "myMovieRecord";


   @Autowired
   ScreenDao screenDao;

   @Autowired
   ReservationReviewDao reservationReviewDao;


   @RequestMapping(value = command)

   public String doAction(HttpSession session, Model model) {
      MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
      String id = memberBean.getMember_id();
      List<ReservationBean> reservationList = screenDao.getReservation(id);
      model.addAttribute("reservationList", reservationList);

      Map<String, String> map = new HashMap<String, String>();
      map.put("member_id", id);
      List<ReservationReviewBean> reviewList = reservationReviewDao.getReviewList(map);
      model.addAttribute("reviewList", reviewList);

      return getPage;
   }


   @RequestMapping(value = reviewInsertCommand, method = RequestMethod.POST, produces = "application/json")
   public ResponseEntity<Map<String, Object>> reviewInsert(@ModelAttribute ReservationReviewBean reviewBean,
                                                                    HttpSession session,
                                                                    HttpServletRequest request,
                                                                    HttpServletResponse response) throws Exception {

      Map<String, Object> result = new HashMap<String, Object>();

      try {
         MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
         if (session.getAttribute("loginInfo") == null) {
            result.put("result", "fail");
            result.put("errorCode", 1);
            result.put("redirectUrl", request.getContextPath() + "/memberlogin");
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.valueOf(200));
         }
         MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
         String id = memberBean.getMember_id();
         reviewBean.setMember_id(id);
         reservationReviewDao.InsertReview(reviewBean);
         result.put("errorCode", 0);
         result.put("result", "success");
      } catch (Exception e) {
    	 System.out.println(e);
         result.put("errorCode", -1);
         result.put("result", "fail");
      }

      return new ResponseEntity<Map<String, Object>>(result, HttpStatus.valueOf(200));
   }
}
