package board.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class IndividualBoardBean {
	private int moviecode;//영화관코드
	private int movie_code;//영화관코드
	private String member_code2;//회원코드
	private String customer_id;//회원아이디
	private String name;//작성자명
	private String tel_num;//연락처

	private String email;//이메일

	private String select_type;//문의선택

	private String question_type;//문의유형


	private String subject;

	private String content;
	private Date write_date;
	private Date writeDate;
	private String image;
	private String individual_content;
	private MultipartFile upload;
	private String upload2;
	private String issecret;

	public IndividualBoardBean() {
		super();
	}

	public IndividualBoardBean(int moviecode, int movie_code, String member_code2, String customer_id, String name,
			String tel_num, String email, String select_type, String question_type,
			String subject, String content, Date write_date, String image, String individual_content,
			MultipartFile upload, String upload2, String issecret) {
		this.moviecode = moviecode;
		this.movie_code = movie_code;
		this.member_code2 = member_code2;
		this.customer_id = customer_id;
		this.name = name;
		this.tel_num = tel_num;
		this.email = email;
		this.select_type = select_type;
		this.question_type = question_type;
		this.subject = subject;
		this.content = content;
		this.write_date = write_date;
		this.image = image;
		this.individual_content = individual_content;
		this.upload = upload;
		this.upload2 = upload2;
		this.issecret = issecret;
	}

	public int getMoviecode() {
		return moviecode;
	}

	public void setMoviecode(int moviecode) {
		this.moviecode = moviecode;
	}

	public int getMovie_code() {
		return movie_code;
	}

	public void setMovie_code(int movie_code) {
		this.movie_code = movie_code;
	}

	public String getMember_code2() {
		return member_code2;
	}

	public void setMember_code2(String member_code2) {
		this.member_code2 = member_code2;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel_num() {
		return tel_num;
	}

	public void setTel_num(String tel_num) {
		this.tel_num = tel_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSelect_type() {
		return select_type;
	}

	public void setSelect_type(String select_type) {
		this.select_type = select_type;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getIndividual_content() {
		return individual_content;
	}

	public void setIndividual_content(String individual_content) {
		this.individual_content = individual_content;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getUpload2() {
		return upload2;
	}

	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}

	public String getIssecret() {
		return issecret;
	}

	public void setIssecret(String issecret) {
		this.issecret = issecret;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

}
