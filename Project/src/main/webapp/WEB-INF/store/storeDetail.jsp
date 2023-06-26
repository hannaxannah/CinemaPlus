<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>
<link rel="stylesheet" href="resources/store.min.css" media="all">


<style>
	body{
		background-color: #FFF;
	}
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
	section{
		padding: 0;
	}
</style>

<div class="container_productDetail">
	<section id="store">
		<div id="contents" class="">
    <div class="inner-wrap">
        <!-- store-view -->
        <div class="store-view">
            <h2 class="tit">${productDetail.product_name}</h2>
            <div class="sub-info">
                <p class="bundle">${productDetail.product_detail}</p>
            </div>
            <!-- box-store-view -->
            <div class="box-store-view">
                <div class="left">
                    <div class="img">
                        <p><img src="<%=request.getContextPath()%>/resources/store_images/${productDetail.product_image}"></p>
                    </div>
                    <p class="origin">
                    </p>
                </div>
                <div class="right">
                                    <form action="addCart.store" name="qtyform" method="post">
		                               <input type="hidden" name="product_code" value="${productDetail.product_code}">
		                               <c:set value="${productDetail.product_sprice}" var="sum_price"/>
		                                <div class="type">
					                        <div class="receipt">
					                            <div class="line">
					                                <p class="tit"><span class="line32">수량/금액</span></p>
					                                <div class="cont">
					                                    <button type="button" class="btn minus" title="수량감소" onClick="btn_minus()">
					                                    <i class="iconset ico-minus"></i></button>
					                                    <input type="text" class="cart_qty" id="cart_qty" name="cart_qty" title="수량 입력" readonly="readonly" value="1">
					                                    <button type="button" class="btn plus" title="수량증가" onClick="btn_plus()">
					                                    <i class="iconset ico-plus"></i></button>
					                                    <div class="money">
					                                        <em id="prdtSumAmt"></em>
															    	<span>원</span>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
		                  			   <div class="btn-group" style="width: 100%;">
											<a href="javascript:void(0);" class="button purple large" w-data="500" h-data="410" onclick="document.forms['qtyform'].submit();">장바구니 담기</a>
										</div>
									</form>
									 <div class="receipt">
					                            <div class="line" style="margin-top: 50px;">
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
									</div>
									</div>
                                </div>
                            </div>
                    </div>
                    <!--// type -->
                </div>
                <!--// right -->
            </div>
            <!--// box-store-view -->
        </div>
        <!--// store-view -->
    </div>
</div>
	</section>
</div>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	priceUpdate();
});

	function priceUpdate(){
		let price = <c:out value="${sum_price}"/>;//전체 상품 가격	
		var totalprice = price * $("#cart_qty").val();
		
		$('#prdtSumAmt').html(totalprice);
	}	
	
	function btn_plus() {
		$("#cart_qty").val(parseInt($("#cart_qty").val()) + 1);
		if ($("#cart_qty").val() > 10) {//최대 수량 10
			alert("한번에 선택가능한 수량은 10개입니다.");
			$("#cart_qty").val(10);
		}
		priceUpdate();
	}
	
	function btn_minus() {
		
		$("#cart_qty").val(parseInt($("#cart_qty").val()) - 1);
		if ($("#cart_qty").val() < 1) {//최소 수량 1
			alert("최소 수량은 1개입니다.");
			$("#cart_qty").val(1);
		}
		priceUpdate();
	}
	
</script>

<%@ include file="../main/mainFooter.jsp"%>