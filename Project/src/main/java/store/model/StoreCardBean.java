package store.model;

public class StoreCardBean {
	
	//card결제카드 테이블
	private String card_number;//카드번호
	private String payment_code;//결제코드(yyMMddHHmmSSS+랜덤3자리) payment에서 받음
	private String card_company;//카드사
	private int card_mmyy;//카드유효기간 월/년
	private String card_pw;//카드비밀번호
	private int card_installment;//할부
	
	public StoreCardBean() {
		super();
	}
	public String getPayment_code() {
		return payment_code;
	}

	public void setPayment_code(String payment_code) {
		this.payment_code = payment_code;
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
	public String getCard_pw() {
		return card_pw;
	}
	public void setCard_pw(String card_pw) {
		this.card_pw = card_pw;
	}
	public int getCard_installment() {
		return card_installment;
	}
	public void setCard_installment(int card_installment) {
		this.card_installment = card_installment;
	}
	
	
}
