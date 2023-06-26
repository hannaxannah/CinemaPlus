package store.model;


public class StoreCouponBean {
	private String coupon_code;//쿠폰 고유 코드
	private String coupon_name;//쿠폰 이름
	private int coupon_rate;//할인률
	private int coupon_qty;//발급수량
	private int coupon_remain_qty;//여유 수량 *초기값은 발급수량과 같음
	
	//coupon_user랑 조인할때 가져올 변수
	private String member_code;//회원코드
	private int coupon_state;//쿠폰 상태 0:미사용 1:사용
	
	public StoreCouponBean() {
		super();
	}

	public StoreCouponBean(String coupon_code, String coupon_name, int coupon_rate, int coupon_qty,
			int coupon_remain_qty) {
		super();
		this.coupon_code = coupon_code;
		this.coupon_name = coupon_name;
		this.coupon_rate = coupon_rate;
		this.coupon_qty = coupon_qty;
		this.coupon_remain_qty = coupon_remain_qty;
	}
	
	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public int getCoupon_state() {
		return coupon_state;
	}

	public void setCoupon_state(int coupon_state) {
		this.coupon_state = coupon_state;
	}

	public String getCoupon_code() {
		return coupon_code;
	}

	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
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

	public int getCoupon_remain_qty() {
		return coupon_remain_qty;
	}

	public void setCoupon_remain_qty(int coupon_remain_qty) {
		this.coupon_remain_qty = coupon_remain_qty;
	}
	
	
	
}
