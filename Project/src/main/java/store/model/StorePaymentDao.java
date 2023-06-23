package store.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StorePaymentDao {
	
	private String namespace = "Store.model.store";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String createPayCode() {//결제코드를 만드는 메서드 *결제한 시스템시간 13자리+ 랜덤3자리
		
		String code = null;
		
		String myDate   = new java.text.SimpleDateFormat("yyMMddHHmmSSS").format(new java.util.Date());//날짜시간13자리
        
        StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 3; i++) {//랜덤숫자3자리
			int num = (int) (Math.random() * 10);
			sb.append(num);
		}
		String ranNum = sb.toString();
        
        code = myDate+ranNum;//16자리 결제코드
        
		return code;
	}
	
	/* 카드정보저장 */
	public int paymentOrder_card(StoreCardBean storeCardBean) {
		int check = -1;
		
		check = sqlSessionTemplate.insert(namespace+".InsertCard", storeCardBean);
			
		return check;	
	}
	
	/* 결제정보저장 */
	public int paymentOrder_payment(StorePaymentBean storePaymentBean) {
		
		int check = -1;
	
		check = sqlSessionTemplate.insert(namespace+".InsertPayment", storePaymentBean);
	
		return check;
	}
	
	/* 회원코드기준으로 주문목록 조회 */
	public List<StorePaymentBean> myPayment_code(String member_code) {
		List<StorePaymentBean> myPaylist = new ArrayList<StorePaymentBean>();
		
		myPaylist = sqlSessionTemplate.selectList(namespace+".ChkPayment_codeByMember_code",member_code); 
		String Payment_code;
		List<StorePaymentBean> myOrderInfolist = new ArrayList<StorePaymentBean>();
		for(StorePaymentBean e:myPaylist) {
			Payment_code = e.getPayment_code();
			List<StorePaymentBean> spb = sqlSessionTemplate.selectList(namespace+".ChkOrderListByPayment_code",Payment_code);
			 myOrderInfolist.addAll(spb);
		}
		
		return myOrderInfolist;
	}
	
	/* 무슨 카드로 결제했는지 결제코드로 불러오기 */
	public StoreCardBean card_Info(String payment_code){
		StoreCardBean storeCardBean = null;
		
		storeCardBean =  sqlSessionTemplate.selectOne(namespace+".CardInformationByPayment_code",payment_code); 
		
		return storeCardBean;
	}
	
	/* 결제목록에 담긴 상품 갯수 불러오기 */
	public int orderProductsCount(StorePaymentBean storePaymentBean) {
		int cnt = 0;
		
		cnt = sqlSessionTemplate.selectOne(namespace+".OrderProductsCount",storePaymentBean);
		
		return cnt;
	}
	
	/* 주문되있는 상품의 코드와 수량을 가져오는 코드 */
	public List<StorePaymentBean> orderProductsCode(StorePaymentBean storePaymentBean) {
		List<StorePaymentBean> myProductslist = new ArrayList<StorePaymentBean>();
		
		myProductslist = sqlSessionTemplate.selectList(namespace+".OrderProductsList",storePaymentBean);
		
		return myProductslist;
	}
	
//	public int orderProductsAmount(String payment_code) {
//		int cnt = 0;
//		
//		cnt = sqlSessionTemplate.selectOne(namespace+".OrderProductsAmount",payment_code);
//		
//		return cnt;
//	}

}
