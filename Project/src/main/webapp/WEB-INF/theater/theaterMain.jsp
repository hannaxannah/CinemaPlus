<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>
<%
	String[] seoul = {"강남",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] gyeonggi = {"경기",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] incheon = {"인천",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] kangwon = {"강원",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] daejeon = {"대전",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] daegu = {"대구",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] busan = {"부산",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] gyeongsang = {"경상",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] gwangju = {"광주",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
	String[] jeju = {"제주",	"강변","건대입구","구로","대학로","동대문","등촌","명동","미아","방학","불광","상봉","성신여대입구","송파"};
%>
<!-- 영화관 -->
<div class="container-theater">
	<!-- 전체 영화관 -->
	<div class="theater">전체 영화관</div>
	<!-- 지역 메뉴 -->
	<div class="container-theaterMenu">
		<nav class="theaterMenu">
			<ul class="theaterAreaMenu">
				<c:forEach var="area" items="서울, 경기, 인천, 강원, 대전/충청, 대구, 부산/울산, 경상, 광주/전라/제주">
					<li class="theaterArea">
						<!-- 지역 -->
						<a class="area" id="${area}" href="">${area}</a>
							<div class="container-theaterSubMenu">
								<nav class="theaterSubMenu">
									<ul class="theaterBranchMenu">
										<c:forEach var="s" items="<%=seoul%>">
											<li class="theaterbranch">
												<!-- 지점 -->
												<a class="branch" id="${s}" href="">${s}</a>
											</li>
										</c:forEach>
									</ul>
								</nav>
							</div>
						</li>
				</c:forEach>
			</ul>
		</nav>
	</div>
	<div class="container-theaterInfo">
		<div class="theaterName">
			강남점
		</div>
		<div class="theaterInfo">
			<b>주소</b> 서울특별시 강남구 강남대로 438 (역삼동)<br>
			<br>
			<b>교통안내</b><br>
			# 지하철<br>
			- 2호선 강남역 11번 출구 도보 5분<br>
			- 9호선 신논현역 5번 출구 도보 5분<br>
			- 신분당선 신논현역 6번 출구 도보 3분<br>
			<div style="padding-bottom: 10px"></div>
			# 버스<br>
			- 간선버스 : 140, 144, 145, 146, 360, 400, 402, 420, 421, 440, 441, 452, 470, 542, 640, 643, 741 <br>
			  심야) N13, N31, N37, N75<br>
			- 지선버스 : 3412, 4312, 8146, 8541<br>
			- 광역버스 : 1005, 1100, 1101, 1151, 1241, 1311, 1311B, 1550, 1550-1, 1551, 1551B, 1552, 1560, 1570,
			 1700, 2000, 2000-1, 3008, 3030, 3100, 3401, 3600, 4403, 5001, 5001-1, 5002A, 5002B, 5003A, 5003B, 
			 5006, 5100, 5200, 5300, 6001, 6002, 6002-1, 6004, 6427, 6600, 7007, 8001, 8502, 9004, 9202, 9303, 
			 9400, 9404, 9408, 9409, 9500, 9501, 9600, 9700, 9711, 9800, 9802, G5100,G7426, M4403, M4434, M4448, 
			 M4449, M5422, M5438, M6427, M7412, P9201, 이음2<br>
			  심야) 1101N, 3100N<br>
			- 마을버스 : 서초03<br>
			- 공항버스 : 6009<br>
		</div>
	</div>
	<div class="container-showtime">
	상영시간표
	</div>



</div>


<%@ include file="../main/mainFooter.jsp"%>