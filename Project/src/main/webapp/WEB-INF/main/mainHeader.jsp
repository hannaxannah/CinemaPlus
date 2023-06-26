<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CINEMA+</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/favicon.ico" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
  
  <!-- Additional CSS File By Me -->
  <link href="resources/styleByMe.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Hidayah
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/hidayah-free-simple-html-template-for-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center justify-content-between">

      <a href="main.mn"><img src="resources/images/main-logo-2E3339.png" height="20px"></a>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>
      	   <a href="index.html">CINEMA+</a>
      -->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="boxOffice.mv">영화</a></li>
          <li><a class="nav-link scrollto" href="reservation.rv">예매</a></li>
          <li><a class="nav-link scrollto" href="theater.th">영화관</a></li>
          <li><a class="nav-link scrollto" href="mymovie.mv">우리집 영화관</a></li>
          <li><a class="nav-link scrollto" href="list.store">스토어</a></li>
          <li><a class="nav-link scrollto" href="main.mp?member_id=${loginInfo.member_id}">MY</a></li>
        </ul>
      </nav><!-- .navbar -->
      <nav id="navbar2" class="navbar2">
      	<ul>
          <c:choose>
				<c:when test="${loginInfo eq null}">
		        	<li><a class="login" href="memberlogin">로그인</a></li>
		        	<li><a class="register" href="register.mb">회원가입</a></li>
		        </c:when>
				<c:otherwise>
					<li><a class="login" href="logout.mb">로그아웃</a></li>
		        	<li><a class="login" href="register.mb">빠른예매</a></li>
				</c:otherwise>
			</c:choose>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

    </div>
  </header><!-- End Header -->
