<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.model.BoardBean"%>
<%@page import="board.model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>    

<style type="text/css">
	body, table{
		text-align: center;
	}
	table{
		margin: auto;
		width: 630px;
		height: 50px;
	}
	td{
		width: 30%;
		height: 30px;
	}
	th{
		width: 15%;
		height: 40px;
	}
</style>    

<table border="1" style="margin-top: 80px">
	<tr>
		<th>번호</th>
		<td>${board.movie_num}</td>
		<th>조회수</th>
		<td>${board.hits}</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>${board.classification}</td>
		<th>작성일</th>
		<td> 
			<fmt:formatDate value="${board.qdate}" type="date" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${board.question}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">
			<textarea rows="15" cols="80" style="resize: none;" readonly>${board.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="button" value="글목록" onClick="location.href='list.bd?pageNumber=${param.pageNumber}'">
		</td>
	</tr>
</table>

<%@ include file="../main/mainFooter.jsp"%>




