<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
					<div class="col-lg-9" style="padding: 20px;">
						<!-- 회원 상세 정보 요약 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
	
	<!-- 오른쪽 : 내용 -->
	<div class="container-mypageContent">
		<!-- 회원 정보 수정 -->
		<div class="myMenuName">회원 정보</div>
		<table class="myMemberInfo">
			<!-- 개인정보 수정 -->
			<tr>
				<td colspan="3">
					<div class="my-member-info-title" style="display: inline-block">개인정보 수정</div>
					<a style="font-size: 0.8em">*회원님의 정보를 정확히 입력해주세요.</a>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					아이디
				</td>
				<td colspan="2">
					Abcdefg1234
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					비밀번호
				</td>
				<td colspan="2">
					<input type="button" value="비밀번호 변경">
				</td>
			</tr>
			<!-- 기본정보 -->
			<tr>
				<td colspan="3">
					<div class="my-member-info-title">기본정보</div>
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					이름
				</td>
				<td colspan="2">
					Abcdefg1234
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					생년월일
				</td>
				<td colspan="2">
					0000년 00월 00일
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					휴대폰
				</td>
				<td colspan="2">
					000-0000-0000
				</td>
			</tr>
			<tr class="myMemberInfo-tr1">
				<td style="font-weight: 500;">
					이메일
				</td>
				<td colspan="2">
					abcd1234@gmail.com
				</td>
			</tr>
			<!-- 간편로그인 계정 연동 -->
			<tr>
				<td colspan="3">
					<div class="my-member-info-title">간편로그인 계정 연동</div>
				</td>
			</tr>
		</table>
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
						미동의&nbsp<input type="radio" name="member_marketing_agree" value="미동의">
						&nbsp&nbsp동의&nbsp<input type="radio" name="member_marketing_agree" value="동의">
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
						<input type="radio" name="member_email_agree" value="수신동의">&nbsp수신동의&nbsp&nbsp
						<input type="radio" name="member_email_agree" value="수신거부">&nbsp수신거부
						<br>
						<div style="padding-bottom: 5px"></div>
						<a style="font-weight: 500; margin-right: 30px"> SMS </a>
						<input type="radio" name="member_sms_agree" value="수신동의">&nbsp수신동의&nbsp&nbsp
						<input type="radio" name="member_sms_agree" value="수신거부">&nbsp수신거부
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center; vertical-aling: middle; padding: 50px;">
					<input type="button" class="registerButton" value="수정">

				</td>
			</tr>
		</table>
		
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