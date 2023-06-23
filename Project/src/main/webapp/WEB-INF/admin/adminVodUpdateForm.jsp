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
                    <h2>Vod 수정<small>변경할 vod의 정보를 입력해주세요</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br>
                    <form id="demo-form2" name="vod_update_form" action="updateVod.admin" method="post" onSubmit="return emptyCheck()" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >영화코드 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="movie_code" name="movie_code" required="required" class="form-control col-md-7 col-xs-12"
                          value="${vodBean.movie_code}" readonly="readonly">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >Vod 제목<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="vod_title" name="vod_title" required="required" class="form-control col-md-7 col-xs-12"
                          value="${vodBean.vod_title }" readonly="readonly">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >Vod 제목<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="vod_price" name="vod_price" required="required" class="form-control col-md-7 col-xs-12"
                          value="${vodBean.vod_price }">
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >예고편 주소<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="url" name="url" required="required" class="form-control col-md-7 col-xs-12"
                          value="${vodBean.url}">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">Vod 수정</button>
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