<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 영화 : 박스오피스 -->
	<section id="portfolio" class="portfolio">
		<div style="width: 90%; margin: 0 auto;">
		<div class="container-fluid">

			<div class="section-title">
				<h3>박스오피스</h3>
			</div>
				<div class="row portfolio-container justify-content-center" style="position: relative; width: 100%; margin: 0 auto;">
					<div class="col-xl-10">
						<div class="row">
							<c:forEach var="i" begin="1" end="10">
							<!-- Start portfolio item -->
							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item">
								<!-- style="position: absolute; left: 0px; top: 0px;" -->
								<div class="portfolio-wrap">
									<img src="resources/images/movie-poster-${i}.jpg" class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>
											<a href="movieDetail.mv" title="More Details">스파이더맨: 어크로스 더 유니버스</a>
										</h4>
										<p>App</p>
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
										<span class="rate">예매율 22.5%</span>
										<span class="date">개봉일 2023.06.21</span>
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