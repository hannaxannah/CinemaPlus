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
						<form action="findid.mb" method="POST">
							<ol>
				           		<li><a href="findid.mb">아이디 찾기</a></li>
				            	<li><a href="findpw.mb" style="color:#6B39EA;">비밀번호 찾기</a></li>
				            </ol>
							<h2 class="sr-only" style="margin-bottom: 20px;">비밀번호 찾기</h2>
							<div class="form-group">
								<input class="form-control" type="text" name="member_id" placeholder="아이디">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="member_name" placeholder="이름">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="member_birth" placeholder="생년월일">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="member_phone" placeholder="휴대폰번호">
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit" onClick="return check_find_pw()">비밀번호 찾기</button>
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