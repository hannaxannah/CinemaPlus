package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import mypage.model.MypageDao;
import store.model.StoreCouponBean;
import store.model.StoreCouponDao;
import store.model.StorePaymentBean;

@Controller
public class MypageCouponController {
	
	private final String command = "/myCouponList.mp";
	private final String gotopage = "myCouponList";
	
	@Autowired
	MypageDao pdao;
	
	@Autowired
	StoreCouponDao storeCouponDao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session, Model model) {
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		String member_code = mb.getMember_code();
		
		List<StoreCouponBean> myCouponListInfo = storeCouponDao.checkUserAvailableCouponListInfo(member_code);
		
		model.addAttribute("myCouponListInfo",myCouponListInfo);
		
		return gotopage;
	}

}
