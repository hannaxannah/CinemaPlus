<% pageContext.setAttribute("newLineChar", "\n"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../common/common.jsp"%>
<main id="main">

	<section id="testimonials" class="testimonials section-bg">
		<div class="container-fluid">

			<div class="row justify-content-center">
				<div class="col-xl-10">

					<div class="row">

						<div class="col-lg-12" style="display: flex; flex-direction: column;">
							<!------------------------------
								MovieDetail : 영화 상세정보
							 ------------------------------>
							<div style="padding: 0; background-color: #000; display: flex; justify-content: center;">
								<!-- iframe original width="560" height="315" -->
								<iframe width="840" height="472.5"
									<c:if test="${screen_on}">
										src="https://www.youtube.com/embed/${sUrl}"
									</c:if>
									<c:if test="${vod_on}">
									src="https://www.youtube.com/embed/${vodBean.url}"
									</c:if>
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									allowfullscreen></iframe>
							</div>
							<div class="testimonial-item" style="padding: 40px 0; display: flex; flex-wrap: wrap;">
								<div class="col-lg-10">
									<h2>${movie.movie_title}</h2>
								</div>
								<c:if test="${screen_on}">
									<div class="col-lg-2" style="display: inline-flex;align-items: flex-start; padding-left: 40px; margin-right: 0">
										<input type="button" class="btn btn-primary btn-block" style="background-color: #6B49EA; border: 0px" value="예매하기"
										onclick="reservation()">
									</div>
								</c:if>
								<c:if test="${vod_on}">
									<div class="col-lg-2" style="display: inline-flex;align-items: flex-start; padding-left: 40px; margin-right: 0">
										<input type="button" class="btn btn-primary btn-block" style="background-color: #6B49EA; border: 0px" value="VOD구매하기"
										onclick="vodBuy()">
									</div>
								</c:if>
								<div class="col-lg-12">
									<h4>
										감독 : ${movie.director} | 장르 : 애니메이션/140 분 | 등급 : ${movie.rating} | 개봉일 : ${movie.open_date}<br>
										출연진 : ${movie.actors}
									</h4>
									<h4 style="color: #F7F7F7; margin-top: 20px;">
										${movie.movie_story}
									</h4>
								</div>
							</div>
							<!-- End MovieDetail : 영화 상세정보 -->
							<!------------------------------
								MovieDetail : 영화 감상평
							 ------------------------------>
							<!-- <hr style="width: 100%; border: 1px solid #fff; opacity: 0.8;"> -->
							<div class="testimonial-item" style="padding: 40px 0; display: flex; flex-wrap: wrap;">
								<a style="font-size: 1.2rem; font-weight: 500; color: #F7F7F7;">한줄 기록</a>
								<hr style="width: 100%; border: 1px solid #fff; opacity: 0.8;">
								<table class="MovieDetailReview">
									<c:forEach var="review" items="${reviewList}">
										<tr>
											<td width="15%">
												<b>${review.member_id}</b>
												<div style="margin-bottom: 5px;"></div>
												<!-- 4.5 / 5.0 -->
											</td>
											<td width="85%">
													${fn:replace(review.review_content, newLineChar, "<br/>")}
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- <hr style="width: 100%; border: 1px solid #fff; opacity: 0.8;"> -->
						</div><!-- col-lg-12 -->
					</div><!-- row -->
				</div><!-- col-xl-10 -->
			</div><!-- row justify-content-center -->

		</div>
		<!-- "container-fluid" -->
	</section>
</main>
<script type="text/javascript">
	function reservation() {
		location.href="fastReservation.mv?movie_title=" + '${movie.movie_title}';
	}
	function vodBuy() {
		alert(1);
	}
	
	
</script>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>