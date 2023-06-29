package mypage.model;

import board.model.IndividualBoardBean;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import utility.Paging;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class ReservationReviewDao {

   private String namespace = "mypage.model.ReservationReviewBean";


   @Autowired
   SqlSessionTemplate sqlSessionTemplate;

   public int getTotalCount(Map<String, String> map) {
      int cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
      return cnt;
   }

   public List<ReservationReviewBean> getReviewList(Map<String, String> map) {
      return sqlSessionTemplate.selectList(namespace + ".getReviewList", map);
   }

   public void InsertReview(ReservationReviewBean board) {
      sqlSessionTemplate.insert(namespace + ".InsertReview", board);
   }
}
