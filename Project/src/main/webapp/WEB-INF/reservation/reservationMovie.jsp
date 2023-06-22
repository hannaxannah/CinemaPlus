<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">

	<!-- 예매 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-xl-10" style="padding-bottom: 40px;">
						<div class="row">
							<div class="col-xl-3" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title">
									영화관
								</div>
								<div class="reservation-theater-list" style="width: 100%">
									<%
										String[] 서울 = {"서울", "서울", "서울", "서울", "서울", "서울", "서울", "서울", "서울"};
										String[] 경기 = {"경기", "경기", "경기", "경기", "경기", "경기", "경기", "경기", "경기"};
										String[] 인천 = {"인천", "인천", "인천", "인천", "인천", "인천", "인천", "인천", "인천"};
										String[] 강원 = {"강원", "강원", "강원", "강원", "강원", "강원", "강원", "강원", "강원"};
										String[] 대전 = {"대전", "대전", "대전", "대전", "대전", "대전", "대전", "대전", "대전"};
										String[] 대구 = {"대구", "대구", "대구", "대구", "대구", "대구", "대구", "대구", "대구"};
										String[] 부산 = {"부산", "부산", "부산", "부산", "부산", "부산", "부산", "부산", "부산"};
										String[] 경상 = {"경상", "경상", "경상", "경상", "경상", "경상", "경상", "경상", "경상"};
										String[] 광주 = {"광주", "광주", "광주", "광주", "광주", "광주", "광주", "광주", "광주"};
									%>
									<div class="dropend" id="btn-groupDropendArea"> 
										<c:forEach var="area" items="서울, 경기, 인천, 강원, 대전/충청, 대구, 부산/울산, 경상, 광주/전라/제주">
										<button type="button" class="dropdown theater-area-btn" id="${area}" onClick="dp_menu()">
											${area}
										</button>
										<ul class="area-dropdown-menu" id="drop-content" style="display: none;">
											<c:if test="${area == '서울'}">
												<c:forEach var="branch" items="<%=서울%>">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${branch}</a></li>											
												</c:forEach>
											</c:if>
											<c:if test="${area == '인천'}">
												<c:forEach var="branch" items="<%=인천%>">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${branch}</a></li>											
												</c:forEach>
											</c:if>
											<c:if test="${area == '부산'}">
												<c:forEach var="branch" items="<%=부산%>">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${branch}</a></li>											
												</c:forEach>
											</c:if>
											<!-- 									
											<li><a class="area-dropdown-item" href="#">Action</a></li>
											<li><a class="area-dropdown-item" href="#">Another action</a></li>
											<li><a class="area-dropdown-item" href="#">Something else here</a></li>
											<li><hr class="area-dropdown-item"></li>
											<li><a class="area-dropdown-item" href="#">Separated link</a></li>
											 -->
										</ul>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="col-xl-4" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title">
									영화
								</div>
								<div class="container-dropend" id="btn-groupDropendArea" style="width: 100%">
									<div class="reservation-movie-list">
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<a class="reservation-movie-list-item">
											<img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											스파이더맨: 어크로스 더 유니버스
										</a>
										<br>
									</div>
								</div>
							</div>
							<div class="col-xl-5" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title">
									날짜/시간
								</div>
								<div class="container-dropend" id="btn-groupDropendArea" style="width: 100%">
									<div class="reservation-movie-date" style="flex-flow: row;">
										<c:forEach var="date" items="22<br>목, 23<br>금, 24<br>토, 25<br>일, 26<br>월, 27<br>화">
										<div class="reservation-movie-date-item">
											${date}
										</div>
										</c:forEach>
									</div>
									<div class="reservation-movie-time">
										<div class="reservation-movie-time-btn" onClick="">
											<!-- 상영시간 -->
											<a>16:15</a>
											<!-- 잔여석 상영관 -->
											<a>10/30&emsp;&emsp;2관</a>
										</div>
										<div class="reservation-movie-time-btn" onClick="">
											<!-- 상영시간 -->
											<a>16:15</a>
											<!-- 잔여석 상영관 -->
											<a>10/30&emsp;&emsp;2관</a>
										</div>
										<div class="reservation-movie-time-btn" onClick="">
											<!-- 상영시간 -->
											<a>16:15</a>
											<!-- 잔여석 상영관 -->
											<a>10/30&emsp;&emsp;2관</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 영화관, 영화, 날짜, 시간 선택 안했으면 alert -->
					<!-- 팝업창에 영화관, 영화, 날짜, 시간 띄우고 좌석을 선택하시겠습니까? 물어보기 -->
					<!-- 선택 -> form 전송, 취소 -> 뒤로가기 -->
				</div>
			</div>
		</div>
	</section>
</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>