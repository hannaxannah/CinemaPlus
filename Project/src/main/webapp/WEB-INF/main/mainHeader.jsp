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
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

      <h1 class="logo"><a href="main.mn" class="logo"><img src="resources/images/main-logo-2E3339.png" alt="" class="img-fluid"></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>
      	   <a href="index.html">CINEMA+</a>
      -->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a style="color: #FCFBFF;" class="nav-link scrollto" href="movie.mv">영화</a></li>
          <li><a style="color: #FCFBFF;" class="nav-link scrollto" href="#">예매</a></li>
          <li><a style="color: #FCFBFF;" class="nav-link scrollto" href="theater.th">영화관</a></li>
          <li><a style="color: #FCFBFF;" class="nav-link scrollto" href="#">우리집 영화관</a></li>
          <li><a style="color: #FCFBFF;" class="nav-link scrollto" href="list.store">스토어</a></li>
          <li><a style="color: #FCFBFF;" class="nav-link scrollto" href="main.mp">MY</a></li>
          <!-- 
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
           -->
          <li style="margin-right: 235px"></li>
          <c:choose>
				<c:when test="${loginInfo eq null}">
					<%session.removeAttribute("loginInfo");%> 
					<%session.removeAttribute("cartSize");%> 
		        	<li><a class="nav-link scrollto" href="memberlogin">로그인</a></li>
		        	<li><a class="nav-link scrollto" href="#">회원가입</a></li>
		        </c:when>
				<c:otherwise>
					<li><a class="nav-link scrollto" href="logout.mb">로그아웃</a></li>
		        	<li><a class="nav-link scrollto" href="#">빠른예매</a></li>
				</c:otherwise>
			</c:choose>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
