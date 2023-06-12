package store.model;

import java.util.ArrayList;
import java.util.List;

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

	public List<StoreCouponBean> getAllCoupon() {
		List<StoreCouponBean> couponList = new ArrayList<StoreCouponBean>();

		couponList = sqlSessionTemplate.selectList(namespace+".GetCouponList");
		
		return couponList;
	}
	
}
