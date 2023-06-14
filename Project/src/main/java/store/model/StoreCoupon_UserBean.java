package store.model;

public class StoreCoupon_UserBean {
	private String member_code;//회원코드
	private String coupon_code;//쿠폰코드
	private int coupon_state;//쿠폰 상태 0:미사용 1:사용
	
	public StoreCoupon_UserBean() {
		super();
	}
	public StoreCoupon_UserBean(String member_code, String coupon_code, int coupon_state) {
		super();
		this.member_code = member_code;
		this.coupon_code = coupon_code;
		this.coupon_state = coupon_state;
	}
	public String getMember_code() {
		return member_code;
	}
	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}
	public int getCoupon_state() {
		return coupon_state;
	}
	public void setCoupon_state(int coupon_state) {
		this.coupon_state = coupon_state;
	}
	
	
	
}
