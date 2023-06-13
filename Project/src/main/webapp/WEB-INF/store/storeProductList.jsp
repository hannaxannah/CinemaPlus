<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>

<style>
	*{
		box-sizing: border-box;
		text-decoration: none;
	}
	
	ul,li{
		list-style-type: none;
	}
	
	.container_productList {
		width: 1080px;
		height: inherit;
		margin: 0 auto;
		display: flex;
		flex-direction: column;
		border: 1px solid;
		position: relative;
	}

	.contents{
		overflow: hidden;
		padding : 40px 0 0 0;
	}
	
	.product_tab .clearfix{
		width : 100%;
		margin : 20px 0 0px 40px;
	}
	
	.clearfix .product_category{
		list-style:none;
		float:left;
		border: 1px solid #ebebeb;
		width : 19%;
		text-align: center;
	}
	
	.clearfix a b{
		font-size: 20px;
	}
	
	.coupon_banner{
		text-align : center;
		margin : 30px;
	}
	
	.p_img{
		width:100%;
		height:100%;
	}
	
	.product_category_btn{
		margin-bottom: 100px!important;
	}
	
	.products{
		position: relative;
	    float: left;
	    width: 245px;
	    margin: 0 0 0 40px;
	    border-radius: 10px;
	    box-sizing: border-box;
	}
	
	.product_imagebox{
		height: 243px;
	    font-size: 0;
	    line-height: 243px;
	    text-align: center;
	    background: #eee;
	    border-radius: 10px 10px 0 0;
	    overflow: hidden;
	}
	
	.product_info{
		padding: 0 19px;
	    border-top: 1px solid #e4e4e4;
	    line-height: 1.3;
	}
	
	.product_attribute{
		height: 115px;
	    padding-top: 20px;
	    border-bottom: 1px solid #e4e4e4;
	}
	
	.product_name{
		overflow: hidden;
	    height: 39px;
	    margin: 0 0 10px 0;
	    color: #222;
	    font-weight: 700;
	}
	
	.product_detail{
		font-size: .8667em;
   	 	color: #666;
	}
	
	.product_pricebox{
		text-align : center;
		position: relative;
	    padding: 35px 0 0 0;
	    line-height: 1.1;
	}
	.category_product_list{
		position: relative;
	    display: block;
	    height: 435px;
	    text-decoration: none;
	    border: 1px solid #e4e4e4;
	    border-radius: 10px;
	}
	.product_sprice{
		margin: 0;
    	color: #503396;
	}
	.product_price{
		position: absolute;
	    left: 0;
	    top: 15px;
	    color: #666;
	    text-decoration: line-through;
	}
	
	.product_pricebox em{
	    font-size: 1.6em;
	    font-weight: 400;
	    vertical-align: middle;
	    font-style: normal;
	}
</style>

<div class="container_productList">

<section id="store">
        <div class="container">
            <div class="row">
                <div class="contents">
                	<div class="product_tab">
	                    <h2>스토어</h2>
							<div class="product_category_btn">
								 <ul class="clearfix" width="100%">
			                     		<li class="product_category"><a href=""><b>전체</b></a></li>
			                     		<li	class="product_category"><a href=""><b>기프트 카드</b></a></li>
			                     		<li class="product_category"><a href=""><b>티켓</b></a></li>
			                     		<li class="product_category"><a href=""><b>팝콘/음료/스낵</b></a></li>
			                     		<li class="product_category"><a href=""><b>기타</b></a></li>
								</ul>
							</div>
							<div class="coupon_banner">
								<a href="getCoupon.store">
									쿠폰발급
								</a>
							</div>
					</div>
					
                    <c:forEach var="products" items="${products}">
                    
	                       		<!-- <td height="200px" width="200px" style="background: #eee;"> -->
	                       		<li class="products">
				                    <a class="category_product_list" href="productDetail.store?product_code=${products.product_code}">
				                    <div class="product_imagebox">
				                       	<img class="p_img" alt="상품 사진" src="<%=request.getContextPath()%>/resources/store_images/${products.product_image}">
				                    </div>
									<div class="product_info">
					                    <div class="product_attribute">
					                    	<p class="product_name">
					                    		${products.product_name}
					                    	</p>
					                    	<p class="product_detail">
					                    		${products.product_detail}
					                    	</p>
					                    </div>
					                    <div class="product_pricebox">
					                    	<c:choose>
												<c:when test="${products.product_price eq 0}"> 
							                    	<p class="product_sprice">
														<em>${products.product_sprice}원</em>
							                    	</p>
							                    </c:when>	
												<c:otherwise>
							                    	<p class="product_price">
														${products.product_price}원
							                    	</p>
							                    	<p class="product_sprice">
														<em>${products.product_sprice}원</em>
							                    	</p>
					                       		</c:otherwise>
											</c:choose>
					                    </div>
									</div>				                    
				                    </a>
	                       		</li>
	                       		
	                       	<tr>
	                       		
	                       	</tr>
	                       	
	                      
                    </c:forEach>
                   </div>   
                  </div>
                </div>
               
        </div>
 </section>
</div>


<%@ include file="../main/mainFooter.jsp"%>