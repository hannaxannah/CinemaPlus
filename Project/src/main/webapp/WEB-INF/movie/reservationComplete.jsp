<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main" style="background-color: #F2F2F2">

	<!-- 영화 예매 결제 완료 안내 페이지 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<!-- 결제 완료 안내 -->
					<div class="col-xl-6" id="reservation-complete">
						<h1 style="margin-bottom: 100px;">영화 예매가 완료됐습니다.</h1>
						<table>
							<tr>
								<td>영화관</td>
								<td>상암월드컵경기장</td>
							</tr>
							<tr>
								<td>영화</td>
								<td>${screenBean.movie_title}</td>
							</tr>
							<tr>
								<td>상영일시</td>
								<td>${screenBean.screen_time}</td>
							</tr>
							<tr>
								<td>좌석번호</td>
								<td>
									<c:forEach var="seat" items="${seatnum}" varStatus="stutus"> 
										${seat}
										<c:if test="${stutus.index < fn:length(seatnum)-1}">
										,
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td>결제금액</td>
								<td>
									${totalPrice}
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