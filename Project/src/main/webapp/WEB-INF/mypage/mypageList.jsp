<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="../common/common.jsp"%>
	<%@include file="../main/mainHeader.jsp"%>

<style>
	.mypage{
	margin-top: 30px;
	margin-left: 20px;
	width: 20%;
	height: 100%;
	}
</style>


<div class="mypage">
<table border="1" width="220px" height="400px"
	style="text-align: center;">
	<tr>
		<td><a href="mypage_main.mb?member_id=${loginInfo.member_id}">마이페이지
				메인</a><br></td>
	</tr>
	<tr>
		<td><a href="myPurchaseList.mp?member_id=${loginInfo.member_id}">예매/구매내역</a><br></td>
	</tr>
	<tr>
		<td><a href="myProductList.mp?member_id=${loginInfo.member_id}">스토어 구매내역</a><br></td>
	</tr>
	<tr>
		<td><a href="myCouponList.mp?member_id=${loginInfo.member_id}">MY쿠폰</a><br></td>
	</tr>
	<tr>
		<td><a href="membership.mp?member_id=${loginInfo.member_id}">멤버십 안내</a><br></td>
	</tr>
	<tr>
		<td><a href="insert.in">1:1문의</a><br></td>
	</tr>
	<tr>
		<td><a href="list.in">전체 문의내역</a><br></td>
	</tr>
	<tr>
		<td><a href="myList.in?customer_id=${loginInfo.member_id}">나의 문의내역</a><br></td>
	</tr>
	<tr>
		<td><a href="list.bd">자주 묻는 질문(FAQ)</a><br></td>
	</tr>
	<%-- 
	<tr>
		<td><a href="mypage_update.mb?member_id=${loginInfo.member_id}">회원정보
				수정하기</a><br></td>
	</tr>
	 --%>
	<tr>
		<td><a href="mail.mp?member_id=${loginInfo.member_id}">My정보수정 메일인증</a><br></td>
	</tr>
	<tr>
		<td><a href="mypage_delete.mb?member_id=${loginInfo.member_id}">회원
				탈퇴하기</a><br></td>
	</tr>
</table>
</div>

<%@include file="../main/mainFooter.jsp"%>

