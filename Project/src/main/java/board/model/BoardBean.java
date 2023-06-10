package board.model;

import java.security.Timestamp;
import java.sql.Date;

public class BoardBean {
	private int movie_num;
	private String classification;
	private String question;
	private Date qdate;
	private String content;
	private int hits;
	
	public BoardBean() {
		super();
	}
	
	public BoardBean(int movie_num, String classification, String question, Date qdate, String content, int hits) {
		super();
		this.movie_num = movie_num;
		this.classification = classification;
		this.question = question;
		this.qdate = qdate;
		this.content = content;
		this.hits = hits;
	}
	
	
	public int getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	
	
}
