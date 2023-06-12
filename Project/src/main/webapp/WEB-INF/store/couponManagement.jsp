<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
 
 <table border="1">
 	<tr>
 		<th>쿠폰 번호</th>
 		<th>쿠폰 이름</th>
 		<th>할인률</th>
 		<th>쿠폰 발급 수량</th>
 		<th>쿠폰 잔여 수량</th>
 	</tr>
 	<c:forEach var="c" items="${couponList}">
	 	<tr>
	 		<td>${c.coupon_code}</td>
	 		<td>${c.coupon_name}</td>
	 		<td>${c.coupon_rate}</td>
	 		<td>${c.coupon_qty}</td>
	 		<td>${c.coupon_remain_qty}</td>
	 	</tr>
 	</c:forEach>	
 	
 
 </table>
 <a href="couponCreate.store">쿠폰 생성페이지</a>
 <a href="getCoupon.store">쿠폰 발급페이지</a>