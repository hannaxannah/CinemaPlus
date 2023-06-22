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
			<c:set var = "grade" scope = "session" value = "${mybean.member_point}"/>
	<c:choose>
        <c:when test = "${grade eq null || grade <3000}">
          <font style="font-size: middle; margin-left: 20px;">회원 등급 : Welcome</font><br><br>
        </c:when>
        <c:when test = "${grade >=3000 && grade <5000}">
          <font style="font-size: middle; margin-left: 20px;">회원 등급 : Friends</font><br><br>
        </c:when>
        <c:when test = "${grade >=5000 && grade <10000}">
           <font style="font-size: middle; margin-left: 20px;">회원 등급 : VIP</font><br><br>
        </c:when>
        <c:otherwise>
        <font style="font-size: middle; margin-left: 20px;">회원 등급 : MVP</font><br><br>
        </c:otherwise>
     </c:choose>
		</td>
		
	</tr>
	
	<tr>
		<td align="center">
			<font style="font-size: small;">쿠폰/관람권/교환권</font>	<br>
			<font style="font-size: large;"> ${couponSize} 장</font>
		</td>
		<td align="center">
			<font style="font-size: small;">현재 포인트</font><br>
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

