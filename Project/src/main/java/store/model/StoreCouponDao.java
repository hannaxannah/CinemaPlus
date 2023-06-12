package store.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StoreCouponDao {

	private String namespace = "Store.model.store";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;	
		
	public int createCoupon(StoreCouponBean StoreCouponBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".CreateCoupon", StoreCouponBean);
		
		return cnt;
	}
	
}
