package movie.model;

public class VodBean {
	private String movie_code;
	private int vod_price;
	private String vod_title;
	private String url;
	
	public VodBean() {
		super();
	}
	
	public VodBean(String movie_code, int vod_price, String vod_title, String url) {
		super();
		this.movie_code = movie_code;
		this.vod_price = vod_price;
		this.vod_title = vod_title;
		this.url = url;
	}

	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public int getVod_price() {
		return vod_price;
	}
	public void setVod_price(int vod_price) {
		this.vod_price = vod_price;
	}
	public String getVod_title() {
		return vod_title;
	}
	public void setVod_title(String vod_title) {
		this.vod_title = vod_title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	
}
