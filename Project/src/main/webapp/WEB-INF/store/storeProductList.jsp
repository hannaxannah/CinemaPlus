<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>
<style>
	section{
		padding:0px;
	}
	*{
		box-sizing: border-box;
		text-decoration: none;
	}
	
	
	h1{
		text-transform: uppercase;
	    font-weight: 900;
	    border-left: 10px solid #fec500;
	    padding-left: 10px;
	    margin-bottom: 30px;
	    
	}
	
	h1.tit {
	    font-size: 1.8666em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	}
	
	h3{
		text-transform: uppercase;
	    font-weight: 900;
	    border-left: 10px solid #503396;
	    padding-left: 10px;
	    margin-bottom: 30px;
	}
	
	ul,li{
		list-style-type: none;
	}
	a{
		text-decoration: none;
		color : #000;
	}
	.coupon_banner{
		height: 100px;
    	margin-bottom: 20px;
    	text-align: center;
    	display:flex;
    	justify-content: center;
        align-items: center;
	}
	
	.cart{
		cursor: pointer;
		background-color: #eee;
		border-radius: 100%;
		margin: 0px;
        padding: 0px;
        width: 100%;
        height: 100%;
	}
	
	.cart:hover {
		transform: scale(1.1);
}
	.p_img{
		width: 243px;
		height:243px;
	}
	.coupon_banner{
		width : 1100px;
		height : 325px;
	}
</style>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="resources/store.min.css" media="all">
<div class="container_productList">
<section id="store">
	<!-- contents -->
<div id="contents" class="">

    <!-- inner-wrap -->
    <div class="inner-wrap">
		
		<c:choose>
			<c:when test="${loginInfo eq null}">
				<div class="coupon_banner" OnClick="location.href ='getCoupon.store'" style="cursor:pointer;border:solid 1px;">
					<img class="coupon_banner" src="resources/store_menuImages/쿠폰배너.png">
				</div>
			</c:when>
			<c:otherwise>
				<div class="coupon_banner" OnClick="location.href ='getCoupon.store?member_code=${loginInfo.getMember_code()}'" style="cursor:pointer;">
					<img class="coupon_banner" src="resources/store_menuImages/쿠폰배너.png">
				</div>
			</c:otherwise>
		</c:choose>
		
        <h1 class="tit">스토어</h1>
	
		
        <div class="tab-list fixed">
            <ul>
                <li class="on" id="storeTab_"><a href="list.store">전체 상품</a></li>
                <li id="storeTab_giftcard" class=""><a href="categorylist.store?category_name=기프트카드" ><span class="pointmall">기프트카드</span></a></li>
                <li id="storeTab_ticket" class=""><a href="categorylist.store?category_name=영화티켓" >영화 티켓</a></li>
                <li id="storeTab_food" class=""><a href="categorylist.store?category_name=팝콘/음료/스낵" >팝콘/음료/굿즈</a></li>
                <li id="storeTab_others" class=""><a href="categorylist.store?category_name=기타" >기타</a></li>
            </ul>
        </div>
        <!-- 전체 상품 -->
        <div id="divNewPrdtArea">
                <div class="tit-util mt70 mb15">
                    <h3 class="tit">전체 상품보기</h3>

                </div>

                <!-- store-list -->
                <div class="store-list">
                    <ul class="list">
                    		<c:forEach var="products" items="${products}" varStatus="status">
                    			<c:if test="${products ne null}">
                                <li class="">
							     <a class="category_product_list" href="productDetail.store?product_code=${products.product_code}">
							     	<c:choose>
							     		<c:when test="${products.product_state eq 0}">
							     			<div class="soldout">SOLD OUT</div>
							     		</c:when>
							     		<c:when test="${products.product_state eq 3}">
							     			<div class="label new">NEW</div>
							     		</c:when>
							     		<c:when test="${products.product_state eq 4 }">
							     			<div class="label event">BEST</div>
							     		</c:when>
							     		<c:when test="${products.product_state eq 5 }">
							     			<div class="label push">추천</div>
							     		</c:when>
							     		<c:when test="${products.product_state eq 6 }">
							     			<div class="label hot">대표상품</div>
							     		</c:when>
							     	</c:choose>
							             
							         <div class="img">
							         	<img class="p_img" src="<%=request.getContextPath()%>/resources/store_images/${products.product_image}" alt="${products_product_name }">
							         </div>
							         <div class="info">
							             <div class="tit">
							                 <p class="name">${products.product_name}</p>
							                 <p class="bundle">${products.product_detail}</p>
							             </div>
							             <div class="price">
							             <c:choose>
											<c:when test="${products.product_price eq 0}"> 
							                   	<p class="sale">
													<em>${products.product_sprice}원</em>
							                   	</p>
							                   </c:when>	
											<c:otherwise>
							                   	<p class="original">
													${products.product_price}원
							                   	</p>
							                   	<p class="sale">
													<em>${products.product_sprice}원</em>
							                   	</p>
							                    		</c:otherwise>
										</c:choose>
							                  <p class="ea">
							                  		<a href="addCart.store?product_code=${products.product_code}&cart_qty=1" style="width: 70px;" class="btn btn-sm btn-primary">
							                  			<i class="fa fa-shopping-cart" aria-hidden="true"></i>
							                  		</a>
							                  </p>
							             </div>
							         </div>
							     </a>
							 </li>
                              </c:if>  
                    		</c:forEach>
                    </ul>
                </div>
                <!--// store-list -->
            </div>
    
        <!--// 카테고리 별 상품 -->
    </div>
    <!--// inner-wrap -->

</div>
<!--// contents -->
 </section>
</div>


<%@ include file="../main/mainFooter.jsp"%>