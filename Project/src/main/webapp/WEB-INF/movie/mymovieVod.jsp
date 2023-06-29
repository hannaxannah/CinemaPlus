<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 우리집영화관 -->
	<section id="portfolio" class="portfolio">
		<div style="width: 90%; margin: 0 auto;">
		<div class="container-fluid">

			<div class="section-title">
				<h3>우리집영화관</h3>
				</div>
				<div class="col-xl-12" style="display: flex; flex-direction: column; align-items: center;">
				<nav id="theaterNavbar" class="navbar">
					<ul>
						<!-- <li class="dropdown"><a href="mymovieshowtime.mv">상영시간표</a></li> -->
						<li class="dropdown"><a href="mymovievod.mv">VOD</a></li>
					</ul>
				</nav>
				</div>
				<div class="movie-list-classify">
				
					<ol>
				      <li><a href="" style="color:#6B39EA;">가격순</a></li>
				      <li><a href="">개봉일순</a></li>
				      <!-- 선택한 순서일 때, 글자색: #6B39EA, 원래: #FCFBFF -->
				    </ol>
				</div>
			
				<div class="row portfolio-container justify-content-center" style="position: relative; margin: 0 auto;">
				
					<div class="col-xl-10">
						<div class="row">
							<c:forEach var="i" begin="1" end="10">
							<!-- Start portfolio item -->
							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item">
								<!-- style="position: absolute; left: 0px; top: 0px;" -->
								<div class="portfolio-wrap">
									<img src="resources/images/movie-poster-${i}.jpg" class="img-fluid" alt="" height="363px">
									<div class="portfolio-info">
										<!-- 영화 줄거리 요약(전체 글자수 제한둬서 잘라서 출력) -->
										<p>
											스파이더맨 VS 스파이더맨?!<br>
											<br>
											여러 성장통을 겪으며 새로운 스파이더맨이 된 ‘마일스 모랄레스’.<br>
											그 앞에 다른 평행세계의 스파이더우먼 ‘ 그웬’이 다시 나타난다.<br>
											<br>
											모든 차원의 멀티버스 속 스파이더맨들을 만나게 되지만 ,<br>
										</p>
										<div style="margin-bottom: 100px"></div>
										<h4>
											<!-- 영화 제목 클릭 시, 영화 상세페이지로 넘어감 -->
											<a href="mymovievoddetail.mv" title="More Details">스파이더맨: 어크로스 더 유니버스</a>
										</h4>
										<input type="button" class="movie-list-reservation-btn" value="구입하기">
										<!-- 예매하기 넘길 때, 예를 들어 onClick="reservation.rv?movie_code=${movie_code}" -->
										<div class="portfolio-links">
											<!-- <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a> -->
										</div>
									</div>
								</div>
									<div class="tit-area">
										<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
										<p title="스파이더맨: 어크로스 더 유니버스" class="tit">스파이더맨: 어크로스 더 유니버스</p>
									</div>
									<div class="rate-date">
										<span class="date">개봉일 2023.06.21</span>
										<span class="rate">가격 3,500원</span>
									</div>
							</div>
							<!-- End portfolio item -->
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>