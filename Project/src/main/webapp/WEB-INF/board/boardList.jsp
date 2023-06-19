<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>    

	FAQboardList.jsp<br>
	
<style>
	.formList{
	margin: auto;
	text-align: center;
	}
</style>
	
<center>
	<table width="70%" class="formList">
		<tr>
			<td>
				<font style="font-size: x-large;">자주 묻는 질문</font>
			</td>
		</tr>
	</table>
	<!-- 검색 설정은 내부브라우저 말고 외부브라우저에서 실행 -->
	<form action="list.bd" method="get" style="margin-left: 500px">
		<select name="whatColumn">
			<option value="">전체</option>
			<option value="classification">분류</option>
			<option value="question">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	
	<table border="0" width="70%">
		<tr>
			<td align="left">
			<p>
				<font style="font-size: small; border: medium;">FAQ에서 자주하는 질문을 모았습니다.<br>궁금하신 내용에 대해 검색해 보세요.</font>			
			</p><br>
				<span><b>전체 (${pageInfo.totalCount}건)</b></span>
			</td>
			<td align="right">
				<a href="number.bd">번호 순</a>&nbsp;&nbsp;&nbsp;
				<a href="date.bd">작성일 순</a>&nbsp;&nbsp;&nbsp;
				<a href="hits.bd">조회수 순</a>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</table>
	
	<table border="1" width="70%">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
	<c:if test="${fn:length(boardLists) == 0}">
		<tr>
			<td colspan="6" align="center">
				목록이 없습니다.
			</td>
		</tr>		
	</c:if>
		
<c:if test="${fn:length(boardLists) != 0}">
	<c:forEach var="board" items="${boardLists}">
		<tr>
			<td align="center">${board.movie_num}</td>
			<td align="center">${board.classification}</td>
			<td align="left">
			<a href="detail.bd?movienum=${board.movie_num }&pageNumber=${pageInfo.pageNumber}">${board.question}</a>
			</td>
			<td align="center"><fmt:formatDate value="${board.qdate}" type="date" pattern="yyyy-MM-dd"/> </td>
			<td align="center">${board.hits}</td>
		</tr>
	</c:forEach>
	</c:if>
</table>
</center>

<center>
	${pageInfo.pagingHtml}
</center>
	
	
<%@ include file="../main/mainFooter.jsp"%>


