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
	
	public StorePayDetailBean() {
		super();
	}

	public int getPayde_code() {
		return payde_code;
	}

	public void setPayde_code(int payde_code) {
		this.payde_code = payde_code;
	}

	public String getPay_code() {
		return pay_code;
	}

	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public String getCard_company() {
		return card_company;
	}

	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}

	public int getCard_mmyy() {
		return card_mmyy;
	}

	public void setCard_mmyy(int card_mmyy) {
		this.card_mmyy = card_mmyy;
	}

	public int getCard_pw() {
		return card_pw;
	}

	public void setCard_pw(int card_pw) {
		this.card_pw = card_pw;
	}

	public int getCard_installment() {
		return card_installment;
	}

	public void setCard_installment(int card_installment) {
		this.card_installment = card_installment;
	}
	
	
	
}
