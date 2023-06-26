<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../mypage/mypageSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

	
<style>

table{
margin: auto;
}
	body {
	
}

.orderList {
	cursor: pointer;
	text-align: center;
}

.orderList:hover {
	transform: scale(1.1);
}

.panel-default {
	border-color: #ddd;
}

.panel-order .row {
	border-bottom: 1px solid #ccc;
}

.panel-order .row .col-md-1 {
	text-align: center;
	padding-top: 28px;
}

.panel-order .row .col-md-1 i {
	width: 50px;
	max-height: 50px;
}

.panel-order .row .row {
	border-bottom: 0;
}

.panel-order .row .col-md-11 {
	border-left: 1px solid #ccc;
}

.panel-order .row .row .col-md-12 {
	text-align: left;
	padding-top: 7px;
	padding-bottom: 7px;
}

.panel-order .row .row .col-md-12:last-child {
	font-size: 11px;
	color: #555;
	background: #efefef;
}

.panel-order .btn-group {
	margin: 0px;
	padding: 0px;
}

.panel-order .panel-body {
	padding-top: 0px;
	padding-bottom: 0px;
}

.panel-order .panel-deading {
	margin-bottom: 0;
}

a {
	color: #000000;
	text-decoration: none;
}

.row .row {
	text-align: left;
}

.panel-order .panel-heading {
	color: #333;
	background-color: #f5f5f5;
	border-color: #ddd;
	padding: 10px 15px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.label-danger {
	background-color: #5cb85c;
}

.label {
	display: inline;
	padding: .2em .6em .3em;
	font-size: 75%;
	font-weight: 700;
	line-height: 1;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
}
</style>
	
	
<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
	<table width="820px;" style="text-align: center; margin-top: 80px;">
		<div align="center" style="margin-top: 50px">
			<font style="font-size: x-large;">전체 문의내역</font>
		</div>
	</table>

	<!-- 검색 설정은 내부브라우저 말고 외부브라우저에서 실행 -->
	<form action="list.in" method="get" style="margin-left: 460px"  width="70%">
		<select name="whatColumn" class="my-reservation-search-date">
			<option value="">전체</option>
			<option value="subject">제목</option>
			<option value="customer_id">계정ID</option>
		</select>
		<input type="text" name="keyword" class="my-reservation-search-date">
		<input type="submit" value="검색" class="my-search" >
	</form>
	
	
	<table width="850px;">
		<tr>
			<th align="left">
				<font style="font-size: small;">
				- 1:1문의를 통해 남기신 내역을 검색을 통해 확인 하실 수 있습니다.<br>
				- 접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.
				</font>
			</th>
		</tr>
		
	</table>
	
	
	
	<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="reservation-tab-pane"
					role="tabpanel" aria-labelledby="reservation-tab" tabindex="0"
					style="display: flex; flex-flow: column; padding-top: 20px;">
					<div style="width: 100%;">
						<div style="width: 100%; display: flex;">
	
	<table class="table" style="width: 850px;;">
	<tr>	
			<th>
			<font style="font-size: small; color: #B2CCFF;">전체 (${pageInfo.totalCount}건)</font>
			<input type="button" class="btn btn-outline-secondary" onclick="location.href='insert.in'" value="1:1문의">
			</th>	
	</tr>
		
		<tr>
			<th scope="col" width="7%">번호</th>
			<th scope="col" width="7%">계정ID</th>
			<th scope="col" width="20%">유형</th>
			<th scope="col" width="40%">제목</th>
			<th scope="col" width="10%">답변상태</th>
			<th scope="col" width="25%">등록일</th>
		</tr>
		
	<c:if test="${fn:length(inboardLists) == 0}">
		<tr>
			<td colspan="6" align="center">
				목록이 없습니다.
			</td>
		</tr>
	</c:if>
		
	<c:if test="${fn:length(inboardLists) != 0}">
		<c:forEach var="board" items="${inboardLists}">
			<tr>
				<td align="center">${board.movie_code}</td>
				<td align="center">${board.customer_id}</td>
				<td align="center">${board.question_type}</td>
				<td style="text-align: left;">
				<c:if test="${board.issecret == 'Y'}">
				<img width="15px;" height="15px;" alt="비밀글 이미지" src="<%=request.getContextPath()%>/resources/board_image/자물쇠아이콘.jpg">
				</c:if>
				<a href="detail.in?moviecode=${board.movie_code}&pageNumber=${pageInfo.pageNumber}">${board.subject}</a>
				</td>
				<td align="center">
					<c:if test="${empty board.individual_content}">
						미답변
					</c:if>
					<c:if test="${not empty board.individual_content}">
						답변완료
					</c:if>
				</td>
				<td align="center">
				<fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>


			</div>
		</div>
	</div>
</div>


<div class="row" style="margin-bottom: 50px;">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link">${pageInfo.pagingHtml}</a></li>
            </ul>
        </nav>
</div>
	
	
</div>
</div>
</div>
</section>

</main>



<%@include file="../main/mainFooter.jsp"%>



	