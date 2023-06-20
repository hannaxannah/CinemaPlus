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
	
	public int paymentOrder_card(StoreCardBean storeCardBean) {
		int check = -1;
		
		check = sqlSessionTemplate.insert(namespace+".InsertCard", storeCardBean);
			
		return check;	
	}
	public int paymentOrder_payment(StorePaymentBean storePaymentBean) {
		
		int check = -1;
	
		check = sqlSessionTemplate.insert(namespace+".InsertPayment", storePaymentBean);
	
		return check;
	}
	
	
	
}
