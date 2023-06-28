<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main" style="background-color: #FCFBFF"><!-- style="background-color: #FCFBFF" -->

	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">

			<div class="row justify-content-center">    
				<div class="col-xl-10">
					<!-- 회원 로그인 -->
					<div class="login-clean">
						<form action="memberlogin.mb" method="POST">
							<ol>
				           		<li><a href="memberlogin.mb" style="color:#6B39EA;"></a></li>
				            	<!-- <li><a href="nonmemberlogin.mb">비회원</a></li> -->
				            </ol>
							<h2 class="sr-only" style="margin-bottom: 20px;">로그인</h2>
							<div class="form-group">
								<input class="form-control" type="text" name="member_id" placeholder="아이디">
							</div>
							<div class="form-group">
								<input class="form-control" type="password" name="member_pw" placeholder="비밀번호">
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit" onClick="return check_member_login()">로그인</button>
							</div>
							<div class="form-group idpwfind">
								<a href="findid.mb">ID/PW 찾기</a>
								<a href="register.mb">회원가입</a>
								<!-- <a href="nonmember-reservation.mb">비회원 예매확인</a> -->
							</div>
							<div class="form-group link-login">
								<a class="link-login-1" href="${url}">
								<img src="resources/naverlogo.jpg" width="30px;"></a>
								
								<a href="https://kauth.kakao.com/oauth/authorize?client_id=0f2a40dae9d02f9c0e00332f2d04684a&redirect_uri=http://localhost:8080/ex/kakao.mb&response_type=code">
								<img src="resources/Kakaologo.svg" width="28px;"></a>
								
								<a class="link-login-3" href="https://accounts.google.com/o/oauth2/v2/auth?client_id=463335171535-cq8meuskkdbk1gkbincqebv3md4alf3i.apps.googleusercontent.com&redirect_uri=http://localhost:8080/ex/google.mb&response_type=code&scope=email profile">
								<img src="https://developers.google.com/static/identity/images/g-logo.png?hl=ko" width="26px"></a>
							</div>
						</form>
					</div>


				</div>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs -->

</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>