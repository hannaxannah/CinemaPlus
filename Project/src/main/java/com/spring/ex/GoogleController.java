package com.spring.ex;

import org.springframework.stereotype.Controller;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
@Controller
public class GoogleController {
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	/* 로그인 버튼 눌렀을 때 url생성될 수 있도록 NaverController로 합쳤다.
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/memberlogin", method = RequestMethod.GET )
	public String login(Model model, HttpSession session) {

		// 구글code 발행 
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String google_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + google_url);

		model.addAttribute("google_url", google_url);

		// 생성한 인증 URL을 View로 전달 
		return "redirect:/memberlogin.mb";
	}
*/

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");
		
		System.out.println();
		return "redirect:/main.mn";
	}

}
