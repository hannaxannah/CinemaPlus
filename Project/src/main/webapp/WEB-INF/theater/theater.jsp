<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 영화관 -->
	<section id="portfolio" class="portfolio">
		<div style="width: 90%; margin: 0 auto;">
		<div class="container-fluid">

			<div class="section-title">
				<h3>영화관</h3>
			</div>
			
			<div class="col-xl-10">
			
			<nav id="theaterNavbar" class="navbar">
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
			
				
			</div>
		</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>