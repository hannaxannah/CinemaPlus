package theater.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import theater.model.LocationBean;
import theater.model.TheaterCrawlingBean;
import theater.model.TheaterCrawlingDao;


@Controller
public class TheaterCrawlingController {
	
	
	String url;
	private final String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
	private final String WEB_DRIVER_PATH = "C:/Users/pc/Downloads/chromedriver_win32/chromedriver.exe"; //드라이버 경로
	
	@Autowired
	TheaterCrawlingDao tcd;
	
	@RequestMapping(value="/list.th")
	public void crolling(HttpServletRequest request, Model model) throws Exception {
		
		//드라이버 설정
		try {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//크롬 설정을 담은 객체 생성
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless"); //브라우저가 눈에 보이지 않고 내부적으로 돈다.
		
		//위에서 설정한 옵션을 담은 드라이버 객체 생성
		WebDriver driver = new ChromeDriver(options);
		
		//url로 이동
		String url = "http://www.cgv.co.kr/theaters";
		driver.get(url);
		
		//영화관 지역 관련 변수 설정
		List<WebElement> areas = driver.findElements(By.className("area"));
		String areaname1 = "#contents > div.sect-common > div > div.sect-city > ul > li:nth-child(";
		String areaname2 = ") > a";
		
		//영화관 이름 관련 변수 설정
		String branchname1 = "#contents > div.sect-common > div > div.sect-city > ul > li:nth-child(";
		String branchname2 = ") > div > ul > li:nth-child(";
		String branchname3 = ") > a";
		
		//영화관 이름 추출을 위한 링크 관련 변수 설정
		String link_branch = "#contents > div.sect-common > div > div.sect-city > ul > li > div > ul > li";
		String link_branch_1 = "#contents > div.sect-common > div > div.sect-city > ul > li:nth-child(";
		String link_branch_2 = ") > div > ul > li:nth-child(";
		String link_branch_3 = ") > a";
		
		//영화관 주소 추출을 위한 링크 관련 변수 설정
		String link_address = "#contents > div.wrap-theater > div.sect-theater > div > div.box-contents > div.theater-info > strong";
		String link_howtoget = "#menu > li.last > a";

		String howtoget = "#contents > div.wrap-theater > div.cols-content > div.col-detail > div:nth-child(3) > div > p";
		
		/*
		TheaterNameCrawling.java에서 지역 별 지점 개수 추출한 결과값
		seoul:31
		gyeonggi:58
		incheon:14
		kangwon:6
		daejeon:24
		daegu:8
		busan:18
		gyeonsang:17
		gwangju:23
		*/
		int[] branch_size = {29, 57, 14, 6, 24, 8, 16, 17, 23};
		
		//추출한 데이터를 LocationBean 객체로 묶고 List로 저장
		List<TheaterCrawlingBean> branch = new ArrayList<TheaterCrawlingBean>();
		
		TheaterCrawlingBean tcb;		
		//LocationBean lb;
		
		//영화관 지점 총 개수
		List<WebElement> items = driver.findElements(By.cssSelector(link_branch));
		//System.out.println(items.size()); //199 //**list에 저장할 영화관 수 = 194**
		List<WebElement> titles = driver.findElements(By.className("title"));
		
		/*
		 * try { //드라이버가 null이 아니라면 if(driver != null) { //드라이버 연결 종료 driver.close();
		 * //드라이버 연결 해제
		 * 
		 * //프로세스 종료 driver.quit(); } } catch (Exception e) { throw new
		 * RuntimeException(e.getMessage()); }
		 * 
		 * WebDriver driver2 = new ChromeDriver(options);
		 */
		
		for(int i=0; i<1; i++) { 
			for(int j=0; j<branch_size[i]; j++) {
				tcb = new TheaterCrawlingBean();
				
				//tcb.setCode("L"+"0"+(i+1)+"0"+(j+1));
				//lb.setLocation_code("L"+"0"+String.valueOf(i+1)+"0"+String.valueOf(j+1));
				tcb.setCode("L"+"0"+(i+1)+"0"+(j+1));
				tcb.setBranch_code("B"+String.valueOf(j+1));

				if(i==0) {
					tcb.setArea("서울");
					tcb.setArea_code("A1");
				}
				if(i==1) {
					tcb.setArea("경기");
					tcb.setArea_code("A2");
				}
				if(i==2) {
					tcb.setArea("인천");
					tcb.setArea_code("A3");
				}
				if(i==3) {
					tcb.setArea("강원");
					tcb.setArea_code("A4");
				}
				if(i==4) {
					tcb.setArea("대전/충청");
					tcb.setArea_code("A5");
				}
				if(i==5) {
					tcb.setArea("대구");
					tcb.setArea_code("A6");
				}
				if(i==6) {
					tcb.setArea("부산/울산");
					tcb.setArea_code("A7");
				}
				if(i==7) {
					tcb.setArea("경상");
					tcb.setArea_code("A8");
				}
				if(i==8) {
					tcb.setArea("광주/전라/제주");
					tcb.setArea_code("A9");
				}
				
				//영화관 링크 selector
				WebElement link_branch_elm = driver.findElement(By.cssSelector(link_branch_1+(i+1)+link_branch_2+(j+1)+link_branch_3));
				
				//영화관 이름
				tcb.setBranch(link_branch_elm.getAttribute("title").substring(3));
				//System.out.println(link_branch_elm.getAttribute("title").substring(3));
				
				
				//영화관 링크 추출
				//System.out.println(link_branch_elm.getAttribute("href"));
				
				//영화관 링크로 이동
				driver.get(link_branch_elm.getAttribute("href"));
				
				//영화관 주소 selector
				WebElement link_address_elm = driver.findElement(By.cssSelector(link_address));
				
				//영화관 주소 추출
				String address_getText = link_address_elm.getText();
				int length = address_getText.length();
				tcb.setAddress(address_getText.substring(0, (length-10)));
				//tcb.setAddress(address_getText.substring(0, (length-10)).split("\\n")[0]);
				//System.out.println(address_getText.substring(0, (length-10)));

				//영화관 위치안내 링크 selector
				WebElement link_howtoget_elm = driver.findElement(By.cssSelector(link_howtoget));

				//영화관 위치안내 링크 추출
				//System.out.println(link_howtoget_elm.getAttribute("href"));
				int howtoget_slash = link_howtoget_elm.getAttribute("href").indexOf("&") + 1;
				int howtoget_length = link_howtoget_elm.getAttribute("href").length();
				tcb.setHowtoget1(link_howtoget_elm.getAttribute("href").substring(0, howtoget_slash));
				tcb.setHowtoget2(link_howtoget_elm.getAttribute("href").substring(howtoget_slash, howtoget_length));
				
				//영화관 위치안내 링크로 이동
				//driver.get(link_howtoget_elm.getAttribute("href"));
				
				//영화관 위치안내 selector
				//WebElement howtoget_elm = driver.findElement(By.className("info-contents"));
				
				//영화관 위치안내 추출
				//tcb.setHowtoget(howtoget_elm.getText());
				//System.out.println(howtoget_elm.getText());
				
				System.out.println(tcb.getCode());
				System.out.println(tcb.getArea_code());
				System.out.println(tcb.getArea());
				System.out.println(tcb.getBranch_code());
				System.out.println(tcb.getBranch());
				System.out.println(tcb.getAddress());
				System.out.println(tcb.getHowtoget1());
				System.out.println(tcb.getHowtoget2());

				int k = 0;
				while(true) {
					if(branch.size() == 0) {
						branch.add(tcb);
					}
									
					//search.getCode() == tcb.getCode() => 저장 X => break
					//search.getCode() =/= tcb.getCode() => 저장 O
					
					TheaterCrawlingBean search = branch.get(k);
					
				}
				
				/*
				///////////////////////////////////////////////////////
				에러 발생
				///////////////////////////////////////////////////////
				if(branch.size()>0) {
					for(TheaterCrawlingBean search : branch) {
						if(search.getCode().equals(tcb.getCode())) {
							break;
						}
						else {
							branch.add(tcb); //194
						}
					}
				} else {
					branch.add(tcb); //branch.size => 1
				}
				System.out.println("branch.size(): "+branch.size());
				*/
			}
		}
		System.out.println("최종 branch.size(): "+branch.size());
		
		try {
			//드라이버가 null이 아니라면
			if(driver != null) {
				//드라이버 연결 종료
				driver.close(); //드라이버 연결 해제
				
				//프로세스 종료
				driver.quit();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		 //location 테이블에 저장 int cnt = tcd.insertLocationList2(branch);
		
		int cnt = tcd.insertLocationList2(branch);
		System.out.println("insert cnt:"+cnt);
		
		tcd.getLocationList2();
		 
	}
	
	
}