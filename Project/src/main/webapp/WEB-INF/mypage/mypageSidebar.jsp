<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main id="main" style="background-color: #F2F2F2">

	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">

			<div class="row justify-content-center">
				<div class="col-xl-10" style="display: flex;">
					<!-- 회원 로그인 -->
					<div class="col-lg-3">
						<div id="sidebar" class="sidebar">
							<ul class="sidebar-nav" id="sidebar-nav">
								<li class="nav-item">
									<a class="nav-link " href="main.mp?member_id=${loginInfo.member_id}">
										<i class="bi bi-grid"></i>
										<span>MY</span>
									</a>
								</li>
								<!-- End Dashboard Nav -->
								<li class="nav-item">
									<a class="nav-link collapsed" href="#">
										<i class="bi bi-card-list"></i>
										<span>예매내역</span>
									</a>
								</li>
								<!-- End Profile Page Nav -->
	
								<li class="nav-item">
									<a class="nav-link collapsed" href="#">
										<i class="bi bi-ticket-perforated"></i>
										<span>MY 쿠폰</span>
									</a>
								</li>
								
								<li class="nav-item">
									<a class="nav-link collapsed" href="myProductList.mp">
										<i class="bi bi-gift"></i>
										<span>스토어 구매 내역</span>
									</a>
								</li>
								
								<!-- End F.A.Q Page Nav -->
	
								<li class="nav-item">
									<a class="nav-link collapsed" href="pages-contact.html">
										<i class="bi bi-star"></i>
										<span>멤버십</span>
									</a>
								</li>
								<!-- End Contact Page Nav -->
	
								<li class="nav-item">
									<a class="nav-link collapsed" href="pages-register.html">
										<i class="bi bi-pencil-square"></i>
										<span>영화기록</span>
									</a>
								</li>
								<!-- End Register Page Nav -->
	
								<li class="nav-item">
									<a class="nav-link collapsed" href="pages-login.html">
										<i class="bi bi-envelope"></i>
										<span>1:1문의</span>
									</a>
								</li>
								
									<li class="nav-item">
									<a class="nav-link collapsed" href="myList.in?customer_id=${loginInfo.member_id}">
										<i class="bi bi-envelope-paper"></i>
										<span>나의 문의내역</span>
									</a>
								</li>
								
								<!-- End Login Page Nav -->
	
								<li class="nav-item">
									<a class="nav-link collapsed" href="pages-error-404.html">
										<i class="bi bi-question-circle"></i>
										<span>자주 묻는 질문</span>
									</a>
								</li>
								<!-- End Error 404 Page Nav -->
	
								<li class="nav-item">
									<a class="nav-link collapsed" href="pages-blank.html">
										<i class="bi bi-person"></i>
										<span>회원 정보</span>
									</a>
								</li>
								
								<%-- 
									<li class="nav-item">
									<a class="nav-link collapsed" href="myUpdate.mp?member_id=${loginInfo.member_id}">
										<i class="bi bi-person"></i>
										<span>회원정보 수정</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link collapsed" href="myDelete.mp?member_id=${loginInfo.member_id}">
										<i class="bi bi-person"></i>
										<span>회원 탈퇴하기</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link collapsed" href="mail.mp?member_id=${loginInfo.member_id}">
										<i class="bi bi-person"></i>
										<span>회원수정 이메일 인증</span>
									</a>
								</li>
								 --%>
								
								<!-- End Blank Page Nav -->
							</ul>
						</div>
					</div>