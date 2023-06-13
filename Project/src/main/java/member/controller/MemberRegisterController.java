package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	private final String command = "register.mb"; /* 로그인화면에서 회원가입 클릭 */
	private final String getPage = "memberRegisterForm"; /* 회원가입폼 */
	private final String gotoPage = "redirect:/main.mn"; /* 메인화면 */
	
	@Autowired
	MemberDao mdao;
	
	// 로그인 폼에서 회원가입 요청
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {
		return getPage;
	}

	//회원가입 폼에서 요청
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
				@ModelAttribute("mb") @Valid MemberBean mb,
				BindingResult result) {

		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			
		}else {
			int cnt = mdao.insertMember(mb);
			
			if(cnt > -1) {
				mav.setViewName(gotoPage);
				
			}else {
				mav.setViewName(getPage);
			}
		}
		return mav;
	}

}