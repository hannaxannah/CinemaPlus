<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="../common/common.jsp"%>
<%@include file="../main/mainHeader.jsp"%>
	    
	individualBoard.jsp<br>
	
<style>
	b{
	font-size: small;
	}	
</style>
	

	<h2 align="center">문의내역</h2>
<center>
	<!-- 검색 설정은 내부브라우저 말고 외부브라우저에서 실행 -->
	<form action="list.in" method="get" style="margin-left: 550px">
		<select name="whatColumn">
			<option value="">전체</option>
			<option value="subject">제목</option>
			<option value="individual_content">답변상태</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	<table border="0" width="70%">
		<tr>
			<td align="left">
				<b>
				- 1:1문의를 통해 남기신 내역을 검색을 통해 확인 하실 수 있습니다.<br>
				접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.
				</b>
			</td>
		</tr>
	</table>
	
	<table border="1" width="70%">
		<tr>
			<td align="center">
				<span><b>전체 (${pageInfo.totalCount}건)</b></span>
			</td>
			<td align="right" colspan="6">
				<input type="button" onclick="location.href='insert.in'" value="1:1문의">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>유형</th>
			<th>제목</th>
			<th>답변상태</th>
			<th>등록일</th>
		</tr>
		
	<c:if test="${fn:length(inboardLists) == 0}">
		<tr>
			<td colspan="6" align="center">
				목록이 없습니다.
			</td>
		</tr>
	</c:if>
		
	<c:if test="${fn:length(inboardLists) != 0}">
		<c:forEach var="board" items="${inboardLists}">
			<tr>
				<td align="center">${board.movie_code}</td>
				<td align="center">${board.customer_id}</td>
				<td align="center">${board.question_type}</td>
				<td>
				<a href="detail.in?moviecode=${board.movie_code}&pageNumber=${pageInfo.pageNumber}">${board.subject}</a>
				</td>
				<td align="center">
					<c:if test="${empty board.individual_content}">
						미답변
					</c:if>
					<c:if test="${not empty board.individual_content}">
						답변완료
					</c:if>
				</td>
				<td align="center">
				<fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</center>

<center>
	${pageInfo.pagingHtml}
</center>

<%@include file="../main/mainFooter.jsp"%>



	