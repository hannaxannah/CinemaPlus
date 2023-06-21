package theater.controller;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import theater.model.TheaterCrawlingBean;
import theater.model.TheaterCrawlingDao;
 
public class TheaterLinkCrawling {

	String url;
	private static String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
	private static String WEB_DRIVER_PATH = "C:/Users/pc/Downloads/chromedriver_win32/chromedriver.exe"; //드라이버 경로
	
	public static void main(String[] args) {
		//드라이버 설정
		try {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//크롬 설정을 담은 객체 생성
		ChromeOptions options = new ChromeOptions();
		//브라우저가 눈에 보이지 않고 내부적으로 돈다.
		//설정하지 않을 시 실제 크롬 창이 생성되고, 어떤 순서로 진행되는지 확인할 수 있다.
		options.addArguments("headless");
		
		//위에서 설정한 옵션을 담은 드라이버 객체 생성
		//옵션을 설정하지 않았을 때에는 생략 가능하다.
		//WebDriver객체가 곧 하나의 브라우저 창이라 생각한다.
		WebDriver driver = new ChromeDriver(options);
		
		//이동을 원하는 url
		//String url = "https://www.naver.com";
		String url = "http://www.cgv.co.kr/theaters";
		driver.get(url);
		
		List<WebElement> areas = driver.findElements(By.className("area"));
		String areaname1 = "#contents > div.sect-common > div > div.sect-city > ul > li:nth-child(";
		String areaname2 = ") > a";
		//List<WebElement> area = driver.findElements(By.cssSelector(areaname));
		
		String branchname1 = "#contents > div.sect-common > div > div.sect-city > ul > li:nth-child(";
		String branchname2 = ") > div > ul > li:nth-child(";
		String branchname3 = ") > a";
		
		String link_branch = "#contents > div.sect-common > div > div.sect-city > ul > li > div > ul > li";
		String link_branch_1 = "#contents > div.sect-common > div > div.sect-city > ul > li:nth-child(";
		String link_branch_2 = ") > div > ul > li:nth-child(";
		String link_branch_3 = ") > a";
		
		String link_address = "#contents > div.wrap-theater > div.sect-theater > div > div.box-contents > div.theater-info > strong";
		String link_howtoget = "#menu > li.last > a";
		
		String howtoget = "#contents > div.wrap-theater > div.cols-content > div.col-detail > div:nth-child(3) > div > p";
		
		//#contents > div.wrap-theater > div.sect-theater > div > div.box-contents > div.theater-info > strong > a
		//price_selector = "#content > div > div.homePageResponsive_best_wrap__3KGye > div > div > ul > li > div > div.productCardResponsive_information__1HK4_ > div.productCardResponsive_price_area__3lo44 > span";
		//links_selector = "#content > div > div.homePageResponsive_best_wrap__3KGye > div > div > ul > li > div > a";

		    
		List<WebElement> items = driver.findElements(By.cssSelector(link_branch));
		//WebElement abc = driver.findElement(By.cssSelector(link_selector_begin+"1"+link_selector_end));
		List<WebElement> titles = driver.findElements(By.className("title"));
		//prices = driver.findElements(By.cssSelector(WEB_DRIVER_ID));
		//links = driver.findElements(By.cssSelector(WEB_DRIVER_ID));

		/*
		print("가져온 상품 수: ", len(items));
		for item, price, link in zip(items, prices, links):
		    print("상품: ", item.text);
		    print("가격: ", price.text);
		    print("주소: ", link.get_attribute("href"));
		    print();
		*/
	
		/*
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
		List<TheaterCrawlingBean> branch = new ArrayList<TheaterCrawlingBean>();
		
		TheaterCrawlingBean tcb;		
		
		System.out.println(items.size()); //199
		for(int i=3; i<4; i++) {
			for(int j=0; j<branch_size[i]; j++) {
				tcb = new TheaterCrawlingBean();
				tcb.setCode("L"+"0"+(i+1)+"0"+(j+1));
				
				if(i==0) {
					tcb.setArea("서울");
				}
				if(i==1) {
					tcb.setArea("경기");
				}
				if(i==2) {
					tcb.setArea("인천");
				}
				if(i==3) {
					tcb.setArea("강원");
				}
				if(i==4) {
					tcb.setArea("대전/충청");
				}
				if(i==5) {
					tcb.setArea("대구");
				}
				if(i==6) {
					tcb.setArea("부산/울산");
				}
				if(i==7) {
					tcb.setArea("경상");
				}
				if(i==8) {
					tcb.setArea("광주/전라/제주");
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
				
				//tcb.setAddress(address_getText.substring(0, (length-10)));
				//System.out.println(address_getText.substring(0, (length-10)));
				tcb.setAddress(address_getText.split("\\n")[0]);

				//영화관 위치안내 링크 selector
				WebElement link_howtoget_elm = driver.findElement(By.cssSelector(link_howtoget));

				//영화관 위치안내 링크 추출
				//System.out.println(link_howtoget_elm.getAttribute("href"));
				//tcb.setHowtoget(link_howtoget_elm.getAttribute("href"));
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
				System.out.println(tcb.getArea());
				System.out.println(tcb.getBranch());
				System.out.println(tcb.getAddress());
				System.out.println(link_howtoget_elm.getAttribute("href"));
				System.out.println(tcb.getHowtoget1());
				System.out.println(tcb.getHowtoget2());
				
				
				branch.add(tcb); //194
			}
		}
		System.out.println("branch 갯수:"+branch.size());
		
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
		
		TheaterCrawlingDao tcd = new TheaterCrawlingDao();
		int cnt = tcd.insertBranchList(branch);
		System.out.println("insert branch cnt: "+cnt);
		
		tcd.getBranchList();
		

	} //main

}
