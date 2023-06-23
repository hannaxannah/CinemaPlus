<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 좌석선택 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-xl-10" style="padding: 40px 0;">
						<div style="padding-bottom: 20px;">
							<h3 style="color: #FCFBFF">관람인원선택</h3>
							<hr style="border: 1px solid #FCFBFF; opacity: 1;">
						</div>
						<div style="display: flex; padding: 0 20px 20px 20px; width: inherit">
							<div class="reservation-select-number">
								<a class="reservation-select-number number">성인</a>
								<table>
									<tr>
										<td><i class="bi bi-plus-lg"></i></td>
										<td>0</td>
										<td><i class="bi bi-dash-lg"></i></td>
									</tr>
								</table>
							</div>
							<div class="reservation-select-number">
								<a class="reservation-select-number number">청소년</a>
								<table>
									<tr>
										<td><i class="bi bi-plus-lg"></i></td>
										<td>0</td>
										<td><i class="bi bi-dash-lg"></i></td>
									</tr>
								</table>
							</div>
							<div class="reservation-select-number">
								<a class="reservation-select-number number">우대</a>
								<table>
									<tr>
										<td><i class="bi bi-plus-lg"></i></td>
										<td>0</td>
										<td><i class="bi bi-dash-lg"></i></td>
									</tr>
								</table>
							</div>
						</div>
						<hr style="border: 1px solid #FCFBFF; opacity: 1;">
						<div style="display: flex; justify-content: space-around; padding: 20px;">
						<div class="col-xl-7" style="border: 1px solid white;">
						
						</div>
						
						<div class="col-xl-3" style="border: 1px solid white;">
						
						</div>
						</div>
					</div>
					<!-- 영화관, 영화, 날짜, 시간 선택 안했으면 alert -->
					<!-- 인원/좌석 선택 버튼 클릭 -> form 전송 -->
					<!-- 이때, 로그인 X -> 로그인 페이지, 로그인O -> 인원/좌석 선택 페이지 -->
				</div>
				
			</div>
		</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>