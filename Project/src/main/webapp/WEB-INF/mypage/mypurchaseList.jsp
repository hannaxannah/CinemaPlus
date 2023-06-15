<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mypageList.jsp<br>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>    

<!--
 [ 예매내역 테이블 구성 순서]
예매번호or예매코드 - 영화관 - 영화명 - 상영일or구매일 - 결제금액 순으로 구성 + 예매취소
-> 예매번호 클릭하면 예매상세보기 페이지로 이동
-> 예매내역이 없을 시에는 "예매 내역이 없습니다." 가 나오도록 함
 
 아래에는 
 [구매내역 테이블 구성 순서]
 구매번호 - 구분(극장or영화관) -  영화명 - 상영일 - 취소금액
 -> 구매내역이 없을 시에는 "구매 내역이 없습니다." 가 나오도록 함
 
 + 맨 아래에는 이용안내 토글 추가
 [스토어 구매/취소 안내]
스토어 상품은 구매 후 취소가능기간 내 100% 환불이 가능하며, 부분환불은 불가 합니다.
(ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다)
스토어 교환권은 MMS로 최대 1회 재전송 하실 수 있습니다.
[모바일오더 구매/취소 안내]
ⓘ 모바일오더는 모바일앱을 통해 이용하실 수 있습니다.
모바일오더는 구매 후 즉시 조리되는 상품으로 취소가 불가 합니다.
극장 매점에서 주문번호가 호출되면 상품을 수령하실 수 있습니다.
극장 상황에 따라 상품준비시간이 다소 길어질 수 있습니다.
 -->

<style>
	table {
	margin: auto;
	margin-top: 50px;
	width: 730px;
	}
	.purchase{
	width: 730px;
	height: 25px;	
	border: 1px solid black;
	margin: auto;
	}
</style> 

<form name="mypageList" action="myPurchaseList.mp" method="POST">
 <table>
	<tr>
		<td>
			<font style="font-size: x-large; margin: auto;">예매/구매내역</font>
		</td>
	</tr>
</table>
<c:forEach var="order" items="<%-- ${ orders } --%>">
    <table class="table" border="1">
        <tr>
          <th>예매번호</th>
          <th>영화관</th>
          <th>영화명</th>
          <th>수량</th>
          <th>결제금액</th>
          <th>합계</th>
          <th>예매취소</th>
        </tr>
      
      	<c:if test="${fn:length(purchaseLists) == 0}">
			<tr>
				<td colspan="7" align="center">예매/구매 내역이 없습니다.</td>
			</tr>
		</c:if>
    <%--   
      <tbody>
        <c:forEach var="item" items=" ${ order.items }" varStatus="status">
                <tr>
                <th>${ status.count }</th>
                <td>${ item.screen }</td>
                <td>${ item.movietitle}</td>
                <td>${ item.movieqty }</td>
                <td>${ item.price}</td>
                <td>${ item.price * item.movieqty }</td>
                <td><a href="location.href=''">예매취소</a></td>
            </tr>       
        </c:forEach>
      </tbody>
       --%>
      
    </table>
</c:forEach><br><br>

<table>
	<tr>
		<td>
			<font style="font-size: x-large; margin: auto;">취소내역</font>
		</td>
	</tr>
</table>
<c:forEach var="order" items="<%-- ${ orders } --%>">
    <table class="table" border="1">
        <thead class="thead-light">
        <tr>
          <th>예매번호</th>
          <th>영화관</th>
          <th>영화명</th>
          <th>수량</th>
          <th>결제금액</th>
          <th>합계</th>
        </tr>
      </thead>
      
      <c:if test="${fn:length(movieOrderLists) == 0}">
		<tr>
			<td colspan="6" align="center">
				취소내역이 없습니다.
			</td>
		</tr>
	</c:if>
      
     <%--  
      <tbody>
        <c:forEach var="item" items="${ order.items }" varStatus="status">
                <tr>
                <th>${ status.count }</th>
                <td>${ item.screen }</td>
                <td> ${ item.movietitle}</td>
                <td>${ item.movieqty }</td>
                <td>${ item.price}</td>
                <td>${ item.price * item.movieqty }</td>
            </tr>       
        </c:forEach>
      </tbody>
       --%>
      
    </table>
</c:forEach><br><br><br>
 </form>

 <div class="purchase">
  <details>
	  <summary style="margin-left: 8px;">이용안내</summary><br>
 <div markdown="1">
 	<p>
만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.<br>
예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.<br><br>
<font style="font-weight: bold;">티켓교환 안내</font><br>
무인발권기 이용이 어려우신경우, 티켓교환권을 출력하여 티켓을 발권하실 수 있습니다.<br>
(티켓교환권 출력이 어려운경우 예매번호 확인을 통해 티켓 발권이 가능합니다)<br><br>
<font style="font-weight: bold;">예매취소 안내</font><br>
위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.<br>
온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.<br>
LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.<br>
관람 4일전 : 취소 가능<br>
관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능<br>
관람 당일 : 취소 및 환불 불가<br>
공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.<br>
발권된 티켓은 상영시간 전까지 현장 방문 시에만 취소가 가능합니다.<br>
 	</p>
 </div>
 </details>
</div>
<div style="height: 500px"></div>


<%@ include file="../main/mainFooter.jsp"%>

