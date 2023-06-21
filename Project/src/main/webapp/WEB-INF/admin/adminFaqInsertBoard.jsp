<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./adminMenu.jsp" %>   
<%@ include file="../common/common.jsp" %>  

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
    
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/board/insertFaqBoard.js"></script>

<%
    String[] questionArr = {"영화정보문의", "회원 및 포인트문의", "예매/결제문의", "이벤트문의", "일반문의", "제안/건의"};
%>

<!-- page content -->
        <div class="right_col" role="main" style="min-height: 3535.8px;">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>FAQ 추가</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>FAQ 추가 <small>추가할 FAQ리스트를 작성해 주세요.</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br>
                    <form id="demo-form2" name="faq_Insertform" action="faqInsert.admin" method="post" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >분류 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="classification" name=classification required="required" class="form-control col-md-7 col-xs-12" value="${board.classification}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >질문 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="question" name="question" required="required" class="form-control col-md-7 col-xs-12" value="${board.question }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">작성일 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="qdate" class="form-control col-md-7 col-xs-12" type="text" name="qdate" value="${board.qdate}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">내용 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <textarea style="resize: none;"  class="form-control col-md-7 col-xs-12"  id="content" name="content" rows="10"
					placeholder="- 개인정보 및 보안에 유의하여 작성해 주세요.">${board.content}</textarea>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">FAQ 작성</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>
		 </div>
        </div>


<%@ include file="./adminBottom.jsp" %>                

