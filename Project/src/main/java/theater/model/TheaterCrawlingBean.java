package theater.model;

public class TheaterCrawlingBean {

	//영화관+지역 DB
	
	private String code;
	private String area;
	private String branch; //지역=>지점, 영화관=>영화관명
	private String address;
	private String howtoget;
	
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
	public String getHowtoget() {
		return howtoget;
	}
	public void setHowtoget(String howtoget) {
		this.howtoget = howtoget;
	}
	
	

	
}

