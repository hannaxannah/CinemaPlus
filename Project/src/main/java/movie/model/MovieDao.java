package movie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class MovieDao {

	private String namespace = "movie.model.Movie";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<MovieBean> getAllMovie(Paging pageInfo, Map<String, String> map) {

		List<MovieBean> list = new ArrayList<MovieBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace + ".GetMovieList", map, rowBounds);
		return list;
	}
	public int getTotalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		System.out.println("count : " + count);
		return count;
	}
	public int insertMovie(MovieBean movieBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertMovie", movieBean);
		System.out.println("성공여부: " + cnt);
		return cnt;

	}

	public int getOneMovie(MovieBean movieBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".GetOneMovie", movieBean);
		return cnt;
	}
	public MovieBean getMovieByCode(String movie_code) {
		MovieBean movie = null;
		movie = sqlSessionTemplate.selectOne(namespace+".GetMovieByCode", movie_code);
		return movie;
	}
	public int insertVod(VodBean vodBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertVod", vodBean);
		System.out.println("성공여부: " + cnt);
		return cnt;

	}
	public void vodOn(String movie_code) {

		sqlSessionTemplate.update(namespace + ".VodOn", movie_code);
	}
	public int deleteVod(String movie_code) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteVod" , movie_code);
		return cnt;
	}

	public void vodOff(String movieCode) {

		sqlSessionTemplate.update(namespace + ".VodOff", movieCode);
	}
	public VodBean getVodByCode(String movie_code) {
		VodBean vod = null;
		vod = sqlSessionTemplate.selectOne(namespace+".GetVodByCode", movie_code);
		return vod;

	}
}
