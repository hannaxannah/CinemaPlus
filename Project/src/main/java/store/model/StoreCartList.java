package store.model;

import java.util.HashMap;
import java.util.Map;

public class StoreCartList {
	
	private Map<Integer,Integer> cartlists = null;
	
	public StoreCartList() {
		cartlists = new HashMap<Integer,Integer>(); // <키(상품코드) , 값(수량)>
		
	}

	public void addOrder(int product_code, int cart_qty) {
		cartlists.put(product_code, cart_qty); //map에 상품코드(key)를 넣으면 수량(value)이 나온다
	}
	
	public Map<Integer,Integer> getAllCartList() {//상품목록 반환
		
		return cartlists;
	}
	
	public void deleteProduct(int product_code) {
		cartlists.remove(product_code);
	}
	
	public void removeCartList() {//상품목록 전체삭제
		cartlists.clear();
	}
}
