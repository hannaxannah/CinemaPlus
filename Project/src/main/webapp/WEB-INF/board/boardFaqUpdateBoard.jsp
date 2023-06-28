<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="../mypage/mypageSidebar.jsp"%>

	<style>
	table{
		margin-top: 200px;
		margin: auto;
	}
    .t_red {
        color: #f55500
    }

    .err {
        font-size: 8px;
        color: red;
    }
    th {
	height: 30px;
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

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/board/insertFaqBoard.js"></script>

<%
    String[] questionArr = {"영화정보문의", "회원 및 포인트문의", "예매/결제문의", "이벤트문의", "일반문의", "제안/건의"};
%>

<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">
<!-- page content -->
            <div class="page-title">
              <div class="title_left">
                <h3>FAQ 수정</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  </div>
                  <div class="x_content">
                    <br>
                    <form id="demo-form2" name="faq_Updateform" action="faqUpdate.bd" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" >
					<input type="hidden" name="movie_num" value="${ board.movie_num}">
					
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >분류</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="classification" name=classification required="required" class="form-control col-md-7 col-xs-12" value="${board.classification}">
                        </div>
                      </div>
                      <div class="form-group">
                         <label class="control-label col-md-3 col-sm-3 col-xs-12" >질문</label>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="question" name="question" required="required" class="form-control col-md-7 col-xs-12" value="${board.question }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >작성일</label>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="qdate" class="form-control col-md-7 col-xs-12" type="text" name="qdate" value="${board.qdate}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >내용</label>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <textarea style="resize: none;"  class="form-control col-md-7 col-xs-12"  id="content" name="content" rows="10"
					placeholder="- 개인정보 및 보안에 유의하여 작성해 주세요.">${board.content}</textarea>
                        </div><br><br>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">수정하기</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>
		 </div>
        </div>
        
		</div>
	</div>
</section>

</main>
    	

<%@ include file="../main/mainFooter.jsp"%>

