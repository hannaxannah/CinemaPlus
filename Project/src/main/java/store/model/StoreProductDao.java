package store.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoreProductDao {
	
	private String namespace = "Store.model.Product";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<StoreProductBean> getAllProduct() { //전체 상품 목록 불러오기
		List<StoreProductBean> lists = new ArrayList<StoreProductBean>();

		lists = sqlSessionTemplate.selectList(namespace+".GetProductList"); 
		
		return lists;
	}

	public StoreProductBean getProducDetailByNum(int p_code) {

		StoreProductBean storeProductBean = sqlSessionTemplate.selectOne(namespace+".GetProducDetailByNum",p_code); 
		
		return storeProductBean;
	}
	
}
