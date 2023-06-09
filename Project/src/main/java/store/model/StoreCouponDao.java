package store.model;

public class StoreCouponDao {

	public String createCoupon() {
		String coupon = null;
		
		String myDate = new java.text.SimpleDateFormat("ddMMyyHHmmss").format(new java.util.Date());//시간날짜12자리
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 4; i++) {//랜덤숫자4자리 
			int num = (int) (Math.random() * 10);
			sb.append(num);
		}
		String ranNum = sb.toString();
		
		coupon = myDate+ranNum;//16자리 쿠폰번호
		
		return coupon;
	}//createCoupon()
	
}
