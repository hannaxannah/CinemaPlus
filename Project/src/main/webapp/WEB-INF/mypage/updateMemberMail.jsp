<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<style>
.field {
  margin-bottom: 10px;
}

.field label {
  display: block;
  font-size: 12px;
  color: #777;
}

.field input {
  display: block;
  min-width: 250px;
  line-height: 1.5;
  font-size: 14px;
}
</style>

   <form id="form" action="mail.mp" method="post">
  <div class="field">
    <label for="to_name">받는사람</label>
    <input type="text" name="to_name" id="to_name" value="${sessionScope.loginInfo.member_id}">
  </div>
  <div class="field">
    <label for="from_name">보내는 사람</label>
    <input type="text" name="from_name" id="from_name" value="CINEMA PLUS" readonly="readonly">
  </div>
  
  <c:if test="${sessionScope.loginInfo.member_id eq 'admin'}">
  <div class="field">
    <label for="message">인증번호</label>
    <input type="text" name="message" id="message" value="TL4AP9SZ">
  </div>
  </c:if>
  <input type="submit" id="button" value="메일 전송하기">
</form>
<!-- 
  <div class="field">
    <label for="message1">인증번호 확인</label>
    	<input type="text" name="confirm_m" id="confirm_m">
    	<input type="submit" id="numCheck" value="인증 확인" onclick="return check()">
  </div>
	 -->

<script type="text/javascript"
  src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript">
/* 
	function check() {
		if(${"#numCheck"}.val == "TL4AP9SZ") {
			location.href="mypage_update.mb?member_id="+${loginInfo.member_id};
		}else {
			alert("인증번호가 맞지 않습니다.");
			return;
		}
	} 
	*/

  emailjs.init('f8nFzr47CZNJoupb0')
  
  const btn = document.getElementById('button');

document.getElementById('form')
 .addEventListener('submit', function(event) {
   event.preventDefault();

   btn.value = '전송 중...';

   const serviceID = 'default_service';
   const templateID = 'template_4fhvf5e';

   emailjs.sendForm(serviceID, templateID, this)
    .then(() => {
      btn.value = '메일 전송';
      alert('메일 전송이 완료되었습니다.');
    }, (err) => {
      btn.value = '메일 전송';
      alert(JSON.stringify(err));
    });
});
  
  
</script>





