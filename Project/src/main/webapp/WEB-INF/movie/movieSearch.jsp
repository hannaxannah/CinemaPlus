<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery.js"></script>
<table border="1">
	<tr>
		<th>#</th>
		<th>영화코드</th>
		<th>제목</th>
		<th>개봉년도</th>
		<th>개봉일</th>
		<th>나라</th>
		<th>장르</th>
		<th>포스터</th>
		<th>감독</th>
		<th>스토리</th>
		<th>배우</th>
		<th>관람등급</th>
	</tr>
	<c:forEach var="movie" items="${movieList}" varStatus="status">
		<tbody id="tmp_table_body">
			<tr>
				<td><input type="checkbox" name="selectedRows"
					value="${status.index}"></td>
				<td>${movie.get('movieCd')}</td>
				<td>${movie.get('movieNm')}</td>
				<td>${movie.get('prdtYear')}</td>
				<td>${movie.get('openDt')}</td>
				<td>${movie.get('nationAlt')}</td>
				<td>${movie.get('genreAlt')}</td>
				<td><img src="${posters[status.index]}" width="100"
					height="150">
					<input type="hidden" value="${posters[status.index]}">
				</td>
				<td>${movieDirectors[status.index]}</td>
				<td>${stories[status.index]}</td>
				<td>${movieActors[status.index]}</td>
				<td>${ratings[status.index]}</td>
			</tr>
		</tbody>

	</c:forEach>

</table>
<input type="button" value="추가하기" id="button">
<script>
	$(function() {
		
		$("#button").click(function() {
			var rowData = new Array();
			var list = [];
			var checkbox = $("input[name=selectedRows]:checked");
			
			// 체크된 체크박스 값을 가져온다
			checkbox.each(function(i) {
				var data = new Object();
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				
				data.movieCd = td.eq(1).text();
				data.movieNm = td.eq(2).text();
				data.prdtYear = td.eq(3).text();
				data.openDt = td.eq(4).text();
				data.nationAlt = td.eq(5).text();
				data.genreAlt = td.eq(6).text();
				data.poster = td.eq(7).find('input[type="hidden"]').val()
				data.director = td.eq(8).text();
				data.story = td.eq(9).text();
				data.actor = td.eq(10).text();
				data.rating = td.eq(11).text();

				// 가져온 값을 배열에 담는다.\
				list.push(data);
				
			});//for
			
			var movies = JSON.stringify(list);
			$.ajax({
				url    :"insert.mv"
				, type : "POST"
				, traditional :true
				, data   : {"movies": movies}
				, dataType : "text"
				, success : function(data){
				      alert(data);
					location.href = 'list.mv';
				}
				, error: function(jqXHR, textStatus, errorThrown) {
					alert("ERROR : " + textStatus + " : " + errorThrown);
				}
			});
		});
	});
</script>