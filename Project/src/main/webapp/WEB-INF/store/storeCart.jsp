<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>

<style>
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
		width : 33px;
		height : 33px;
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
	
	.delete_cart_btn{
		float: left;
	    width: 22px;
	    height: 22px;
	    font-size: 0;
	    border: 1px solid #bebebe;
	    background: transparent url(resources/store_menuImages/bg_closedBtn.png) center center scroll no-repeat;
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
</style>

<c:set var="original_price" value="0"/>
<c:set var="sale_price" value="0"/>


<div class="container_cart">
	<section id="store">
	        <div class="container">
	            <div class="row">
	            	<div class="cart">
							<h2>장바구니</h2>
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
											<td width="110px">
													<button type="button" class="btn_minus" title="수량감소" onClick="btn_minus()">-</button>
					                            	<input type="text" class="cart_qty" id="cart_qty" name="cart_qty" title="수량 입력" readonly="readonly" value="${cart.cart_qty }">
					                            	<button type="button" class="btn_plus" title="수량증가" onClick="btn_plus()">+</button>
					                            	<button></button>
											</td>
											<td>
												<div style="float : left">
													${cart.cart_amount }
												</div>
													<a href="" class="delete_cart_btn"></a>
											</td>
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
											<button type="button" onClick="empty_cart()">
												장바구니 비우기
											</button>
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
								<div>
									<button type="submit">
									결제하기
									</button>
								</div>
							</form>
	            		</div>
					</div>
	            	
	            </div>
	        </div>
	</section>
</div>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	
	function empty_cart() {
		location.href = "emptyAll.store";
	}
</script>


<%@ include file="../main/mainFooter.jsp"%>