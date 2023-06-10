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

import board.model.IndividualBoardBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import board.model.IndividualBoardDao;
import member.model.MemberBean;

@Controller
public class IndividualBoardInsertController {
   private final String command = "/insert.in";
   private final String getPage = "individualInsertBoard";
   private final String gotoPage = "redirect:/list.in";

   @Autowired
   IndividualBoardDao idao;

   @Autowired
   ServletContext servletContext;

   @RequestMapping(value = command, method = RequestMethod.GET)
   public String doAction(
		   HttpServletRequest request, Model model,
		   HttpServletResponse response, HttpSession session) throws IOException {
     
	   if (session.getAttribute("loginInfo") == null) {
         response.sendRedirect(request.getContextPath() + "/memberlogin.mb");
         return null;
      }

	   MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
      model.addAttribute("email", mb.getMember_email());
      model.addAttribute("name", mb.getMember_name());
      model.addAttribute("phone", mb.getMember_phone());

      return getPage;
   }

   @RequestMapping(value = command, method = RequestMethod.POST, produces = "application/json")
   public ResponseEntity<Map<String, String>> doAction(
           @ModelAttribute IndividualBoardBean board,
           HttpSession session,
           HttpServletRequest request,
           HttpServletResponse response) throws Exception {

      if (session.getAttribute("loginInfo") == null) {
         response.sendRedirect(request.getContextPath() + "/memberlogin.mb");
         return null;
      }

      /* 占싱뱄옙占쏙옙 占쌩곤옙4. post占쏙옙청占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 uploadPath占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙트 占쏙옙체 占쏙옙치占쏙옙占쏙옙占쏙옙 占쏙옙載� */
      //uploadPath:C:\\Users\\user\Downloads\spring-tool-suite-3.9.17.RELEASE\sts-bundle\pivotal-tc-server\instances\Spring3\wtpwebapps\20_Spring_MyBatis_Products\resources
      String uploadPath = servletContext.getRealPath("/resources");
      System.out.println("uploadPath:" + uploadPath);

      // 占쏙옙占� 占쏙옙占� : C:\\Users~~~\resources\lemon.jpg
      System.out.println("*:" + uploadPath + File.separator + board.getUpload().getOriginalFilename());
		
		/* 
		 占싱뱄옙占쏙옙 占쌩곤옙5. [占쏙옙占쏙옙 占싫울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙 File占쏙옙체占쏙옙 占쏙옙占쏙옙] 
		 */
      File destination = new File(uploadPath + File.separator + board.getUpload().getOriginalFilename());

      /* 占싱뱄옙占쏙옙 占쌩곤옙8. 占쌈쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱뱄옙占쏙옙占쏙옙占쏙옙 占시몌옙 占쌜억옙占쏙옙 占싹댐옙 占쌘듸옙 */
      String str = "c:/tempUpload";
      File destination_local = new File(str + File.separator + board.getUpload().getOriginalFilename());

      /* 占싱뱄옙占쏙옙 占쌩곤옙6. MultipartFile占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙占쌍댐옙 productBean.getUpload占쏙옙 占쏙옙占쏙옙 multi占쏙옙占쏙옙占쏙옙 占쌨아쇽옙 占쏙옙占쏙옙 */
      MultipartFile multi = board.getUpload();


      // 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙.
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
         // DB Insert 占쏙옙占쏙옙.
         idao.InsertBoard(board);

         /* 占싱뱄옙占쏙옙 占쌩곤옙7. 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱뱄옙占쏙옙 占시몌옙占쏙옙 占쌜억옙 - transferTo占쌨쇽옙占쏙옙(占쏙옙占쏙옙처占쏙옙占쌔억옙占쏙옙)占쏙옙 MultipartFile占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 multi占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 */
         multi.transferTo(destination);
         
         /*
            占싱뱄옙占쏙옙 占쌩곤옙9.
            占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙(destination)占쏙옙 占시몌옙 占싱뱄옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙(destination_local)占쏙옙 占쏙옙占쏙옙占쌔쇽옙 占시몌옙 */
         //FileCopyUtils.copy(destination_local, destination);
         FileCopyUtils.copy(destination, destination_local);

         result.put("result", "success");
      } catch (Exception e) {
         e.printStackTrace();
         result.put("result", "fail");
         throw e;
      }
      return new ResponseEntity<Map<String, String>>(result, HttpStatus.valueOf(200));
   }



   @RequestMapping(value = "/individualReplyUpdate.in", method = RequestMethod.POST, produces = "application/json")
   public ResponseEntity<Map<String, Object>> individualReplyUpdate(@ModelAttribute IndividualBoardBean board,
                                                        HttpSession session,
                                                        HttpServletRequest request,
                                                        HttpServletResponse response) throws Exception {
      Map<String, Object> result = new HashMap<String, Object>();

      try {
         MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
         if (session.getAttribute("loginInfo") == null) {
            result.put("result", "fail");
            result.put("errorCode", 1);
            result.put("redirectUrl", request.getContextPath() + "/memberlogin.mb");
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.valueOf(200));
         }
         idao.updateReplyBoard(board);
         result.put("errorCode", 0);
         result.put("result", "success");
      } catch (Exception e) {
         result.put("errorCode", -1);
         result.put("result", "fail");
      }

      return new ResponseEntity<Map<String, Object>>(result, HttpStatus.valueOf(200));
   }
}