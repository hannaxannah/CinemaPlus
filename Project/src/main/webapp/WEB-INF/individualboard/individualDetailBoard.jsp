<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	individualDetailBoard.jsp<br>
	<%@ include file="../common/common.jsp" %>

<style type="text/css">
	table{
		margin: auto;
		width: 630px;
		height: 50px;
		text-align: center;
	}
	td{
		width: 25%;
		height: 40px;
	}
</style>    
	<h3 align="center">문의글 상세</h3>
<table border="1"> 
	<tr>
		<td>번호</td>
		<td>${board.movie_code}</td>
		<td>계정 아이디</td>
		<td>${board.customer_id}</td>
	</tr>
	<tr>
		<td>문의유형</td>
		<td>${board.question_type}</td>
		<td>작성일</td>
		<td>
			<fmt:formatDate value="${board.write_date}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${board.subject}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">
			<textarea rows="15" cols="65" style="resize: none;" readonly>${board.content}</textarea>
		</td>
	</tr>
	<tr>
		<td>참고이미지</td>
		<td colspan="3">${board.image}</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="button" value="글목록" onClick="location.href='list.in?pageNumber=${param.pageNumber}'">
			
			<c:if test="${loginInfo.member_id eq 'admin'}">
			<input type="button" value="답글작성" onClick="location.href='reply.in?ref=${board.ref}&restep=${board.re_step}&relevel=${board.re_level}&pageNumber=${param.pageNumber}'">&nbsp;
			</c:if>
			<c:if test="${loginInfo.member_id eq board.customer_id}">
			<input type = "button" value = "답글삭제" onClick = "location.href='delete.in?moviecode=${ board.movie_code}&pageNumber=${pageNumber }'">
			</c:if>
		</td>
	</tr>
</table>