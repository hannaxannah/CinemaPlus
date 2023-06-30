<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./adminMenu.jsp"%>
<%@ include file="../common/common.jsp"%>

<!-- 내용 -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					영화 <small>영화판매내역</small>
				</h3>
			</div>

		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							판매 리스트 <small>판매내역</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<p class="text-muted font-13 m-b-30" style="color:#F15F5F">
                     	* 총 판매 금액은 <fmt:formatNumber value="${totalPrice}" pattern="#,###"/> 원 입니다.
                    </p>
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>영화제목</th>
									<th>티켓가격</th>
									<th>회원</th>
									<th>티켓타입</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach var="reservation" items="${reservationList}" varStatus="status">
									<tr>
										<td>${reservation.movie_title}</td>
										<td>${reservation.ticket_price}</td>
										<td>${reservation.member_id}</td>
										<td>${reservation.ticket_type}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /page content -->
<%@ include file="./adminBottom.jsp"%>
