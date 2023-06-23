<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%> 

<style>
form{
	margin-top: 30px;
	margin-left: 40%;
}
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

<%
Random rand = new Random();

String temp = Integer.toString( rand.nextInt(8) + 1);

for (int i = 0; i < 7; i++) {
    temp+= Integer.toString(rand.nextInt(9));
}
	System.out.println("8자리 인증번호 : " + temp);
%>


	<table style="margin: auto; margin-top: 170px">
		<tr>
			<td>
				<font style="font-size: small;">* 인증 확인 메일은 회원가입 시 입력한 메일로 자동 발송됩니다.</font><br>
				<font style="font-size: small; color: red;">* 메일 발송은 현재 175번 가능함 남용X</font>
			</td>
		</tr>
	</table>

   <form id="form" action="mail.mp" method="post" style="margin-bottom: 170px;">
    <input type="hidden" name="to_email" id="to_email" value="${loginInfo.member_email}">
  <div class="field">
    <label for="to_name">인증 받을 계정ID</label>
    <input type="text" name="to_name" id="to_name" value="${sessionScope.loginInfo.member_id}" readonly="readonly">
  </div>
  <div class="field">
    <label for="from_name">보내는 사람</label>
    <input type="text" name="from_name" id="from_name" value="CINEMA PLUS" readonly="readonly">
  </div>
  
  <div class="field">
    <label for="message">인증번호 확인</label>
    <input type="hidden" name="message" id="message" value="<%=temp%>">
    <input type="text" name="message1" id="message1">
  </div>
  <input type="submit" id="button" value="메일 전송하기">
  <input type="button" id="checkButton" onclick="return check()" value="인증 확인">
</form>


<script type="text/javascript"
  src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script type="text/javascript">

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
  
  
function check() {
	if($("#message1").val() == <%=temp%>) {
		alert("인증이 완료되었습니다.");
		location.href="myUpdate.mp?member_id="+"${loginInfo.member_id}";
	}else if($("#message1").val() != <%=temp%>) {
		alert("인증번호가 맞지 않습니다.");
		return;
	}
} 
  
</script>

<%@ include file="../main/mainFooter.jsp"%>



