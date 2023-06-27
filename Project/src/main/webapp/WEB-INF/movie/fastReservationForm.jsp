<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<main id="main">
	<!-- 예매 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-xl-10" style="padding: 40px 0;">
						<div class="row">
							<div class="col-xl-3" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title">
									영화관
								</div>
								<div class="reservation-theater-list" style="width: 100%">
									<div class="dropend" id="btn-groupDropendArea"> 
										<c:forEach var="areaName" items="${area}">
										<button type="button" class="dropdown theater-area-btn" id="${areaName}" onClick="dp_menu()">
											${areaName}
										</button>
										<ul class="area-dropdown-menu" id="drop-content" style="display: none;">
											<c:if test="${areaName == '서울'}">
												<c:forEach var="Branch" items="${seoul}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>											
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '경기'}">
												<c:forEach var="Branch" items="${gyeonggi}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '인천'}">
												<c:forEach var="Branch" items="${incheon}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '강원'}">
												<c:forEach var="Branch" items="${kangwon}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '대전/충청'}">
												<c:forEach var="Branch" items="${daejeon}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '대구'}">
												<c:forEach var="Branch" items="${daegu}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '부산/울산'}">
												<c:forEach var="Branch" items="${busan}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '경상'}">
												<c:forEach var="Branch" items="${gyeongsang}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
											<c:if test="${areaName == '광주/전라/제주'}">
												<c:forEach var="seoulBranch" items="${gwangju}">
													<li class="dropdown" style="padding: 10px;"><a class="area-dropdown-item" href="#">${Branch}</a></li>
												</c:forEach>
											</c:if>
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
									<c:forEach var="fastReservation" items="${fastReservationList}" end="0">
										<a class="reservation-movie-list-item">
										<c:if test="${fastReservation.rating eq '18세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/18_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if test="${fastReservation.rating eq '15세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if test="${fastReservation.rating eq '12세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if
											test="${fastReservation.rating ne '18세관람가' &&  fastReservation.rating ne '12세관람가' && fastReservation.rating ne '15세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png"
												width="23px" height="23px">
										</c:if>
											${fastReservation.movie_title}
										</a>
									</c:forEach>
										<!-- <a class="reservation-movie-list-item">
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
										</a> -->
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
										<c:forEach var="date" items="22<br>목, 23<br>금, 24<br>토, 25<br>일, 26<br>월, 27<br>화, 28<br>수">
										<div class="reservation-movie-date-item">
											${date}
										</div>
										</c:forEach>
									</div>
									<div class="reservation-movie-time">
									
										<c:forEach var="fastReservation" items="${fastReservationList}">
											<div class="reservation-movie-time-btn" onclick="selectTime(this)"  id="${fastReservation.screen_time}">
												<a>상영시간 ${fastReservation.screen_time}
												잔여석${fastReservation.left_seats}/${fastReservation.seat_count}석
												<br>
												상영관${fastReservation.screen_name}</a>
												<input type="hidden" name="screen_time" value="${fastReservation.screen_time}">
												<input type="hidden" name="movie_title" value="${fastReservation.movie_title}">
												<input type="hidden" name="seat_count" value="${fastReservation.seat_count}">
												<input type="hidden" name="screen_name" value="${fastReservation.screen_name}">
												<input type="hidden" name="ticket_price" value="${fastReservation.ticket_price}">
												<input type="hidden" name="rating" value="${fastReservation.rating}">
											</div>
										</c:forEach>
										<form action="selectSeats.mv" method="post" id="myform" name="aForm">
										
										</form>
										<!-- <div class="reservation-movie-time-btn" onClick="">
											상영시간
											<a>16:15</a>
											잔여석 상영관
											<a>10/30&emsp;&emsp;2관</a>
										</div>
										<div class="reservation-movie-time-btn" onClick="">
											상영시간
											<a>16:15</a>
											잔여석 상영관
											<a>10/30&emsp;&emsp;2관</a>
										</div>
										<div class="reservation-movie-time-btn" onClick="">
											상영시간
											<a>16:15</a>
											잔여석 상영관
											<a>10/30&emsp;&emsp;2관</a>
										</div> -->
									</div>
								</div>
							</div>
							<div class="col-xl-10" id="reservation-go-seat">
								<input type="submit" value="인원 및 좌석 선택" form="myform">;
							</div>
						</div>
					</div>
					<!-- 영화관, 영화, 날짜, 시간 선택 안했으면 alert -->
					<!-- 인원/좌석 선택 버튼 클릭 -> form 전송 -->
					<!-- 이때, 로그인 X -> 로그인 페이지, 로그인O -> 인원/좌석 선택 페이지 -->
				
				
			</div>
		</div>
	</section>
</main>
<script>
alert("좌석은 최대 4개까지 예약 할 수 있습니다.");
var selectedTime;
function selectTime(val) {
   $('input[name=screen_time]').attr('value',val.id);
   
   var input = document.createElement("input");
   var values = ['screen_time', 'movie_title', 'seat_count', 'screen_name', 'ticket_price', 'rating'];
   var aForm = document.forms["aForm"].getElementsByTagName("input");
   while(aForm[0]){
	   aForm[0].remove();
   }
   
   $(val).each( function() {
     
      var c = $(val).children();
      
      for(var i=1; i<=6; i++){
    	  input = document.createElement("input");
    	  alert(values[i-1]);
    	  input.setAttribute("type", "hidden");
          input.setAttribute("id", "input");
          input.setAttribute("name", values[i-1]);
          input.setAttribute("value", c.eq(i).val());
          document.getElementById("myform").appendChild(input);
      }
     
   })
}
</script>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>