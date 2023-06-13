<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
customerUpdateForm.jsp<br>
<%@ include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>    

<style type="text/css">
.err {
	font-size: 8px;
	color: red;
	
}


.t_red{
	color:#f55500
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

<div class="container-register">
<form:form commandName="mb" action="mypage_update.mb" method="post">
	<input type="hidden" name="member_code" value="${mb.member_code}">
	<table class="registerForm-1">
		<tr>
				<td>
					<b style="font-size: large;">회원 정보</b>
				</td>
		</tr>
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>아이디
			</td>
			<td>
			<input type="text" name="member_id" class="inputText3" value="${mb.member_id}" readonly style="background-color: #F6F6F6;">
			<form:errors cssClass="err" path="member_id"/>
			</td>
		</tr>
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>비밀번호
			</td>
			<td>
				<input type="password" id="pwbutton" name="mpw1" class="inputText3" value="${mb.member_pw}">
			</td>
		</tr>
	</table>
		<details>
		<summary style="margin-left: 400px">비밀번호 변경하기</summary>
		<table id="pwcheck" markdown="1" class="registerForm-1">
		<tr>
			<td>
				<a style="color: #DE0000">*&nbsp&nbsp</a>현재 비밀번호
			</td>
			<td>
			<input type="password" name="mpw_og" class="inputText3" value="${mb.member_pw}" disabled="disabled">
			</td>
		</tr>
		<tr>
			<td>
				<a style="color: #DE0000">*&nbsp&nbsp</a>변경 비밀번호
			</td>
			<td>
			<input type="password" id="member_pw" name="member_pw" class="inputText3" placeholder="비밀번호 변경 입력"/>
			 <br>
			</td>
		</tr>
		<tr>
			<td>
				<a style="color: #DE0000">*&nbsp&nbsp</a>비밀번호 확인
			</td>
			<td>
			<input type="password" id="userPwChk" class="inputText3" placeholder="비밀번호 확인"/>
			<font id="chkNotice" ></font>
			</td>
		</tr>
		</table>
		</details>
	<table class="registerForm-1">
		<tr>
			<td>
				<b style="font-size: large;">기본 정보</b>
			</td>
		</tr>
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>이름
			</td>
			<td>
				<input type="text" name="member_name" class="inputText3" value="${mb.member_name}" readonly style="background-color: #F6F6F6;">
				<form:errors cssClass="err" path="member_name"/>
			</td>
		</tr>
		
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>생년월일
			</td>
			<td>
				<input type="text" name="member_birth" class="inputText3" value="${mb.member_birth}" readonly style="background-color: #F6F6F6;">
				<form:errors cssClass="err" path="member_birth"/>
			</td>
		</tr>
		
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>연락처
			</td>
			<td>
				<input type="text" name="member_phone" class="inputText3" value="${mb.member_phone}">
				<form:errors cssClass="err" path="member_phone"/>
			</td>
		</tr>
		
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>이메일
			</td>
			<td>
				<input type="text" name="member_email" class="inputText3" value="${mb.member_email}">
				<form:errors cssClass="err" path="member_email"/>
			</td>
		</tr>
		
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>비밀번호 확인 질문
			</td>
			<td>
				<input type="text" name="pw_question" class="inputText3" value="${mb.pw_question}">
				<form:errors cssClass="err" path="pw_question"/>
			</td>
		</tr>
		
		<tr>
			<td>
			<a style="color: #DE0000">*&nbsp&nbsp</a>비밀번호 확인 답변
			</td>
			<td>
				<input type="text" name="pw_answer" class="inputText3" value="${mb.pw_answer}">
				<form:errors cssClass="err" path="pw_answer"/>
			</td>
		</tr>
	</table><br><br><br>
	
<table class="registerForm-2">
	<tr>
		<td>
			마케팅 활용을 위한 개인정보 수집 이용 안내
		</td>
		<td>
			<c:forEach var="member_marketing_agree" items="<%=martketingArr%>">
				<INPUT TYPE="radio" NAME="member_marketing_agree" id="member_marketing_agree" value="${member_marketing_agree }" <c:if test="${mb.member_marketing_agree eq member_marketing_agree}">checked</c:if>>${member_marketing_agree }
			</c:forEach>
			<form:errors cssClass="err" path="member_marketing_agree" />		
		</td>
	</tr>
	<tr>
		<td colspan="2" style="font-size: 0.9em">
			[수집 목적]<br>
			고객 맞춤형 상품 및 서비스 추천. 당사 신규 상품/서비스 안내 및 권유. 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유<br>
			<div style="padding-bottom: 5px"></div>
			[수집 항목]<br>
			이메일, 휴대폰번호, 주소, 생년월일, 선호극장, 문자/이메일/앱푸쉬 정보 수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그<br>
			<div style="padding-bottom: 5px"></div>
			[보유 및 이용 기간]<br>
			회원 탈퇴 시 혹은 이용 목적 달성 시까지
		</td>
	</tr>
</table>

<table class="registerForm-2">
	<tr>
		<td colspan="2">
			마케팅 정보 수신 동의
		</td>
	</tr>
	<tr>
		<td colspan="2" style="font-size: 0.9em">
			거래정보와 관련된 내용(예매완료/취소)과 소멸포인트 안내는 수신동의 여부와 관계없이 SMS, PUSH 알림 또는 이메일로 발송됩니다.<br>
			이 외 타 정보는 수신동의를 하셔야만 받으실 있습니다. (2014.05.16 기준)
			<div style="padding-bottom: 7px"></div>
			! 수신 동의 여부를 선택해주세요
			<div style="padding-bottom: 7px"></div>
			<div style="background-color: #F2F2F2; padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
				<a style="font-weight: 500; margin-right: 20px;"> 이메일 </a>
				 <c:forEach var="member_email_agree" items="<%=emailArr%>">
				<INPUT TYPE="radio" NAME="member_email_agree" id="member_email_agree" value="${member_email_agree }" <c:if test="${mb.member_email_agree eq member_email_agree}">checked</c:if>>${member_email_agree }
				</c:forEach>
				<form:errors cssClass="err" path="member_email_agree" />
				<br>
				<div style="padding-bottom: 5px"></div>
				<a style="font-weight: 500; margin-right: 30px"> SMS </a>
				<c:forEach var="member_sms_agree" items="<%=smsArr%>">
					<INPUT TYPE="radio" NAME="member_sms_agree" id="member_sms_agree" value="${member_sms_agree }" <c:if test="${mb.member_sms_agree eq member_sms_agree}">checked</c:if>>${member_sms_agree }
				</c:forEach>
				<form:errors cssClass="err" path="member_sms_agree" />
			</div>
		</td>
	</tr>
</table>
<div class="register-button">
			<input type="button" onclick="location.href='memberlogin.mb'" value="목록으로">
			<input type="submit" class="submit" value="수정">
			<input type="reset" value="취소">
</div>
</form:form>
</div>

<%@ include file="../main/mainFooter.jsp"%>


