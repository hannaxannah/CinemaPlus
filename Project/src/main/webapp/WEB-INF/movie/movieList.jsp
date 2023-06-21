<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<script type="text/javascript">
	function search() {
		location.href="search.mv";
	}
	function boxOffice() {
		location.href="boxOffice.mv";
	}
</script>   
list.jsp
<h2 align="center">영화 정보 리스트 화면</h2>
<center>
<form action="list.mv" method="get">
	<select name="whatColumn">
		<option value="">전체검색
		<option value="title">제목
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
	<table border="1">
		<tr>
			<td colspan="15" align="right"><input type="button" value="추가하기" onclick="search()">
			<td colspan="15" align="right"><input type="button" value="순위보기" onclick="boxOffice()">
			</td>
		</tr>
		<tr>
			<th>번호</th>
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
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="movie" items="${movieLists}">
			<tr>
				<td>${movie.movie_num}</td>
				<td><img src="${movie.poster}" width="100" height="150"></td>
				<td><a href="detail.mv?movie_code=${movie.movie_code}&pageNumber=${pageInfo.pageNumber}">${movie.movie_code}</a></td>
				<td>${movie.movie_title}</td>
				<td>${movie.genre}</td>
				<td>${movie.director}</td>
				<td>${movie.actors}</td>
				<td>${movie.rating}</td>
				<td>${movie.open_year}</td>
				<td>${movie.open_date}</td>
				<td>${movie.nation}</td>
				<td>${movie.movie_story}</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</c:forEach>


	</table>
</center>
<center>
	${pageInfo.pagingHtml} 
</center>