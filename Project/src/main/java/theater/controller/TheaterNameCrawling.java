package theater.controller;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class TheaterNameCrawling {

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
		String[] url = {"http://www.cgv.co.kr/theaters",
						"http://www.cgv.co.kr/theaters/?areacode=02&theaterCode=0260&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=202&theaterCode=0043&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=12&theaterCode=0139&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=03%2C205&theaterCode=0261&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=11&theaterCode=0345&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=05%2C207&theaterCode=0061&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=204&theaterCode=0263&date=20230612",
						"http://www.cgv.co.kr/theaters/?areacode=206%2C04%2C06&theaterCode=0220&date=20230612"
						};
		
		int count = 0;
		//String[] branch = ("seoul, gyeonggi, incheon, kangwon, daejeon, daegu, busan, gyeonsang, gwangju").split(", ");
		String[] seoul, gyeonggi, incheon, kangwon, daejeon, daegu, busan, gyeonsang, gwangju;
		String[] branch_seoul, branch_gyeonggi, branch_incheon, branch_kangwon, branch_daejeon, branch_daegu, branch_busan, branch_gyeonsang, branch_gwangju;
		for(int i=0; i<url.length; i++) {
			
			driver.get(url[i]);
		
			//브라우저 이동시 생기는 로드시간을 기다린다.
			//HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				
			}
			
			List<WebElement> el2 = driver.findElements(By.className("area"));
			//System.out.println("el2.size:"+el2.size());
			
			//System.out.println(el2.get(i).getText());
			
			
			if(i==0) {
				seoul = el2.get(0).getText().split("\\n");
				//System.out.println("seoul:"+seoul.length);
				branch_seoul = new String[seoul.length];
				
				for(int j=0; j<seoul.length; j++) {
					if(seoul[j].contains("CGV")) {
						branch_seoul[j] = seoul[j].substring(3);
					}
					else{
						break;
					}
					System.out.println(branch_seoul[j]);
				}
				System.out.println("seoul:"+branch_seoul.length);
			}
			if(i==1) {
				gyeonggi = el2.get(1).getText().split("\\n");
				//System.out.println(gyeonggi.length);
				branch_gyeonggi = new String[gyeonggi.length];

				for(int j=0; j<gyeonggi.length; j++) {
					
					if(!gyeonggi[j].contains("CGV")) {
						branch_gyeonggi[j] = gyeonggi[j].substring(3);
						System.out.println(branch_gyeonggi[j]);
						break;
					}
				}
				System.out.println("gyeonggi:"+branch_gyeonggi.length);
			}
			if(i==2) {
				incheon = el2.get(2).getText().split("\\n");
				//System.out.println(incheon.length);
				branch_incheon = new String[incheon.length];

				for(int j=0; j<incheon.length; j++) {
					branch_incheon[j] = incheon[j].substring(3);
					
					if(!incheon[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_incheon[j]);
				}
				System.out.println("incheon:"+branch_incheon.length);
			}
			if(i==3) {
				kangwon = el2.get(3).getText().split("\\n");
				//System.out.println(kangwon.length);
				branch_kangwon = new String[kangwon.length];

				for(int j=0; j<kangwon.length; j++) {
					branch_kangwon[j] = kangwon[j].substring(3);
					
					if(!kangwon[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_kangwon[j]);
				}
				System.out.println("kangwon:"+branch_kangwon.length);
			}
			if(i==4) {
				daejeon = el2.get(4).getText().split("\\n");
				//System.out.println(daejeon.length);
				branch_daejeon = new String[daejeon.length];

				for(int j=0; j<daejeon.length; j++) {
					branch_daejeon[j] = daejeon[j].substring(3);
					
					if(!daejeon[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_daejeon[j]);
				}
				System.out.println("daejeon:"+branch_daejeon.length);
			}
			if(i==5) {
				daegu = el2.get(5).getText().split("\\n");
				//System.out.println(daegu.length);
				branch_daegu = new String[daegu.length];

				for(int j=0; j<daegu.length; j++) {
					branch_daegu[j] = daegu[j].substring(3);
					
					if(!daegu[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_daegu[j]);
				}
				System.out.println("daegu:"+branch_daegu.length);
			}
			if(i==6) {
				busan = el2.get(6).getText().split("\\n");
				//System.out.println(busan.length);
				branch_busan = new String[busan.length];

				for(int j=0; j<busan.length; j++) {
					branch_busan[j] = busan[j].substring(3);
					
					if(!busan[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_busan[j]);
				}
				System.out.println("busan:"+branch_busan.length);
			}
			if(i==7) {
				gyeonsang = el2.get(7).getText().split("\\n");
				//System.out.println(gyeonsang.length);
				branch_gyeonsang = new String[gyeonsang.length];

				for(int j=0; j<gyeonsang.length; j++) {
					branch_gyeonsang[j] = gyeonsang[j].substring(3);
					
					if(!gyeonsang[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_gyeonsang[j]);
				}
				System.out.println("gyeonsang:"+branch_gyeonsang.length);
			}
			if(i==8) {
				gwangju = el2.get(8).getText().split("\\n");
				//System.out.println(gwangju.length);
				branch_gwangju = new String[gwangju.length];

				for(int j=0; j<gwangju.length; j++) {
					branch_gwangju[j] = gwangju[j].substring(3);
					
					if(!gwangju[j].contains("CGV")) {
						break;
					}
					System.out.println(branch_gwangju[j]);
				}
				System.out.println("gwangju:"+branch_gwangju.length);
			}			
			
		}
		//System.out.println();
		
		
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

	} //main

}
