<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../common/common.jsp"%>
    <%@ include file="../main/mainHeader.jsp"%> 
    
<!-- 
    [my쿠폰 혹은 쿠폰내역]
    쿠폰번호 - 회원코드 or 회원아이디 - 쿠폰이름 - 쿠폰상태(0:미사용 / 1:사용완료)
     -->
     
<style>
	table {
		margin: auto;
		margin-top: 80px;
	}
	.coupon{
	width: 700px;
	height: 25px;	
	border: 1px solid black;
	margin: auto;
	}
</style> 
    
<form name="myform" action="myCouponList.mp" method="post">
<table style="width: 700px;">
	<tr>
		<td>
			<font style="font-size: x-large; margin: auto;">MY 쿠폰</font>
		</td>
	</tr>
</table>
<c:forEach var="coupon" items="<%-- ${ coupons } --%>">
    <table class="table" border="1" style="width: 700px;">
        <tr>
          <th>쿠폰번호</th>
          <th>회원계정</th>
          <th>쿠폰명</th>
          <th>할인률</th>
          <th>쿠폰상태</th>
        </tr>
      
      	<c:if test="${fn:length(couponLists) == 0}">
			<tr>
				<td colspan="4" align="center">쿠폰 내역이 없습니다.</td>
			</tr>
		</c:if>
      
      
        <c:forEach var="item" items="<%-- ${ order.items } --%>" varStatus="status">
                <tr>
                <th><%-- ${ item.couponnumber} --%></th>
                <td><%-- ${ item.membercode} --%></td>
                <td><%-- ${ item.couponname} --%></td>
                <td><%-- ${ item.coupon_rate} coupon이랑 join해서 가져옴 --%></td>
                <td><%-- ${ item.couponstate } --%></td>
            </tr>       
        </c:forEach>
      
    </table>
</c:forEach><br><br>
</form>  
<div class="coupon" style="margin-bottom: 70px;">
<details>
	  <summary style="margin-left: 8px;">이용안내</summary><br>
 <div markdown="1">
 	<p>
영화 예매 시에는 다른 결제수단(신용카드, 예매쿠폰, 계좌이체 등)과 병행하여 사용이 가능합니다.<br>
등록 쿠폰이 특정 영화/극장 전용 쿠폰일 경우, 명시된 사용기간 내에만 사용이 가능합니다.<br>
온라인 전용으로 발행된 쿠폰의 경우에는 현장 사용이 불가능합니다.<br>
홈페이지 예매 후 예매취소는 홈페이지에서 상영시간 30분 전까지 가능합니다.<br>
취소 시 현금 환불은 되지 않으며,기존 쿠폰으로 유효기간 중에서 재사용 하실 수 있습니다.<br>
기타 할인쿠폰에 대한 문의사항이 있으실 경우, 1544-0101 또는 홈페이지를 이용해 주시기 바랍니다.<br>    
 	</p>
 </div>
 </details>
 </div><br><br><br><br><br><br>
 <%@ include file="../main/mainFooter.jsp"%>

 
 
 
 
 
 
 