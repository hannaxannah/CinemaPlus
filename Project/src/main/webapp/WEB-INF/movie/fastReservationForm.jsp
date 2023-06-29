<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<style>
	.timeButton{
		display: block;
	    position: relative;
	    height: 80px;
	    padding: 8px 14px 5px;
	    border-radius: 4px;
	    border: 1px solid #ddd;
	    cursor: pointer;
	    background: #f8f8f8;
	    background: -moz-linear-gradient(top, rgba(255, 255, 255, 1) 0%, rgba(248, 248, 248, 1) 100%);
	    background: -webkit-linear-gradient(top, rgba(255, 255, 255, 1) 0%, rgba(248, 248, 248, 1) 100%);
	    background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%, rgba(248, 248, 248, 1) 100%);
	}
	
	dt{
		overflow: hidden;
	    position: absolute !important;
	    width: 1px;
	    height: 1px;
	    clip: rect(1px, 1px, 1px, 1px);
	}
	
	.sit_time{
		display: block;
	    font-size: 15px;
	    font-weight: bold;
	    text-align: center;
	}
	.tooltip{
		display: none;
	    position: absolute;
	    left: 50%;
	    top: -41px;
	    height: 32px;
	    line-height: 34px;
	    margin-left: -38px;
	    padding: 0 8px;
	    border-radius: 4px;
	    font-family: 'Roboto';
	    font-size: 13px;
	    color: #FFF;
	    white-space: nowrap;
	    background-color: #333;
	}
	
	.reservation-movie-time::-webkit-scrollbar {
	    display: none; 
	}
	
	.theater-area-branch::-webkit-scrollbar {
	    display: none; 
	}
</style>
<main id="main">

	<!-- 예매 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-xl-10" style="padding: 40px 0;">
						<div class="row">
							<div class="col-xl-3" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title" style="border-right: 1px solid #FCFBFF;">
									영화관
								</div>
								<div class="reservation-theater-list" style="width: 400px; height:459px; background: #fff;">
									<nav id="theaterSidebar" class="navbar">
										<ul class="theater-area" style="flex-flow: column;align-items: flex-start;">
											<c:forEach var="areaName" items="${area}">
												<li class="dropdown" style="width: 100%;">
													<button style="width: 100%; text-align: left; padding: 10px 25px; border: 0px; background: #fff;">
														<span style="font-size: 1.2rem;color: #000;">${areaName}</span>
													</button>
													<ul class="theater-area-branch" id="branchName">
														<c:if test="${areaName == '서울'}">
															<c:forEach var="Branch" items="${seoul}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '경기'}">
															<c:forEach var="Branch" items="${gyeonggi}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '인천'}">
															<c:forEach var="Branch" items="${incheon}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '강원'}">
															<c:forEach var="Branch" items="${kangwon}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '대전/충청'}">
															<c:forEach var="Branch" items="${daejeon}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '대구'}">
															<c:forEach var="Branch" items="${daegu}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '부산/울산'}">
															<c:forEach var="Branch" items="${busan}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '경상'}">
															<c:forEach var="Branch" items="${gyeongsang}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${Branch}</a></li>
															</c:forEach>
														</c:if>
														<c:if test="${areaName == '광주/전라/제주'}">
															<c:forEach var="seoulBranch" items="${gwangju}">
																<li class="dropdown"><a class="reservation-theater-branch" href="#">${seoulBranch}</a></li>
															</c:forEach>
														</c:if>
													</ul>
												</li>
											</c:forEach>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-xl-4" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title" style="border-right: 1px solid #FCFBFF;">
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
								<div class="container-title" style="border-right: 1px solid #FCFBFF;">
									날짜/시간
								</div>
								<div class="container-dropend" id="btn-groupDropendArea" style="width:100%; border:1px solid rgba(242, 242, 242, 1);">
									<div class="reservation-movie-date" style="flex-flow: row;border: 1px solid rgba(242, 242, 242, 1);">
										<c:forEach var="date" items="22<br>목, 23<br>금, 24<br>토, 25<br>일, 26<br>월, 27<br>화, 28<br>수">
										<div class="reservation-movie-date-item" >
											<div class="btn-group">
						                        <button class="btn btn-default" type="button" id="date">${date}</button>
						                      </div>
										</div>
										</c:forEach>
									</div>

									

						<h5 style="margin: 20px;">2D</h4>
								<div class="reservation-movie-time" style="overflow:scroll;">
										<c:forEach var="fastReservation" items="${fastReservationList}">
											<div id="${fastReservation.movie_title}" onClick="" style="margin-bottom: 30px;">
												<div>
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
													${fastReservation.movie_title }</div>
											<button class="timeButton"  style="width:100px" onclick="change_btn2(event)" id="${screen.screen_time}">
											<a style="font-family: 'Roboto'; font-size: 11px;color: #666; padding-right: 0;padding-left:0;"> 
												<dl>
													<dt>상영시간</dt>
													<dd class="time">
														<strong class="sit_time">
															${fastReservation.screen_time } ~
															<span>
																<c:set var="startTime_1" value="${fastReservation.time}"/>
																	<c:if test="${fn:length(fastReservation.time) eq 2}">
																<c:set var="startTime_1" value="${fastReservation.time}"/>
																	</c:if>
																<fmt:parseNumber var="startTime_2" value="${(startTime_1 * (1000*60*60)) + (fastReservation.runtime * (1000*60))}" integerOnly="true" />
																
																<fmt:parseNumber var="hh" value="${(startTime_2  / (1000*60)) / 60 }" integerOnly="true" /> 
																<fmt:parseNumber var="mm" value="${(startTime_2  / (1000*60)) % 60 }" integerOnly="true" />
																${hh}:<c:if test="${mm < 10}">0</c:if>${mm}
															</span>
														</strong>
													</dd>
													<dt>잔여석</dt>
													<dd class="seat">
														<strong>${fastReservation.left_seats}</strong> / ${fastReservation.seat_count}
													</dd>
													<dt>상영관</dt>
													<dd class="hall">${fastReservation.screen_name}</dd>
												</dl>
												</a>
												<input type="hidden" name="screen_time" value="${fastReservation.screen_time}">
												<input type="hidden" name="movie_title" value="${fastReservation.movie_title}">
												<input type="hidden" name="seat_count" value="${fastReservation.seat_count}">
												<input type="hidden" name="screen_name" value="${fastReservation.screen_name}">
												<input type="hidden" name="ticket_price" value="${fastReservation.ticket_price}">
												<input type="hidden" name="rating" value="${fastReservation.rating}">
											</button>
										</div>
										</c:forEach>
										<form action="selectSeats.mv" method="post" id="myform" name="aForm">
										
										</form>
									
									</div>
								</div>
							</div>
							<div class="col-xl-10" id="reservation-go-seat" >
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

	
function change_btn2(e) {
	  var btns2 = document.querySelectorAll(".timeButton");
	  btns2.forEach(function (btn, i) {
	    if (e.currentTarget == btn) {
	      btn.classList.add("active");
	      console.log("btn=");
	      console.log(btn.id);
			$('input[name=screen_time]').attr('value',btn.id);
			 var input = document.createElement("input");
			   var values = ['screen_time', 'movie_title', 'seat_count', 'screen_name', 'ticket_price', 'rating'];
			   var aForm = document.forms["aForm"].getElementsByTagName("input");
			   while(aForm[0]){
				   aForm[0].remove();
			   }
			   $(btn).each( function() {
			     
			      var c = $(btn).children();
			      alert("영화가 선택되었습니다.");
			      for(var i=1; i<=6; i++){
			    	  input = document.createElement("input");
			    	  //alert(values[i-1]);
			    	  input.setAttribute("type", "hidden");
			          input.setAttribute("id", "input");
			          input.setAttribute("name", values[i-1]);
			          input.setAttribute("value", c.eq(i).val());
			          document.getElementById("myform").appendChild(input);
			      }
			     
			   })
	    
	    } else {
	      btn.classList.remove("active");
	    }
	  });
	  //console.log(e.currentTarget);
	}
	

</script>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>