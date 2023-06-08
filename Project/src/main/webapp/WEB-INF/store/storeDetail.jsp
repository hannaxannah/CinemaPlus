<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="./top.jsp" %>
<%@ include file="./cartNavigation.jsp" %>



<style>
	.store_detail{
		margin-top: 10px;
		padding: 50px;
	}
	
	.store_detail_name{
		margin-top: 30px;
	}
	
	.store_detail_info{
		margin-top: 30px;
	}
	
	.btn_minus, .btn_plus{
		padding : 10px;
		cursor: pointer;
	}
</style>

<section id="store">
	 <div class="container">
            <div class="row">
				<div class="store_detail">
					<div class="store_detail_name">
						<h2>${productDetail.product_name}</h2>
					</div>
					
					<div class="store_detail_info">
					<table border="1" width="100%">
						<tr>
							<td rowspan="3" width="480px" height="400px" style="text-align: center">
								<img src="<%=request.getContextPath()%>/resources/store_images/${productDetail.product_image}" style="max-width:280px; max-height:280px;">
								<h3>${productDetail.product_detail}</h3>
							</td>
						</tr>
						<tr>	
							<td colspan="2" style="padding : 40px">
								<form action="addCart.store" method="post">
	                               <input type="hidden" name="product_code" value="${productDetail.product_code}">
	                               <input type="hidden" name="product_image" value="${productDetail.product_image}">
									잔여 수량 ${productDetail.product_qty} <br><br>
	                               <span >수량/금액</span>
	                               <button type="button" class="btn_minus" title="수량감소" onClick="btn_minus()">-</button>
	                               <input type="text" id="cart_qty" title="수량 입력" readonly="readonly" value="1">
	                               <button type="button" class="btn_plus" title="수량증가" onClick="btn_plus()">+</button><br><br>
		                              총 상품 금액 ${productDetail.product_sprice} 원 <br><br>
		                              적립 포인트 ${productDetail.product_point} point <br><br><br>
									<input type="submit" style="border: solid; padding: 10px ; cursor: pointer;" value="장바구니 담기">
								</form>
							</td>
						</tr>
						<tr>
							<td colspan="3" style="padding : 20px">
								사용방법<br>
								- 스토어 상품은 회원만 구매하실 수 있습니다.<br>
								- 유효기간은 24개월로 사용일 기준입니다.<br>
								- 결제가 완료된 상품은 마이시네마 > 예매/구매내역에서 확인 가능합니다.<br>
								- 영화관 스위트샵(매점) 방문 후, 바코드를 제시하는 방법으로도 사용가능합니다.<br>
								- 정해진 상품 외 기타 상품 변경은 불가합니다.<br><br>
								취소/환불<br>
								- 스토어 상품의 취소기한은 구매일로부터 70일 입니다.<br>
								- 구매취소는 취소기한 내 마이시네마 > 예매/구매내역에서만 가능합니다.(현장취소 불가)<br>
								- 구매하신 상품은 부분환불 및 현금환불이 되지 않습니다.<br><br>
								기타<br>
								- 이벤트로 판매되는 상품의 구매/사용/취소 규정은 해당 이벤트 페이지를 확인해주세요.<br>
								- 유효기간 만료일 전 연장 요청 시, 1회에 한하여 3개월 연장 가능합니다.<br>
								- 고객센터: 1544-8855 (유료)<br>
							</td>
						</tr>
					</table>
					</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	
	function btn_plus() {
		
		$("#cart_qty").val(parseInt($("#cart_qty").val()) + 1);
		if ($("#cart_qty").val() > 10) {//최대 수량 10
			alert("한번에 선택가능한 수량은 10개입니다.");
			$("#cart_qty").val(10);
		}
		
	}
	
	function btn_minus() {
		
		$("#cart_qty").val(parseInt($("#cart_qty").val()) - 1);
		if ($("#cart_qty").val() < 1) {//최소 수량 1
			alert("최소 수량은 1개입니다.");
			$("#cart_qty").val(1);
		}
		
	}
	
</script>

<%@ include file="./bottom.jsp" %>