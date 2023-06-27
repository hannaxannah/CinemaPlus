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
#red{
	color: red !important;
}
</style>
	
<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
	<table width="850px;" style="text-align: center; margin-top: 80px;">
		<div align="center" style="margin-top: 50px">
			<font style="font-size: x-large;">자주 묻는 질문</font>
		</div>
	</table>
	<!-- 검색 설정은 내부브라우저 말고 외부브라우저에서 실행 -->
	<form action="list.bd" method="get" style="margin-left: 485px">
		<select name="whatColumn"  class="my-reservation-search-date" >
			<option value="">전체</option>
			<option value="classification">분류</option>
			<option value="question">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="keyword" class="my-reservation-search-date">
		<input type="submit" class="my-search" value="검색">
	</form>
	
	
	
	<table border="0" width="820px">
		<tr>
			<th align="left">
			<p>
				<font style="font-size: small; border: medium;">FAQ에서 자주하는 질문을 모았습니다.<br>궁금하신 내용에 대해 검색해 보세요.</font>			
			</p><br>
				<span style="color: #B2CCFF;"><font style="font-size: small;">전체 (${pageInfo.totalCount}건)</font></span>
			</th>
			<div style="margin-top: 30px; margin-right: 30px" align="right">
				<a href="number.bd">번호 순</a>&nbsp;&nbsp;&nbsp;
				<a href="date.bd">작성일 순</a>&nbsp;&nbsp;&nbsp;
				<a href="hits.bd">조회수 순</a>&nbsp;&nbsp;&nbsp;
			</div>
		</tr>
	</table>
	
	
	<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="reservation-tab-pane"
					role="tabpanel" aria-labelledby="reservation-tab" tabindex="0"
					style="display: flex; flex-flow: column; padding-top: 20px;">
					<div style="width: 100%;">
						<div style="width: 100%; display: flex;">
	<table class="table" style="width: 820px">
		<thead>
			<tr>
			<th scope="col" width="10%">번호</th>
			<th scope="col" width="15%">분류</th>
			<th scope="col" width="50%">제목</th>
			<th scope="col" width="15%">작성일</th>
			<th scope="col" width="10%">조회수</th>
		</tr>
		</thead>
	<c:if test="${fn:length(boardLists) == 0}">
		<tr>
			<td colspan="6" align="center">
				목록이 없습니다.
			</td>
		</tr>		
	</c:if>
		
<c:if test="${fn:length(boardLists) != 0}">
	<c:forEach var="board" items="${boardLists}">
		<tr>
			<td align="center">${board.movie_num}</td>
			<td align="center">${board.classification}</td>
			<td style="text-align: left;">
			<a href="detail.bd?movienum=${board.movie_num }&pageNumber=${pageInfo.pageNumber}">${board.question}</a>
			</td>
			<td align="center"><fmt:formatDate value="${board.qdate}" type="date" pattern="yyyy-MM-dd"/> </td>
			<td align="center">${board.hits}</td>
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
            	
                <li class="page-item" style = "display:flex;">
                
               <div class="row" style="margin-bottom: 50px;">
							<nav id="pagination" aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<li class="page-item" style="display: flex;">${pageInfo.pagingHtml}</li>
								</ul>
							</nav>
						</div>
					</li>
            </ul>
        </nav>
</div>
	
	
</div>
</div>
</div>
</section>

</main>
	
<%@ include file="../main/mainFooter.jsp"%>


