package mypage.controller;

import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MypageMemberUpdateController {

	private final String command = "/update.mp";
	private final String getPage = "memberUpdateForm";
	private final String gotoPage = "redirect:/list.mp";

	@Autowired
	MemberDao mdao;

	/* ȸ������ -> �������� ���� */
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView goAction(@RequestParam("member_id") String member_id) {

		System.out.println("member_id: "+member_id);
		
		ModelAndView mav = new ModelAndView();
		MemberBean member = mdao.GetMemberById(member_id);
		mav.addObject("mb", member);
		mav.setViewName(getPage);
		return mav;
	}

	// customerUpdateForm -> controller
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			@ModelAttribute("mb") @Valid MemberBean mb,
			BindingResult result) {

		ModelAndView mav = new ModelAndView();

		if(result.hasErrors()) {
			mav.setViewName(getPage);
		}else {
			int cnt = mdao.updateMember(mb);
			if(cnt != -1) {
				mav.setViewName(gotoPage);
			}else {
				mav.setViewName(getPage);
			}
		}
		return mav;
	}
}