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
			
			<div class="col-xl-12" style="display: flex; flex-direction: column; align-items: center;">
				<%@ include file="theaterMenu.jsp"%>
				<div class="theater-intro">
					<img src="resources/images/movie-theater-01-02.jpg">
					<div style="position: absolute;display: flex;flex-direction: column;padding: 20px 40px;">
						<a class="theater-branch-name">${branch}점</a>
						
						<a class="theater-branch-address">
							${address}
						</a>
						
					</div>
				</div>
				<div class="theater-branch-info">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">교통안내</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="showtime-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="showtime-tab-pane" aria-selected="false">상영시간표</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="fee-tab" data-bs-toggle="tab" data-bs-target="#fee-tab-pane" type="button" role="tab" aria-controls="fee-tab-pane" aria-selected="false">관람료</button>
					  </li>
					</ul>
					<div class="tab-content" id="myTabContent">
					  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0" style="display:flex;flex-flow:column;padding-top:20px;">
						<!-- <a class="theater-branch-howtoget-title"><i class="bi bi-bus-front"></i>&ensp;교통안내</a> -->
						<a class="theater-branch-howtoget">
							 ${subway}
						</a>
					  </div>
					  <div class="tab-pane fade" id="showtime-tab-pane" role="tabpanel" aria-labelledby="showtime-tab" tabindex="0">
					  
					  </div>
					  <div class="tab-pane fade" id="fee-tab-pane" role="tabpanel" aria-labelledby="fee-tab" tabindex="0">
					  
					  </div>
					</div>
					
				</div>
			</div>	
			
				
			</div>
		</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>