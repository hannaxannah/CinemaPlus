<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../common/common.jsp"%>
    <%@ include file="../main/mainHeader.jsp"%> 
    
<!-- 
    [my쿠폰 혹은 쿠폰내역]
    쿠폰번호 - 회원코드 or 회원아이디 - 쿠폰이름 - 쿠폰상태(0:미사용 / 1:사용완료)
     -->
     
<style>
	.coupon{
	width: 750px;
	height: 25px;	
	border: 1px solid black;
	}
</style> 
    
<form name="" action="myCouponList.mp" method="post">
<h2>MY쿠폰</h2>
<hr>
<c:forEach var="coupon" items="<%-- ${ coupons } --%>">
    <table class="table">
        <thead class="thead-light">
        <tr>
          <th>쿠폰번호</th>
          <th>회원코드</th>
          <th>쿠폰명</th>
          <th>쿠폰상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="<%-- ${ order.items } --%>" varStatus="status">
                <tr>
                <th>${ item.couponnumber}</th>
                <td>${ item.membercode}</td>
                <td>${ item.couponname}</td>
                <td>${ item.couponstate }</td>
            </tr>       
        </c:forEach>
      </tbody>
    </table>
</c:forEach><br><br>
</form>  
<div class="coupon">
<details>
	  <summary style="margin-left: 8px;">이용안내</summary>
 <div markdown="1">
 	<p>
등록 쿠폰이 특정 영화/극장 전용 쿠폰일 경우, 지정 영화 및 극장에서 명시된 사용기간 내에만 사용이 가능합니다.<br>
온라인 전용으로 발행된 쿠폰의 경우에는 현장 사용이 불가능합니다.<br>
영화 예매 시에는 다른 결제수단(신용카드, 예매쿠폰, 계좌이체 등)과 병행하여 사용이 가능합니다.<br>
홈페이지 예매 후 예매취소는 홈페이지에서 상영시간 30분 전까지 가능합니다.<br>
취소 시 현금 환불은 되지 않으며,기존 쿠폰으로 유효기간 중에서 재사용 하실 수 있습니다.<br>
기타 할인쿠폰에 대한 문의사항이 있으실 경우, 1544-0101 또는 홈페이지를 이용해 주시기 바랍니다.<br>    
 	</p>
 </div>
 </details>
 </div>
 <%@ include file="../main/mainFooter.jsp"%>

 
 
 
 
 
 
 