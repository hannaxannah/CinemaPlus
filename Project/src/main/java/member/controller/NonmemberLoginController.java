package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.NonmemberBean;
import member.model.NonmemberDao;

@Controller
public class NonmemberLoginController {

	private final String command = "nonmemberlogin.mb";
	private final String getPage = "nonmemberLoginForm";
	private final String gotoPage = "redirect:/main.mn"; //나중에 예매하기로 가게 바꾸기
	
	@Autowired
	NonmemberDao ndao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionByGet() {
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doActionByPost(NonmemberBean nb) {
		
		int total = ndao.getNonmemberTotal(); //1
		nb.setNonmember_code("N"+String.valueOf(total+1)); //N2
		System.out.println("total:"+total+"/setCode:"+nb.getNonmember_code());
		
		int cnt = ndao.insertNonmember(nb);
		
		if(cnt > -1) {
			return gotoPage;
		}else {
			return getPage;
		}
		
	}

}
