<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>

<style>
	body{
		background-color: #FFF;
	}
	
	a{
		text-decoration: none;
		color : #000;
	}
	.container_coupon {
		width: 1080px;
		height: inherit;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		position: relative;
		background-color: #FFF;
		margin-bottom: 200px;
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
	
	@import url('https://fonts.googleapis.com/css?family=Oswald');
* {
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box
}

.fl-left {
    float: left;
    border : 1px solid #ccc;
}

.fl-right {
    float: right
}

h1 {
    text-transform: uppercase;
    font-weight: 900;
    border-left: 10px solid #fec500;
    padding-left: 10px;
    margin-bottom: 30px
}

.row {
    overflow: hidden;
    width: 45%;
    float: left;
    margin: 10px;
}

.card {
    display: table-row;
    width: 100%;
    background-color: #fff;
    color: #989898;
    margin-bottom: 10px;
    font-family: 'Oswald', sans-serif;
    text-transform: uppercase;
    border-radius: 4px;
    position: relative
}

.card+.card {
    margin-left: 2%
}

.date {
    display: table-cell;
    width: 200px;
    position: relative;
    text-align: center;
    border-right: 2px dashed #dadde6
}

.date time {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%)
}

.date time span {
    display: block
}

.date time span:first-child {
    color: #2b2b2b;
    font-weight: 600;
    font-size: 220%
}

.date time span:last-child {
    text-transform: uppercase;
    font-weight: 600;
    margin-top: -10px
}

.card-cont {
    display: table-cell;
    width: 65%;
    font-size: 85%;
    padding: 10px 10px 30px 50px
}

.card-cont h3 {
    color: #3C3C3C;
    font-size: 130%
}

.card-cont>div {
    display: table-row
}

.card-cont .even-date i,
.card-cont .even-info i,
.card-cont .even-date time,
.card-cont .even-info p {
    display: table-cell
}

.card-cont .even-date i,
.card-cont .even-info i {
    padding: 5% 5% 0 0
}


.card-cont .even-date time span {
    display: block
}

.issued {
    display: block;
    text-decoration: none;
    width: 80px;
    height: 30px;
    background-color: #D8DDE0;
    color: #fff;
    text-align: center;
    line-height: 30px;
    border-radius: 2px;
}
.issue{
	display: block;
    text-decoration: none;
    width: 80px;
    height: 30px;
	background-color: #037FDD;
    color: #fff;
    text-align: center;
    line-height: 30px;
    border-radius: 2px;
}

@media screen and (max-width: 860px) {
    .card {
        display: block;
        float: none;
        width: 100%;
        margin-bottom: 10px
    }
    .card+.card {
        margin-left: 0
    }
    .card-cont .even-date,
    .card-cont .even-info {
        font-size: 75%
    }
}
</style>
<div class="container_coupon">
	<div class="coupon_container">
	<section class="container">
<h1>쿠폰 발급</h1>
<c:forEach var="c" items="${couponList}">

  <div class="row">
    <article class="card fl-left">
      <section class="date">
        <time datetime="23th feb">
        	<span>${c.coupon_rate}%</span>
			  <c:choose>
				<c:when test="${fn:contains(myCouponList,c.coupon_code)}"> 
					<button class="issued" disabled="disabled">발급완료</button>
				</c:when>
				<c:when test="${c.coupon_remain_qty eq 0}"> 
					<button class="issued" disabled="disabled">발급종료</button>
				</c:when>
				<c:otherwise>
					<a class="issue" href="couponIssue.store?coupon_code=${c.coupon_code}&member_code=${loginInfo.getMember_code()}">쿠폰 발급</a>
				</c:otherwise>
			</c:choose>  
        </time>
      </section>
      <section class="card-cont">
        <h3>${c.coupon_name}</h3>
        <div class="even-date">
         <i class="fa fa-calendar"></i>
         <time>
         </time>
        </div>
        <div class="even-info">
          <i class="fa fa-map-marker"></i>
          <p>
            잔여 수량 : ${c.coupon_remain_qty} 개
          </p>
        </div>
      </section>
    </article>
  </div>
 </c:forEach>   
  
</section>
 
	</div>
</div>

<%@ include file="../main/mainFooter.jsp"%>