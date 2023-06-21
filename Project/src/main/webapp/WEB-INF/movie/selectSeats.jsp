<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>좌석 선택</h1>

<%@ include file="../common/common.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery.js"></script>
<style>
body {
	font-family: 'Lato', sans-serif;
	background-color: #242333;
	color: #fff;
	box-sizing: border-box;
}

#container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 800px;
}

.movieContainer {
	margin: 20px 0px;
}

.showcase {
	background-color: #777;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	display: flex;
	justify-content: center;
	margin: 16px 0;
	padding: 5px 10px;
}

.movieContainer select {
	margin: 10px;
	padding: 5px 15px 5px 15px;
	border-radius: 7px;
	appearance: none;
	border: 0;
}

.movieContainer select option {
	text-align: left;
}

li {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 10px;
}

.small {
	color: #777;
	margin-left: 2px;
}

.showcase .seat:hover {
	cursor: default;
	scale: 1;
}

.showcase .selectedSeat:hover {
	cursor: default;
	scale: 1;
}

.screen {
	background-color: #fff;
	margin: 25px;
	padding: 5px;
	width: 180px;
	height: 100px;
	transform: rotateX(-45deg);
	box-shadow: 0 3px 10px rgb(255 255 255/ 70%);
}

.seat {
	background-color: #444451;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: pointer;
}

.availableSeat {
	background-color: #444451;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: default;
}

.selectedSeatIcon {
	background-color: #6feaf6;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: default;
}

.seat:hover {
	scale: 1.2;
}

.selectedSeat:hover {
	scale: 1.2;
}

.selectedSeat:nth-of-type(3) {
	margin-right: 18px;
}

.selectedSeat:nth-of-type(8) {
	margin-left: 18px;
}

.seat:nth-of-type(3) {
	margin-right: 18px;
}

.seat:nth-of-type(8) {
	margin-left: 18px;
}

.occupiedSeat:nth-of-type(3) {
	margin-right: 18px;
}

.occupiedSeat:nth-of-type(8) {
	margin-left: 18px;
}

.selectedSeat {
	background-color: #6feaf6;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	cursor: pointer;
}

.occupiedSeat {
	background-color: #fff;
	width: 15px;
	height: 12px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.row {
	display: flex;
}

.text {
	margin-top: 30px;
	padding: 20px;
}

#count {
	color: #6feaf6;
}

#costs {
	color: #6feaf6;
}
</style>

<head>
<title>Movie Booking</title>
</head>
<body>
	<div id="container">
		<div class="movieContainer">
			<label for="movie"> Pick a Movie : </label>
		</div>
		<ul class="showcase">
			<li>
				<div class="availableSeat"></div> <small class="small">선택가능한
					자리</small>
			</li>
			<li>
				<div class="selectedSeatIcon"></div> <small class="small">선택한
					자리</small>
			</li>
			<li>
				<div class="occupiedSeat"></div> <small class="small">예약된 자리</small>
			</li>
		</ul>

		<div class="seatContainer">
			<div class="screen"></div>
			<div class="row">
				<c:forEach var="i" begin="1" end="${screenBean.seat_count}">
					<c:forEach var="reservation" items="${reservationList}">
						<c:if test="${i == reservation.seat_number2}">
							<span class="occupiedSeat" id="${i}"></span>
							<c:set var="check" value="1" />
						</c:if>

					</c:forEach>

					<c:if test="${check != 1}">
						<span class="seat" id="${i}"></span>
					</c:if>
					<c:set var="check" value="0" />
					<c:if test="${i%10 == 0}">
			</div>
			<div class="row">
				</c:if>
				</c:forEach>
			</div>
		</div>

		<p class="text">
			선택한 자리 개수 <span id="count">0</span>
		</p>
		<input type="button" value="예매하기" onclick="submitSeatnum()">


	</div>
	<script>
alert("좌석은 최대 4개까지 예약 할 수 있습니다.");
var seatnum = [];
var selec = 0;
document.addEventListener('DOMContentLoaded', () =>{



const seatContainer = document.querySelector('.seatContainer');

const movie = document.getElementById('movie'); // 선택할 영화

let count = document.querySelector('#count'); // 인원수



// 선택한 좌석수 텍스트 변경해주기

function countSeat(){
    const selectedSeatCount = document.querySelectorAll('.selectedSeat').length;

    count.textContent = selectedSeatCount;
    
}


//좌석 클릭했을때

seatContainer.addEventListener('click', (e) => {
    if(e.target.className === 'seat' && selec <4){
        e.target.className = 'selectedSeat';
       
        seatnum.push(e.target.id)
        selec = selec +1;
    } else if(e.target.className === 'selectedSeat'){
        e.target.className = 'seat';
        
        for(var i = 0; i < seatnum.length; i++) {
        	  if(seatnum[i] === e.target.id)  {
        		  seatnum.splice(i, 1);
        	    i--;
        	  }
        	}
        selec = selec -1;
    }
    countSeat();
   
})




})
function submitSeatnum() {
	 location.href = "screenReservationInsert.mv?seatnum="+ seatnum + "&screen_time=" + '${screenBean.screen_time}';
	
}

</script>
</body>

</html>