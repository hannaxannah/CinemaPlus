<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>

<style>
	ul,li{
		list-style-type: none;
	}
	
	.container_cart {
		width: 1080px;
		height: inherit;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		border: 1px solid;
		position: relative;
		background-color: #FFF;
	}
	.cart{
		margin-top: 50px;
		padding : 50px;
	}
	
	.cart_list{
		width : 100%;
		margin-top: 30px;
	}
	
	tr td{
		text-align : center;
	}
	
	.store_cart_img {
		width : 150px;
		float : left;
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
		float:left;
		border: 1px solid #ccc;
		text-align : center;
		width : 42px;
		height : 32px;
		color: #aaa;
		background-color: #f7f8f9;
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
	    margin-top: 23px; 
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
</style>



<c:set var="original_price" value="0"/>
<c:set var="sale_price" value="0"/>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function purchaseMenu() {//구매하기 버튼 클릭
		if ($("#payDiv").css("visibility") == "hidden") {
			$("#payDiv").css("visibility", "visible");
		} else {
			$("#payDiv").css("visibility", "hidden");
		}	
	}
</script>
<script>
$(document).ready(function() {
		 $(".payment").click(function(){
			 if ($("#cardDiv").css("visibility") == "hidden") {
					$("#cardDiv").css("visibility", "visible");
				} else {
					$("#cardDiv").css("visibility", "hidden");
				}
         }) 
});//ready

</script>
<% request.setCharacterEncoding("EUC-KR"); %>
<div class="container_cart">
	<section id="store">
	        <div class="container">
	            <div class="row">
	            	<div class="cart">
							<h2>결제 페이지</h2>
	            		<div class="cart_list">
	            			<form action="order.store" method="get">
								<table border="1" width="100%">
									<tr>
										<th width="40%">상품/옵션 정보</th>
										<th>상품 금액</th>
										<th>수량</th>
										<th>합계 금액</th>
									</tr>
									 <c:forEach items="${cartBeanList}" var="cart">
										<tr>
											<td>
												<a href="productDetail.store?product_code=${cart.product_code}">
						                       		<img alt="상품 사진" class="store_cart_img" src="<%=request.getContextPath()%>/resources/store_images/${cart.product_image}">
						                   		 </a>
						                   		<span style="float: left; padding-top: 60px;">
							                   		${cart.product_name }
						                   		</span> 
											</td>
											<td>
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
											<td width="110px" style="text-align:center;">
					                            	<input type="text" class="cart_qty" id="cart_qty" name="cart_qty" title="수량 입력" readonly="readonly" value="${cart.cart_qty }">
											</td>
											<td>${cart.product_sprice * cart.cart_qty }</td>
										</tr>
												<c:set var="original_price" value="${original_price + cart.product_sprice*cart.cart_qty}"/>
												<c:set var="total_price" value="${toatl_price + original_price}"/>
												<c:set var="sum_point" value="${sum_point + cart.product_point*cart.cart_qty}"/>
									</c:forEach>				
								</table>
								
								할인적용<br>
								쿠폰
									  
								<select>
									<option>=====</option>
									<c:forEach items="${myCoupon}" var="coupon">
										<option value="">[${coupon.coupon_rate}% 할인] ${coupon.coupon_name}</option>
									</c:forEach>
								</select>
								
								<table width="100%" border="1" style="margin-top : 50px">
									<tr>
										<th>
											총 상품 금액
										</th>
										<th>
											할인 금액
										</th>
										<th>
											총 결제 예정 금액
										</th>
									</tr>
									<tr>	
										<td>
											${original_price}원
										</td>
										<td>
											<c:set var="sale_price" value=""/>
											<c:choose>
												<c:when test="${empty sale_price}">
													<c:set var="sale_price" value="0"/>
												</c:when>
											</c:choose>
											<c:out value="${sale_price}"/>
											원
										</td>
										<td>
											${total_price } 원
										</td>
									</tr>
									<tr>	
									</tr>	
								</table>
								
								<div class="order_box_design_wrap">
							        <strong class="com_box_design_title">주문자 정보 확인</strong>
							        <ul class="com_box_design">
							            <li>
							                <label for="user_info_name">
							                    이름</label>
							                <input type="text" id="user_info_name" placeholder="이름" style="width: 128px" value="${loginInfo.getMember_name()}" readonly="">
							                <label for="user_info_phonenum">
							                    휴대전화 번호</label>
							                <input type="tel" id="user_info_phonenum" placeholder="휴대전화 번호" style="width: 228px" value="0${loginInfo.getMember_phone()}" readonly="">
							            </li>
							        </ul>
							        <p class="order_box_design_wrap">
							            구매하신 상품은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.<br>
							            입력된 휴대전화 번호가 맞는지 꼭 확인하세요.</p>
							    </div>
								
								<div class="store_box_design_wrap">
								        <strong class="com_box_design_title">결제 수단</strong>
							        	<button type="button" onclick="purchaseMenu()">구매하기</button>
							    </div> 
							</form>
	            		</div>
					</div>
	            </div>
	        </div>
	</section>
</div>

<div id="payDiv">
<form action="pay.store" method="post" class="cardForm" id="cardForm" accept-charset="UTF-8">
	<input type="hidden" name="total_price" value="${total_price}">	
	<input type="hidden" name="sale_pay" value="${sale_price}">	
	<input type="hidden" name="total_point" value="${sum_point}">	
   	<input type="radio" class="payment" name="payment_card" id="payment_card" value="card"> 신용/체크 카드결제
   	<div id="cardDiv">
	<table border="1" width="50%">
		<tr>
			<th>
				카드사
			</th>
			<td>
				<select name="card_company">
			   		<option value="신한카드" selected="selected">신한카드</option>
			   		<option value="BC카드">BC카드</option>
			   		<option value="삼성카드">삼성카드</option>
			   		<option value="우리카드">우리카드</option>
			   		<option value="하나카드">하나카드</option>
			   		<option value="롯데카드">롯데카드</option>
			   		<option value="현대카드">현대카드</option>
			   		<option value="KB국민카드">KB국민카드</option>
	  			</select>
			</td>
		</tr>
		<tr>
			<th>
				카드번호
			</th>
			<td>
				<input type="text" id="card_number" name="card_number" placeholder="(-)기호 없이 16자리" maxlength="16" size="16">
			</td>
		</tr>
		<tr>
			<th>
				생년월일
			</th>
			<td>
				<input type="text" id="card_birth" name="card_birth" maxlength="10" >
				<h6>생년월일 6자리(예:801224)/사업자번호 10자리</h6>
			</td>
		</tr>
		<tr>
			<th>
				카드 유효기간(월/년)
			</th>
			<td>
				<input type="text" id="card_mmyy" name="card_mmyy" placeholder="mm/yy" maxlength="4" size="4">
			</td>
		</tr>
		<tr>
			<th>
				카드 비밀번호 앞 두자리
			</th>
			<td>
				<input type="text" id="card_pw" name="card_pw" placeholder="앞2자리" maxlength="2" size="2">**
			</td>
		</tr>
		<tr>
			<th>
				할부 개월
			</th>
			<td>
				<select name="card_installment">
					<option value="0" selected="selected">일시불</option>
					<c:forEach begin="1" end="12" var="i">
	         		<option value="${i}">${i}개월</option>
					</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="payment();">결제하기</button>	      						
					</th>
				</tr>
			</table>
		</div>
		</form>
</div>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
function payment() {//결제 버튼 클릭
	var birth_regEXP = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;//주민번호6자리
	var busi_regEXP = /^[0-9]{6,10}$/;// 숫자6~10자리 정규식
	var mmyy_regEXP = /(^0[1-9][0-9][0-9]$)|(^1[012][0-9][0-9]$)/;//월-년도 4자리 정규식
	var card_regEXP = /^(?:(94[0-9]{14})|(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/;
	
	//유효성 체크
	if ($("#card_birth").val() == "") {
		alert("생년월일은 필수입력사항입니다.");
		$("#card_birth").focus();
		return false;
	} else if (!birth_regEXP.test($("#card_birth").val()) || !busi_regEXP.test($("#card_birth").val())) {
		alert("생년월일 및 사업자번호 형식이 올바르지 않습니다.");
		$("#card_birth").focus();
		return false;
	} else if ($(".card_mmyy").val() == "") {
		alert("유효기간은 필수입력사항입니다.");
		$(".card_mmyy").focus();
		return false;
	}
	/* else if (mmyy_regEXP.test($(".card_mmyy").val()) == false) {
		alert("년 월 형식이 올바르지 않습니다.");
		$(".card_mmyy").focus();
		return false;
	}  */
	else if ($("#card_num").val() == "") {
		alert("카드번호는 필수입력사항입니다.");
		$("#card_num").focus();
		return false;
	} /* else if (!card_regEXP.test($("#card_num").val())) {
		alert("카드번호 형식이 올바르지 않습니다.");
		$("#card_num").focus();
		return false;
	} */ else if ($("#card_pwd").val() == "") {
		alert("비밀번호는 필수입력사항입니다.");
		$("#card_pwd").focus();
		return false;
	}

	$("#cardForm").submit();
}
	
</script>


<%@ include file="../main/mainFooter.jsp"%>