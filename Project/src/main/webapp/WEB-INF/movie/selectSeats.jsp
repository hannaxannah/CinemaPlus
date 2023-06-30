	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<style>
	#selectedSeat{
	color: #503396!important;
	margin: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.2rem;
    cursor: pointer;
    
	}
	
	#occupiedSeat{
	color: #CCCCCC!important;
	margin: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.2rem;
    cursor: pointer;
    
	}
#selectedSeat:nth-of-type(4) {
	margin-right: 50px;
}

#selectedSeat:nth-of-type(11) {
	margin-right: 50px;
}

#seat:nth-of-type(4) {
	margin-right: 50px;
}

#seat:nth-of-type(11) {
	margin-right: 50px;
}

#occupiedSeat:nth-of-type(4) {
	margin-right: 50px;
}

#occupiedSeat:nth-of-type(11) {
	margin-right: 50px;
}
	
	.seatNumber{
		pointer-events: none;
		cursor: default;
	}	
</style>
<% request.setCharacterEncoding("utf-8"); %>
<main id="main">

	<!-- 좌석선택 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container-fluid">
				<div class="row justify-content-center">
					<!-- form 시작 -->
					<div class="col-xl-10" style="padding: 40px 0;">
						<div class="col-xl-12" style="padding: 10px;display: flex;width: 100%;">
							<div class="reservation-select-number-seat">
								<div style="display: flex;align-items: center;color: #404040;margin-left: 30px;font-size: 1.5rem;font-weight: 600;align-content: center;">
									관람인원선택
								</div>
								<div style="display:flex;">
									<div class="reservation-select-number">
										<a class="reservation-select-number number">성인</a>
										<div class="reservation-select-number-table">
											<table>
												<tr>
													<td><i class="bi bi-plus-lg" onclick="plusAdult()"></i></td>
													<td><span id="adult">0</span></td>
													<td><i class="bi bi-dash-lg" onclick="minusAdult()"></i></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="reservation-select-number">
										<a class="reservation-select-number number">청소년</a>
										<div class="reservation-select-number-table">
											<table>
												<tr>
													<td><i class="bi bi-plus-lg" onclick="plusTeen()"></i></td>
													<td><span id="teen">0</span></td>
													<td><i class="bi bi-dash-lg" onclick="minusTeen()"></i></td>
												</tr>
											</table>
										</div>
									</div>
									<div class="reservation-select-number">
										<a class="reservation-select-number number">우대</a>
										<div class="reservation-select-number-table">
											<table>
												<tr>
													<td><i class="bi bi-plus-lg" onclick="plusHandicap()"></i></td>
													<td><span id="handicap">0</span></td>
													<td><i class="bi bi-dash-lg" onclick="minusHandicap()"></i></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div style="display: flex;">
							<!-- 좌석 선택 -->
							<div class="col-xl-9" style="padding: 20px 10px 20px 10px;display: flex;flex-direction: column;align-items: center;">
								<div class="reservation-screen-seat">
									<div class="reservation-screen">SCREEN</div>
									<div class="reservation-seat-list">
										<c:set var="entireSeats" value="150"/>
										<div style="display: flex; flex-flow: column;">
											<c:forEach var="seatColumn" items="A,B,C,D,E,F,G,H,I,J">
											
												<div style="display: flex;">
												
												
													<i id="seat" class="bi bi-square" style="margin-right: 25px; cursor: default;">
														<a class="seatNumber">${seatColumn}</a>
													</i>
													
													<c:forEach var="seatRow" begin="1" end="15">
													<c:set var="check" value="0"/>
														
														<c:forEach var="reservation" items="${reservationList}" >
															<c:if test="${reservation.seat_number eq seatColumn && reservation.seat_number2 eq seatRow}">
																<i id="occupiedSeat" class="bi bi-square-fill" style="color: #CCCCCC;">
																<a class="seatNumber">${seatRow}</a>
																</i>
																<c:set var="check" value="1"/>
															</c:if>
														</c:forEach>
														
														<c:if test="${check != 1}">
														<i id="seat" class="bi bi-square-fill" style="color: #747474;">
															<a class="seatNumber">${seatRow}</a>
														</i>
														</c:if>
														
														
													</c:forEach>
													<!-- 좌석에 커서 대거나, 클릭하면 color: #503396로 변화 -->
													<!-- 예약완료/선택불가 좌석은 <i class="bi bi-x-square-fill" style="color: #CCCCCC"></i>로 설정 -->
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<!-- 선택 정보 조회 -->
							<div class="col-xl-3" style="padding: 20px 10px 20px 10px;">
								<div class="" style="padding: 20px 10px 20px 10px; background-color: #ffffff; border-radius: 5px 5px 0 0;">
									<!-- 상영 등급, 제목 -->
									<div class="rreservation-ticketeservation-ticket-title">
										<c:if test="${screenBean.rating eq '18세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/18_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if test="${screenBean.rating eq '15세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if test="${screenBean.rating eq '12세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png"
												width="23px" height="23px">
										</c:if>
										<c:if
											test="${screenBean.rating ne '18세관람가' &&  screenBean.rating ne '12세관람가' && screenBean.rating ne '15세관람가'}">
											<img
												src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png"
												width="23px" height="23px">
										</c:if>
										<p class="tit"><b>${screenBean.movie_title}</b></p>
									</div>
									<hr style="border: 1px solid #7F7F7F">
									<!-- 영화관, 상영관, 날짜, 시간, 포스터 -->
									<div class="reservation-ticket-theater">
										<div style="width: 50%;">
											<p class="tit">${sArea}</p>
											<p class="tit">${screenBean.screen_name}</p>
											<p class="tit">${day}</p>
											<p class="tit">${screenBean.screen_time } ~
															<span>
																<c:set var="startTime_1" value="${screenBean.time}"/>
																	<c:if test="${fn:length(screenBean.time) eq 2}">
																<c:set var="startTime_1" value="${screenBean.time}"/>
																	</c:if>
																<fmt:parseNumber var="startTime_2" value="${(startTime_1 * (1000*60*60)) + (screenBean.runtime * (1000*60))}" integerOnly="true" />
																
																<fmt:parseNumber var="hh" value="${(startTime_2  / (1000*60)) / 60 }" integerOnly="true" /> 
																<fmt:parseNumber var="mm" value="${(startTime_2  / (1000*60)) % 60 }" integerOnly="true" />
																${hh}:<c:if test="${mm < 10}">0</c:if>${mm}
															</span>
											</p>
										</div>
										<div style="width: 50%; text-align: end;">
											<img src="${screenBean.poster}" style="width: 60%; text-align: end; padding-right: 5px;">
										</div>
									</div>
									<hr style="border: 1px solid #7F7F7F">
									<!-- 좌석 선택 정보 -->
									<div class="reservation-ticket-seat">
										<div style="width: 50%; border: 1px solid #CCCCCC; border-radius: 5px 0 0 5px; padding: 5px;">
											<div style="margin-top: 5px; backgoround-color:#ffffff"></div>
											<p class="tit"><i class="bi bi-square-fill" id="selectedSeat" style=" justify-content: unset; display:unset;"></i><span>&nbsp;선택</span></p>
											<div style="margin-top: 5px;"></div>
											<p class="tit"><i class="bi bi-x-square-fill" style="border-radius:5px;color:#CCCCCC; margin-left: 5px;"></i>&nbsp;&nbsp;선택불가</p>
											<p class="tit"><i class="bi bi-square-fill" id="seat" style=" justify-content: unset; display:unset;"></i><span>&nbsp;선택가능</span></p>
										</div>
										<div style="width: 50%; text-align: center; border: 1px solid #CCCCCC; border-radius: 0 5px 5px 0; border-left: 0; padding: 5px;">
											<p class="tit" style="margin: 0;">선택좌석</p>
											<hr style="width: 70%; border: 1px solid #7F7F7F; margin: 0 auto; margin-top: 5px; margin-bottom: 5px;">
											<div style="margin: 0; padding-top: 15px;">
												<p class="tit" style="margin: 0;display: flex;justify-content: center;align-items: center;">
													<font style="font-size:1.3rem;">
														
													<span id="selec">0</span></font>개
												</p>
											</div>
										</div>
									</div>
									<div class="reservation-ticket-price">
										<div class="reservation-price">최종결제금액</div>
										<div class="reservation-price"><a class="reservation-price-bold">
											
										<span id="price"></span></a>원</div>
									</div>
								</div>
								<div class="reservation-go-pay">
									<div>
										<input type="button" class="reservation-go-pay-btn" value="결제하기" style="float: left;
    width: 50%;margin: 5px;" onClick="submitSeatnum()">
									</div>
									<div>
										<input type="button" class="reservation-go-pay-btn" value="취소하기" style="margin: 5px;" onClick="cancelSeat()">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- form 종료 -->
					<!-- 결제페이지 안만들면 alert로 결제하시겠습니까? 물어보고 -->
					<!-- 취소 -> 메인으로 돌아가기, 확인 -> 결제가 완료됐습니다 페이지로 -->				
				</div>
			</div>
		</section>
</main>
	<script>
alert("좌석은 최대 4개까지 예약 할 수 있습니다.");
var seatnum = [];
var selec = 0;
var people = 0;
var adults = 0;
var teens = 0;
var price = 0;
var handicaps = 0;


document.addEventListener('DOMContentLoaded', () =>{



const seatContainer = document.querySelector('.reservation-screen-seat');




// 선택한 좌석수 텍스트 변경해주기

function countSeat(){
    const selectedSeatCount = document.querySelectorAll('.selectedSeat').length;

    
}


//좌석 클릭했을때

seatContainer.addEventListener('click', (e) => {
	//alert(e.target.className);
	//alert(e.target.id);
	//alert(e.target.text);
	//alert(e.target.id)
    if(e.target.id === 'seat' && selec < people && e.target.className === 'bi bi-square-fill'){
        e.target.id = 'selectedSeat';
        var sCol = e.target.children[0].textContent;
        //alert(e.target.children[0].textContent);
        var sRow = e.target.parentElement.children[0].children[0].textContent;
        //alert(e.target.parentElement.children[0].children[0].textContent);
        seat = sRow + sCol;
        //alert(seat);
        seatnum.push(seat);
        selec = selec +1;
        $("#selec").text(selec);
    } else if(e.target.id === 'selectedSeat'){
        e.target.id = 'seat';
        
        seatnum.push(seat)
        for(var i = 0; i < seatnum.length; i++) {
        	  if(seatnum[i] === seat)  {
        		  seatnum.splice(i, 1);
        	    i--;
        	  }
        	}
        selec = selec -1;
        $("#selec").text(selec);
    }
    countSeat();
   
})




})

 function plusAdult() {
	
	console.log(document.getElementById("adult"));
	adults = $("#adult").text();
	adults = Number(adults);
	
	if(checkOver() && adults != 4){
	adults = adults + 1;
	people = people + 1;
	price = price + Number(${screenBean.ticket_price});
	
	$("#adult").text(adults);
	$("#price").text(price);
	}
}

function minusAdult() {
	adults = $("#adult").text();
	adults = Number(adults);
	if(checkLow() && adults != 0) {
	adults = adults - 1;
	people = people - 1;
	price = price - Number(${screenBean.ticket_price});
	}
	$("#adult").text(adults);
	$("#price").text(price);
}

function plusTeen() {
	teens = $("#teen").text();
	teens = Number(teens);
	if(checkOver() && teens != 4){
	teens = teens + 1;
	people = people +1;
	price = price + Number(${screenBean.ticket_price})*0.8;
	}
	$("#teen").text(teens);
	$("#price").text(price);
}
function minusTeen() {
	teens = $("#teen").text();
	teens = Number(teens);
	if(checkLow() && teens != 0) {
	teens = teens - 1;
	people = people -1;
	price = price - Number(${screenBean.ticket_price})*0.8;
	}
	$("#teen").text(teens);
	$("#price").text(price);
}

function plusHandicap() {
	
	handicaps = $("#handicap").text();
	handicaps = Number(handicaps);
	if(checkOver() && handicaps != 4){
	handicaps = handicaps + 1;
	people = people + 1;
	price = price + Number(${screenBean.ticket_price})*0.5;
	}
	$("#handicap").text(handicaps);
	$("#price").text(price);
	
}
function minusHandicap() {
	handicaps = $("#handicap").text();
	handicaps = Number(handicaps);
	if(checkLow() && handicaps != 0) {
	handicaps = handicaps - 1;
	people = people - 1;
	price = price - Number(${screenBean.ticket_price})*0.5;
	}
	$("#handicap").text(handicaps);
	$("#price").text(price);
}

function checkOver() {
	if(people == 4){
		alert("최대 4명까지 선택 가능합니다.");
		return false;
	}
	return true;
}
function checkLow() {
	if(people == 0){
		return false;
	}
	if(people == selec){
		alert("이미 좌석이 선택되었습니다.");
		return false;
	}
	return true;
} 
function submitSeatnum() {
	var area = encodeURIComponent('${sArea}',"UTF-8");
	var day = encodeURIComponent('${day}',"UTF-8");
	if(people == 0){
		alert("최소 1명이라도 좌석을 선택해주세요")
	}else{
	 location.href = "screenReservationInsert.mv?seatnum="+ seatnum + "&screen_time=" + '${screenBean.screen_time}'
			 + "&adults=" + adults
			 + "&teens=" + teens
			 + "&sArea=" + area			 
			 + "&day=" + day
			 + "&time=" + '${screenBean.time}'
			 + "&handicaps=" + handicaps;
	}
	
}
function cancelSeat() {
	 if (confirm("취소하시겠습니까?")) {

		 location.href = document.referrer;

		  }
}

</script>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>