<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
movieDetailView.jsp
<br>
<center>
	<body>
		<div class="ratio ratio-16x9" style="width: 900">
			<iframe src="${movie.poster}" title="포스터"></iframe>
		</div>
		<div class="container" style="width: 900">
			<div class="row">
				<div class="col">
					<h1>${movie.movie_title}</h1>
				</div>
			</div>
			<div class="row">
				<div class="col">${movie.rating}|${movie.open_date}|평점</div>
				<div class="col"></div>
				<div class="col">
					<c:if test="${movie.vod eq 0}">
						<a href="insertVod.mv?movie_code=${movie.movie_code}&movie_title=${movie.movie_title}">VOD 추가하기</a>
					</c:if>
					<c:if test="${movie.vod eq 1}">
						<a>VOD 가격 수정하기</a> | <a href="deleteVod.mv?movie_code=${movie.movie_code}">VOD삭제하기</a>
					</c:if>
				</div>
			</div>
			<hr class="dropdown-divider">
			<div class="row">
				<div class="col">
					<b>감독</b>: ${movie.director}
				</div>
			</div>
			<div class="row">
				<div class="col">
					<b>출연</b>: ${movie.actors}
				</div>
			</div>
			<hr class="dropdown-divider">
			<div class="row">
				<div class="col">
					<b>줄거리</b>: ${movie.movie_story}
				</div>
			</div>
		</div>
	</body>
</center>