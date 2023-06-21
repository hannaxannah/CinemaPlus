package movie.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection; 
import java.net.URL; 
import java.net.URLEncoder;
import java.io.BufferedReader; 
import java.io.IOException;

public class MovieTest {
	private final String command = "list.mv";
	private final String getPage = "list";

	@RequestMapping(value = command)
	public String doAction(Model model, HttpServletRequest request) {
		String result = "";
		StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2");
		try {
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=1073781M200XYOF0GMF1");
			/*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode("스파이더맨", "UTF-8")); /*�󿵳⵵*/ 
			URL url = new URL(urlBuilder.toString()); HttpURLConnection conn = (HttpURLConnection) url.openConnection(); conn.setRequestMethod("GET");
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
			model.addAttribute("sb", sb);
			
			BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();

        	JSONParser jsonParser = new JSONParser();
        	JSONObject jsonObject = (JSONObject)jsonParser.parse(sb.toString());
        	JSONArray search = (JSONArray)jsonObject.get("Search");
        	//JSONArray colName = (JSONArray)search.get(2);
        	System.out.println("search: " + jsonObject);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return getPage;
	}
}
