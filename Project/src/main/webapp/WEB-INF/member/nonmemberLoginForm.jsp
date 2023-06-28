<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main" style="background-color: #FCFBFF"><!-- style="background-color: #FCFBFF" -->

	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">

			<div class="row justify-content-center">
				<div class="col-xl-10">
					<!-- 비회원 로그인 -->
					<div class="login-clean">
						<form action="nonmemberlogin.mb" method="POST">
							<ol>
				           		<li><a href="memberlogin">회원</a></li>
				            	<li><a href="nonmemberlogin.mb" style="color:#6B39EA;">비회원</a></li>
				            </ol>
							<h2 class="sr-only" style="margin-bottom: 20px;">로그인</h2>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_name" id="nonmember_name" placeholder="이름">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_phone" id="nonmember_phone" placeholder="휴대폰번호">
								<br>
								
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_birth" id="nonmember_birth" placeholder="생년월일">
							</div>
							<div class="form-group">
								<input class="form-control" type="password" name="nonmember_pw" id="nonmember_pw" placeholder="비밀번호">
							</div>
							<div class="form-group">
								<input class="form-control" type="password" name="nonmember_pwcheck" placeholder="비밀번호 확인">
							</div>
							<div class="nonmemberAgree">
								<div style="padding-bottom: 5px; font-size: 13px; display: flex; vertical-align: middle;">
									비회원예매 개인정보 처리방침&emsp;&nbsp;&nbsp;
									<input type="radio" name="nonmember_agree" value="동의" >&nbsp;동의&ensp;
									<input type="radio" name="nonmember_agree" value="미동의">&nbsp;미동의
								</div>
								<div style="font-size: 13px;">수집목적</div>
								<div style="padding-bottom: 3px; font-size: 13px; color: #7F7F7F;">비회원예매 서비스 제공 / 이용자식별 / 구매 및 결제</div>
								<div style="font-size: 13px;">수집항목</div>
								<div style="padding-bottom: 3px; font-size: 13px; color: #7F7F7F;">이름, 생년월일, 휴대폰번호, 비밀번호</div>
								<div style="font-size: 13px;">보유기간</div>
								<div style="padding-bottom: 5px; font-size: 13px; color: #7F7F7F;">관람 또는 취소 후 7일 이내</div>
								<div style="font-size: 13px;">* 정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다.</div>								
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit" onClick="return check_nonmember_login()">비회원 로그인</button>
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