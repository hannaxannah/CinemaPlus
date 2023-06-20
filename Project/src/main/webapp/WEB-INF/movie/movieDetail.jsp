<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
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
									src="https://www.youtube.com/embed/cqGjhVJWtEg"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
									allowfullscreen></iframe>
							</div>
							<div class="testimonial-item" style="padding: 40px 0; display: flex; flex-wrap: wrap;">
								<div class="col-lg-10">
									<h2>스파이더맨: 어크로스 더 유니버스</h2>
								</div>
								<div class="col-lg-2" style="display: inline-flex;align-items: flex-start; padding-left: 40px; margin-right: 0">
									<input type="button" class="btn btn-primary btn-block" style="background-color: #6B49EA; border: 0px" value="예매하기">
								</div>
								<div class="col-lg-12">
									<h4>
										감독 : 저스틴 톰슨, 조아킴 도스 샌토스, 켐프 파워 | 장르 : 애니메이션/140 분 | 등급 : 전체관람가 | 개봉일 : 2023.06.21<br>
										출연진 : 샤메익 무어, 헤일리 스테인펠드, 브라이언 타이리 헨리, 로렌 벨레스, 제이크 존슨, 제이슨 슈왈츠먼, 잇사 레이, 카란 소니, 대니얼 컬루야, 오스카 아이삭
									</h4>
									<h4 style="color: #F7F7F7; margin-top: 20px;">
										스파이더맨 VS 스파이더맨?!<br>
										<br>
										여러 성장통을 겪으며 새로운 스파이더맨이 된 ‘마일스 모랄레스’.<br>
										그 앞에 다른 평행세계의 스파이더우먼 ‘ 그웬’이 다시 나타난다.<br>
										<br>
										모든 차원의 멀티버스 속 스파이더맨들을 만나게 되지만 ,<br>
										질서에 대한 신념이 부딪히며 예상치 못한 균열이 생기는데…<br>
										<br>
										상상 그 이상을 넘어서는 멀티버스의 세계가 열린다!<br>
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
									<tr>
										<td width="15%">
											<b>gaga1</b>
											<div style="margin-bottom: 5px;"></div>
											4.5 / 5.0
										</td>
										<td width="85%">
											내 최애 히어로 스파이디ㅠ 로튼토마토 높은 이유가 있죠 영화관에서 봐야됨
										</td>
									</tr>
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
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>