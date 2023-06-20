package store.model;

import java.sql.Timestamp;

public class StorePaymentBean {

	private String payment_code;//결제코드(yyMMddHHmmSSS+랜덤3자리)
	private String member_code;//회원코드(session에서 가져옴)
	private String card_number;//카드번호(card 테이블에서 가져옴)
	private String product_code;//상품코드
	private int product_order_qty;//상품 주문수량
	private int payment_sale_pay;//결제 할인 금액
	private Timestamp payment_date;//결제일
	
	public StorePaymentBean(String payment_code, String member_code, String card_number, String product_code,
			int product_order_qty, int payment_sale_pay, Timestamp payment_date) {
		super();
		this.payment_code = payment_code;
		this.member_code = member_code;
		this.card_number = card_number;
		this.product_code = product_code;
		this.product_order_qty = product_order_qty;
		this.payment_sale_pay = payment_sale_pay;
		this.payment_date = payment_date;
	}
	public StorePaymentBean() {
		super();
	}
	public String getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(String payment_code) {
		this.payment_code = payment_code;
	}
	public String getMember_code() {
		return member_code;
	}
	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getProduct_order_qty() {
		return product_order_qty;
	}
	public void setProduct_order_qty(int product_order_qty) {
		this.product_order_qty = product_order_qty;
	}
	public int getPayment_sale_pay() {
		return payment_sale_pay;
	}
	public void setPayment_sale_pay(int payment_sale_pay) {
		this.payment_sale_pay = payment_sale_pay;
	}
	public Timestamp getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Timestamp payment_date) {
		this.payment_date = payment_date;
	}
	
	
	
		

}
		
