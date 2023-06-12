<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>

<style>
	.container_coupon {
		width: 1080px;
		height: inherit;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		border: 1px solid;
		position: relative;
	}
	.title_coupon{
		margin : 30px ;
		
	}
	
	.coupon_container{
		margin : 30px ;
	}
	
	.coupon_box{
		float : left;
		margin : 20px;
	}
</style>

<div class="container_coupon">
	<div class="title_coupon">
		<h2>쿠폰 발급 페이지</h2>
	</div>
	
	<a href="couponCreate.store">[관리] 쿠폰 생성페이지</a>
	<a href="couponManagement.store">[관리] 쿠폰 관리페이지</a>
	
	<div class="coupon_container">
<c:forEach var="c" items="${couponList}">
			<table border="1" width="450px" height="150px" class="coupon_box">
				<tr>
					<td width="100px">
						쿠폰이름
					</td>
					<td>
						${c.coupon_name}
					</td>
					<td rowspan="3">
						<button type="button">발급</button>
					</td>
				</tr>
				<tr>
					<td>
						할인률
					</td>
					<td>
						${c.coupon_rate} %
					</td>
				</tr>
				<tr>
					<td>
						잔여수량
					</td>
					<td>
						${c.coupon_remain_qty}
					</td>
				</tr>
			</table>
</c:forEach>
	</div>
</div>

<%@ include file="../main/mainFooter.jsp"%>