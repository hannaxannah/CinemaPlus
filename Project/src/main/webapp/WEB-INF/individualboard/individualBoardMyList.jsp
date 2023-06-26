<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../mypage/mypageSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

	    
	
<style>
	b{
	font-size: small;
	}	
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
	<table width="850px;" style="text-align: center; margin-top: 80px;">
		<div align="center" style="margin-top: 50px">
			<font style="font-size: x-large;">나의 문의내역</font>
		</div>
		<tr>
			<th>
				<p align="left" style="margin-left: 30px;">
					<font style="font-size: small;">- 1:1문의를 통해 문의한 내역을 확인 하실 수 있습니다.</font>	
				</p>
			</th>
		</tr>
	</table><br>
	
			
	<table class="table" style="width: 800px">
			<div align="right" style="margin-right: 70px; margin-bottom: 40px">	
				<input type="button" onclick="location.href='insert.in'" value="1:1문의">
			</div>
		<tr align="center">
			<th width="70">번호</th>
			<th>유형</th>
			<th>제목</th>
			<th>답변상태</th>
			<th>등록일</th>
			<th>정보확인</th>
		</tr>
		<c:if test="${fn:length(lists) == 0}">
			<tr>
				<td colspan="6" align="center">문의 내역이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="board" items="${lists}">
			<tr>
				<td align="center">${board.movie_code}</td>
				<td align="center">${board.question_type}</td>
				<td style="text-align: left;">
				<a <%-- href="detail.in?moviecode=${board.movie_code}&pageNumber=${pageInfo.pageNumber}" --%>>${board.subject}</a>
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
				<fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd HH:ss"/>
				</td>
				<td align="center">
				<a href="detail.in?moviecode=${board.movie_code }&pageNumber=1">상세보기</a>
				</td>
			</tr>
		</c:forEach>	
</table>

</div>
		</div>
	</div>
</div>
	
<div style="margin-bottom: 120px" align="center">
	${pageInfo.pagingHtml}
</div>
	
	
</div>
</div>
</div>
</section>

</main>
	
<%@ include file="../main/mainFooter.jsp"%>




	