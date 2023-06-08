package store.model;

public class StoreProduct_CategoryBean {
	private int category_num; //카테고리번호 *시퀀스로 자동발급
	private String category_name; //상품 카테고리 이름
	
	public StoreProduct_CategoryBean() {
		super();
	}
	public StoreProduct_CategoryBean(int category_num, String category_name) {
		super();
		this.category_num = category_num;
		this.category_name = category_name;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
}
