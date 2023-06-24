<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 영화관 -->
	<section id="portfolio" class="portfolio">
		<div style="width: 90%; margin: 0 auto;">
		<div class="container-fluid">
			<div class="section-title">
				<h3>우리집영화관</h3>
			</div>
			
			<div class="col-xl-12" style="display: flex; flex-direction: column; align-items: center;">
				
				<nav id="theaterNavbar" class="navbar">
					<ul>
						<li class="dropdown"><a href="mymovieshowtime.mv">상영시간표</a></li>
						<li class="dropdown"><a href="mymovievod.mv">VOD</a></li>
					</ul>
				</nav>

				<div class="theater-intro" style="display:flex;justify-content:center;align-items:center;">
					<img src="resources/images/movie-theater-02-03.jpg">
					<div style="position: absolute;display: flex;flex-direction: column;padding: 20px 40px;">
						<a class="theater-branch-name" style="text-align:center;">
							<i class="bx bxs-quote-alt-left quote-icon-left"></i><br>
							<br>
							우리집 영화관에서<br>
							현재 상영중인 영화를 더욱 편리하게<br>
							감상해보세요<br>
							<br>
							<i class="bx bxs-quote-alt-right quote-icon-right"></i>
						</a>
					</div>
				</div>				
			</div>
		</div>
		</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>