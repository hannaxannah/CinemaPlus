<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<style>
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

	<!-- 회원 상세 정보 요약 -->
				<div class="card info-card customers-card" id="reservation-tab-pane" role="tabpanel" aria-labelledby="reservation-tab" tabindex="0" style=" flex-flow: column; margin-top: 22px; background-color: #6B39EA;">
					<div style="width:850px; height: 40px; background-color: #6B39EA; margin-top: 10px;">
					<a style="font-size: 19px; color: #ffffff; font-style: oblique; ">&nbsp;&nbsp;한줄평 작성하기</a>
					</div>
					
					<div style="width: 850px; height: 503px;  background-color:#FFFFFF;">
					<c:forEach var="List" items="${List}" varStatus="status">
						<strong><p style="font-size: 28px; text-align: center; padding-top: 10px;" >"${List.movie_title}"</p></strong>
						</c:forEach>
						<p style="font-size: 20px; text-align: center;" >영화 어떠셨나요?</p>
						<textarea rows="12" cols="96" style="margin: 20px; "  placeholder="관람평을 입력해주세요."﻿﻿ ></textarea>
						
						<a href="writeReview.mp?member_id=${loginInfo.member_id}" style="background-color: #EBE4FC; padding:5px; margin-left: 380px;">등록</a>
						<a href="myMovieRecord.mp?member_id=${loginInfo.member_id}" style="background-color: #EBE4FC; padding:5px;">취소</a>
						
					</div>
			</div>
			

</section>

</main>
<!-- End #main -->
<%@ include file="../main/mainFooter.jsp"%>