package board.controller;

import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import board.model.BoardBean;
import board.model.IndividualBoardBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.model.IndividualBoardDao;
import member.model.MemberBean;

@Controller
public class IndividualBoardReplyController {
   private final String command = "/reply.in";
   private final String getPage = "individualReplyForm";
   private final String gotoPage = "redirect:/list.in";

   @Autowired
   IndividualBoardDao idao;

   @Autowired
   ServletContext servletContext;

   @RequestMapping(value = command, method = RequestMethod.GET)
   public String doAction(HttpServletRequest request, Model model, HttpServletResponse response, HttpSession session) throws IOException {
      
	   String pageNumber = request.getParameter("pageNumber");
	   
	   if (session.getAttribute("loginInfo") == null) {
         response.sendRedirect(request.getContextPath() + "/loginForm.cm");
         return null;
      }

      MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
      model.addAttribute("pageNumber",pageNumber);
      
      model.addAttribute("email", mb.getMember_email());
      model.addAttribute("name", mb.getMember_name());
      model.addAttribute("phone", mb.getMember_phone());

      return getPage;
   }

   @RequestMapping(value = command, method = RequestMethod.POST, produces = "application/json")
   public ResponseEntity<Map<String, String>> doAction(
		   /* @ModelAttribute IndividualBoardBean board, */
		   @RequestParam("pageNumber") int pageNumber,
           @ModelAttribute("board") @Valid IndividualBoardBean board, 
           BindingResult resultply,
           HttpServletRequest request,
           HttpServletResponse response,
           HttpSession session
           	) throws Exception {

	   ModelAndView mav = new ModelAndView();
	   mav.addObject("pageNumber", pageNumber);
	   
	      if(resultply.hasErrors()) {
		         mav.setViewName(getPage);
		      }else {
		         int cnt = idao.replyUpdateBoard(board);
		         System.out.println("replyUpdateBoard cnt: "+cnt);
		         if(cnt != -1) {
		            idao.replyInsertBoard(board);
		            
		            mav.setViewName(gotoPage);
		         }else {
		            mav.setViewName(getPage);
		         }
		      }
	   
      if (session.getAttribute("loginInfo") == null) {
         response.sendRedirect(request.getContextPath() + "/memberlogin");
         return null;
      }

      //uploadPath:C:\\Users\\user\Downloads\spring-tool-suite-3.9.17.RELEASE\sts-bundle\pivotal-tc-server\instances\Spring3\wtpwebapps\20_Spring_MyBatis_Products\resources
      String uploadPath = servletContext.getRealPath("/resources");
      System.out.println("uploadPath:" + uploadPath);

      System.out.println("*:" + uploadPath + File.separator + board.getUpload().getOriginalFilename());
		
      File destination = new File(uploadPath + File.separator + board.getUpload().getOriginalFilename());

      String str = "c:/tempUpload";
      File destination_local = new File(str + File.separator + board.getUpload().getOriginalFilename());

      MultipartFile multi = board.getUpload();


      Map<String, String> result = new HashMap<String, String>();
      MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
      board.setMember_code2(mb.getMember_code());
      board.setCustomer_id(mb.getMember_id());
      board.setName(mb.getMember_name());
      board.setTel_num(mb.getMember_phone());
      board.setEmail(mb.getMember_email());
      board.setImage(board.getUpload().getOriginalFilename());
      if (board.getIssecret() == null) {
         board.setIssecret("N");
      }

      
      try {
    	  
         multi.transferTo(destination);
         
         //FileCopyUtils.copy(destination_local, destination);
         FileCopyUtils.copy(destination, destination_local);

         result.put("result", "success");
      } catch (Exception e) {
         e.printStackTrace();
         result.put("result", "fail");
         throw e;
      }
      return new ResponseEntity<Map<String, String>>(result, HttpStatus.valueOf(200));
      
      
   }//
   
}//클래스


