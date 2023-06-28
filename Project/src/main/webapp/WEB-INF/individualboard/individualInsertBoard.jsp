<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
individualInsertBoard.jsp<br>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../mypage/mypageSidebar.jsp"%>  

<style>
    .t_red {
        color: #f55500
    }

    .err {
        font-size: 8px;
        color: red;
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
    
    
    body{
    margin-top:20px;
    background:#f5f7fa;
}
.panel.panel-default {
    border-top-width: 3px;
}
.panel {
    box-shadow: 0 3px 1px -2px rgba(0,0,0,.14),0 2px 2px 0 rgba(0,0,0,.098),0 1px 5px 0 rgba(0,0,0,.084);
    border: 0;
    border-radius: 4px;
    margin-bottom: 16px;
}
.thumb96 {
    width: 96px!important;
    height: 96px!important;
}
.thumb48 {
    width: 48px!important;
    height: 48px!important;
}
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/board/insertBoard.js"></script>

<%
    String[] questionArr = {"영화정보문의", "회원 및 포인트문의", "예매/결제문의", "이벤트문의", "일반문의", "제안/건의"};
%>

<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">
	
<font style="margin: auto; font-size: large;">문의글 작성</font><hr width="90%">
<p align="left">
    <b>고객님의 문의에 답변하는 직원은 <font color="red">고객 여러분의 가족 중 한 사람일 수 있습니다.</font></b><br>
    고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br>
    관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br><br>

    문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.<br><br><br>
</p>

<form name="boardForm" action="insert.in" method="POST" enctype="multipart/form-data" >
   <table class="myMemberInfo">
	  <div class="form-group">
    <label for="exampleInputEmail1">문의선택<span class="t_red">*</span></label>
    <input type="text" class="form-control" id="exampleInputEmail1"  name="select_type" aria-describedby="emailHelp" placeholder="Enter email" value="고객센터 문의" readonly>
  </div><br><br>
			

		<div class="form-group">
    <label for="exampleFormControlSelect1">문의유형선택<span class="t_red">*</span></label>
     <select id="question_type"  class="form-control" name="question_type">
      <option value="">문의유형선택</option>
           <c:forEach var="question_type" items="<%=questionArr%>">
              <option value="${question_type}"
                <c:if test="${board.question_type.contains(question_type)}">selected</c:if>>${question_type}</option>
          </c:forEach>
    </select>
    <form:errors cssClass="err" path="question_type"/>
  </div><br><br>

   <div class="form-group col-md-6">
      <label for="inputPassword4">이름<span class="t_red">*</span></label>
      	<input type="text" class="form-control" name="member_name" value="${name}" id="inputPassword4" readonly>
    </div><br>
        
        
     <div class="form-row">
    	<div class="form-group col-md-6">
      	<label for="inputEmail4">이메일<span class="t_red">*</span></label>
     		 <input type="email" class="form-control" name="email" value="${email}" id="inputEmail4" readonly>
    </div><br>
    <div class="form-group col-md-6">
      <label for="inputPassword4">연락처<span class="t_red">*</span></label>
      	<input type="text" class="form-control" name="telnum" value="${phone}" id="inputPassword4" readonly>
    </div>
  </div><br><br>
        
        
        <div class="form-group">
    <label for="exampleInputEmail1">제목<span class="t_red">*</span></label>
    <input type="text" class="form-control" id="subject"  name="subject" aria-describedby="emailHelp" value="${board.subject}">
  		<form:errors cssClass="err" path="subject"/>
  </div><br>
        
          <div class="form-group">
    <label for="exampleFormControlTextarea1">내용<span class="t_red">*</span></label>
    <textarea class="form-control" style="resize: none; width: 100%; height: 6.25em;" id="content" name="content"  placeholder="- 문의내용에 개인정보(이름,연락처,카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.
- 회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다.">${board.content}</textarea>
 		 </div><br>
        
        
        <div class="mb-3">
  <label for="formFile" class="form-label">사진첨부<span class="t_red">*</span></label>
  <input class="form-control" type="file" name="upload" id="upload" value="파일선택">
	<span><font style="font-size: small;"> * 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</font></span>
	<form:errors cssClass="err" path="image"/>
	</div><br>
        
        
   <div class="mb-3">     
  <label for="formCheck" class="form-label">옵션(선택사항)</label>
 <div class="form-check">
  <input class="form-check-input" type="checkbox" id="issecret" name="issecret" value="Y">
  <label class="form-check-label" for="flexCheckDefault">
    <span style="font-size: unset;">비밀글 설정</span>
  </label>
</div>
</div>        
        
        <div class="form-group" align="center">
       <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" style="background-color:#EBE4FC; color:#6b39ea; border-color:#EBE4FC;" value="등록">
                <input type="reset" class="btn btn-primary" style="background-color:#EBE4FC; color:#6b39ea; border-color:#EBE4FC;" value="취소">
		</div>        
		</div>
        
        
    </table>
</form><br><br>


</div>
</div>
</div>
</section>

</main>


<%@ include file="../main/mainFooter.jsp"%>








