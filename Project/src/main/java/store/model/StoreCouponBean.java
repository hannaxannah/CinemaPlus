package store.model;

public class StoreCouponBean {
	private String coupon_number;//쿠폰번호(시퀀스로 받아옴)
	private String coupon_name;//쿠폰이름(쿠폰생성할때 입력받음)
	
	private int coupon_state;//쿠폰상태(0 : 미사용 / 1 : 사용)
	private int coupon_rate;//쿠폰 할인률
	private int coupon_qty;//쿠폰 갯수(0이 되면 품절메세지 띄움)
	
	private String member_code;//회원ID(쿠폰을 가진 회원의 id)

	public StoreCouponBean() {
		super();
	}

	public StoreCouponBean(String coupon_number, String coupon_name, int coupon_state, int coupon_rate, int coupon_qty,
			String member_code) {
		super();
		this.coupon_number = coupon_number;
		this.coupon_name = coupon_name;
		this.coupon_state = coupon_state;
		this.coupon_rate = coupon_rate;
		this.coupon_qty = coupon_qty;
		this.member_code = member_code;
	}

	public String getCoupon_number() {
		return coupon_number;
	}

	public void setCoupon_number(String coupon_number) {
		this.coupon_number = coupon_number;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getCoupon_state() {
		return coupon_state;
	}

	public void setCoupon_state(int coupon_state) {
		this.coupon_state = coupon_state;
	}

	public int getCoupon_rate() {
		return coupon_rate;
	}

	public void setCoupon_rate(int coupon_rate) {
		this.coupon_rate = coupon_rate;
	}

	public int getCoupon_qty() {
		return coupon_qty;
	}

	public void setCoupon_qty(int coupon_qty) {
		this.coupon_qty = coupon_qty;
	}

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}
	
	
	
}
