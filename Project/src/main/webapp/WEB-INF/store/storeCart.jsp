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
	
	.btn_change{
		float: right;
	    width: 36px;
	    height: 29px;
	    font-weight: 400;
	    font-size: 13px;
	    text-align: center;
	    color: #4b4f56;
	    line-height: 29px;
	    border: 1px solid #bdc1c8;
	    text-decoration: none;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
	});//ready
	
		 //장바구니 비우기
		function empty_cart() {
			location.href = "emptyAll.store";
		}
		
		//결제누르기전 장바구니 비었나 확인
		function check_beforePay(url){
			if('${cart_empty}' != ''){
				alert("장바구니가 비었습니다. 상품을 선택해주세요");
				url = "list.store";
			}
			location.href = url;
		}
		
		//선택 상품 수량증가
		function btn_plus(i) {
			$("input[type='text'][name="+i+"]").val(parseInt($("input[type='text'][name="+i+"]").val())+1); 
			if ($("input[type='text'][name="+i+"]").val() > 10) {//최대 수량 10
				alert("한번에 선택가능한 수량은 10개입니다.");
				$("input[type='text'][name="+i+"]").val(10);
			} 
			
		}
		
		//선택 상품 수량감소
		function btn_minus(i) {
			
			$("input[type='text'][name="+i+"]").val(parseInt($("input[type='text'][name="+i+"]").val())-1); 
			
			if ($("input[type='text'][name="+i+"]").val() < 1) {//최대 수량 10
				alert("최소 선택가능한 수량은 1개입니다.");
				$("input[type='text'][name="+i+"]").val(1);
			} 
			
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
	            		<div class="cart_list">
	            			<form action="order.store" method="get">
								<table border="1" width="100%">
									<tr>
										<th width="40%">상품/옵션 정보</th>
										<th>상품 금액</th>
										<th>수량</th>
										<th>합계 금액</th>
									</tr>
									<c:choose>
										<c:when test="${cartBeanList eq null}">
											<tr>
												<td colspan="4">
													장바구니가 비어있습니다.
													<c:set value="empty" var="cart_empty"/>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
										 <c:forEach items="${cartBeanList}" var="cart" varStatus="status">
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
													<form action="modifyCart.store" method="post">
														<input type="hidden" name="product_code" value="${cart.product_code}">
														<button type="button" class="btn_minus" title="수량감소" name="${status.count}" onClick="btn_minus('${status.count}')">-</button>
						                            	<input type="text" class="cart_qty" name="${status.count}" title="수량 입력" readonly="readonly" value="${cart.cart_qty }">
						                            	<button type="button" class="btn_plus" title="수량증가" name="${status.count}" onClick="btn_plus('${status.count}')">+</button>
														<br>
														<button type="submit">변경</button>
													</form>
												</td>
												<td>
													<div style="float : left">
														${cart.product_sprice * cart.cart_qty }원
													</div>
														<a href="" class="delete_cart_btn"></a>
												</td>
											</tr>
													<c:set var="original_price" value="${original_price + cart.product_sprice*cart.cart_qty}"/>
													<c:set var="total_price" value="${toatl_price + original_price}"/>
										</c:forEach>			
									</c:otherwise>
									</c:choose>	
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
											0 원
										</td>
										<td>
											<c:out value="${total_price}"/>원
										</td>
									</tr>
									<tr>	
									</tr>	
								</table>
								<div>
									<a href="#" onClick="check_beforePay('order.store')">
										결제하기
									</a>
								</div>
							</form>
	            		</div>
					</div>
	            	
	            </div>
	        </div>
	</section>
</div>

<%@ include file="../main/mainFooter.jsp"%>