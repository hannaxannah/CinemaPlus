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
	
</style>

<c:set var="original_price" value="0"/>
<c:set var="sale_price" value="0"/>

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
											</td>
											<td width="110px" style="text-align:center;">
					                            	<input type="text" class="cart_qty" id="cart_qty" name="cart_qty" title="수량 입력" readonly="readonly" value="${cart.cart_qty }">
											</td>
											<td>${cart.cart_amount }</td>
										</tr>
										<c:choose>
											<c:when test="${cart.product_price eq 0}">
												<c:set var="original_price" value="${original_price + cart.product_sprice}"/>
											</c:when>
											<c:otherwise>
												<c:set var="original_price" value="${original_price + cart.product_price}"/>
												<c:set var="sale_price" value="${sale_price + (cart.product_price - cart.product_sprice)*cart.cart_qty}"/>
											</c:otherwise>
										</c:choose>
									</c:forEach>				
								</table>
								
								할인적용<br>
								쿠폰
								<select>
									<option>=====</option>
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
											<c:out value="${original_price}"/>원
										</td>
										<td>
											<c:out value="${sale_price}"/>원
										</td>
										<td>
											${totalAmount }
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
							        
							    </div> 
							</form>
	            		</div>
					</div>
	            </div>
	        </div>
	</section>
</div>
	            	<input type="radio" name="payment" id="payment_card" value="card"> 신용/체크 카드결제
	      			<table border="1">
	      				<tr>
	      					<th>
	      						카드사
	      					</th>
	      					<td>
	      						<select>
	      							<option>비씨카드</option>
									<option>하나SK카드</option>
									<option>현대카드</option>
									<option>KB카드</option>
									<option>씨티카드</option>
									<option>롯데카드</option>
									<option>농협NH카드</option>
									<option>삼성카드</option>
									<option>신한카드</option>
									<option>우리카드</option>
	      						</select>
	      					</td>
	      				</tr>
	      				<tr>
	      					<th>
	      						카드번호
	      					</th>
	      					<td>
	      						<input type="text">
	      					</td>
	      				</tr>
	      				<tr>
	      					<th>
	      						카드 유효기간(월/년)
	      					</th>
	      					<td>
	      						<input type="text"> <input type="text">
	      					</td>
	      				</tr>
	      				<tr>
	      					<th>
	      						카드 비밀번호 앞 두자리
	      					</th>
	      					<td>
	      						<input type="text">**
	      					</td>
	      				</tr>
	      				<tr>
	      					<th>
	      						할부 개월
	      					</th>
	      					<td>
	      						<select>
	      							<option>일시불</option>
	      							<option>3개월</option>
	      						</select>
	      					</td>
	      				</tr>
	      				<tr>
	      					<th colspan="2">
								<button>결제하기</button>	      						
	      					</th>
	      				</tr>
	      				
	      				
	      			</table>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">

	
</script>


<%@ include file="../main/mainFooter.jsp"%>