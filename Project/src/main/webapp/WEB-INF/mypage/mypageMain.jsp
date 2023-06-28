<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
					<div class="col-lg-9" style="padding: 20px;">
						<!-- 회원 상세 정보 요약 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
								<form:form commandName="mybean" id="myform" action="main.mp" method="post">
									<table class="mypageInfoTable">
										<tr>
											<td colspan="3">
												${loginInfo.member_name} 님, 안녕하세요!
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<c:set var = "grade" scope = "session" value = "${mybean.member_point}"/>
												<c:set var = "mcount" scope = "session" value = "${MembershipCount}"/>
													<c:choose>
									       			 <c:when test = "${grade eq null || grade <3000 && mcount < 5}">
									       			   <font style="font-size: middle; margin-left: 20px;">회원 등급 : WELCOME</font><br><br>
									       			 </c:when>
									       			 <c:when test = "${grade >=3000 && grade <5000 || mcount >= 5 && mcount <10}">
									          			<font style="font-size: middle; margin-left: 20px;">회원 등급 : FRIENDS</font><br><br>
									        		</c:when>
									        		<c:when test = "${grade >=5000 && grade <10000  || mcount >= 10 && mcount <15}">
									           			<font style="font-size: middle; margin-left: 20px;">회원 등급 : VIP</font><br><br>
									        		</c:when>
									        		<c:otherwise>
									        			<font style="font-size: middle; margin-left: 20px;">회원 등급 : MVP</font><br><br>
									        		</c:otherwise>
									     			</c:choose>						
											</td>
										</tr>
										<tr>
											<td>
												쿠폰
											</td>
											<td>
												적립 포인트
											</td>
											<td>
												1:1 문의
											</td>
										</tr>
										<tr>
											<td>
												<div style="display:flex; justify-content: center;">
													<div class="card-icon rounded-circle align-items-center justify-content-center" style="display:flex; justify-content: center;">
								                    	<strong>${couponSize}</strong>장
								                    </div>
												</div>
											</td>
											<td>
												<div style="display:flex; justify-content: center;">
													<div class="card-icon rounded-circle align-items-center justify-content-center" style="display:flex; justify-content: center;">
								                    	<strong>${mybean.member_point } </strong>P
								                    </div>
												</div>
											</td>
											<td>
												<div style="display:flex; justify-content: center;">
													<div class="card-icon rounded-circle align-items-center justify-content-center" style="display:flex; justify-content: center;">
								                    	<img src="resources/images/mypage-icon-1to1.svg" 
								                    	width="50px" onclick="location.href='insert.in?member_id=${loginInfo.member_id}'">
								                    </div>
												</div>
											</td>
										</tr>
									</table>
								</form:form>
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
														<a href="myreservation.mp?member_id=${loginInfo.member_id}">더보기</a>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<!-- <hr style="border: 1px solid black; margin: 0;"> -->
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
														취소내역
													</td>
													<td>
														<a href="myreservDelete.mp?member_id=${loginInfo.member_id}">더보기</a>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<!-- <hr style="border: 1px solid black; margin: 0;"> -->
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