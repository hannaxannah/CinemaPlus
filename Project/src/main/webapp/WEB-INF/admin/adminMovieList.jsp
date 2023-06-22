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
					영화리스트 <small>전체 생성되있는 영화 리스트</small>
				</h3>
			</div>

		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							영화 리스트 <small>영화</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<p class="text-muted font-13 m-b-30">설명</p>
<table>
							<tr>
									<td colspan="14" align="right"><input type="button"
										value="추가하기" onclick="search()">
									<td colspan="14" align="right"><input type="button"
										value="순위보기" onclick="boxOffice()"></td>
								</tr>
</table>						
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>순서</th>
									<th>포스터</th>
									<th>영화코드</th>
									<th>제목</th>
									<th>장르</th>
									<th>감독</th>
									<th>배우</th>
									<th>관람등급</th>
									<th>개봉년도</th>
									<th>개봉일</th>
									<th>나라</th>
									<th>스토리</th>
									<th>vod</th>
									<th>삭제</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach var="movie" items="${movieLists}">
									<tr>
										<td>${movie.movie_num}</td>
										<td><img src="${movie.poster}" width="100" height="150"></td>
										<td>${movie.movie_code}</td>
										<td>${movie.movie_title}</td>
										<td>${movie.genre}</td>
										<td>${movie.director}</td>
										<td>${movie.actors}</td>
										<td>${movie.rating}</td>
										<td>${movie.open_year}</td>
										<td>${movie.open_date}</td>
										<td>${movie.nation}</td>
										<td>${movie.movie_story}</td>
										<td><c:if test="${movie.vod == 0}">
											<a href="insertVod.mv?movie_code=${movie.movie_code}
													&movie_title=${movie.movie_title}" >vod추가</a>
										</c:if> </td>
										<td>삭제</td>
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
<script type="text/javascript">
	function search() {
		location.href="movieSearch.admin";
	}
	function boxOffice() {
		location.href="boxOffice.mv";
	}
</script>
<%@ include file="./adminBottom.jsp"%>
