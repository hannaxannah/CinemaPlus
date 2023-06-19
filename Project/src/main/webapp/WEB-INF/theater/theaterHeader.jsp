<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
  <!-- ======= Theater Header ======= -->
  <header id="theaterHeader" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center justify-content-center">

      <nav id="navbarTheater" class="navbar">
        <ul>
        <c:forEach var="areaName" items="${area}">                  
          <li class="dropdown"><a href="#"><span>${areaName}</span></a>
            <ul>
              <c:if test="${areaName == '서울'}">
              <c:forEach var="seoulBranch" items="${seoul}"> 
              	<li><a href="#">${seoulBranch}</a></li>
              </c:forEach>
              </c:if>
              <c:if test="${areaName == '경기'}">
              <c:forEach var="gyeonggiBranch" items="${gyeonggi}"> 
              	<li><a href="#">${gyeonggiBranch}</a></li>
              </c:forEach>
              </c:if>
            </ul>
          </li>
              </c:forEach>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->