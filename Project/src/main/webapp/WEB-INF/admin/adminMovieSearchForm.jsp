<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./adminMenu.jsp" %>   
<%@ include file="../common/common.jsp" %>  
<!-- page content -->
        <div class="right_col" role="main" style="min-height: 3535.8px;">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>영화 생성</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>영화 검색 <small>검색할 영화의 정보를 입력해주세요</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br>
                    <form id="demo-form2" name="coupon_form" action="movieSearch.admin" method="post" onSubmit="return emptyCheck()" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >영화 제목 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="title" name="title" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >제작 년도<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="date" name="date" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">영화 검색</button>
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