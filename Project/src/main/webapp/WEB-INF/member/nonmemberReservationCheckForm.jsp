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
						<form action="nonmember-reservation.mb" method="POST">
							<h2 class="sr-only" style="margin-bottom: 20px;">비회원 예매확인</h2>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_name" placeholder="이름">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_birth" placeholder="생년월일">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_phone" placeholder="휴대폰번호">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="nonmember_pw" placeholder="비밀번호">
							</div>
							<div style="font-size: 13px;">* 비회원 정보 오 입력 시 예매 내역 확인/취소 및 티켓 발권이 어려울 수 있으니 다시 한번 확인해 주시기 바랍니다.</div>	
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit" onClick="return check_reservation_check()">비회원 예매확인</button>
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