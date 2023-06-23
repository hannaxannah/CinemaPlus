<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>    
<style type="text/css">
	table{
		margin: auto;
		width: 500px;
		height: 50px;
	}
	.err{
		color: red;
		font-size: 7px;
		font-weight: bold;
	}
</style>

<form:form commandName="member"  action="myDelete.mp" method="post">
<input type="hidden" name="member_code" value="${member.member_code}">
<table border="1" style="margin-top: 150px;">
	<tr align="center">
		<td colspan="2"><B>회원님의 정보를 입력하시고 탈퇴 버튼을 클릭해주세요.</B></td>
	</tr>
	<tr>
		<th>아이디 </th>
		<td>
			 <input type="text" name="member_id" size="30" value="${loginInfo.member_id}" readonly style="background-color: #F6F6F6;">
		</td>
	</tr>
	
	<tr>
	<th>비밀번호 </th>
		<td>
		<input type="password" name="member_pw" size="30">
		</td>
	</tr>
	
	<tr>
	<th>연락처 </th>
		<td>
			<input type="text" name="member_phone" size="30" placeholder="'-'를 제외하고 입력하세요">
		</td>
	</tr>
	
	<tr align="center">
		<td colspan="2">
			<input type="submit" value="탈퇴" onclick="location.href='myDelete.mp'">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form:form>

<%@ include file="../main/mainFooter.jsp"%>

