<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<style>
	a{
		color:#000;
	}
</style>
<main id="main" style="background-color: #F2F2F2">

	<!-- 영화 예매 결제 완료 안내 페이지 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<!-- 결제 완료 안내 -->
					<div class="col-xl-6" id="reservation-complete">
						<h1 style="margin-bottom: 100px;">Vod 구매가 완료됐습니다.</h1>
						<table>
							<tr>
								<td style="background-color: #7B4EEC; color:#FFF;">영화관</td>
								<td>${reservationBean.screen_name}</td>
							</tr>
							<tr>
								<td style="background-color: #7B4EEC; color:#FFF;">VOD 제목</td>
								<td>${vodBean.vod_title}</td>
							</tr>
							<tr>
								<td style="background-color: #7B4EEC; color:#FFF;">상영일시</td>
								<td> ${reservationBean.screen_time}</td>
							</tr>
							<tr>
								<td style="background-color: #7B4EEC; color:#FFF;">좌석번호</td>
								<td>
									${reservationBean.seat_number}
								</td>
							</tr>
							<tr>
								<td  style="background-color: #7B4EEC; color:#FFF;">결제금액</td>
								<td>
									${vodBean.vod_price}
								</td>
							</tr>
							<tr>
								<td style="background-color: #DDD;"><a href="main.mn" style="text-align: center;" >메인으로 돌아가기</a></td>
								<td style="background-color: #DDD; text-align: center;">
									<a href="myreservation.mp" style="background-color: #DDD;">예매내역보기</a>
								</td>
							</tr>
						</table>
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