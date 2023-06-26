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
		width:75px;
		height:75px;
	}
	
	.product_price_original{
		display: block;
	    margin-top: 2px;
	    font-weight: 400;
	    font-size: 16px;
	    color: #6a6f77;
	    text-decoration: line-through;
	}
	
	body{
    margin-top:20px;
    background:#eee;
}

.invoice {
    background: #fff;
    padding: 20px
}

.invoice-company {
    font-size: 20px
}

.invoice-header {
    margin: 0 -20px;
    background: #f0f3f4;
    padding: 20px
}

.invoice-date,
.invoice-from,
.invoice-to {
    display: table-cell;
    width: 1%
}

.invoice-from,
.invoice-to {
    padding-right: 20px
}

.invoice-date .date,
.invoice-from strong,
.invoice-to strong {
    font-size: 16px;
    font-weight: 600
}

.invoice-date {
    text-align: right;
    padding-left: 20px
}

.invoice-price {
    background: #f0f3f4;
    display: table;
    width: 100%
}

.invoice-price .invoice-price-left,
.invoice-price .invoice-price-right {
    display: table-cell;
    padding: 20px;
    font-size: 20px;
    font-weight: 600;
    width: 75%;
    position: relative;
    vertical-align: middle
}

.invoice-price .invoice-price-left .sub-price {
    display: table-cell;
    vertical-align: middle;
    padding: 0 20px
}

.invoice-price small {
    font-size: 12px;
    font-weight: 400;
    display: block
}

.invoice-price .invoice-price-row {
    display: table;
    float: left
}

.invoice-price .invoice-price-right {
    width: 25%;
    background: #2d353c;
    color: #fff;
    font-size: 28px;
    text-align: right;
    vertical-align: bottom;
    font-weight: 300
}

.invoice-price .invoice-price-right small {
    display: block;
    opacity: .6;
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 12px
}

.invoice-footer {
    border-top: 1px solid #ddd;
    padding-top: 10px;
    font-size: 10px
}

.invoice-note {
    color: #999;
    margin-top: 80px;
    font-size: 85%
}

.invoice>div:not(.invoice-footer) {
    margin-bottom: 20px
}

.btn.btn-white, .btn.btn-white.disabled, .btn.btn-white.disabled:focus, .btn.btn-white.disabled:hover, .btn.btn-white[disabled], .btn.btn-white[disabled]:focus, .btn.btn-white[disabled]:hover {
    color: #2d353c;
    background: #fff;
    border-color: #d9dfe3;
}

a{
	color: #000000;
    text-decoration: none;
}

td{
	vertical-align: middle;
}
</style> 
    
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
   <div class="col-md-12" style="margin-top: 50px;">
      <div class="invoice">
         <!-- begin invoice-company -->
         <div class="invoice-company text-inverse f-w-600">
            <span class="pull-right hidden-print">
            <a href="javascript:;" onclick="window.print()" class="btn btn-sm btn-white m-b-10 p-l-5"><i class="fa fa-print t-plus-1 fa-fw fa-lg"></i> Print</a>
            </span>
            결제 번호 : <font> ${payment_code}</font> 
            <font style="font-size: x-large;">(주문 상품 : ${productsCount}건)</font>
         </div>
         <!-- end invoice-company -->
         <!-- begin invoice-header -->
         <div class="invoice-header">
            <div class="invoice-from">
               <small>결제 정보</small>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse"></strong><br>
	                  카드사 : ${storeCardBean.card_company} <br>
	                  카드 번호 : ${fn:substring(storeCardBean.card_number,0,4)}-****-****-${fn:substring(storeCardBean.card_number,12,17)} <br>
	               	  카드 유효기간 (MM/YY) : ${fn:substring(storeCardBean.card_mmyy,0,2)}/${fn:substring(storeCardBean.card_mmyy,2,4)}<br>
               	  <c:choose>
					<c:when test="${storeCardBean.card_installment eq 0}">
						<font>할부 개월 : 일시불</font>
					</c:when>
					<c:otherwise>
						<font>할부 개월 : ${storeCardBean.card_installment} 개월</font>
					</c:otherwise>
				</c:choose>
               </address>
            </div>
         </div>
         <!-- end invoice-header -->
         <!-- begin invoice-content -->
         <div class="invoice-content">
            <!-- begin table-responsive -->
            <div class="table-responsive">
               <table class="table table-invoice">
                  <thead>
                     <tr>
                        <th class="text-center" width="10%">카테고리</th>
                        <th class="text-center" width="30%">상품</th>
                        <th class="text-right" width="10%">상품가격</th>
                        <th class="text-right" width="5%">주문수량</th>
                        <th class="text-right" width="10%">상품 할인가</th>
                        <th class="text-right" width="10%">적립 포인트</th>
                        <th class="text-right" width="10%">상품 최종금액</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:if test="${fn:length(productList) == 0}">
					<tr>
						<td colspan="7" align="center">결제 내역이 없습니다.</td>
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
								<span class="text-inverse">${p.product_name }</span>
						  	 </a>
						</td>
						<td>
							<c:if test="${p.product_price ne 0}">
									<span class="product_price_original">
										<fmt:formatNumber value="${p.product_price}" pattern="#,###"/>원
									</span>
								</c:if>
								<span class="product_price_sale">
									<fmt:formatNumber value="${p.product_sprice}" pattern="#,###"/>원
								</span> 
						</td>	
						<td>${p.product_order_qty} 개</td>
						<td>
							<c:choose>
								<c:when test="${payment_sale_pay eq 0}">
									0 원
								</c:when>
								<c:otherwise>
									<fmt:parseNumber integerOnly="true" value="${p.product_sprice * (1-(0.01*payment_sale_pay))}"/>
									 원
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<fmt:parseNumber integerOnly="true" value="${(p.product_point * p.product_order_qty) - (p.product_point * (0.01*payment_sale_pay) * p.product_order_qty) } "/>
							<font>point</font>
						</td>
						<td>
							<fmt:parseNumber integerOnly="true" value="${p.product_sprice * p.product_order_qty * (1-(0.01*payment_sale_pay))}"/>
							 원
						</td>
					</tr>
					<c:set var="original_price" value="${original_price + p.product_sprice*p.product_order_qty}"/>
					<c:set var="total_price" value="${toatl_price + original_price}"/>
					<c:set var="sum_point" value="${sum_point + ((p.product_point * p.product_order_qty) - (p.product_point * (0.01*payment_sale_pay) * p.product_order_qty))}"/>
				</c:forEach>
                  </tbody>
               </table>
            </div>
            <!-- end table-responsive -->
            <!-- begin invoice-price -->
            <div class="invoice-price">
               <div class="invoice-price-left">
                  <div class="invoice-price-row">
                     <div class="sub-price">
                        <small>총 상품 금액</small>
                        <span class="text-inverse">${original_price} 원</span>
                     </div>
                     <div class="sub-price">
                        <i class="fa fa-minus text-muted"></i>
                     </div>
                     <div class="sub-price">
                        <small>할인 금액</small>
                        <c:choose>
								<c:when test="${payment_sale_pay eq 0 || empty payment_sale_pay}">
									<span class="text-inverse">0 원</span>
								</c:when>
								<c:otherwise>
			                        <span class="text-inverse">
			                        <fmt:parseNumber integerOnly="true" value="${original_price*(1-0.01*payment_sale_pay)}"/>
			                         원
			                        </span>
								</c:otherwise>
							</c:choose>
                     </div>
                     <div class="sub-price" style="padding-left: 200px;">
                        <small>적립 포인트</small>
                        <span class="text-inverse">
                        <fmt:parseNumber integerOnly="true" value="${sum_point}"/>
                         point
                        </span>
                     </div>
                  </div>
               </div>
               <div class="invoice-price-right">
                  <small>최종 결제 금액</small> <span class="f-w-600">
                  	<c:choose>
						<c:when test="${payment_sale_pay eq 0 || empty payment_sale_pay}">
							<span class="text-inverse">${original_price} 원</span>
						</c:when>
						<c:otherwise>
	                        <span class="text-inverse">
	                       	 <fmt:parseNumber integerOnly="true" value="${original_price*(1-0.01*payment_sale_pay)} "/>
	                        원</span>
						</c:otherwise>
					</c:choose>
                  </span>
               </div>
            </div>
            <!-- end invoice-price -->
         </div>
         <!-- end invoice-footer -->
      </div>
   </div>
</div>
 
 <div style="height: 100px;"></div>
 
  <%@ include file="../main/mainFooter.jsp"%>
 
 
 