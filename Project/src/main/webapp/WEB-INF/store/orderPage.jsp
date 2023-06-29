<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>
<link rel="stylesheet" href="resources/store_menuImages/store.css" media="all">
<link rel="stylesheet" href="resources/store_menuImages/payment.css" media="all">
<style>
	body{
		background-color: #FFF;
	}
	ul,li{
		list-style-type: none;
	}
	
	.container_cart {
		height: inherit;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		position: relative;
		background-color: #FFF;
	}
	
	.cart_list{
		margin-top: 30px;
	}
	
	tr td{
		text-align : center;
	}
	
	.store_cart_img {
		width : 150px;
		float : left;
	}
	
	.cart{
		padding: 0 50px;
	}
	
	.btn_minus, .btn_plus{
		float:left;
		background-color: #fff;
		border: 1px solid #ccc;
		width : 32px;
		height : 32px;
		cursor: pointer;
	}
	
	.cart_qty{
		text-align: center;
	    width: 42px;
	    height: 32px;
	    color: #aaa;
	    border : none;
	}
	.product_price_original{
		display: block;
	    margin-top: 2px;
	    font-weight: 400;
	    font-size: 16px;
	    color: #6a6f77;
	    text-decoration: line-through;
	}
	
	.product_price_sale{
		display: block; 
	    font-weight: 500; 
	    font-size: 17px; 
	    color: #000;
	}
	
	.order_box_design_wrap{
		margin: 70px auto 0;
	}
	
	.cardForm table td{
		text-align: left;
	}
	
	#cardDiv {
			visibility: hidden;
		}
		
	#payDiv {
			visibility: hidden;
		}
	.card_input{
		background: #2A59B9;
	    color: rgba(255, 255, 255, 0.5);
	    border: none;
	    height: 30px;
	    border-radius: 2px;
	    padding: 5px 4px;
	    text-align: center;
	    margin: 5px;
	}
	.company{
		background: #2A59B9;
		float: right;
	}
	.top-0 {
		top:auto!important;
	}
</style>



<c:set var="original_price" value="0"/>
<c:set var="sale_price" value="0"/>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<% request.setCharacterEncoding("EUC-KR"); %>
<div class="container_cart">
	<section id="store">
	        <div class="container" style="padding-right: 0;padding-left: 0;">
	            <div class="row">
	            	<div class="cart">
							<h2>결제 페이지</h2>
							
	            		<div class="cart_list">
							<div class="cart_step_wrap">
								<ul class="cart_step step_unit4">
									<li class="step0"><span>STEP 01</span><strong>장바구니</strong></li>
									<li class="step1 active"><span>STEP 02</span><strong>결제하기</strong></li>
									<li class="step3"><span>STEP 03</span><strong>결제완료</strong></li>
								</ul>
							</div>
	            		<div class="container">
	            		
					    <div class="row">
					      <!-- Left -->
					      <div class="col-lg-9" style="width: 65%;">
					        <div class="accordion" id="accordionPayment">
								<div class="accordion-item mb-3 border">
											<div class="card mb-4">
												<div class="card-body">
													<table class="table table-borderless">
														<tbody>
															<tr>
																<th>상품 정보</th>
											                    <th class="text-center">수량</th>
											                    <th class="text-center">상품 금액</th>
											                    <th class="text-center">합계 금액</th>
															</tr>
															<c:forEach items="${cartBeanList}" var="cart">
															<tr>
																<td><div class="d-flex mb-2">
																		<div class="flex-shrink-0">
																			<a href="productDetail.store?product_code=${cart.product_code}">
																				<img src="<%=request.getContextPath()%>/resources/store_images/${cart.product_image}"alt="" width="100px" height="100px" class="img-fluid">
																			</a>
																		</div>
																		<div class="flex-lg-grow-1 ms-3">
																			<h5 class="" style="margin-top: 40px; float: left;">
																				<a href="productDetail.store?product_code=${cart.product_code}" class="text-reset">
																					${cart.product_name }
																				</a>
																			</h5>
																		</div>
																	</div></td>
																<td style="vertical-align: middle;">
																	<input type="text" class="cart_qty" id="cart_qty" name="cart_qty" title="수량 입력" readonly="readonly" value="${cart.cart_qty }">
																 </td>
																<td style="vertical-align: middle;">
																	<span class="product_price_sale">
																		<fmt:formatNumber value="${cart.product_sprice}" pattern="#,###"/>원
																		</span>
																		<c:if test="${cart.product_price ne 0}">
																			<span class="product_price_original">
																				<fmt:formatNumber value="${cart.product_price}" pattern="#,###"/>원
																			</span>
																		</c:if>
																			<span class="product_point">
																				${cart.product_point} point
																	</span>	
																</td>
																<td class="text-end" style="vertical-align: middle; font-size: 17px;">
																	<fmt:formatNumber value="${cart.product_sprice * cart.cart_qty }" pattern="#,###"/>원
																	 <br>
																	<fmt:formatNumber value="${cart.product_point * cart.cart_qty }" pattern="#,###"/> point
																</td>
															</tr>
															<c:set var="original_price" value="${original_price + cart.product_sprice*cart.cart_qty}"/>
															<c:set var="total_price" value="${total_price + original_price}"/>
															<c:set var="sum_point" value="${sum_point + cart.product_point*cart.cart_qty}"/>
															</c:forEach>
														</tbody>

													</table>
												</div>
											</div>
										</div>					        
					          
					          <div class="accordion-item mb-3 border">
					            <h2 class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
					           	  <div class="form-check w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#collapsePP" aria-expanded="false">
					                <label class="form-check-label pt-1" for="payment2">
					                  주문자 정보 확인
					                </label>
					             </h2>   
									 <div id="collapsePP" class="accordion-collapse collapse show" data-bs-parent="#accordionPayment" style="">
					                      <table style="width: 100%;">
					                      	<tr>
					                      		<td style="border-color: #FFF;">
						                      		<label class="form-label" >이름</label>
					                      		</td>
					                      		<td style="border-color: #FFF;">
						                      		<label class="form-label" >휴대전화 번호</label>
					                      		</td>
					                      	</tr>
					                      	<tr>
					                      		<td style="border-color: #FFF;">
						                      		<input type="text" class="form-control" style="text-align: center;" value="${loginInfo.getMember_name()}">
					                      		</td>
					                      		<td style="border-color: #FFF;">
						                      		 <input type="text" class="form-control" style="text-align: center;" value="0${loginInfo.getMember_phone()}">
					                      		</td>
					                      	</tr>
					                      </table>
						            </div>
					          </div>
					          
					        </div>
					      </div>
					      
					      <!-- Right -->
					      <div class="col-lg-3" style="width: 35%;">
					        <div class="card position-sticky top-0">
					        
					        	<div class="accordion-item mb-3" style="border: var(--bs-accordion-border-width) solid var(--bs-accordion-border-color);">
					            <h2 class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
					              <div class="form-check w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#collapseCC" aria-expanded="false">
					                <input class="form-check-input" type="radio" name="payment" id="payment1">
					                <label class="form-check-label pt-1" for="payment1">
					                  카드 결제
					                </label>
					              </div>
					            </h2>
					            <div id="collapseCC" class="accordion-collapse collapse" style="">
					              <div class="accordion-body">
					             
					             	<div id="area">
									  <div class="master-card">
									    <div class="card">
									      <div class="title" style="margin-right: 21px;">카드 결제 &nbsp; &nbsp;
									      <form action="pay.store" method="post" class="cardForm" id="cardForm" accept-charset="UTF-8">
									       <input type="hidden" name="sale_pay" value="${sale_price}">	
											<input type="hidden" name="total_point" value="${sum_point}">	
											<input type="hidden" name="use_coupon_code" value="">	
									      	<select name="card_company" class="company" style="height:30px">
										   		<option value="신한카드" selected="selected">신한카드</option>
										   		<option value="BC카드">BC카드</option>
										   		<option value="삼성카드">삼성카드</option>
										   		<option value="우리카드">우리카드</option>
										   		<option value="하나카드">하나카드</option>
										   		<option value="롯데카드">롯데카드</option>
										   		<option value="현대카드">현대카드</option>
										   		<option value="KB국민카드">KB국민카드</option>
											</select>
									      </div>
									      <div class="input-number"><span class="title-number">카드 번호</span>
									        <div class="inputs-number">
									          <input type="text" class="card_input" id="card_number" name="card_number" maxlength="16" name="number-card" placeholder="0000-0000-0000-0000 카드번호 16자리" required="required"/>
									        </div>
									        <div class="selects-date selecters">
									          <div class="day-select"><span>카드 유효기간</span>
									         	<input type="text" class="card_input" id="card_mmyy" name="card_mmyy" placeholder="MM/YY" maxlength="4" size="4">
									          </div>
									          <div class="password" style="margin-left: 167px;"><span style="display: block; font-size: 12px;">비밀번호 앞 두자리</span>
									         	<input type="text" class="card_input" id="card_pw" name="card_pw" placeholder="**" maxlength="2" style="width: 50px;">* *
									          </div>
									        </div>
									        <div class="selects-date selecters" style="margin-top: 20px;">
									          <div class="day-select"><span>생년월일/사업자번호(10자리)</span>
									         	<input type="text" class="card_input"  id="card_birth" name="card_birth" style="width: 200px;" placeholder="생년월일/사업자번호" maxlength="10" size="10">
									          </div>
									          <div class="day-select" style="margin-left: 50px;"><span>할부개월</span>
									         	<select name="card_installment" class="card_input" style="width: 100%; height: 100%;">
													<option value="0" selected="selected">일시불</option>
													<c:forEach begin="1" end="12" var="i">
									         		<option value="${i}">${i}개월</option>
													</c:forEach>
												</select>
									          </div>
									        </div>
									      <div class="name" style="font-size: 20px;margin-right: 25px;"><span>${loginInfo.getMember_name()}</span></div>
									         
									         
									         </form>
									      </div>
									    </div>
									  </div>
									</div>
					             
					              </div>
					            </div>
					          </div>
					        
					          <div class="p-3 bg-light bg-opacity-10">
					            <h6 class="card-title mb-3">주문정보</h6>
					            <div class="d-flex justify-content-between mb-1 small">
					              <span>쿠폰</span>
									<select class="coupon_sale" id="coupon_sale" name="coupon_sale" style="color: #000;">
										<option value="0" selected>=====</option>
										<c:forEach items="${myCoupon}" var="coupon">
											<option value="${coupon.coupon_rate}" >[${coupon.coupon_rate}% 할인] ${coupon.coupon_name}  /${coupon.coupon_code}</option>
										</c:forEach>
									</select>
					            </div>
         																
					            <div class="d-flex justify-content-between mb-1 small">
					              <span>상품 금액</span> <span class="originalPrice"></span>
					            </div>
					            <div class="d-flex justify-content-between mb-1 small">
					              <span>할인 금액</span> <span class="salePrice"></span>
					            </div>
					            <div class="d-flex justify-content-between mb-1 small">
					              <span>적립 포인트</span> <span class="savePoint"></span>
					            </div>
					            <hr>
					            <div class="d-flex justify-content-between mb-4 small">
					              <span>결제 금액</span> <span class="finalPrice"></span>
					            </div>
					            <button class="btn btn-primary w-100 mt-2" onclick="payment();">결제 완료</button>
					          </div>
					        </div>
					        
					        
					      </div>
					    </div>
  </div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//페이지 로드시 가격 계산
	setTotalInfo();
	
});


function setTotalInfo(){
	let totalPrice = <c:out value="${original_price}"/>;//전체 상품 가격
	let salePercent = 0;//전체 상품 할인 가격
	let getPoint = <c:out value="${sum_point}"/>; //적립 포인트
	let purchasePrice = <c:out value="${total_price}"/>; //최종 가격
	let sale_percent = $("#coupon_sale option:selected").val();
	
	let indexofcoupon = $("#coupon_sale option:selected").text().indexOf('/');
	let substrcoupon = $("#coupon_sale option:selected").text().substr(indexofcoupon);
	let couponcode = substrcoupon.substring(1);
		
	$(".originalPrice").text(totalPrice);
	$(".savePoint").text(parseInt(getPoint-(getPoint*(0.01*sale_percent))));
	$(".salePrice").text(- parseInt(totalPrice*(0.01*sale_percent)));
	$(".finalPrice").text(parseInt(totalPrice-(totalPrice*(0.01*sale_percent))));
	
	$("input[name=sale_pay]").val(sale_percent);
	$("input[name=total_point]").val(parseInt(getPoint-(getPoint*(0.01*sale_percent))));
	$("input[name=use_coupon_code]").val(couponcode);
}
	
	$("#coupon_sale").change(function(){
		setTotalInfo();
	});
	
function payment() {//결제 버튼 클릭
	var birth_regEXP = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;//주민번호6자리
	var busi_regEXP = /^[0-9]{6,10}$/;// 숫자6~10자리 정규식
	var card_regEXP = /^[0-9]{16}$/; //카드 유효성 검사
	var pw_regEXP = /^[0-9]{2}$/; //카드 유효성 검사
	
	//유효성 체크
	if ($("#card_number").val() == "") {
		alert("카드번호는 필수입력사항입니다.");
		$("#card_num").focus();
		return false;
	}else if (!card_regEXP.test($("#card_number").val())) {
		alert("카드번호 16자리를 입력하십시오");
		$(".card_num").focus();
		return false;
	}else if ($("#card_mmyy").val() == "") {
		alert("유효기간은 필수입력사항입니다.");
		$("#card_mmyy").focus();
		return false;
	}else if ($("#card_pw").val() == "") {
		alert("비밀번호는 필수입력사항입니다.");
		$("#card_pw").focus();
		return false;
	}else if (!pw_regEXP.test($("#card_pw").val())) {
		alert("카드 비밀번호 앞 2자리를 입력하십시오");
		$(".card_pw").focus();
		return false;
	}else if ($("#card_birth").val() == "") {
		alert("생년월일은 필수입력사항입니다.");
		$("#card_birth").focus();
		return false;
	} else if (!birth_regEXP.test($("#card_birth").val()) || !busi_regEXP.test($("#card_birth").val())) {
		alert("생년월일 및 사업자번호 형식이 올바르지 않습니다.");
		$("#card_birth").focus();
		return false;
	} 
	 

	$("#cardForm").submit();
}
	
</script>


<%@ include file="../main/mainFooter.jsp"%>