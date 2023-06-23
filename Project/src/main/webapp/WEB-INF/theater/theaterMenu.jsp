<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 영화관 navbar START -->
<nav id="theaterNavbar" class="navbar">
	<ul>
		<c:forEach var="areaName" items="${area}">
			<li class="dropdown">
				<a href="#"><span>${areaName}</span></a>
				<ul class="theater-area-branch">
					<c:if test="${areaName == '서울'}">
						<c:forEach var="Branch" items="${seoul}">
							<li class="dropdown"><a href="branch.th?branch=${branch}">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '경기'}">
						<c:forEach var="Branch" items="${gyeonggi}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '인천'}">
						<c:forEach var="Branch" items="${incheon}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '강원'}">
						<c:forEach var="Branch" items="${kangwon}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '대전/충청'}">
						<c:forEach var="Branch" items="${daejeon}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '대구'}">
						<c:forEach var="Branch" items="${daegu}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '부산/울산'}">
						<c:forEach var="Branch" items="${busan}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '경상'}">
						<c:forEach var="Branch" items="${gyeongsang}">
							<li class="dropdown"><a href="#">${Branch}</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${areaName == '광주/전라/제주'}">
						<c:forEach var="seoulBranch" items="${gwangju}">
							<li class="dropdown"><a href="#">${seoulBranch}</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</li>
		</c:forEach>
	</ul>
</nav>
<!-- 영화관 navbar END -->