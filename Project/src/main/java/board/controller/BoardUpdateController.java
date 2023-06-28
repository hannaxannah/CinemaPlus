package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardUpdateController {

	private final String command = "/faqUpdate.bd";
	private final String getPage = "boardFaqUpdateBoard";
	private final String gotoPage = "redirect:/list.bd";
	
	@Autowired
   BoardDao boardDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView goAction(@RequestParam("movienum") String movie_num) {

		System.out.println("movie_num: "+movie_num);
		
		ModelAndView mav = new ModelAndView();
		BoardBean board = boardDao.GetBoardByNum(movie_num);
		mav.addObject("board", board);
		mav.setViewName(getPage);
		return mav;
	}
	
		@RequestMapping(value=command, method=RequestMethod.POST)
		public ModelAndView doAction(
				@ModelAttribute("board") @Valid BoardBean board,
				HttpServletResponse response,
				BindingResult result,
				@RequestParam("movie_num") String movie_num
				) throws IOException {
			
			System.out.println("update movienum: " + movie_num);
			
			response.setCharacterEncoding("EUC-KR");
		    PrintWriter writer;
		     
			writer = response.getWriter();
				
			ModelAndView mav = new ModelAndView();
			BoardBean Board = boardDao.GetBoardByNum(movie_num);
			
			if(result.hasErrors()) {
				mav.setViewName(getPage);
			}else {
				int cnt = boardDao.updateFaqBoard(board);
				if(cnt != -1) {
					System.out.println("update성공");
					
					  writer.println("<script type='text/javascript'>");
					  writer.println("alert('FAQ정보가 수정 되었습니다.');");
					  writer.println("location.href='list.bd' ");
					  writer.println("</script>");
					  writer.flush();
					  
				}else {
					System.out.println("update실패");
					
					  writer.println("<script type='text/javascript'>");
					  writer.println("alert('FAQ정보 수정에 실패하였습니다.');");
					  writer.println("location.href = 'history.go(-2);'");
					  writer.println("</script>");
					  writer.flush();
					  
					mav.setViewName(getPage);
				}
			}
			return mav;
		}
	}