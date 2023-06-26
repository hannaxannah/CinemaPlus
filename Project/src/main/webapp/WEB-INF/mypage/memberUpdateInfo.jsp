<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>


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

	var member = ${loginInfo.member_id};

$(document).ready(function() {
    $(".submit").click(function() {
       location.href='myUpdate.mp?member_id='+member;
    });
});

</script>​​

<%
	String[] martketingArr = {"비동의","동의"};
	String[] emailArr = {"수신동의","수신거부"};
	String[] smsArr = {"수신동의","수신거부"};
%>


					<div class="col-lg-9" style="padding: 20px;">
						<!-- 회원 상세 정보 요약 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
	
	<!-- 오른쪽 : 내용 -->
	<div class="container-mypageContent">
		<form:form commandName="mb" action="myUpdate.mp" method="post">
		<input type="hidden" name="member_code" value="${mb.member_code}">
		<!-- 회원 정보 수정 -->
		<div class="myMenuName">회원 정보</div><br>
		<table class="myMemberInfo">
			<!-- 개인정보 수정 -->
			<tr>
				<td colspan="3">
					<div class="my-member-info-title" style="display: inline-block">개인정보 수정</div>
					<a style="font-size: 0.8em"> &nbsp; *회원님의 정보를 정확히 입력해주세요.</a>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					아이디
				</td>
				<td colspan="2">
					<input type="text" name="member_id" class="inputText3" value="${mb.member_id}" readonly>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;" id="pwbutton" name="mpw1">
					비밀번호
				</td>
				<td colspan="2">
				<input type="password" id="pwbutton" name="mpw1" class="inputText3" value="${loginInfo.member_pw}" readonly>
				</td>
			</tr>
			</table>
			
			<details>
		<summary>비밀번호 변경하기</summary>
		<table id="pwcheck" markdown="1" class="registerForm-1">
		<tr>
			<td>
				<a style="color: #DE0000">*&nbsp&nbsp</a>현재 비밀번호
			</td>
			<td>
			<input type="password" name="mpw_og" class="inputText3" value="${loginInfo.member_pw}" disabled="disabled">
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
		</details><br><br><br>
			
		<table class="myMemberInfo">
			<!-- 기본정보 -->
			<tr>
				<td colspan="3">
					<div class="my-member-info-title">기본정보</div>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;" name="member_name">
					이름
				</td>
				<td colspan="2">
				<input type="text" name="member_name" class="inputText3" value="${mb.member_name}" readonly>
				<form:errors cssClass="err" path="member_name"/>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;" name="member_birth">
					생년월일
				</td>
				<td colspan="2">
				<input type="text" name="member_birth" class="inputText3" value="${mb.member_birth}" readonly>
				<form:errors cssClass="err" path="member_birth"/>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					휴대폰
				</td>
				<td colspan="2">
				<input type="text" name="member_phone" class="inputText3" value="${mb.member_phone}">
				<form:errors cssClass="err" path="member_phone"/>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					이메일
				</td>
				<td colspan="2">
					<input type="text" name="member_email" class="inputText3" value="${mb.member_email}">
				<form:errors cssClass="err" path="member_email"/>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					비밀번호 확인 질문
				</td>
				<td>
			<select name="pw_question" class="selectBox1">
				<option value="">선택하세요
				<option value="q1"<c:if test="${mb.pw_question == 'q1'}">selected</c:if>>기억에 남는 추억의 장소는?
				<option value="q2"<c:if test="${mb.pw_question == 'q2'}">selected</c:if>>자신의 인생 좌우명은?
				<option value="q3"<c:if test="${mb.pw_question == 'q3'}">selected</c:if>>자신의 보물 제1호는?
				<option value="q4"<c:if test="${mb.pw_question == 'q4'}">selected</c:if>>가장 기억에 남는 선생님 성함은?
				<option value="q5"<c:if test="${mb.pw_question == 'q5'}">selected</c:if>>내가 좋아하는 캐릭터는?
				<option value="q6"<c:if test="${mb.pw_question == 'q6'}">selected</c:if>>인상깊게 읽은 책 이름은?
				<option value="q7"<c:if test="${mb.pw_question == 'q7'}">selected</c:if>>다시 태어나면 되고 싶은 것은?
			</select>
				<form:errors cssClass="err" path="pw_question"/>
			</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					비밀번호 확인 답변
				</td>
				<td>
				<input type="text" name="pw_answer" class="inputText3" value="${mb.pw_answer}">
				<form:errors cssClass="err" path="pw_answer"/>
				</td>
			</tr>
			<!-- 
			간편로그인 계정 연동 
			<tr>
				<td colspan="3">
					<div class="my-member-info-title">간편로그인 계정 연동</div>
				</td>
			</tr>
			 -->
		</table><br><br><br>
		
		<!-- 
		<table class="myMemberInfo">
			<tr class="myMemberInfo-tr2" style="font-weight: 500;">
				<td>
					구분
				</td>
				<td>
					연동정보
				</td>
				<td>
					연결
				</td>
			</tr>
			<tr class="myMemberInfo-tr2">
				<td>
					네이버
				</td>
				<td>
					연결된 계정정보가 없습니다.
				</td>
				<td>
					<input type="button" value="연결">
				</td>
			</tr>
			<tr class="myMemberInfo-tr2">
				<td>
					카카오
				</td>
				<td>
					연결된 계정정보가 없습니다.
				</td>
				<td>
					<input type="button" value="연결">
				</td>
			</tr>
			<tr class="myMemberInfo-tr2">
				<td>
					구글
				</td>
				<td>
					연결된 계정정보가 없습니다.
				</td>
				<td>
					<input type="button" value="연결">
				</td>
			</tr>
		</table>
		 -->
		
		
		<table class="myMemberInfo">
			<!-- 마케팅 활용을 위한 개인정보 수집 이용 안내 -->
			<tr>
				<td colspan="2">
					<div class="my-member-info-title" style="display: inline-block">
						마케팅 활용을 위한 개인정보 수집 이용 안내
						<!-- member 테이블에서 가져온 데이터로 체크 -->
					</div>
				</td>
			<td>
			<div class="my-member-info-title" style="text-align: right">
			<c:forEach var="member_marketing_agree" items="<%=martketingArr%>">
				<INPUT TYPE="radio" NAME="member_marketing_agree" id="member_marketing_agree" value="${member_marketing_agree }" <c:if test="${mb.member_marketing_agree eq member_marketing_agree}">checked</c:if>>${member_marketing_agree }
			</c:forEach>
			<form:errors cssClass="err" path="member_marketing_agree" />		
					</div>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td colspan="3">
					[수집 목적]<br>
					고객 맞춤형 상품 및 서비스 추천. 당사 신규 상품/서비스 안내 및 권유. 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유<br>
					<br>
					[수집 항목]<br>
					이메일, 휴대폰번호, 주소, 생년월일, 선호극장, 문자/이메일/앱푸쉬 정보 수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그<br>
					<br>
					[보유 및 이용 기간]<br>
					회원 탈퇴 시 혹은 이용 목적 달성 시까지
				</td>
			</tr>
			<!-- 마케팅정보 수신동의 -->
			<tr>
				<td colspan="3">
					<div class="my-member-info-title">마케팅정보 수신동의</div>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td colspan="3">
					거래정보와 관련된 내용(예매완료/취소)과 소멸포인트 안내는 수신동의 여부와 관계없이 SMS, PUSH 알림 또는 이메일로 발송됩니다.
					이 외 타 정보는 수신동의를 하셔야만 받으실 있습니다. (2014.05.16 기준)<br>
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
			<tr>
				<td colspan="3" style="text-align: center; vertical-aling: middle; padding: 50px;">
					<input type="button" onclick="location.href='main.mp?member_id=${loginInfo.member_id}'" value="목록으로">
					<input type="submit" class="submit" value="수정">
					<input type="reset" value="취소">

				</td>
			</tr>
		</table>
		</form:form>
	</div>
							</div>
						</div>
			</div>
		</div>
	</div>
</section>

</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>