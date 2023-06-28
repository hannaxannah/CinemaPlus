<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>
<link rel="stylesheet" href="resources/store_menuImages/store.css" media="all">
<style>
	body{
		background-color: #FFF;
	}
	.container_cart {
		width: 1080px;
		height: inherit;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		position: relative;
		background-color: #FFF;
	}
	.cart{
		padding: 0 50px;
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
	
	.cart_qty{
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
	
	a{
		color: #000;
	}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

		 //장바구니 비우기
		function empty_cart() {
			location.href = "emptyAll.store";
		}
		
		//결제누르기전 장바구니 비었나 확인
		function check_beforePay(url){
			if('${cartBeanList}' == ''){
				alert("장바구니가 비었습니다. 상품을 선택해주세요");
				url = "list.store";
			}else if('${cartBeanList}' == '[]'){
				alert("장바구니가 비었습니다. 상품을 선택해주세요");
				url = "list.store";
			}
			location.href = url;
		}
</script>
<c:set var="original_price" value="0"/>
<c:set var="sale_price" value="0"/>

<div class="container_cart">
	<section id="store">
	        <div class="container">
	            <div class="row">
	            
						
	            	<div class="cart">
							<h2>장바구니</h2>
							
						<div class="cart_step_wrap">
							<ul class="cart_step step_unit4">
								<li class="step0 active"><span>STEP 01</span><strong>장바구니</strong></li>
								<li class="step1"><span>STEP 02</span><strong>결제하기</strong></li>
								<li class="step3"><span>STEP 03</span><strong>결제완료</strong></li>
							</ul>
						</div>
	            		<div class="cart_list">
	            			<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
							<div class="container padding-bottom-3x mb-1">
							    <!-- Shopping Cart-->
							    <div class="table-responsive shopping-cart">
							        <table class="table">
							            <thead>
							                <tr>
							                    <th>상품 정보</th>
							                    <th class="text-center">수량</th>
							                    <th class="text-center">상품 금액</th>
							                    <th class="text-center">합계 금액</th>
							                    <th class="text-center">
								                    <button type="button" class="btn btn-sm btn-outline-danger" onClick="empty_cart()">
														장바구니 비우기
													</button>
							                    </th>
							                </tr>
							            </thead>
							            
							            <tbody>
							            <c:choose>
											<c:when test="${cartBeanList eq null}">
												<tr>
													<td colspan="5">
														장바구니가 비어있습니다.
														<c:set value="empty" var="cart_empty"/>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
								            <c:forEach items="${cartBeanList}" var="cart" varStatus="status">
								                <tr>
								                    <td>
								                        <div class="product-item">
								                            <a class="product-thumb" href="productDetail.store?product_code=${cart.product_code}">
								                          	  <img src="<%=request.getContextPath()%>/resources/store_images/${cart.product_image}" alt="Product">
								                            </a>
								                            <div class="product-info">
								                                <h4 class="product-title">
								                                <a href="productDetail.store?product_code=${cart.product_code}">${cart.product_name }</a>
								                                </h4><span><em>${cart.product_name }</em></span>
								                            </div>
								                        </div>
								                    </td>
								                    
								                    <td class="text-center">
								                        <div class="count-input">
									                            <input type="text" class="cart_qty" title="수량 입력" readonly="readonly" value="${cart.cart_qty }">
								                        </div>
								                    </td>
								                    
								                    <td class="text-center text-lg text-medium">
								                   		 <c:if test="${cart.product_price eq 0}">
									                    	<span class="product_price_sale">
																<fmt:formatNumber value="${cart.product_sprice}" pattern="#,###"/>원
																<c:set var="original_price" value="${original_price + cart.product_sprice*cart.cart_qty}"/>
															</span> 
														</c:if>
														<c:if test="${cart.product_price ne 0}">
															<span class="product_price_original">
																<fmt:formatNumber value="${cart.product_price}" pattern="#,###"/>원
																<c:set var="sale_price" value="${sale_price + (cart.product_price-cart.product_sprice)*cart.cart_qty}"/>
																<c:set var="original_price" value="${original_price + cart.product_price*cart.cart_qty}"/>
															</span>
														</c:if>
															<span class="product_point">
																${cart.product_point} point
															</span>
								                    </td>
								                    <td class="text-center text-lg text-medium">${cart.product_sprice * cart.cart_qty }원</td>
								                    <td class="text-center"><a class="remove-from-cart" href="delProduct.store?product_code=${cart.product_code}" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
								                </tr>
												<c:set var="total_point" value="${total_point + cart.product_point}"/>
								                </c:forEach>
								                </c:otherwise>
										</c:choose>	
							            </tbody>
							        </table>
							    </div>
							    <div class="shopping-cart-footer">
							        <div class="column">총 상품 금액 :
							          	<span class="text-medium"><c:out value="${original_price}" default="0"/>원</span>
							        </div>
							        <div class="column">할인 금액 :
							          	<span class="text-medium"><c:out value="${sale_price}" default="0"/>원</span>
							        </div>
							        <div class="column">적립 포인트 :
							          	<span class="text-medium"><c:out value="${total_point}" default="0"/> point</span>
							        </div>
							        <div class="column text-lg">총 결제 예정 금액 :
							        	<span class="text-medium"><c:out value="${original_price-sale_price}" default="0"/>원</span>
							        </div>
							    </div>
							    <div class="shopping-cart-footer">
							        <div class="column"><a class="btn btn-outline-secondary" href="list.store"><i class="icon-arrow-left"></i>계속 쇼핑하기</a></div>
							        <div class="column"><a class="btn btn-primary" href="#" onClick="check_beforePay('order.store')">결제하기</a></div>
							    </div>
							</div>
							
							
	            		</div>
					</div>
	            	
	            </div>
	        </div>
	</section>
</div>

<%@ include file="../main/mainFooter.jsp"%>