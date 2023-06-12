<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mypageMain.jsp<br>
<%@ include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>    
<style>
	table{
	width: 600px;
	height: 100px;
	}
</style>

<form:form commandName="mybean" action="mypage_main.mp" method="post">
<table border="1">
	<tr>
		<td colspan="3">
			<a style="font-size: large; margin-left: 20px">${loginInfo.member_name} 님, 안녕하세요!</a>
		</td>
	</tr>
	<tr>
		<td align="center">
			<font style="font-size: small;">쿠폰/관람권/교환권</font>	<br>
			<font style="font-size: x-large;">${mybean.totalcount} 장</font>
		</td>
		<td align="center">
			<font style="font-size: small;">포인트</font><br>
			<font style="font-size: large;">${mybean.member_point } 점</font>
		</td>
		<td align="center">
			<font style="font-size: small;"><a href="location.href='insert.in'">1:1문의</a></font>
		</td>
	</tr>
</table><br><br>

<table border="1">
	<tr>
		<td height="140px" valign="top"><br>
			&nbsp;&nbsp;예매내역
			<a style="margin-left: 75%" href="">더보기</a><br> 
			<hr align="center" width="90%">
		</td>
	</tr>
</table><br><br>

<table border="1">
	<tr>
		<td height="140px" valign="top"><br>
			&nbsp;&nbsp;구매내역
			<a style="margin-left: 75%" href="">더보기</a><br> 
			<hr align="center" width="90%">
		</td>
	</tr>
</table><br><br>
</form:form>

<%@ include file="../main/mainFooter.jsp"%>

