package main.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import movie.model.MovieDao;
import movie.model.ScreenBean;
import movie.model.ScreenDao;
import store.model.StoreProductBean;
import store.model.StoreProductDao;

@Controller
public class MainController {

	private final String command = "main.mn";
	private final String getPage = "main";
	
	@Autowired
	MovieDao movieDao;

	@Autowired
	ScreenDao screenDao;
	
	@Autowired
	StoreProductDao storeProductDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(Model model,
			@RequestParam(value = "admin", required = false) String admin) throws ParseException 
	{
		//스토어 리스트 받아오기
		
		List<StoreProductBean> giftlist = storeProductDao.getProductByCategory("기프트카드");
		List<StoreProductBean> ticketlist = storeProductDao.getProductByCategory("영화티켓");
		List<StoreProductBean> snacklist = storeProductDao.getProductByCategory("팝콘/음료/스낵");
		
		
		//영화받아오는 코드
		
		// 인증키 (개인이 받아와야함)
				String key = "6786e461570e23c0ed056fcb41d2c488";

				// 파싱한 데이터를 저장할 변수
				String result = "";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

				Calendar c1 = Calendar.getInstance();

				String strToday = sdf.format(c1.getTime());//오늘날짜 가져오기

				//System.out.println("Today=" + strToday);
				try {

					URL url = new URL("http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key="
							+ key + "&targetDt=20230601");//오늘날짜 박스오피스 가져오기
					BufferedReader bf;

					bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

					result = bf.readLine();

					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
					JSONObject boxOfficeResult = (JSONObject)jsonObject.get("boxOfficeResult");
					JSONArray weeklyBoxOfficeList = (JSONArray)boxOfficeResult.get("weeklyBoxOfficeList");    	
					bf.close();

					String[] posters = new String[weeklyBoxOfficeList.size()];
					String[] runtimes = new String[weeklyBoxOfficeList.size()];
					String[] ratings = new String[weeklyBoxOfficeList.size()];
					String[] stories = new String[weeklyBoxOfficeList.size()];

					for(int i=0; i<weeklyBoxOfficeList.size(); i++) {
						JSONObject weekly = (JSONObject)weeklyBoxOfficeList.get(i);
						//System.out.println(i + "code" + weekly.get("movieCd"));
						String movieCode = (String)weekly.get("movieCd");
						String title = (String)weekly.get("movieNm");
						
						String openDt = (String)weekly.get("openDt");
						String date = openDt.substring(0, 4);
						//				System.out.println("title: " + title);
						//				System.out.println("date: " + date);
						//				System.out.println("movieCode: " + movieCode);


						StringBuilder urlBuilder = new StringBuilder("https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=y");
						urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=1073781M200XYOF0GMF1");
						/*Service Key*/
						urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode(title, "UTF-8"));
						urlBuilder.append("&" + URLEncoder.encode("releaseDts","UTF-8") + "=" + URLEncoder.encode(openDt, "UTF-8"));
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

						if(result2 != null) {
							JSONObject result3 = (JSONObject)result2.get(0);

							String post = (String)result3.get("posters");
							//out.print((String)result3.get("posters"));
							String[] posts = post.split("\\|");
							//System.out.println("posts: " + post);
							posters[i] = posts[0];
							runtimes[i] = (String)result3.get("runtime");
							ratings[i] = (String)result3.get("rating");
							
							JSONObject plots = (JSONObject) result3.get("plots");
							JSONArray plot = (JSONArray) plots.get("plot");

							JSONObject plotText = (JSONObject) plot.get(0);
							stories[i] = (String)plotText.get("plotText");
						}

					}

					List<ScreenBean> screenList = screenDao.getAllScreen();
					
					if(screenList.size() != 0) {
						String[] arr = new String[screenList.size()];

						for(int i=0; i<screenList.size(); i++) {
							arr[i] = (screenList.get(i)).getMovie_title();
						}
						   HashSet<String> hashSet = 
					                new HashSet<String>(Arrays.asList(arr));
						   
						   String[] opendScreenTitles = hashSet.toArray(new String[0]);
						model.addAttribute("opendScreenTitles", opendScreenTitles);
					}
					
					
					model.addAttribute("posters", posters);
					model.addAttribute("ratings", ratings);
					model.addAttribute("runtimes", runtimes);
					model.addAttribute("stories", stories);
					model.addAttribute("weeklyBoxOfficeList", weeklyBoxOfficeList);
					
					model.addAttribute("giftlist",giftlist );//기프트 카테고리 상품을 담은 products
					model.addAttribute("ticketlist",ticketlist );//영화티켓 카테고리 상품을 담은 products
					model.addAttribute("snacklist",snacklist );//스낵 카테고리 상품을 담은 products
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			
				
		return getPage;
	}
}
