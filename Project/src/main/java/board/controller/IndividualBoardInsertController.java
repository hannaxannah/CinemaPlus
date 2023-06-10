package board.controller;

import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

      /* �̹��� �߰�4. post��û�� ������ �� uploadPath������ ������Ʈ ��ü ��ġ������ �� */
      //uploadPath:C:\\Users\\user\Downloads\spring-tool-suite-3.9.17.RELEASE\sts-bundle\pivotal-tc-server\instances\Spring3\wtpwebapps\20_Spring_MyBatis_Products\resources
      String uploadPath = servletContext.getRealPath("/resources");
      System.out.println("uploadPath:" + uploadPath);

      // ��� ��� : C:\\Users~~~\resources\lemon.jpg
      System.out.println("*:" + uploadPath + File.separator + board.getUpload().getOriginalFilename());
		
		/* 
		 �̹��� �߰�5. [���� �ȿ� ������ ���� �������� ����� ���� File��ü�� ����] 
		 */
      File destination = new File(uploadPath + File.separator + board.getUpload().getOriginalFilename());

      /* �̹��� �߰�8. �ӽ������� ���� ������ �̹������� �ø� �۾��� �ϴ� �ڵ� */
      String str = "c:/tempUpload";
      File destination_local = new File(str + File.separator + board.getUpload().getOriginalFilename());

      /* �̹��� �߰�6. MultipartFile��ü�� �������ִ� productBean.getUpload�� ���� multi������ �޾Ƽ� ���� */
      MultipartFile multi = board.getUpload();


      // �������� ����.
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
         // DB Insert ����.
         idao.InsertBoard(board);

         /* �̹��� �߰�7. ������ ������ �̹��� �ø��� �۾� - transferTo�޼���(����ó���ؾ���)�� MultipartFile��ü�� ���������� multi�� ���� ���� */
         multi.transferTo(destination);
         
         /*
            �̹��� �߰�9.
            ������ ����(destination)�� �ø� �̹��������� ����(destination_local)�� �����ؼ� �ø� */
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
   
   
   
   
   
   
   
}