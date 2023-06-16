<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
member/mypageMain.jsp<br>
<%@ include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>    
<style>
	table{
	width: 600px;
	height: 100px;
	margin: auto;
	
	}
</style>

<form:form commandName="mybean" id="myform" action="mypage_main.mb" method="post">
<table border="1" style="margin-top: 80px">
	<tr>
		<td colspan="3"><br>
			<a style="font-size: large; margin-left: 20px;">${loginInfo.member_name} 님, 안녕하세요!</a><br><br>
			
			<font style="font-size: small; margin-left: 20px;">회원 등급 : </font><br>
			<font style="font-size: small; margin-left: 20px;"></font><br>
		</td>
		
	</tr>
	
	<tr>
		<td align="center">
			<font style="font-size: small;">쿠폰/관람권/교환권</font>	<br>
			<font style="font-size: x-large;"><%-- ${mybean.totalcount} --%> 장</font>
		</td>
		<td align="center">
			<font style="font-size: small;">포인트</font><br>
			<font style="font-size: large;">${mybean.member_point } P</font>
		</td>
		<td align="center">
			<font style="font-size: small;"><a href="insert.in?member_id=${loginInfo.member_id}">1:1문의</a></font>
		</td>
	</tr>
</table><br><br>

<table border="1">
	<tr>
		<td height="110px" valign="top"><br>
			&nbsp;&nbsp;예매내역
			<a style="margin-left: 75%" href="myPurchaseList.mp?member_id=${loginInfo.member_id}">더보기</a><br> 
			<hr align="center" width="93%" style="margin-left: 10px;">
		</td>
	</tr>
</table><br><br>

<table border="1">
	<tr>
		<td height="110px" valign="top"><br>
			&nbsp;&nbsp;취소내역
			<a style="margin-left: 75%" href="myPurchaseList.mp?member_id=${loginInfo.member_id}">더보기</a><br> 
			<hr align="center" width="93%" style="margin-left: 10px;">
		</td>
	</tr>
</table><br><br>
</form:form>

<%@ include file="../main/mainFooter.jsp"%>

