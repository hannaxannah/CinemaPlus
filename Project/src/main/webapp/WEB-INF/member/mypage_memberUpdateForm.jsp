<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>    
customerUpdateForm.jsp<br>

<style type="text/css">
.err {
	font-size: 8px;
	color: red;
	
}

th,input{
	height:30px;
}

th{
	width: 150px;
}

.t_red{
	color:#f55500
}

p{
	font-size: small;
	margin-right: 250px;
}

.signupBoxTool__signupBox__terms__summary {
  height: 150px;
  overflow: auto;
  padding: 7px;
  margin-bottom: 0;
}
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<script type="text/javascript">
$(function(){
    $('#member_pw').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#userPwChk').keyup(function(){

        if($('#member_pw').val() != $('#userPwChk').val()){
          $('#chkNotice').html('비밀번호 불일치<br>');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치<br>');
          $('#chkNotice').attr('color', '#199894b3');
        }

    });
});

$(document).ready(function() {
    $(".submit").click(function() {
       
    	if($('#member_pw').val() == "") {
    		alert("비밀번호 변경 후에 클릭해주세요.");
    	}
    });
});

</script>​​

<%
	String[] martketingArr = {"비동의","동의"};
	String[] emailArr = {"수신동의","수신거부"};
	String[] smsArr = {"수신동의","수신거부"};
%>

<center>
<h3 style="margin-right: 400px">회원 정보</h3>
<form:form commandName="mb" action="mypage_update.mb" method="post">
	<input type="hidden" name="member_code" value="${mb.member_code}">
	<table border="1" style="width: 500px">
		<tr>
			<p>* 회원님의 정보를 정확히 입력해주세요.</p>
			<th>아이디<span class="t_red">*</span></th>
			<td>
			<input type="text" name="member_id" value="${mb.member_id}" readonly style="background-color: #F6F6F6;">
			<form:errors cssClass="err" path="member_id"/>
			</td>
		</tr>
		<tr>
			<th>비밀번호<span class="t_red">*</span></th>
			<td>
				<input type="password" id="pwbutton" name="mpw1" value="${mb.member_pw}">
			</td>
		</tr>
	</table>
		<details>
		<summary>비밀번호 변경하기</summary>
		<table border="1" style="width: 500px" id="pwcheck" markdown="1">
		<tr>
			<th>현재 비밀번호</th>
			<td>
			<input type="password" name="mpw_og" value="${mb.member_pw}" disabled="disabled">
			</td>
		</tr>
		<tr>
			<th>변경 비밀번호</th>
			<td>
			<input type="password" id="member_pw" name="member_pw" placeholder="비밀번호 변경 입력"/>
			 <br>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
			<input type="password" id="userPwChk" placeholder="비밀번호 확인"/>
			<font id="chkNotice" size="2"></font>
			</td>
		</tr>
		</table>
		</details>
	<h3 style="margin-right: 400px">기본 정보</h3>
	<table border="1" style="width: 500px">
		<tr>
			<th>이름<span class="t_red">*</span></th>
			<td>
				<input type="text" name="member_name" size="20px" value="${mb.member_name}" readonly style="background-color: #F6F6F6;">
				<form:errors cssClass="err" path="member_name"/>
			</td>
		</tr>
		
		<tr>
			<th>생년월일<span class="t_red">*</span></th>
			<td>
				<input type="text" name="member_birth" size="20px" value="${mb.member_birth}" readonly style="background-color: #F6F6F6;">
				<form:errors cssClass="err" path="member_birth"/>
			</td>
		</tr>
		
		<tr>
			<th>연락처<span class="t_red">*</span></th>
			<td>
				<input type="text" name="member_phone" value="${mb.member_phone}">
				<form:errors cssClass="err" path="member_phone"/>
			</td>
		</tr>
		
		<tr>
			<th>이메일<span class="t_red">*</span></th>
			<td>
				<input type="text" name="member_email" value="${mb.member_email}">
				<form:errors cssClass="err" path="member_email"/>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호 확인 질문<span class="t_red">*</span></th>
			<td>
				<input type="text" name="pw_question" value="${mb.pw_question}">
				<form:errors cssClass="err" path="pw_question"/>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호 확인 답변<span class="t_red">*</span></th>
			<td>
				<input type="text" name="pw_answer" value="${mb.pw_answer}">
				<form:errors cssClass="err" path="pw_answer"/>
			</td>
		</tr>
	</table><br><br><br>
	
<table>
<div style="width: 550px"> 
        <span><b>마케팅 활용을 위한 개인정보 수집 이용 동의</b></span>&nbsp;&nbsp;&nbsp;
      <c:forEach var="member_marketing_agree" items="<%=martketingArr%>">
				<INPUT TYPE="radio" NAME="member_marketing_agree" id="member_marketing_agree" value="${member_marketing_agree }" <c:if test="${mb.member_marketing_agree eq member_marketing_agree}">checked</c:if>>${member_marketing_agree }
			</c:forEach>
			<form:errors cssClass="err" path="member_marketing_agree" /><br>
        <div class="signupBoxTool__signupBox__terms__summary">
          <dl>
              <dd style="text-align: left;">
                [수집 목적]<br>
				고객 맞춤형 상품 및 서비스 추천. 당사 신규 상품/서비스 안내 및 권유. 사은/할인 행
				사 등 각종 이벤트 정보 등의 안내 및 권유<br><br>
				[수집 항목]<br>
				이메일, 휴대폰번호, 주소, 생년월일, 선호극장, 문자/이메일/앱푸쉬 정보 수신동의여부, 
				서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그<br><br>
                [보유 및 이용 기간]<br>
				회원 탈퇴 시 혹은 이용 목적 달성 시까지<br><br><br>
              </dd>
		</dl>
		</div>
	</div><br><br><br>

<div style="width: 550px"> 
        <span><b>email 수신동의</b></span>&nbsp;&nbsp;&nbsp;
        <c:forEach var="member_email_agree" items="<%=emailArr%>">
				<INPUT TYPE="radio" NAME="member_email_agree" id="member_email_agree" value="${member_email_agree }" <c:if test="${mb.member_email_agree eq member_email_agree}">checked</c:if>>${member_email_agree }
			</c:forEach>
			<form:errors cssClass="err" path="member_email_agree" />
        <div class="signupBoxTool__signupBox__terms__summary">
          <dl>
              <dd style="text-align: left;">
                 거래정보와 관련된 내용(예매완료/취소)과 소멸포인트 안내는 수신동의 여부와 관계 없이 알림 또는 이메일로 발송됩니다.<br>
                 이외 타 정보는 수신동의를 하셔야 받으실 수 있습니다.(2023.05.30 기준)<br><br>
                 
                 본 마케팅 정보 수신에 대한 동의를 거부할 수 있으며, 이 경우 일부 서비스 이용 및 
                 각종 광고, 할인 등 이용자 서비스 제공이 제한될 수 있습니다.<br><br><br>
              </dd>
		</dl>
		</div><br><br>
	</div>
	
	<div style="width: 550px"> 
        <span><b>SMS 수신동의</b></span>&nbsp;&nbsp;&nbsp;
        <c:forEach var="member_sms_agree" items="<%=smsArr%>">
				<INPUT TYPE="radio" NAME="member_sms_agree" id="member_sms_agree" value="${member_sms_agree }" <c:if test="${mb.member_sms_agree eq member_sms_agree}">checked</c:if>>${member_sms_agree }
			</c:forEach>
			<form:errors cssClass="err" path="member_sms_agree" />
        <div class="signupBoxTool__signupBox__terms__summary">
          <dl>
              <dd style="text-align: left;">
                 거래정보와 관련된 내용(예매완료/취소)과 소멸포인트 안내는 수신동의 여부와 관계 없이 알림 또는 이메일로 발송됩니다.<br>
                 이외 타 정보는 수신동의를 하셔야 받으실 수 있습니다.(2023.05.30 기준)<br><br>
                 
                 본 마케팅 정보 수신에 대한 동의를 거부할 수 있으며, 이 경우 일부 서비스 이용 및 
                 각종 광고, 할인 등 이용자 서비스 제공이 제한될 수 있습니다.<br><br><br>
              </dd>
		</dl>
		</div><br><br>
	</div>
	
		<tr>
			<td colspan="2" align="center">
			<input type="button" onclick="location.href='memberlogin.mb'" value="목록으로">
			<input type="submit" class="submit" value="수정하기">
			<input type="reset" value="취소하기">
			</td>
		</tr>
</table>
</form:form>
</center><br><br>

