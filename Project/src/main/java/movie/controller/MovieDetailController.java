package movie.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import movie.model.MovieBean;
import movie.model.ScreenBean;
import movie.model.ScreenDao;

@Controller
public class MovieDetailController {

	private final String command = "movieDetail.mv";
	private final String getPage = "movieDetailViewVod";
	
	@Autowired
	ScreenDao screenDao;
	
	@RequestMapping(value = command)
	public String doAction(HttpServletRequest request, Model model,HttpSession session) {
		
		
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		
		
		
		
		
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String[] reDate = date.split("-");
		System.out.println(request.getParameter("title"));
		System.out.println(reDate[0]);
		URLEncoder.encode(reDate[0], StandardCharsets.UTF_8);

		String key = "6786e461570e23c0ed056fcb41d2c488";
		String result = "";

		URL url;


		try {
			url = new URL("https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key="
					+ key + "&movieNm=" + URLEncoder.encode(title, StandardCharsets.UTF_8) + "&openStartDt=" + reDate[0]);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONObject movieListResult = (JSONObject) jsonObject.get("movieListResult");
			JSONArray movieList = (JSONArray) movieListResult.get("movieList");

			request.setAttribute("movieList", movieList);
			String[] posters = new String[movieList.size()];
			String[] movieDirectors = new String[movieList.size()];
			String[] stories = new String[movieList.size()];
			String[] movieActors = new String[movieList.size()];
			String[] ratings = new String[movieList.size()];
			String[] runtimes = new String[movieList.size()];



			for(int i=0; i<movieList.size(); i++) {
				JSONObject movie = (JSONObject)movieList.get(i);
				JSONArray directors = (JSONArray)movie.get("directors");

				StringBuilder urlBuilder = new StringBuilder("https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=y");
				urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=1073781M200XYOF0GMF1");
				/*Service Key*/
				urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode((String)movie.get("movieNm"), "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("releaseDts","UTF-8") + "=" + URLEncoder.encode((String)movie.get("openDt"), "UTF-8"));
				URL url2 = new URL(urlBuilder.toString()); HttpURLConnection conn = (HttpURLConnection) url2.openConnection(); conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/json");
				System.out.println("Response code: " + conn.getResponseCode()); 
				BufferedReader rd;
				if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream())); } 
				else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream())); }
				StringBuilder sb = new StringBuilder(); 
				String line;

				while ((line = rd.readLine()) != null) {
					sb.append(line); 
				} 
				rd.close();
				conn.disconnect(); 


				JSONParser jsonParser2 = new JSONParser();
				JSONObject jsonObject2 = (JSONObject)jsonParser2.parse(sb.toString());
				JSONArray data = (JSONArray)jsonObject2.get("Data");
				//out.println("Data: " + data);
				JSONObject search = (JSONObject)data.get(0);
				//out.println("search: " + search);
				JSONArray result2 = (JSONArray)search.get("Result");
				//out.println("result2: " + result2);

				//JSONObject result3 = (JSONObject)result2.get(i);
				if(result2 != null) {
					JSONObject result3 = (JSONObject)result2.get(0);

					//			for(int i=0; i<result2.size();i++){
					//				System.out.println("result" + i + ":" + result2.get(i));
					//				JSONObject movie = (JSONObject)result2.get(i);
					//				System.out.println(movie.get("title"));
					//				System.out.println(movie.get("directors"));
					//				System.out.println(movie.get("nation"));
					//				System.out.println(movie.get("plots"));
					//			}
					String post = (String)result3.get("posters");
					//out.print((String)result3.get("posters"));
					String[] posts = post.split("\\|");
					//System.out.println("posts: " + post);
					posters[i] = posts[0];

					ratings[i] = (String)result3.get("rating");

					//JSONArray colName = (JSONArray)search.get(2);
					//request.setAttribute("post", posts[0]);
					if(directors.size() != 0){
						JSONObject director = (JSONObject)directors.get(0);
						movieDirectors[i] = (String)director.get("peopleNm"); 

						JSONObject plots = (JSONObject) result3.get("plots");
						JSONArray plot = (JSONArray) plots.get("plot");

						JSONObject plotText = (JSONObject) plot.get(0);
						stories[i] = (String)plotText.get("plotText");
						
						runtimes[i] = (String)result3.get("runtime");
					}

					JSONObject actors = (JSONObject) result3.get("actors");
					JSONArray actor = (JSONArray) actors.get("actor");
					String actorNm = "";

					if(actor.size() < 5) {
						for (int j = 0; j < actor.size(); j++) {
							JSONObject actorInfo = (JSONObject) actor.get(j);
							actorNm += (String) actorInfo.get("actorNm");
							if (actor.size()-1 != j) {
								actorNm += ",";
							}
						}
					}else {
						for (int j = 0; j < 5; j++) {
							JSONObject actorInfo = (JSONObject) actor.get(j);
							actorNm += (String) actorInfo.get("actorNm");
							if (actor.size()-1 != j) {
								actorNm += ",";
							}
						}
					}
					movieActors[i] = actorNm;
				}
			}
			java.util.List<ScreenBean> screeList = screenDao.getScreenByMovieTitle(title);
			Boolean screen_on = false;
			if(screeList.size() != 0) {
				screen_on = true;
				
			}else {
				screen_on = false;
			}
			MovieBean movie = new MovieBean();
			movie.setActors(movieActors[0]);
			movie.setDirector(movieDirectors[0]);
			movie.setMovie_story(stories[0]);
			movie.setRating(ratings[0]);
			movie.setMovie_title(title);
			movie.setOpen_date(date);
			
			model.addAttribute("movie", movie);
			model.addAttribute("screen_on", screen_on);
			model.addAttribute("runtimes", runtimes);
			
			
			
			
			/*
			 * for(int i=0; i<posters.length; i++){ out.println("posters: " + posters[i]); }
			 */  

		} catch (MalformedURLException e) {
			e.printStackTrace();
		}//오늘날짜 박스오피스 가져오기
		catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		return getPage;
	}
	
}
