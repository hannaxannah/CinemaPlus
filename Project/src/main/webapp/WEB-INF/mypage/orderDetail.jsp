<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
orderDetail.jsp<br>
    <%@include file="../common/common.jsp"%>
     <%@ include file="../main/mainHeader.jsp"%> 
 <%
    request.setCharacterEncoding("UTF-8");
%>
 <style>
 	.orderList{
 		 cursor: pointer;
 		 text-align: center;
 	}
 	.orderList:hover{
 		transform: scale(1.1);
 	}
 	#mytable{
 	margin-top: 50px;
 	}
 	table{
 	text-align:left;
 	margin: auto;
 	width: 730px;
 	}
	.product{
	width: 730px;
	height: 25px;	
	border: 1px solid black;
	margin: auto;
	}
	
	form{
	margin-bottom: 100px;
	}
	
	.card td {
		align : left;
		font-size: small;
	}
	
	.p_img{
		width:50px;
		height:50px;
	}
	
	.product_price_original{
		display: block;
	    margin-top: 2px;
	    font-weight: 400;
	    font-size: 16px;
	    color: #6a6f77;
	    text-decoration: line-through;
	}
</style> 
    
	<table id="mytable">
	<tr>
		<td>
	<font style="font-size: x-large;">주문 상세 페이지 (주문 상품 : ${productsCount}건)</font><br><br>
		</td>
	</tr>
	</table>
	<table class="card">
		<tr>
			<td>
				<font>-결제 번호 <br> ${payment_code}</font>
			</td>
			<td>
				<font>-카드사 <br> ${storeCardBean.card_company}</font>
			</td>
			<td>
				<font>-카드 번호<br> ${storeCardBean.card_number}</font>
			</td>
			<td>
				<font>-카드 유효기간 <br>
					${fn:substring(storeCardBean.card_mmyy,0,2)}/
					${fn:substring(storeCardBean.card_mmyy,2,4)}
				</font>
			</td>
			<td>
				<font>-카드 비밀번호 <br> ${storeCardBean.card_pw}**</font>
			</td>
			<td>
				<c:choose>
					<c:when test="${storeCardBean.card_installment eq 0}">
						<font>할부 개월 : 일시불</font>
					</c:when>
					<c:otherwise>
						<font>할부 개월 : <br> ${storeCardBean.card_installment} 개월</font>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<table border="1" id="mytable">
		<tr align="center">
			<td>카테고리</td>
			<td>주문상품</td>
			<td>구매자</td>
			<td>주문수량</td>
			<td>상품 할인가</td>
			<td>상품 최종금액</td>
		</tr>
		
		
		<c:if test="${fn:length(productList) == 0}">
			<tr>
				<td colspan="5" align="center">결제 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="p" items="${productList}" >
			<tr>
				<td>
					${p.category_name}
				</td>
				
					<td>
				   <a href="productDetail.store?product_code=${p.product_code}">
					    	<img class="p_img" alt="상품 사진" src="<%=request.getContextPath()%>/resources/store_images/${p.product_image}">
						${p.product_name}
				   </a>
						<c:if test="${p.product_price ne 0}">
							<span class="product_price_original">
								<fmt:formatNumber value="${p.product_price}" pattern="#,###"/>원
							</span>
						</c:if>
						<span class="product_price_sale">
							<fmt:formatNumber value="${p.product_sprice}" pattern="#,###"/>원
						</span> 
							<span class="product_point">
								${cart.product_point} point
							</span>
						${p.product_point}
					</td>
				
				<td>${loginInfo.member_name}</td>
				<td>${p.product_order_qty}</td>
				<td>${p.product_sprice * (1-0.01*20)}</td>
				<td>${p.product_sprice * p.product_order_qty}</td>
			</tr>
		</c:forEach>
	</table>
	${pageInfo.pagingHtml }

<div class="product">
<details>
	 <summary style="margin-left: 8px;">이용안내</summary><br>
 <div markdown="1">
 	<p>
스토어 교환권에 따라 사용방법이 다르니, 상세 쿠폰정보를 확인 후 이용바랍니다.<br>
2020년 2월 4일 이후 구매하신 스토어 교환권은 기준에 따라 유효기간 연장이 가능합니다.<br>
선물받은 교환권은 등록 후 구매자가 결제를 취소할 경우 자동 회수처리 되어 사용하실 수 없습니다.<br>
*단, 메가찬스용 스토어 교환권 및 이벤트/프로모션 상품의 경우 유효기간 연장이 불가할 수 있습니다.<br><br>
<b>유효기간 연장안내</b><br>
유효기간은 만료 30일 전 부터 기간연장이 가능하며, 유효기간이 만료된 경우 기간연장이 불가합니다.<br>
유효기간은 발급일로부터 5년 이내 횟수 제한없이 기간연장이 가능하며, 1회 연장 시 <br>
90일 단위로 유효기간이 연장됩니다.<br>
최초 유효기간 만료 시 결제금액의 90% 환불 가능합니다.<br>
 	</p>
 </div>
 </details>
 </div>
 
 <div style="height: 280px;"></div>
 
  <%@ include file="../main/mainFooter.jsp"%>
 
 
 