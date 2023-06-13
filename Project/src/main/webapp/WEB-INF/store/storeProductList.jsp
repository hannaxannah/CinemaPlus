<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="./cartNavigation.jsp" %>

<style>
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
		padding : 35px;
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
		width:280px;
		height:280px;
	}
	
	.product_category_btn{
		margin-bottom: 100px!important;
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
					
                    <div class="category_product_list">
                    <c:forEach var="products" items="${products}">
                    	<div>
	                        <table style="float : left; margin: 0 0 40px 40px; border: 1px solid #e4e4e4; border-radius: 10px;">
	                       <tr>
	                       		<td height="200px" width="200px" style="background: #eee;">
				                    <a href="productDetail.store?product_code=${products.product_code}">
				                       	<img class="p_img" alt="상품 사진" src="<%=request.getContextPath()%>/resources/store_images/${products.product_image}">
				                    </a>
	                       		</td>
	                       	</tr>
	                       	<tr>
	                       		<td style="text-align: center">${products.product_name}</td>
	                       	</tr>
	                       	<tr>
	                       		<td style="text-align: center">${products.product_detail}</td>
	                       	</tr>
	                       	<tr>
	                       		<c:choose>
	                       			<c:when test="${products.product_price eq 0}"> 
	                       				<tr>
		                       				<td style="text-align: center">${products.product_sprice}</td>
		                       			</tr>
	                       			</c:when>
		                       		<c:otherwise>
		                       			<tr>
		                       				<td style="text-align: center;text-decoration : line-through;">${products.product_price}</td>
		                       			</tr>
		                       			<tr>
		                       				<td style="text-align: center">${products.product_sprice}</td>
		                       			</tr>
		                       		</c:otherwise>
	                       		</c:choose>
	                       	</tr>
	                       	
	                       </table>
	                      </div>
                    </c:forEach>
                   </div>   
                  </div>
                </div>
               
        </div>
 </section>
</div>


<%@ include file="../main/mainFooter.jsp"%>