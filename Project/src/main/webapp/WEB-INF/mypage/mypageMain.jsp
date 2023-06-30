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
											<td colspan="3"  style="background-color:#EBE4FC; border-radius: 25px;" >
												${loginInfo.member_name} 님, 안녕하세요 !
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<c:set var = "grade" scope = "session" value = "${mybean.member_point}"/>
												<c:set var = "mcount" scope = "session" value = "${MembershipCount}"/>
													<c:choose>
									       			 <c:when test = "${grade eq null || grade <3000 && mcount < 5}">
									       			   <font style="font-size:20px;"><br>회원 등급 : WELCOME</font><br><br>
									       			 </c:when>
									       			 <c:when test = "${grade >=3000 && grade <5000 || mcount >= 5 && mcount <10}">
									          			<font style="font-size:20px;"><br>회원 등급 : FRIENDS</font><br><br>
									        		</c:when>
									        		<c:when test = "${grade >=5000 && grade <10000  || mcount >= 10 && mcount <15}">
									           			<font style="font-size:20px;">회원 등급 : VIP</font><br><br>
									        		</c:when>
									        		<c:otherwise>
									        			<font style="font-size:20px;">회원 등급 : MVP</font><br><br>
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
												
												  <thead>
								                  <tr>
								                    <th scope="col" width="20%">예매날짜</th>
								                    <th scope="col" width="10%">영화관</th>
								                    <th scope="col" width="30%">영화</th>
								                    <th scope="col" width="15%">영화시간</th>
								                    <th scope="col" width="10%">좌석번호</th>
								                    <th scope="col" width="20%">예매취소</th>
												</tr>
								                </thead>
								                
								                <c:if test="${fn:length(reservationList) == 0}">
													<tr>
														<td colspan="6" align="center">예매 내역이 없습니다.</td>
													</tr>
												</c:if>
												
												 <c:if test="${fn:length(reservationList) != 0}">
												<tbody>
												<c:forEach var="reservation" items="${reservationList}" varStatus="status">
													<tr>
														<fmt:parseDate var="date1" value="${reservation	.reservation_date}" pattern="yyyy-MM-dd"/>
														<fmt:formatDate  var="date2" value="${date1}" type="DATE" pattern="yyyy-MM-dd"/> 
														<td>${date2}</td>
														<td>${reservation.screen_name}</td>
														<td>${reservation.movie_title}</td>
														<td>${reservation.screen_time}</td>
														<td>${reservation.seat_number}</td>
														<td><a href="reservDel.mp?reservation_num=${reservation.reservation_num}">예매취소</a></td>
													</tr>
												</c:forEach>												
												</tbody>
											</c:if>
								              </table>
											
								              
								</div>
							</div>
							<!-- 취소내역 -->
							<div class="card info-card customers-card">
								<div class="card-body align-items-center justify-content-center">
											 <table class="table">
								                <thead>
								                  <tr>
								                    <th scope="col" width="15%">예매날짜</th>
								                    <th scope="col" width="15%">영화관</th>
								                    <th scope="col" width="30%">영화</th>
								                    <th scope="col" width="15%">좌석번호</th>
								                    <th scope="col" width="15%">완전삭제</th>
								                  </tr>
								                </thead>
								                
								                <c:if test="${fn:length(delList) == 0}">
												<tr>
													<td colspan="5" align="center">취소 내역이 없습니다.</td>
												</tr>
												
											</c:if>
											 <c:if test="${fn:length(delList) != 0}">
												<tbody>
												<c:forEach var="del" items="${delList}" varStatus="status">
													<tr>
														<fmt:parseDate var="date1" value="${del.reservation_date}" pattern="yyyy-MM-dd"/>
														<fmt:formatDate  var="date2" value="${date1}" type="DATE" pattern="yyyy-MM-dd"/> 
														<td>${date2}</td>
														<td>${del.screen_name}</td>
														<td>${del.movie_title}</td>
														<td>${del.seat_number}</td>
														<td><a href="hangDelete.mp?reservation_num=${del.reservation_num}">완전삭제</a></td>
													</tr>
												</c:forEach>												
												</tbody>
											</c:if>
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