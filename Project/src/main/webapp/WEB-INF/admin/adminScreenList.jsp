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
							상영 리스트 <small>영화</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<p class="text-muted font-13 m-b-30"></p>
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th width="7%" >예매율</th>
									<th width="15%">포스터</th>
									<th width="35%">제목</th>
									<th width="10%">개봉일</th>
									<th>관람등급</th>
									<th>상영여부</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach var="weekly" items="${weeklyBoxOfficeList}" varStatus="status">
								<c:set var="on" value="0"/>
									<tr>
										<td style="text-align:center;">${weekly.get("salesShare")}</td>
										<td><img src="${posters[status.index]}" width="100" height="150"></td>
										<td>${weekly.get('movieNm')}</td>
										<td>${weekly.get('openDt')}</td>
										<td>${ratings[status.index]}</td>
										<td>
											<c:forEach var="screen" items="${screenList}">
												<c:if test="${screen.movie_title eq weekly.get('movieNm')}">
												<span class="btn btn-success">상영중</span>
													<c:set var="on" value="1"/>
												</c:if>
											</c:forEach>
											<c:if test="${on == 0}">
													<span class="btn btn-danger">상영 준비중</span>
											</c:if>
											<c:if test="${on ne 1}">
												<a class="btn btn-primary" href="screenInsert.admin?movie_title=${weekly.get('movieNm')}
													&movie_runtime=${runtimes[status.index]}
													&rating=${ratings[status.index]}">영화오픈</a>
												</c:if>
										</td>
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
