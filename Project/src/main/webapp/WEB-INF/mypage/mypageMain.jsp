<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
					<div class="col-lg-9" style="padding: 20px;">
						<!-- 회원 상세 정보 요약 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
									<table class="mypageInfoTable">
										<tr>
											<td colspan="3">
												OOO님, 안녕하세요!
											</td>
										</tr>
										<tr>
											<td colspan="3">
												등급 WELCOME
												<br>
												포인트 1,020P				
											</td>
										</tr>
										<tr>
											<td>
												쿠폰/관람권/교환권
											</td>
											<td>
												영화기록
											</td>
											<td>
												1:1 문의
											</td>
										</tr>
										<tr>
											<td>
												<div style="display:flex; justify-content: center;">
													<div class="card-icon rounded-circle align-items-center justify-content-center" style="display:flex; justify-content: center;">
								                    	<strong>0</strong>
								                    </div>
												</div>
											</td>
											<td>
												<div style="display:flex; justify-content: center;">
													<div class="card-icon rounded-circle align-items-center justify-content-center" style="display:flex; justify-content: center;">
								                    	<img src="resources/images/mypage-icon-review.svg" width="50px">
								                    </div>
												</div>
											</td>
											<td>
												<div style="display:flex; justify-content: center;">
													<div class="card-icon rounded-circle align-items-center justify-content-center" style="display:flex; justify-content: center;">
								                    	<img src="resources/images/mypage-icon-1to1.svg" width="50px">
								                    </div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- 예매내역 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
											<table class="myReservationPurchase">
												<tr>
													<td>
														예매내역
													</td>
													<td>
														<a href="">더보기</a>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<hr style="border: 1px solid black; margin: 0;">
													</td>
												</tr>
												<tr>
													<td colspan="2">
													</td>
												</tr>
											</table>
								</div>
							</div>
							<!-- 구매내역 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
											<table class="myReservationPurchase">
												<tr>
													<td>
														구매내역
													</td>
													<td>
														<a href="">더보기</a>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<hr style="border: 1px solid black; margin: 0;">
													</td>
												</tr>
												<tr>
													<td colspan="2">
													</td>
												</tr>
											</table>
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