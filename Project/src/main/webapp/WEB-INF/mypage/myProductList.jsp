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
</style> 
    
	<table id="mytable">
	<tr>
		<td>
	<font style="font-size: x-large;">스토어 결제 내역</font><br><br>
		</td>
	</tr>
	</table>
	<table>
		<tr>
			<td align="left" style="font-size: small;">
				<font>- 스토어 결제 내역 입니다.</font>
			</td>
		</tr>
	</table>

		${fn:length(order)} 결제 갯수
<form name="myform" action="myProductList.mp" method="post">
	<table border="1" id="mytable">
		<!-- 로그인한 아이디가 admin일때만 추가하기가 가능하도록 설정 -->
		구매일/결제번호/구매 품목수/결제금액(card_number로 어디회사 카드인지 표시)/상세보기
		<tr align="center">
			<td>결제번호</td>
			<td>결제자 이름</td>
			<td>결제 품목</td>
			<td>결제금액</td>
			<td>구매일</td>
		</tr>
		
		
		<c:if test="${fn:length(order) == 0}">
			<tr>
				<td colspan="7" align="center">결제 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="order" items="${order}" >
			<tr>
				<td>${order.payment_code }</td>
				<td></td>
				<td></td>
				<td></td>
				<td>${order.payment_date }</td>
			</tr>
		</c:forEach>
	</table>
	${pageInfo.pagingHtml }
</form>

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
 
 
 