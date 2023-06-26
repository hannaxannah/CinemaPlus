<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../common/common.jsp"%>
    <%@ include file="../main/mainHeader.jsp"%> 
    <%@ include file="mypageSidebar.jsp"%>
     
<style>
	table {
		margin: auto;
		margin-top: 30px;
	}
	.coupon{
	width: 700px;
	height: 25px;	
	border: 1px solid black;
	margin: auto;
	}
	
	.label-available {
    background-color: #5cb85c;
	}
	
	.label-notavailable {
    background-color: red;
	}
	
	.label {
	    display: inline;
	    padding: .2em .6em .3em;
	    font-size: 75%;
	    font-weight: 700;
	    line-height: 1;
	    color: #fff;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    borde
</style> 
 
 <div class="col-lg-9" style="padding: 20px;">
		<div class="card info-card customers-card">
			<div class="card-body align-items-center justify-content-center">   
					<div class="container bootdey">
					     <div class="panel panel-default panel-order">
					        <div class="panel-heading">
					            <strong>나의 쿠폰 리스트</strong>
					            </div>
					
					        <div class="panel-body">
				<c:forEach var="coupon" items="<%-- ${ coupons } --%>">
				    <table class="table" border="1" style="width: 700px;">
				        <tr>
				          <th>쿠폰번호</th>
				          <th>쿠폰명</th>
				          <th>할인률</th>
				          <th>쿠폰상태</th>
				        </tr>
				      
				      	<c:if test="${fn:length(myCouponListInfo) == 0}">
							<tr>
								<td colspan="4" align="center">쿠폰 내역이 없습니다.</td>
							</tr>
						</c:if>
				      
				      
				        <c:forEach var="c" items="${myCouponListInfo}" varStatus="status">
				                <tr>
				                <th>${c.coupon_code }</th>
				                <th>${c.coupon_name }</th>
				                <th>${c.coupon_rate } %</th>
				                <th>
				                <c:choose>
				                	<c:when test="${c.coupon_state eq 0}">
				                		<label class="label label-available">사용 가능</label>
				                	</c:when>
				                	<c:otherwise>
				                		<label class="label label-notavailable">사용 완료</label>
				                	</c:otherwise>
				                </c:choose>
				                </th>
				            </tr>       
				        </c:forEach>
				      
				    </table>
				</c:forEach><br><br>
</form>  
</div>
</div>
</div>
</div>
</div>
</div>
</div>
 <%@ include file="../main/mainFooter.jsp"%>

 
 
 
 
 
 
 