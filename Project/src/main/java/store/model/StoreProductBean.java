package store.model;

public class StoreProductBean {
	private String product_code; //상품코드 product_seq로 받아옴
	private String category_name; //카테고리이름 Product_Category table 에서 받아옴
	private String product_name; //상품이름
	private String product_detail; //상품설명
	private String product_image; //상품 이미지
	
	private int product_qty;	//상품 갯수
	private int product_price;	//상품 가격
	private int product_sprice;	//상품 세일 가격 *세일 가격이 없다면 sprice가 최종가격
	private int product_state; //상품 상태  0:품절 1:상품대기 2:판매중 3:new상품 4:best상품 5:추천상품 6:대표상품
	private int product_point; //상품 포인트
	
	//테이블에 없음 payment에서 넘겨받기위한 값
	private int product_order_qty; //주문한 수량
	private int payment_sale_pay;//결제 할인 금액
	
	public StoreProductBean() {
		super();
	}

	public StoreProductBean(String product_code, String category_name, String product_name, String product_detail,
			String product_image, int product_qty, int product_price, int product_sprice, int product_state,
			int product_point) {
		super();
		this.product_code = product_code;
		this.category_name = category_name;
		this.product_name = product_name;
		this.product_detail = product_detail;
		this.product_image = product_image;
		this.product_qty = product_qty;
		this.product_price = product_price;
		this.product_sprice = product_sprice;
		this.product_state = product_state;
		this.product_point = product_point;
	}
	
	public int getPayment_sale_pay() {
		return payment_sale_pay;
	}

	public void setPayment_sale_pay(int payment_sale_pay) {
		this.payment_sale_pay = payment_sale_pay;
	}

	public int getProduct_order_qty() {
		return product_order_qty;
	}

	public void setProduct_order_qty(int product_order_qty) {
		this.product_order_qty = product_order_qty;
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_detail() {
		return product_detail;
	}

	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public int getProduct_qty() {
		return product_qty;
	}

	public void setProduct_qty(int product_qty) {
		this.product_qty = product_qty;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_sprice() {
		return product_sprice;
	}

	public void setProduct_sprice(int product_sprice) {
		this.product_sprice = product_sprice;
	}

	public int getProduct_state() {
		return product_state;
	}

	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}

	public int getProduct_point() {
		return product_point;
	}

	public void setProduct_point(int product_point) {
		this.product_point = product_point;
	}
	
	
	
	
	
	
	
}
