package store.model;

public class StorePayDetailBean {
	
	private int payde_code;//결제상세코드(Auto Increment)
	private String pay_code;//결제코드(pay 테이블에서 가져옴)
	private int item_code;//상품코드(cart 테이블에서 가져옴)
	private int cart_qty;//상품수량(cart 테이블에서 가져옴)
	
	//card결제카드 테이블
	private String card_number;//카드번호
	private String card_company;//카드사
	private int card_mmyy;//카드월
	private int card_pw;//카드비밀번호
	private int card_installment;//할부
	
	
}
