package store.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Component
public class StoreCouponDao {

	private String namespace = "Store.model.store";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;	
		
	public int createCoupon(StoreCouponBean storeCouponBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".CreateCoupon", storeCouponBean);
		
		return cnt;
	}

	public List<StoreCouponBean> getAllCoupon() {
		List<StoreCouponBean> couponList = new ArrayList<StoreCouponBean>();

		couponList = sqlSessionTemplate.selectList(namespace+".GetCouponList");
		
		return couponList;
	}
	
	public int issueCoupon(StoreCoupon_UserBean storeCoupon_UserBean) {
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".IssueCoupon", storeCoupon_UserBean);
		
		return cnt;
	}
	
//	public checkUserAvailableCoupon(String member_code) { 
//		
//		checkCoupon = sqlSessionTemplate.selectList(namespace+".CheckUserAvailableCoupon", member_code);
//		
//		return checkCoupon;
//	}
}
