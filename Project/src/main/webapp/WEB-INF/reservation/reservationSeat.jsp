<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 좌석선택 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<!-- form 시작 -->
					<div class="col-xl-10" style="padding: 40px 0;">
						<div class="col-xl-12" style="padding: 10px;display: flex;width: 100%;">
							<div class="reservation-select-number-seat">
								<div style="display: flex;align-items: center;color: #404040;margin-left: 30px;font-size: 1.5rem;font-weight: 600;align-content: center;">
									관람인원선택
								</div>
								<div style="display:flex;">
									<div class="reservation-select-number">
										<a class="reservation-select-number number">성인</a>
										<div class="reservation-select-number-table">
											<table>
												<tr>
													<td><i class="bi bi-plus-lg"></i></td>
													<td>0</td>
													<td><i class="bi bi-dash-lg"></i></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="reservation-select-number">
										<a class="reservation-select-number number">청소년</a>
										<div class="reservation-select-number-table">
											<table>
												<tr>
													<td><i class="bi bi-plus-lg"></i></td>
													<td>0</td>
													<td><i class="bi bi-dash-lg"></i></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="reservation-select-number">
										<a class="reservation-select-number number">우대</a>
										<div class="reservation-select-number-table">
											<table>
												<tr>
													<td><i class="bi bi-plus-lg"></i></td>
													<td>0</td>
													<td><i class="bi bi-dash-lg"></i></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div style="display: flex;">
							<!-- 좌석 선택 -->
							<div class="col-xl-9" style="padding: 20px 10px 20px 10px;display: flex;flex-direction: column;align-items: center;">
								<div class="reservation-screen-seat">
									<div class="reservation-screen">SCREEN</div>
									<div class="reservation-seat-list">
										<c:set var="entireSeats" value="150"/>
										<div style="display: flex; flex-flow: column;">
											<c:forEach var="seatColumn" items="A,B,C,D,E,F,G,H,I,J">
												<div style="display: flex;">
													<i id="seat" class="bi bi-square" style="margin-right: 25px; cursor: default;">
														<a class="seatNumber">${seatColumn}</a>
													</i>
													<c:forEach var="seatRow" begin="1" end="15">
														<i id="seat" class="bi bi-square-fill" style="color: #747474;">
															<a class="seatNumber">${seatRow}</a>
														</i>
													</c:forEach>
													<!-- 좌석에 커서 대거나, 클릭하면 color: #503396로 변화 -->
													<!-- 예약완료/선택불가 좌석은 <i class="bi bi-x-square-fill" style="color: #CCCCCC"></i>로 설정 -->
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<!-- 선택 정보 조회 -->
							<div class="col-xl-3" style="padding: 20px 10px 20px 10px;">
								<div class="reservation-ticket">
									<!-- 상영 등급, 제목 -->
									<div class="reservation-ticket-title">
										<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
										<p class="tit"><b>스파이더맨: 어크로스 더 유니버스</b></p>
									</div>
									<hr style="border: 1px solid #7F7F7F">
									<!-- 영화관, 상영관, 날짜, 시간, 포스터 -->
									<div class="reservation-ticket-theater">
										<div style="width: 50%;">
											<p class="tit">상암월드컵경기장</p>
											<p class="tit">4관</p>
											<p class="tit">2023.06.23(금)</p>
											<p class="tit">20:20 ~ 22:50</p>
										</div>
										<div style="width: 50%; text-align: end;">
											<img src="resources/images/movie-poster-1.jpg" style="width: 60%; text-align: end; padding-right: 5px;">
										</div>
									</div>
									<hr style="border: 1px solid #7F7F7F">
									<!-- 좌석 선택 정보 -->
									<div class="reservation-ticket-seat">
										<div style="width: 50%; border: 1px solid #CCCCCC; border-radius: 5px 0 0 5px; padding: 5px;">
											<div style="margin-top: 5px;"></div>
											<p class="tit"><i class="bi bi-square-fill" style="color: #503396"></i>&nbsp;선택</p>
											<div style="margin-top: 5px;"></div>
											<p class="tit"><i class="bi bi-x-square-fill" style="color: #CCCCCC"></i>&nbsp;선택불가</p>
											<div style="margin-top: 5px;"></div>
											<p class="tit"><i class="bi bi-square-fill" style="color: #747474"></i>&nbsp;선택가능</p>
										</div>
										<div style="width: 50%; text-align: center; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; border-left: 0; padding: 5px;">
											<p class="tit" style="margin: 0;">선택좌석</p>
											<hr style="width: 70%; border: 1px solid #7F7F7F; margin: 0 auto; margin-top: 5px; margin-bottom: 5px;">
											<div style="margin: 0; padding-top: 15px;">
												<p class="tit" style="margin: 0;display: flex;justify-content: center;align-items: center;">
													<font style="font-size:1.3rem;">4</font>개
												</p>
											</div>
										</div>
									</div>
									<div class="reservation-ticket-price">
										<div class="reservation-price">최종결제금액</div>
										<div class="reservation-price"><a class="reservation-price-bold">100,000</a>원</div>
									</div>
								</div>
								<div class="reservation-go-pay">
									<input type="button" class="reservation-go-pay-btn" value="결제하기" onClick="location.href='pay.rv'">
								</div>
							</div>
						</div>
					</div>
					<!-- form 종료 -->
					<!-- 결제페이지 안만들면 alert로 결제하시겠습니까? 물어보고 -->
					<!-- 취소 -> 메인으로 돌아가기, 확인 -> 결제가 완료됐습니다 페이지로 -->				
				</div>
			</div>
		</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>