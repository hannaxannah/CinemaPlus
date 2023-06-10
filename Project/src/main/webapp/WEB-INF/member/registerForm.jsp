<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		//alert(1);
		
		var isCheck = false;
		var use;
		
		/* 중복체크 */
		$('#id_check').click(function(){
			//alert(11);
			isCheck = true;
			
			$.ajax({
				url : "id_check_proc.mb",
				data : ({
						inputid : $('input[name = member_id]').val()
				}),
				success : function(data){
					
					if($("input[name = member_id]").val() == ""){
						$('#id_msg').html("<font color='red'> 입력 누락됐습니다.</font>");
						$('#id_msg').show();
						$('input[name = member_id]').focus();
					
					}else if(data == 'N'){
						$('#id_msg').html("<font color='red'>이미 등록된 아이디 입니다.</font>");
						$('#id_msg').show();
						$('input[name = member_id]').select();
						use = "impossible";
						
					}else{
						alert("사용가능한 아이디입니다.");
						use = "possible";
					}
					
				}//success
				
			})//ajax
			
		})//click
		
		/* keydown */
		$("input[name=member_id]").keydown(function(){ 
			$('#id_msg').css('display','none');
		});//keydown
		
		$('#join').click(function(){
			//alert("join");
			if(!isCheck){
				alert("아이디 중복체크 확인이 누락됐습니다.");
				return false;
			
			}else if(use =="impossible"){
				alert("이미 등록된 아이디입니다.");
				$('input[name = member_id]').select();
				return false;
				
			}else if($('input[name = member_id]').val()==""){
				alert("아이디가 누락됐습니다.");
				$('input[name=member_id]').focus();
				return false;
			}
			
		})//join
		
		$('#join').click(function(){
			//alert("join");
			if($('input[name = pw_check]').val()==""){
				alert("비밀번호 확인이 누락됐습니다.");
				return false;
			}
			
		})//join
		
		//비밀번호 일치 확인
		$("#pw_check").blur(function() {
			//alert(1);
			if($("#pw_check").val() == "") {
				alert("비밀번호 확인이 누락됐습니다.");
				return false;
			}
			else if($("#member_pw").val() == $("#pw_check").val()) {
				alert("비밀번호가 일치합니다.");
				pw_check = true;
			}else {
				alert("비밀번호가 불일치합니다.");
				return false;
			}
		});
		
		
		
	})//ready


</script>

<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
</style>

memberRegisterForm.jsp<br>


<form:form commandName="mb" action="registerForm.mb" method="post">
	<h2>회원가입</h2>
	<p>
		<label>이름</label>
		<input type="text" name="member_name" value="${mb.member_name}"><br>
		<form:errors cssClass="err" path="member_name"/>
	</p>
	<p>
		<label>아이디</label>
		<input type="text" name="member_id" value="${mb.member_id}">
		<input type="button" value="중복체크" id="id_check">
		<span id="id_msg"></span><br>
		<form:errors cssClass="err" path="member_id"/>
	</p>
	<p>
		<label>비밀번호</label>
		<input type="text" name="member_pw" id="member_pw" value="${mb.member_pw}"><br>
		<form:errors cssClass="err" path="member_pw"/>
	</p>
		<p>
		<label>비밀번호 확인</label>
		<input type="text" name="pw_check" id="pw_check" value="${pw_check}"><br>
		
		
	</p>
	<p>
		<label>생년월일(yyyy.mm.dd)</label>
		<input type="text" name="member_birth" value="${mb.member_birth}"><br>
		<form:errors cssClass="err" path="member_birth"/>
	</p>
	<p>
		<label>핸드폰번호</label>
		<input type="text" name="member_phone" id="member_phone" value="${mb.member_phone}"><br>
		<form:errors cssClass="err" path="member_phone"/>
	</p>
	<p>
		<label>이메일</label>
		<input type="text" name="member_email" value="${mb.member_email}"><br>
	</p>
	<p>
	<label>비밀번호 찾기 질문</label>
	<select name="pw_question">
		<option value="">선택하세요
		<option value="q1"<c:if test="${mb.pw_question == 'q1'}">selected</c:if>>기억에 남는 추억의 장소는?
		<option value="q2"<c:if test="${mb.pw_question == 'q2'}">selected</c:if>>자신의 인생 좌우명은?
		<option value="q3"<c:if test="${mb.pw_question == 'q3'}">selected</c:if>>자신의 보물 제1호는?
		<option value="q4"<c:if test="${mb.pw_question == 'q4'}">selected</c:if>>가장 기억에 남는 선생님 성함은?
		<option value="q5"<c:if test="${mb.pw_question == 'q5'}">selected</c:if>>내가 좋아하는 캐릭터는?
		<option value="q6"<c:if test="${mb.pw_question == 'q6'}">selected</c:if>>인상깊게 읽은 책 이름은?
		<option value="q7"<c:if test="${mb.pw_question == 'q7'}">selected</c:if>>다시 태어나면 되고 싶은 것은?
	</select><br>
	<form:errors cssClass="err" path="pw_question"/>
	</p>
	<p>
		<label>비밀번호 찾기 답변</label>
		<input type="text" name="pw_answer" value="${mb.pw_answer}"><br>
		<form:errors cssClass="err" path="pw_answer"/>
	</p>
	<p>
		<label>마케팅 활용을 위한 개인정보 수집 이용 안내</label><br>
		<input type="radio" name="member_marketing_agree" value="동의"<c:if test="${mb.member_marketing_agree == '동의'}">checked</c:if>>동의
		<input type="radio" name="member_marketing_agree" value="미동의"<c:if test="${mb.member_marketing_agree == '미동의'}">checked</c:if>>미동의<br>
	</p>
	<p>
		<label>마케팅정보 수신동의</label><br>
		이메일<input type="radio" name="member_email_agree" value="수신동의"<c:if test="${mb.member_email_agree == '수신동의'}">checked</c:if>>수신동의
			<input type="radio" name="member_email_agree" value="수신거부"<c:if test="${mb.member_email_agree == '수신거부'}">checked</c:if>>수신거부<br>
			
		SMS<input type="radio" name="memeber_sms_agree" value="수신동의"<c:if test="${mb.memeber_sms_agree == '수신동의'}">checked</c:if>>수신동의
			<input type="radio" name="memeber_sms_agree" value="수신거부"<c:if test="${mb.memeber_sms_agree == '수신거부'}">checked</c:if>>수신거부<br>
	</p>
	
	<p>
		<input type="submit" value="가입하기" id="join">
	</p>
</form:form>