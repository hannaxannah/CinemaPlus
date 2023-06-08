<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>

<!-- 회원/비회원 -->
<div class="container-login">
	<div class="login">로그인</div>
	<div class="container-loginMenu">
		<div class="loginmenu-member">
			<a href="memberlogin.mb">회원</a>
		</div>
		<div class="loginmenu-nonmember">
			<a href="nonmemberlogin.mb"><b>비회원</b></a>
		</div>
	</div>
	<div class="container-loginForm">
		<!-- 비회원 로그인 폼 -->
		<form action="nonmemberlogin.mb" method="POST">
			<!-- 비회원 정보 입력 -->
			<div class="nonmemberLoginForm-0">
				<div class="nonmemberLoginForm-1">
					<div class="nonmember-name-1">
						<a style="color: #DE0000">*&nbsp</a>이름&nbsp
					</div>
					<div class="nonmember-name-2">
						<input type="text" class="inputText2" name="nonmember_name" placeholder="ex) 홍길동">
					</div>
					<div class="nonmember-phone-1">
						<a style="color: #DE0000">*&nbsp</a>휴대폰번호&nbsp
					</div>
					<div class="nonmember-phone-2">
						<input type="text" class="inputText2" name="nonmember_phone" placeholder="ex) 01012345678">
					</div>
					<div class="nonmember-birth-1">
						<a style="color: #DE0000">*&nbsp</a>생년월일&nbsp
					</div>
					<div class="nonmember-birth-2">
						<input type="text" class="inputText2" name="nonmember_birth" placeholder="ex) 19990101">
					</div>
					<div class="nonmember-password-1">
						<a style="color: #DE0000">*&nbsp</a>비밀번호&nbsp
					</div>
					<div class="nonmember-password-2">
						<input type="password" class="inputText2" name="nonmember_pw" placeholder="비밀번호">
					</div>
					<div class="nonmember-passwordcheck-1">
						<a style="color: #DE0000">*&nbsp</a>비밀번호 확인&nbsp
					</div>
					<div class="nonmember-passwordcheck-2">
						<input type="password" class="inputText2" name="nonmember_pwcheck" placeholder="비밀번호확인">
					</div>
				</div>
				<!-- 비회원 공개 수집 동의 -->
				<div class="nonmemberLoginForm-2">
					<div>
						비회원예매 개인정보 처리방침
						<div style="margin-top: 10px; margin-bottom: 10px;"><hr></div>
						<a style="font-size: 0.9em">수집목적&nbsp</a>
						<a style="font-size: 0.75em">비회원예매 서비스 제공 / 이용자식별 / 구매 및 결제<br></a>
						<a style="font-size: 0.9em">수집항목&nbsp</a>
						<a style="font-size: 0.75em">이름, 생년월일, 휴대폰번호, 비밀번호<br></a>
						<a style="font-size: 0.9em">보유기간&nbsp</a>
						<a style="font-size: 0.75em">관람 또는 취소 후 7일 이내<br></a>
						<!-- 
							수집목적 비회원예매 서비스 제공 / 이용자식별 / 구매 및 결제<br>
							수집항목 이름, 생년월일, 휴대폰번호, 비밀번호<br>
							보유기간 관람 또는 취소 후 7일 이내<br>
						 -->
						<div style="margin-top: 10px; margin-bottom: 10px"><hr></div>
						<div style="background-color: #F2F2F2; padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
							<input type="radio" name="nonmember_agree" value="동의" >&nbsp동의&nbsp&nbsp
							<input type="radio" name="nonmember_agree" value="미동의">&nbsp미동의
						</div>
						<div style="margin-top: 10px; margin-bottom: 10px"><hr></div>
						<a style="font-size: 0.9em">
							* 정보수집에 동의를 거부할 수 있으며, 동의하지 않을<br>
							&nbsp&nbsp경우 비회원 예매서비스를 이용하실 수 없습니다.
						</a>
					</div>
				</div>
				<div class="nonmember-login-button">
					<input type="submit" class="nonmemberLoginButton" value="비회원 로그인" onClick="return check_nonmember_login()">
				</div>
			</div>
		</form>
	</div>
</div>


<%@ include file="../main/mainFooter.jsp"%>