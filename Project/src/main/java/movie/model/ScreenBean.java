package movie.model;

public class ScreenBean {
	private String movie_title;
	private int seat_count;
	private int left_seats;
	private String screen_time;
	private String time;
	private String screen_name;
	private int runtime;
	private int ticket_price;
	private String discount;
	private String rating;
	public ScreenBean() {
		super();
	}
	
	
	public ScreenBean(String movie_title, int seat_count, int left_seats, String screen_time, String time,
			String screen_name, int runtime, int ticket_price, String discount, String rating) {
		super();
		this.movie_title = movie_title;
		this.seat_count = seat_count;
		this.left_seats = left_seats;
		this.screen_time = screen_time;
		this.time = time;
		this.screen_name = screen_name;
		this.runtime = runtime;
		this.ticket_price = ticket_price;
		this.discount = discount;
		this.rating = rating;
	}


	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public int getSeat_count() {
		return seat_count;
	}
	public void setSeat_count(int seat_count) {
		this.seat_count = seat_count;
	}
	public String getScreen_time() {
		return screen_time;
	}
	public void setScreen_time(String screen_time) {
		this.screen_time = screen_time;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getLeft_seats() {
		return left_seats;
	}

	public void setLeft_seats(int left_seats) {
		this.left_seats = left_seats;
	}
	
	
}
