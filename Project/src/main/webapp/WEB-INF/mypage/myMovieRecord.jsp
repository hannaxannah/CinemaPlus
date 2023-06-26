<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<style>
body {
	
}

.orderList {
	cursor: pointer;
	text-align: center;
}

.orderList:hover {
	transform: scale(1.1);
}

.panel-default {
	border-color: #ddd;
}

.panel-order .row {
	border-bottom: 1px solid #ccc;
}

.panel-order .row .col-md-1 {
	text-align: center;
	padding-top: 28px;
}

.panel-order .row .col-md-1 i {
	width: 50px;
	max-height: 50px;
}

.panel-order .row .row {
	border-bottom: 0;
}

.panel-order .row .col-md-11 {
	border-left: 1px solid #ccc;
}

.panel-order .row .row .col-md-12 {
	text-align: left;
	padding-top: 7px;
	padding-bottom: 7px;
}

.panel-order .row .row .col-md-12:last-child {
	font-size: 11px;
	color: #555;
	background: #efefef;
}

.panel-order .btn-group {
	margin: 0px;
	padding: 0px;
}

.panel-order .panel-body {
	padding-top: 0px;
	padding-bottom: 0px;
}

.panel-order .panel-deading {
	margin-bottom: 0;
}

a {
	color: #000000;
	text-decoration: none;
}

.row .row {
	text-align: left;
}

.panel-order .panel-heading {
	color: #333;
	background-color: #f5f5f5;
	border-color: #ddd;
	padding: 10px 15px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.label-danger {
	background-color: #5cb85c;
}

.label {
	display: inline;
	padding: .2em .6em .3em;
	font-size: 75%;
	font-weight: 700;
	line-height: 1;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
}
</style>

<div class="col-lg-9" style="padding: 20px;">
	<!-- 회원 상세 정보 요약 -->
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="reservation-tab" data-bs-toggle="tab" data-bs-target="#reservation-tab-pane" type="button" role="tab" aria-controls="reservation-tab-pane" aria-selected="true">
						내가 본 영화 (총 ${fn:length(reservationList)}건)
					</button>
				</li>
				 <li class="nav-item" role="presentation">
					<button class="nav-link" id="purchase-tab" data-bs-toggle="tab" data-bs-target="#purchase-tab-pane" type="button" role="tab" aria-controls="purchase-tab-pane" aria-selected="false">
						작성한 리뷰 목록
					</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="reservation-tab-pane"
					role="tabpanel" aria-labelledby="reservation-tab" tabindex="0"
					style=" flex-flow: column; padding-top: 20px;">
					<div style="width: 1000px;">
					
						
						<div style="width: 770px; padding: 15px;" >
							<c:if test="${fn:length(reservationList) == null}">
								<p colspan="5" align="center">리뷰 내역이 없습니다.</p>
							</c:if>

							<c:if test="${fn:length(reservationList) != null}">
								<c:forEach var="reservation" items="${reservationList}" varStatus="status">
									<fmt:parseDate var="date1" value="${reservation.reservation_date}" pattern="yyyy-MM-dd" />
									<fmt:formatDate var="date2" value="${date1}" type="DATE" pattern="yyyy-MM-dd" />
									<div style="width: 190px; padding-left: 30px; padding-bottom:50px; float: left;">
										<img
										src="https://img.megabox.co.kr/SharedImg/2021/12/16/ixl5QxDVs5Gn8nQN3rslK8BUmgFVklj8_230.jpg"
										onerror="noImg(this)" alt="스파이더맨: 노 웨이 홈">
									</div>
									<div style="width: 180px; padding-left: 20px; float: left;">
										<p class="movieTitle">${reservation.movie_title}</p>
										<p>속초점</p>
										<p>${reservation.screen_name}</p>
										<p>${date2}</p>
										<a href="" style="background-color: #EBE4FC; padding:5px;">리뷰쓰기</a> &nbsp;|  &nbsp;
										<a href="" style="background-color: #EBE4FC; padding:5px;">삭제하기</a>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
			</div>
		</div>
	</div>

</div>
</div>
</div>
</section>

</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>