package mypage.model;

import java.util.Date;

public class ReservationReviewBean {
   private int review_num;
   private int reservation_num;
   private String movie_title;
   private String review_content;
   private String screen_name;
   private Date review_date;
   private String member_id;

   public int getReview_num() {
      return review_num;
   }

   public void setReview_num(int review_num) {
      this.review_num = review_num;
   }

   public int getReservation_num() {
      return reservation_num;
   }

   public void setReservation_num(int reservation_num) {
      this.reservation_num = reservation_num;
   }

   public String getMovie_title() {
      return movie_title;
   }

   public void setMovie_title(String movie_title) {
      this.movie_title = movie_title;
   }

   public String getReview_content() {
      return review_content;
   }

   public void setReview_content(String review_content) {
      this.review_content = review_content;
   }

   public String getScreen_name() {
      return screen_name;
   }

   public void setScreen_name(String screen_name) {
      this.screen_name = screen_name;
   }

   public Date getReview_date() {
      return review_date;
   }

   public void setReview_date(Date review_date) {
      this.review_date = review_date;
   }

   public String getMember_id() {
      return member_id;
   }

   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }

   ;
}
