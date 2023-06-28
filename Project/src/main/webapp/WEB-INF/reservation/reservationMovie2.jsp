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
								<div class="container-title" style="border-right: 1px solid #FCFBFF;">
									영화관
								</div>
								<div class="reservation-theater-list" style="width: 100%;background: #fff;">
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
										
											
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
										
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
											 
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
											 
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
											 
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
											 
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
											 
											 <button class="button" id="open" onclick="change_btn(event)">
											 <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" width="23px" height="23px">
											 스파이더맨: 어크로스 더 유니버스</button>
											 
										<br>
									</div>
								</div>
							</div>
							<div class="col-xl-5" style="display: flex; flex-direction: column; padding: 0;">
								<div class="container-title" style="border-right: 1px solid #FCFBFF;">
									날짜/시간
								</div>
								<div class="container-dropend" id="btn-groupDropendArea" style="width: 100%">
									<div class="reservation-movie-date" style="flex-flow: row;">
										<c:forEach var="date" items="22<br>목, 23<br>금, 24<br>토, 25<br>일, 26<br>월, 27<br>화, 28<br>수">
										<div class="reservation-movie-date-item" >
											<input type="checkbox" value="${date}">
											${date}
										</div>
										</c:forEach>
									</div>
									<div class="reservation-movie-time">
										<div id="reservation-movie-time-btn" onClick="">
											<button class="timeButton" style="width:100px;" onclick="change_btn2(event)">
											16:15<br> <!-- 상영시간 -->
											10석/30석<br> <!-- 잔여석 -->
											2관 <!-- 상영관 -->
											</button>
										</div>
										<div id="reservation-movie-time-btn" onClick="">
											<button class="timeButton" style="width:100px;" onclick="change_btn2(event)">
											16:15<br> <!-- 상영시간 -->
											10석/30석<br> <!-- 잔여석 -->
											2관 <!-- 상영관 -->
											</button>
										</div>
										<div id="reservation-movie-time-btn" onClick="">
											<button class="timeButton" style="width:100px;" onclick="change_btn2(event)">
											16:15<br> <!-- 상영시간 -->
											10석/30석<br> <!-- 잔여석 -->
											2관 <!-- 상영관 -->
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-10" id="reservation-go-seat">
								<input type="button" value="인원 및 좌석 선택" onClick="location.href='selectSeat.rv'">;
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
var seatnum = [];
var selec = 0;
document.addEventListener('DOMContentLoaded', () =>{



const seatContainer = document.querySelector('.breadcrumbs');

const movie = document.getElementById('movie'); // 선택할 영화

let count = document.querySelector('#count'); // 인원수



// 선택한 좌석수 텍스트 변경해주기

function countSeat(){
    const selectedSeatCount = document.querySelectorAll('.selectedSeat').length;

    count.textContent = selectedSeatCount;
    
}


//좌석 클릭했을때

seatContainer.addEventListener('click', (e) => {
	//alert(e.target.text);
	//alert(e.target.value);
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

function selectMovie() {
	alert(1);
}


})
function submitSeatnum() {
	 location.href = "screenReservationInsert.mv?seatnum="+ seatnum + "&screen_time=" + '${screenBean.screen_time}';
	
}

function change_btn(e) {
	  var btns = document.querySelectorAll(".button");
	  btns.forEach(function (btn, i) {
	    if (e.currentTarget == btn) {
	      btn.classList.add("active");
	    } else {
	      btn.classList.remove("active");
	    }
	  });
	  console.log(e.currentTarget);
	}
	
function change_btn2(e) {
	  var btns2 = document.querySelectorAll(".timeButton");
	  btns2.forEach(function (btn, i) {
	    if (e.currentTarget == btn) {
	      btn.classList.add("active");
	    } else {
	      btn.classList.remove("active");
	    }
	  });
	  console.log(e.currentTarget);
	}
	
	

</script>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>