<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
productList.jsp<br>
    <%@include file="../common/common.jsp"%>
     <%@ include file="../main/mainHeader.jsp"%> 
     
   <!--
    [스토어 교환권 구성] 이름은 스토어 결제내역
    상품코드 - 구분 - 상품명 - 구매수량 - 결제상태
    -->
    
 <style>
 	table{
 	text-align:left;
 	margin: auto;
 	width: 60%;
 	}
	.coupon{
	width: 750px;
	height: 25px;	
	border: 1px solid black;
	}
</style> 
    
	<table>
	<tr>
		<td>
	<font style="font-size: x-large;">스토어교환권</font><br><br>
		</td>
	</tr>
	</table>
	<table>
		<tr>
			<td align="left" style="font-size: small;">
				<b>- 보유하신 영화관람권/예매권 내역입니다.<br>- 소지하신 지류(종이)관람권은 등록 후 이용하실 수 있습니다.</b>
			</td>
		</tr>
	</table>

	
	<table border="1">
		<!-- 로그인한 아이디가 admin일때만 추가하기가 가능하도록 설정 -->
		<tr>
			<td>상품번호</td>
			<td>카테고리</td>
			<td>상품명</td>
			<td>설명</td>
			<td>가격</td>
			<td>적립포인트</td>
			<td>삭제</td>
			<td>수정</td>
		</tr>
		<c:forEach items="${productLists }" var="product">
			<tr>
				<td>${product.productcode }</td>
				<td><a href="detail.pd?product_code=${product.product_code }&pageNumber=${pageInfo.pageNumber } ">${product.category_name }</a></td>
				<td>${product.product_name }</td>
				<td>${product.product_detail }</td>
				<td>${product.product_price }</td>
				<td>${product.product_point }</td>
				<td><a href="delete.pd?product_code=${product.product_code }&pageNumber=${pageInfo.pageNumber } ">삭제</a></td>
				<td><a href="update.pd?product_code=${product.product_code }&pageNumber=${pageInfo.pageNumber } ">수정</a></td>
			</tr>
		</c:forEach>
	</table>
	${pageInfo.pagingHtml }


<div class="coupon">
<details>
	 <summary style="margin-left: 8px;">이용안내</summary>
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
  <%@ include file="../main/mainFooter.jsp"%>
 
 
 