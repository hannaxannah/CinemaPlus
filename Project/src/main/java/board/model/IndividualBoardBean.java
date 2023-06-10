package board.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class IndividualBoardBean {
   private int moviecode; 
   private int movie_code; 
   private String member_code2;
   private String customer_id;
   private String name; 
   private String tel_num; 

   private String email; 

   private String select_type;
   
   private String question_type; 

   private int ref;
   private int re_step;
   private int re_level;
   
   private String subject; 

   private String content;
   private Date write_date; 
   private String image; 
   private String individual_content;
   private MultipartFile upload;
   private String upload2;
   private String issecret;
   
   
   
}
