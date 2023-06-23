<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
productList.jsp<br>
    <%@include file="../common/common.jsp"%>
     <%@ include file="../main/mainHeader.jsp"%>
	<%@ include file="mypageSidebar.jsp"%>
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
 <style>
 	body{
 		
 	}
 
 	.orderList{
 		 cursor: pointer;
 		 text-align: center;
 	}
 	.orderList:hover{
 		transform: scale(1.1);
 	}
 	.panel-default {
   		 border-color: #ddd;
	}
	.panel-order .row {
		border-bottom: 1px solid #ccc;
	}
	.panel-order .row .col-md-1  {
		text-align: center;
		padding-top: 28px;
	}
	.panel-order .row .col-md-1 i {
		width: 50px;
		max-height: 50px;
	}
	.panel-order .row .row {
		border-bottom: 0;
	}
	.panel-order .row .col-md-11 {
	
		border-left: 1px solid #ccc;
	}
	.panel-order .row .row .col-md-12 {
		text-align : left;
		padding-top: 7px;
		padding-bottom: 7px; 
	}
	.panel-order .row .row .col-md-12:last-child {
		font-size: 11px; 
		color: #555;  
		background: #efefef;
	}
	.panel-order .btn-group {
		margin: 0px;
		padding: 0px;
	}
	.panel-order .panel-body {
		padding-top: 0px;
		padding-bottom: 0px;
	}
	.panel-order .panel-deading {
		margin-bottom: 0;
	}                    
	a {
    color: #000000;
    text-decoration: none;
}
	.row .row {
		text-align :left;
	}
	.panel-order .panel-heading{
		color: #333;
	    background-color: #f5f5f5;
	    border-color: #ddd;
	    padding: 10px 15px;
	    border-bottom: 1px solid transparent;
	    border-top-left-radius: 3px;
	    border-top-right-radius: 3px;
	}
	
	.label-danger {
    background-color: #5cb85c;
	}
	.label {
	    display: inline;
	    padding: .2em .6em .3em;
	    font-size: 75%;
	    font-weight: 700;
	    line-height: 1;
	    color: #fff;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    border-radius: .25em;
	}
</style> 
 <div class="col-lg-9" style="padding: 20px;">
		<div class="card info-card customers-card">
			<div class="card-body align-items-center justify-content-center">   
					<div class="container bootdey">
					     <div class="panel panel-default panel-order">
					        <div class="panel-heading">
					            <strong>스토어 결제 내역</strong>
					            </div>
					
					        <div class="panel-body">
					        
					        <c:forEach var="order" items="${order}" >
								<a class="orderList" onclick="location.href='myOrderDetail.mp?payment_code=${order.payment_code}'">
						            <div class="row">
						                <div class="col-md-1">
						                	<i class="fa fa-credit-card" aria-hidden="true"></i>
						                </div>
						                <div class="col-md-11">
						                    <div class="row">
						                        <div class="col-md-12">
						                            <div class="pull-right"><label class="label label-danger">주문 완료</label></div>
						                            <span><strong>주문 번호 : </strong></span>${order.payment_code }<br />
						                        	</div>
						                        <div class="col-md-12">주문 시간 : <fmt:formatDate value="${order.payment_date}" pattern="yy-MM-dd HH:mm"/></div>
						                    </div>
						                </div>
						            </div>
								</a>
					         </c:forEach>   
					         				            
					        </div>
					        
					        <div class="panel-footer"></div>
					    </div>
					</div>
					</div>
</div>	


<div class="card info-card customers-card">
	<div class="card-body align-items-center justify-content-center">
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
</div> 
</main>
  <%@ include file="../main/mainFooter.jsp"%>
 
 
 