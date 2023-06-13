<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>

<!-- 회원/비회원 -->
<div class="container-login">
	<div class="login">로그인</div>
	<div class="container-loginMenu">
		<div class="loginmenu-member">
			<a href="memberlogin.mb"><b>회원</b></a>
		</div>
		<div class="loginmenu-nonmember">
			<a href="nonmemberlogin.mb">비회원</a>
		</div>
	</div>
	<div class="container-loginForm">
		<!-- 회원 로그인 폼 -->
		<form action="memberlogin.mb" method="POST">
			<div class="memberLoginForm">
				<div class="member-id">
					<input type="text" class="inputText1" name="member_id" placeholder="아이디를 입력하세요">
				</div>
				<div class="member-password">
					<input type="password" class="inputText1" name="member_pw" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="member-login-button">
					<input type="submit" class="loginButton" value="로그인" onClick="return check_member_login()">
				</div>
			</div>
		</form>
		<!-- id/pw찾기 | 회원가입 | 비회원 예매확인 -->
		<div class="Search-Signup-Check">
			<a class="SSC-1" href="findid.mb">ID/PW 찾기</a>
			<a class="SSC-2" href="register.mb">회원가입</a>
			<a class="SSC-3" href="nonmember-reservation.mb">비회원 예매확인</a>
		</div>
		<!-- 간편 연동 로그인 -->
		<div class="link-login">
			<a class="link-login-1" href="">네이버</a>
			<a class="link-login-2" href="https://kauth.kakao.com/oauth/authorize?client_id=0f2a40dae9d02f9c0e00332f2d04684a&redirect_uri=http://localhost:8080/ex/kakao.mb&response_type=code">카카오</a>
			<a class="link-login-3" href="">구글</a>
		</div>
	</div>
</div>


<%@ include file="../main/mainFooter.jsp"%>