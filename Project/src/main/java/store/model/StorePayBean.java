package store.model;

import java.sql.Timestamp;

public class StorePayBean {

	//DB에 컬럼 있는 변수
		private String payment_code;//결제코드(직접 생성해서 입력)
		private String member_code;//회원ID
		private String payment_method;//결제수단
		private int payment_total;//총결제금액
		private Timestamp payment_date;//결제일
		private Timestamp payment_cdate;//취소일(결제상태가 취소완료가 된 날짜)
		private int payment_state;//결제상태(디폴트 0 : 결제대기 / 1 : 결제완료 / 2 : 취소)
		
		public StorePayBean() {
			super();
		}

		public StorePayBean(String payment_code, String member_code, String payment_method, int payment_total,
				Timestamp payment_date, Timestamp payment_cdate, int payment_state) {
			super();
			this.payment_code = payment_code;
			this.member_code = member_code;
			this.payment_method = payment_method;
			this.payment_total = payment_total;
			this.payment_date = payment_date;
			this.payment_cdate = payment_cdate;
			this.payment_state = payment_state;
		}

		public String getPayment_code() {
			return payment_code;
		}

		public void setPayment_code(String payment_code) {
			this.payment_code = payment_code;
		}

		public String getMember_code() {
			return member_code;
		}

		public void setMember_code(String member_code) {
			this.member_code = member_code;
		}

		public String getPayment_method() {
			return payment_method;
		}

		public void setPayment_method(String payment_method) {
			this.payment_method = payment_method;
		}

		public int getPayment_total() {
			return payment_total;
		}

		public void setPayment_total(int payment_total) {
			this.payment_total = payment_total;
		}

		public Timestamp getPayment_date() {
			return payment_date;
		}

		public void setPayment_date(Timestamp payment_date) {
			this.payment_date = payment_date;
		}

		public Timestamp getPayment_cdate() {
			return payment_cdate;
		}

		public void setPayment_cdate(Timestamp payment_cdate) {
			this.payment_cdate = payment_cdate;
		}

		public int getPayment_state() {
			return payment_state;
		}

		public void setPayment_state(int payment_state) {
			this.payment_state = payment_state;
		}
		
		

}
		
