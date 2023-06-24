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
					  	 <a class="theater-branch-fee">
					  <h5>영화관람료</h5>
					 	 <table id="fee-table">
					  		<tr>
					  			<td>요일</td>
					  			<td>상영시간</td>
					  			<td>일반</td>
					  			<td>청소년</td>
					  		</tr>
					  		<tr>
					  			<td rowspan="2">월~목</td>
					  			<td>조조(06:00~)</td>
					  			<td>10,000</td>
					  			<td>8,000</td>
					  		</tr>
					  		<tr>
					  			<td>일반(10:01~)</td>
					  			<td>14,000</td>
					  			<td>12,000</td>
					  		</tr>
					  		<tr>
					  			<td rowspan="2">
					  				금~일<br>
					  				공휴일
					  			</td>
					  			<td>조조(06:00~)</td>
					  			<td>11,000</td>
					  			<td>9,000</td>
					  		</tr>
					  		<tr>
					  			<td>일반(10:01~)</td>
					  			<td>15,000</td>
					  			<td>13,000</td>
					  		</tr>
					 	 </table>
					 	 <br>
					 	  <h5>우대적용</h5>
							• <span class="fee-apply">국가유공자</span> &nbsp; &nbsp;현장에서 국가유공자증을 소지한 본인 외 동반 1인까지 적용<br>
							• <span class="fee-apply">장애인</span> &nbsp; &nbsp;현장에서 복지카드를 소지한 장애인[중증 (1급~3급)까지 동반 1인까지 적용 / 경증(4급~6급)은 본인에 한함]<br>
							• <span class="fee-apply">경로</span> &nbsp; &nbsp;만65세 이상 본인에 한함(신분증 확인)<br>
							• <span class="fee-apply">미취학아동</span> &nbsp;부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)<br>
							• <span class="fee-apply">소방종사자</span> &nbsp; &nbsp;공무원증을 소지하거나 정복을 입은 소방관 본인<br>
							</a>
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