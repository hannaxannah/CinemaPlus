<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="./top.jsp" %>
<%@ include file="./cartNavigation.jsp" %>

<style>
	.cart{
		margin-top: 50px;
		padding : 50px;
	}
	
	.cart_list{
		width : 100%;
		margin-top: 30px;
		
	}
</style>

<section id="store">
        <div class="container">
            <div class="row">
            	<div class="cart">
						<h2>장바구니</h2>
            		<div class="cart_list">
						<table border="1" width="100%">
							<tr>
								<th><input type="checkbox"> </th>
								<th>상품/옵션 정보</th>
								<th>수량</th>
								<th>상품 금액</th>
								<th>합계 금액</th>
							</tr>
						</table>
            		</div>
				</div>
            	
            </div>
        </div>
</section>



<%@ include file="./bottom.jsp" %>