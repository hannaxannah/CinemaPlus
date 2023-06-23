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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import theater.model.LocationBean;
import theater.model.TheaterCrawlingBean;
import theater.model.TheaterCrawlingDao;
import theater.model.TheaterDao;


@Controller
public class TheaterHowtogetCrawlingController {
	
	private final String command = "howtoget.th";
	//private final String getPage = "redirect:/howtoget.th";
	
	private final String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
	private final String WEB_DRIVER_PATH = "C:/Users/pc/Downloads/chromedriver_win32/chromedriver.exe"; //드라이버 경로
	
	@Autowired
	TheaterDao tdao;
	
	@RequestMapping(value=command)
	public String crolling(HttpServletRequest request, Model model,
			@RequestParam("branch") String branch) throws Exception {
		
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
		
		//branch 정보 가져오기
		TheaterCrawlingBean branchInfo = tdao.getHowtogetByBranch(branch);
		
		//branchInfo howtoget(url)로 이동
		String howtoget = branchInfo.getHowtoget1() + branchInfo.getHowtoget2();
		driver.get(howtoget);
		
		//영화관 위치안내 selector
		WebElement howtoget_elm = driver.findElement(By.className("info-contents"));
		
		//영화관 위치안내 추출
		String subway = howtoget_elm.getText();
		System.out.println(subway);
		//tcb.setHowtoget(howtoget_elm.getText());
		
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

		model.addAttribute("address", branchInfo.getAddress());
		model.addAttribute("subway", subway);
		
		return "theater.th?branch="+branch;
	}
	
	
}