<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<form action="movieSearch.admin" method="post">
<table>
	<tr>
		<td>영화제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>개봉년도</td>
		<td><input type="text" name="date"></td>
	<tr>
	<tr>
		<td colspan="2"><input type="submit" value="검색"></td>
	</tr>
</table>
</form>