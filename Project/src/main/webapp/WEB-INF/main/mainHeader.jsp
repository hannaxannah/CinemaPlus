<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cinema+</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/input.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/member.js"></script>
</head>

<body>
	<!-- 상단 고정바 -->
	<div class="header">
		<div class="header1">
			<a href="">사이트맵</a>
		</div>
		<div class="header2">
			<c:choose>
				<c:when test="${loginInfo eq null}">
					<a href="memberlogin.mb">로그인</a>&nbsp&nbsp<a href="register.mb">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="logout.mb">로그아웃</a>&nbsp&nbsp<a href="">빠른예매</a>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>

	<!-- 메인 메뉴 -->
	<div class="container-mainmenu">
		<div class="mainmenu-1">
			<a href="">영화</a>
		</div>
		<div class="mainmenu-2">
			<a href="">예매</a>
		</div>
		<div class="mainmenu-3">
			<a href="theater.th">영화관</a>
		</div>
		<div class="mainmenu-4">
			<a href="main.mn">
				CINEMA+
				<%-- <img src="<%=request.getContextPath()%>/resources/images/main-logo.png" width="225px"> --%>
			</a>
		</div>
		<div class="mainmenu-5">
			<a href="">우리집 영화관
			</a>
		</div>
		<div class="mainmenu-6">
			<a href="list.store">스토어</a>
		</div>
		<div class="mainmenu-7">
			<a href="main.mp?member_id=${loginInfo.member_id}">MY</a>
		</div>
	</div>
	<hr>