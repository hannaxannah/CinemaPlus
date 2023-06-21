package member.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
public class MemberUpdateController {

	private final String command = "/mypage_update.mb";
	private final String getPage = "mypage_memberUpdateForm";
	private final String gotoPage = "redirect:/main.mp";
	private final String backPage = "redirect:/mypage_update.mb";;
	
	@Autowired
	MemberDao mdao;

	///mypage_update.mb -> member/mypage_memberUpdateForm
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView goAction(@RequestParam("member_id") String member_id) {

		System.out.println("member_id: "+member_id);
		
		ModelAndView mav = new ModelAndView();
		MemberBean member = mdao.GetMemberById(member_id);
		mav.addObject("mb", member);
		mav.setViewName(getPage);
		return mav;
	}

	// member/mypage_memberUpdateForm -> controller
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			@ModelAttribute("mb") @Valid MemberBean mb,
			HttpServletResponse response,
			BindingResult result) {
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=UTF-8");

		ModelAndView mav = new ModelAndView();

		if(result.hasErrors()) {
			mav.setViewName(getPage);
		}else {
			int cnt = mdao.updateMember(mb);
			if(cnt == 1 && mb.getMember_pw() != "") {
				try {
					out = response.getWriter();
					System.out.println("mb.getMember_pw(): "+mb.getMember_pw() );
					out.print("<script>alert('회원 정보가 수정되었습니다.');location.href='main.mn';</script>");
					out.flush();
					mav.setViewName(gotoPage);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else if(cnt == -1){
				try {
					out = response.getWriter();
					out.print("<script>alert('회원 정보 수정이 실패했습니다.');location.href='history.go(-1)';</script>");
					out.flush();
					mav.setViewName(getPage);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				try {
					System.out.println("mb.getMember_pw(): "+mb.getMember_pw() );
					out = response.getWriter();
					out.print("<script>alert('회원정보 및 비밀번호를 변경해주세요.');");
					out.print("location.href='mypage_update.mb?member_id="+mb.getMember_id()+"' ");
					out.print("</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return mav;
	}
}