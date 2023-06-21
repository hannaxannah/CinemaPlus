<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../common/common.jsp"%>
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
							<c:forEach var="weekly" items="${weeklyBoxOfficeList}" varStatus="status">
							<!-- Start portfolio item -->
							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item">
								<!-- style="position: absolute; left: 0px; top: 0px;" -->
								<div class="portfolio-wrap">
									<img src="${posters[status.index]}" class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>
											<a href="movieDetail.mv" title="More Details">${weekly.get("movieNm")}</a>
										</h4>
										<p>App</p>
										<div class="portfolio-links">
											<!-- <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a> -->
										</div>
									</div>
								</div>
									<div class="tit-area">
										<c:if test="${ratings[status.index] eq '18세관람가'}">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/18_46x46.png" width="23px" height="23px">
										</c:if>
										<c:if test="${ratings[status.index] eq '15세관람가'}">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png" width="23px" height="23px">
										</c:if>
										<c:if test="${ratings[status.index] eq '12세관람가'}">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png" width="23px" height="23px">
										</c:if>
										<c:if test="${ratings[status.index] ne '18세관람가' &&  ratings[status.index] ne '12세관람가' && ratings[status.index] ne '15세관람가'}">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
										</c:if>
										
										<p title=${weekly.get("movieNm")} class="tit">${weekly.get("movieNm")}</p>
									</div>
									<div class="rate-date">
										<span class="rate">예매율 ${weekly.get("salesShare")}</span>
										<span class="date">개봉일 ${weekly.get("openDt")}</span>
									</div>
							</div>
							<!-- End portfolio item -->a
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