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
	
	public List<StoreCouponBean> checkUserAvailableCoupon(String member_code) { 
		List<String> myCouponList = new ArrayList<String>();
		
		myCouponList = sqlSessionTemplate.selectList(namespace+".CheckUserAvailableCoupon", member_code);
		
		List<StoreCouponBean> couponInfo = new ArrayList<StoreCouponBean>();
		//쿠폰 정보를 담은 couponInfo

		for(int i=0;i<myCouponList.size();i++) {
			//System.out.println("쿠폰 코드 : "+myCouponList.get(i).toString());
			List<StoreCouponBean> coupon = sqlSessionTemplate.selectList(namespace+".Coupon_codeToName",myCouponList.get(i).toString());
			//System.out.println("쿠폰 이름들 : "+name);
			couponInfo.addAll(coupon);
			
		}
		
//		System.out.println("멤버코드 : "+member_code);
//		System.out.println("쿠폰 리스트 크기 : "+myCouponList.size());
//		for(int i=0;i<myCouponList.size();i++) {
//			System.out.println(myCouponList.get(i).toString());
//		}
		return couponInfo;
	}
	
	public boolean checkDuplicateCoupon(StoreCoupon_UserBean storeCoupon_UserBean) {
		boolean flag = false;
		
		int chk = sqlSessionTemplate.selectOne(namespace+".CheckDuplicateCoupon", storeCoupon_UserBean);
		//System.out.println("1이면 존재 0이면 없음"+chk);
		if(chk == 1) {
			flag = true;
		}
		
		return flag;
	}
	
	public void decreaseCouponQty(String coupon_code) {
		
		sqlSessionTemplate.selectOne(namespace+".decreaseCouponQty",coupon_code);
		
	}
	
}
