package movie.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class ScreenDao {
	private String namespace = "movie.model.Movie";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public int insertScreen(ScreenBean screenBean) {
			int cnt = -1;
			cnt = sqlSessionTemplate.insert(namespace+".InsertScreen", screenBean);
			//System.out.println("성공여부: " + cnt);
			return cnt;
	}


	public List<ScreenBean> getAllScreen() {
			
			List<ScreenBean> list = new ArrayList<ScreenBean>();
			list = sqlSessionTemplate.selectList(namespace + ".GetScreenList");
			return list;
	}


	public List<ScreenBean> getScreenByMovieTitle(String movie_title) {
		List<ScreenBean> list = new ArrayList<ScreenBean>();
		list = sqlSessionTemplate.selectList(namespace + ".GetScreenByMovieTitle", movie_title);
		return list;
		
	}

	public List<ScreenBean> getScreenByTime(String screen_time) {
		List<ScreenBean> list = new ArrayList<ScreenBean>();
		list = sqlSessionTemplate.selectList(namespace + ".GetScreenByTime", screen_time);
		return list;
	}


	public int insertReservation(ReservationBean reservationBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertReservation", reservationBean);
		//System.out.println("예약성공: " + cnt);
		return cnt;
		
	}


	public List<ReservationBean> getReservationByTime(String screen_time) {
		List<ReservationBean> list = new ArrayList<ReservationBean>();
		list = sqlSessionTemplate.selectList(namespace + ".GetReservationByTime", screen_time);
		return list;
	}


	public void removeSeat(String Screen_time) {
		sqlSessionTemplate.update(namespace + ".RemoveSeat", Screen_time);
	}


	public List<ReservationBean> getReservationById(String id) {
		List<ReservationBean> list = new ArrayList<ReservationBean>();
		list = sqlSessionTemplate.selectList(namespace + ".GetReservationById", id);
		return list;
	}

	/* 마이페이지-내가본영화목록 */
	public List<ReservationBean> getReservation(String id) {
		List<ReservationBean> list = new ArrayList<ReservationBean>();
		list = sqlSessionTemplate.selectList(namespace + ".GetReservation", id);
		return list;
	}

	/* 리뷰작성시 영화제목 */
	public List<ReservationBean> writeReview(String id) {
		List<ReservationBean> list = new ArrayList<ReservationBean>();
		list = sqlSessionTemplate.selectList(namespace + ".WriteReview", id);
		return list;
	}
	
	
}
