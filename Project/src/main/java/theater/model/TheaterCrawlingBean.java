package theater.model;

public class TheaterCrawlingBean {

	//영화관+지역 DB
	
	private String code;
	private String area;
	private String branch; //지역=>지점, 영화관=>영화관명
	private String address;
	private String howtoget1;
	private String howtoget2;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHowtoget1() {
		return howtoget1;
	}
	public void setHowtoget1(String howtoget1) {
		this.howtoget1 = howtoget1;
	}
	public String getHowtoget2() {
		return howtoget2;
	}
	public void setHowtoget2(String howtoget2) {
		this.howtoget2 = howtoget2;
	}
	
	

	
}

