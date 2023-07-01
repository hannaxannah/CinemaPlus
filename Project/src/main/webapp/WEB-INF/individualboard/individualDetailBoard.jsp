<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../mypage/mypageSidebar.jsp"%>

<style type="text/css">
	body, table{
		text-align: center;
	}
	table{
		margin: auto;
		width: 630px;
		height: 50px;
	}
	td{
		width: 30%;
		height: 30px;
	}
	th{
		width: 15%;
		height: 40px;
	}
	
	.meButton {
	box-shadow:inset 0px 1px 0px 0px #f7c5c0;
	background:linear-gradient(to bottom, #fc8d83 5%, #e4685d 100%);
	background-color:#fc8d83;
	border-radius:6px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.meButton:hover {
	background:linear-gradient(to bottom, #e4685d 5%, #fc8d83 100%);
	background-color:#e4685d;
}
.meButton:active {
	position:relative;
	top:1px;
}
	
  
  .myButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color:#ededed;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color:#dfdfdf;
}
.myButton:active {
	position:relative;
	top:1px;
}


.updateButton {
	box-shadow:inset 0px 1px 0px 0px #fce2c1;
	background:linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
	background-color:#ffc477;
	border-radius:6px;
	border:1px solid #eeb44f;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #cc9f52;
}
.updateButton:hover {
	background:linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
	background-color:#fb9e25;
}
.updateButton:active {
	position:relative;
	top:1px;
}
  
  
  .search-form {
  width: 80%;
  margin: 0 auto;
  margin-top: 1rem;
}

.search-form input {
  height: 100%;
  background: transparent;
  border: 0;
  display: block;
  width: 100%;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select {
  background: transparent;
  border: 0;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select:focus {
  border: 0;
}

.search-form button {
  height: 100%;
  width: 100%;
  font-size: 1rem;
}

.search-form button svg {
  width: 24px;
  height: 24px;
}

.card-margin {
  margin-bottom: 1.875rem;
}

@media (min-width: 992px) {
  .col-lg-2 {
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
  }
}

.card {
  border: 0;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #ffffff;
  background-clip: border-box;
  border: 1px solid #e6e4e9;
  border-radius: 8px;
}


.listButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.listButton:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.listButton:active {
	position:relative;
	top:1px;
}

    </style>


<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/board/detailBoard.js"></script>


<input type="hidden" name="movie_code" id="movie_code" value="${board.movie_code}">

<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">
 <table class="table">
    <tr>
        <th class="first">번호</th>
        <th>${board.movie_code}</th>
        <th class="first">계정ID</th>
        <th>${board.customer_id}</th>
    </tr>
    <tr>
        <th class="first">문의유형</th>
        <th>${board.question_type}</th>
        <th class="first">작성일</th>
        <th>
           <fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd"/>
        </th>
    </tr>
    <tr>
        <th class="first">제목</th>
        <th colspan="3">${board.subject}</th>
    </tr>
    <tr>
        <th class="first">내용</th>
        <th colspan="3">
            <textarea rows="15" cols="80" style="resize: none;" readonly>${board.content}</textarea>
        </th>
    </tr>
    <tr>
        <th class="first">참고이미지</th>
        <th colspan="3"><img src="${pageContext.request.contextPath}${board.image}" width="50%"></th>
    </tr>

    <c:if test="${sessionScope.loginInfo.member_id eq 'admin'}">
        <tr>
            <th class="first">답글 달기</th>
            <th colspan="3">
                <textarea name="individual_content" id="individual_content" rows="5" cols="80"
                          style="resize: none;">${board.individual_content}</textarea>
            </th>
        </tr>
    </c:if>
    <c:if test="${empty sessionScope.loginInfo || sessionScope.loginInfo.member_id ne 'admin'}">
        <tr>
            <th class="first">답글</th>
            <th colspan="3">
                <textarea rows="5" cols="80" style="resize: none;" readonly>${board.individual_content}</textarea>
            </th>
        </tr>
    </c:if>
    
    <tr>
        <th colspan="4" align="center">
            <c:if test="${sessionScope.loginInfo.member_id != 'admin'}">    
            <input type="button" class="listButton " value="글목록" onClick="location.href='list.in?pageNumber=${param.pageNumber}'">
  			</c:if>
  			
  			  <c:if test="${sessionScope.loginInfo.member_id eq 'admin'}">    
            <input type="button" class="listButton " value="글목록" onClick="location.href='board.admin">
  			</c:if>
  			
  			
  			<c:if test="${sessionScope.loginInfo.member_id eq board.customer_id}">         
            <input type="button" class="meButton" value="문의글 삭제" onClick="location.href='delete.in?movie_code=${board.movie_code}&pageNumber=${param.pageNumber}'">
            </c:if>
            <c:if test="${sessionScope.loginInfo.member_id eq 'admin'}">
                <c:if test="${not empty board.individual_content}">
                    <input type="button" class="updateButton" value="답글수정" onClick="replyUpdate();">
                    <input type="button" class="meButton" value="답글삭제" onClick="replyDelete();">
                </c:if>
                <c:if test="${empty board.individual_content}">
                    <input type="button" class="myButton" value="답글작성" onClick="replyInsert();">&nbsp;
                </c:if>
            </c:if>
        </th>
    </tr>
</table>
 
 </div>
</div>
</div>
</div>
</div>
</section>

</main>


</main>
 
<%@ include file="../main/mainFooter.jsp"%>


