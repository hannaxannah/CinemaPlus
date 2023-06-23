<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 영화관 navbar START -->
<nav id="theaterNavbar" class="navbar">
	<ul>
		<c:forEach var="areaName" items="서울, 경기, 인천, 강원, 대전/충청, 대구, 부산/울산, 경상, 광주/전라/제주">
			<li class="dropdown">
				<a href="#"><span>${areaName}</span></a>
				<ul class="theater-area-branch">
					<c:forEach var="seoulBranch" items="${seoul}">
						<li class="dropdown"><a href="#">${seoulBranch}</a></li>
					</c:forEach>
				</ul></li>
		</c:forEach>
	</ul>
</nav>
<!-- 영화관 navbar END -->