package store.model;

public class StoreCartBean {
	
	private String product_code; //상품 코드
	private int cart_qty; //상품 수량
	
	private String product_name;//상품명
	private String product_image;//상품사진
	private int product_sprice;//상품단가
	private int product_price;//상품원가
	private int cart_amount;//수량*상품단가
	
	public StoreCartBean(String product_code, int cart_qty, String product_name, String product_image,
			int product_sprice, int product_price, int cart_amount) {
		super();
		this.product_code = product_code;
		this.cart_qty = cart_qty;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_sprice = product_sprice;
		this.product_price = product_price;
		this.cart_amount = cart_amount;
	}
	public StoreCartBean() {
		super();
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_sprice() {
		return product_sprice;
	}
	public void setProduct_sprice(int product_sprice) {
		this.product_sprice = product_sprice;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	
	
	
}
