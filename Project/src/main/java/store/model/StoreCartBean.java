package store.model;

public class StoreCartBean {
	//Cart에 들어있는 칼럼
	private int cart_code;
	private String product_code;
	private String member_code;
	private int cart_qty;
	private int cart_status;
	
	//Cart 테이블에 들어있지 않은 칼럼
	private String product_name;//상품명
	private String product_image;//상품사진
	private int product_sprice;//상품단가
}
