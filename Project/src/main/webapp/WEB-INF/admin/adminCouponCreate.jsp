<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./adminMenu.jsp" %>   
<%@ include file="../common/common.jsp" %>  
<script type="text/javascript">
	function emptyCheck(){
		
	if(coupon_form.coupon_name.value.length == 0){
		alert("쿠폰이름을 입력하세요");
		coupon_form.coupon_name.focus();
		return false;
	}//쿠폰이름 공백체크	
	
	if(coupon_form.coupon_rate.value.length == 0){
		alert("할인률을 입력하세요");
		coupon_form.coupon_rate.focus();
		return false;
	}
	else if(parseInt(coupon_form.coupon_rate.value) < 1 || parseInt(coupon_form.coupon_rate.value) > 100){
		alert("할인률은 1~100% 사이만 입력하세요");
		return false;
	}
	else if(isNaN(coupon_form.coupon_rate.value)){
		alert("할인률은 숫자만 입력하세요");
		coupon_form.coupon_rate.value = "";
		coupon_form.coupon_rate.focus();
		return false;
	}//할인률 체크
	
	if(coupon_form.coupon_qty.value.length == 0){
		alert("발행갯수를 입력하세요");
		coupon_form.coupon_qty.focus();
		return false;
	}else if(parseInt(coupon_form.coupon_qty.value) < 1){
		alert("쿠폰 최소 발행갯수는 1개이상입니다.");
		return false;
	}	
	else if(isNaN(coupon_form.coupon_qty.value)){
		alert("쿠폰 발행갯수는 숫자만 입력하세요");
		coupon_form.coupon_qty.value = "";
		coupon_form.coupon_qty.focus();
		return false;
	}//발행갯수 체크
	
	
	}
</script>     
<!-- page content -->
        <div class="right_col" role="main" style="min-height: 3535.8px;">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>쿠폰 발급</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>쿠폰 발급 <small>생성할 쿠폰의 정보를 입력해주세요</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br>
                    <form id="demo-form2" name="coupon_form" action="couponCreate.admin" method="post" onSubmit="return emptyCheck()" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >쿠폰이름 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="coupon_name" name="coupon_name" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >할인률(%)<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="coupon_rate" name="coupon_rate" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">쿠폰 발행 갯수<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="coupon_qty" class="form-control col-md-7 col-xs-12" type="text" name="coupon_qty">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
						  <button class="btn btn-primary" type="reset">초기화</button>
                          <button type="submit" class="btn btn-success">쿠폰 생성</button>
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