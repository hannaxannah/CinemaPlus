package admin.movie.controller;




import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class AdminMovieInsertController {
	private final String command = "/movieInsert.admin";

	@Autowired
	MovieDao movieDao;

	@ResponseBody
	@RequestMapping(value = command)
	public String doAction(@RequestParam String movies) throws ParseException 
	{

		System.out.println(movies);
		JSONArray jsonArr = new JSONArray();
		JSONParser parser = new JSONParser();

		// 문자열 형식의 데이터를 JSONArray로 가공
		jsonArr = (JSONArray)parser.parse(movies);
		System.out.println(jsonArr.get(0));
		int cnt = 0;
		for(int i=0; i<jsonArr.size(); i++) {
			JSONObject movieList = (JSONObject)jsonArr.get(i);
//			System.out.println(movieList.get("movieCd"));
//			System.out.println(movieList.get("movieNm"));
//			System.out.println(movieList.get("story"));
//			System.out.println(movieList.get("openDt"));
//			System.out.println(movieList.get("poster"));
//			System.out.println(movieList.get("director"));
			MovieBean movieBean = new MovieBean((String)movieList.get("movieCd"),
										(String)movieList.get("movieNm"),
										(String)movieList.get("story"),
										(String)movieList.get("openDt"),
										(String)movieList.get("prdtYear"),
										(String)movieList.get("poster"),
										(String)movieList.get("director"),
										(String)movieList.get("nationAlt"),
										(String)movieList.get("genreAlt"),
										(String)movieList.get("actor"),
										(String)movieList.get("rating")
										);
//			System.out.println("영화제목: " + movieBean.getMovie_title());
			cnt += movieDao.insertMovie(movieBean);
			System.out.println("성공여부: " + cnt);
			
		}
		System.out.println("성공개수: " + cnt);

		return "true";
	}
}
