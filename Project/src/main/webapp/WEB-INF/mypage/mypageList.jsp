<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="../common/common.jsp"%>
	<%@include file="../main/mainHeader.jsp"%>

<style>
	.mypage{
	width: 20%;
	height: 100%;
	background: white;
	}
</style>


로그인 아이디 : ${loginInfo.member_id}<br>
<div class="mypage">
<table border="1" width="220px" height="400px"
	style="text-align: center;">
	<tr>
		<td><a href="mypage_main.mp?member_id=${loginInfo.member_id}">마이페이지
				메인</a><br></td>
	</tr>
	<tr>
		<td><a href="">예매/구매내역</a><br></td>
	</tr>
	<tr>
		<td><a href="">관람권/교환권</a><br></td>
	</tr>
	<tr>
		<td><a href="">MY쿠폰</a><br></td>
	</tr>
	<tr>
		<td><a href="">멤버쉽 안내</a><br></td>
	</tr>
	<tr>
		<td><a href="insert.in">1:1문의</a><br></td>
	</tr>
	<tr>
		<td><a href="list.in">문의내역</a><br></td>
	</tr>
	<tr>
		<td><a href="list.bd">자주 묻는 질문(FAQ)</a><br></td>
	</tr>
	<tr>
		<td><a href="mypage_update.mb?member_id=${loginInfo.member_id}">회원정보
				수정하기</a><br></td>
	</tr>
	<tr>
		<td><a href="mypage_delete.mb?member_id=${loginInfo.member_id}">회원
				탈퇴하기</a><br></td>
	</tr>
</table>
</div>


<%@include file="../main/mainFooter.jsp"%>

