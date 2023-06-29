package movie.model;

public class MovieBean {
	private String movie_code;
	private int movie_num;
	private String movie_title;
	private String movie_story;
	private String open_date;
	private String open_year;
	private String poster;
	private String director;
	private String nation;
	private String genre;
	private String actors;
	private String rating;
	private int screen;
	private int vod;
	


	


	public MovieBean() {
		super();
	}
	public MovieBean(String movie_code, String movie_title, String movie_story, String open_date, String open_year,
			 String poster, String director, String nation, String genre, String actors,
			String rating) {
		super();
		this.movie_code = movie_code;
		this.movie_title = movie_title;
		this.movie_story = movie_story;
		this.open_date = open_date;
		this.open_year = open_year;
		this.poster = poster;
		this.director = director;
		this.nation = nation;
		this.genre = genre;
		this.actors = actors;
		this.rating = rating;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_story() {
		return movie_story;
	}
	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public String getOpen_year() {
		return open_year;
	}
	public void setOpen_year(String open_year) {
		this.open_year = open_year;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getScreen() {
		return screen;
	}
	public void setScreen(int screen) {
		this.screen = screen;
	}
	public int getVod() {
		return vod;
	}
	public void setVod(int vod) {
		this.vod = vod;
	}
	
}
