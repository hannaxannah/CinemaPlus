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
					박스오피스 <small>박스오피스 목록</small>
				</h3>
			</div>

		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							상영중 <small>영화</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<p class="text-muted font-13 m-b-30">설명</p>
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>상영시간</th>
									<th>상영관</th>
									<th>제목</th>
									<th>남은좌석</th>
									<th>할인</th>
									<th>관람등급</th>
									<th>티켓가격</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach var="screen" items="${screenList}" varStatus="status">
								<c:set var="on" value="0"/>
									<tr>
										<td>${screen.screen_time}</td>
										<td>${screen.screen_name}</td>
										<td>${screen.movie_title}</td>
										<td>${screen.left_seats}/${screen.seat_count}</td>
										<td>${screen.discount}</td>
										<td>${screen.rating}</td>
										<td>${screen.ticket_price}</td>
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
