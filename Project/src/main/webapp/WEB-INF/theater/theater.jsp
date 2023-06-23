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
						<a class="theater-branch-name">강남점</a>
						<a class="theater-branch-address">
							서울특별시 강남구 역삼동 814-6 스타플렉스<br>
							서울특별시 강남구 강남대로 438 (역삼동)
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
							# 지하철<br>
							- 2호선 강남역 11번 출구 도보 5분<br>
							- 9호선 신논현역 5번 출구 도보 5분<br>
							- 신분당선 신논현역 6번 출구 도보 3분<br>
							<br>
							# 버스<br>
							- 간선버스 : 140, 144, 145, 146, 360, 400, 402, 420, 421, 440, 441, 452, 470, 542, 640, 643, 741<br> 
							  심야) N13, N31, N37, N75<br>
							- 지선버스 : 3412, 4312, 8146, 8541<br>
							- 광역버스 : 1005, 1100, 1101, 1151, 1241, 1311, 1311B, 1550, 1550-1, 1551, 1551B, 1552, 1560, 1570, 1700, 2000, 2000-1, 3008, 3030, 3100, 3401, 3600, 4403, 5001, 5001-1, 5002A, 5002B, 5003A, 5003B,5006, 5100, 5200, 5300, 6001, 6002, 6002-1, 6004, 6427, 6600, 7007, 8001, 8502, 9004, 9202, 9303, 9400, 9404, 9408, 9409, 9500, 9501, 9600, 9700, 9711, 9800, 9802, G5100,G7426, M4403, M4434, M4448, M4449, M5422, M5438, M6427, M7412, P9201, 이음2<br>
							  심야) 1101N, 3100N<br>
							- 마을버스 : 서초03<br>
							- 공항버스 : 6009<br>
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