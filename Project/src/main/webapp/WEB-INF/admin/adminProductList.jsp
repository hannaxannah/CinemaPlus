<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./adminMenu.jsp" %>    
<%@ include file="../common/common.jsp" %>   
<style>
	.product_img:hover{
		transform: scale(2.5);
	}
</style>
<!-- 내용 -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>상품 리스트 <small>스토어에 등록 되어있는 상품 리스트</small></h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 리스트 <small>상품</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                     	설명
                    </p>
                    
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>상품 코드</th>
                          <th>상품 이미지</th>
                          <th>카테고리이름</th>
                          <th>상품이름</th>
                          <th>상품설명</th>
                          <th>갯수</th>
                          <th>상품 가격</th>
                          <th>상품 세일 가격</th>
                          <th>상품 상태</th>
                          <th>적립 포인트</th>
                        </tr>
                      </thead>


                      <tbody>
                 <c:forEach var="p" items="${ProductList}">
                 	<tr>
                          <td>${p.product_code}</td>
                          <td><img src="resources/store_images/${p.product_image}" class="product_img" style="width: 75px;"></td>
                          <td>${p.category_name}</td>
                          <td>${p.product_name}</td>
                          <td>${p.product_detail}</td>
                          <td>${p.product_qty}</td>
                          <td>${p.product_price}</td>
                          <td>${p.product_sprice}</td>
                          <td>
                          <c:choose>
                          	<c:when test="${p.product_state eq 0}">
                          		품절
                          	</c:when>
                          	<c:when test="${p.product_state eq 1}">
                          		상품대기
                          	</c:when>
                          	<c:when test="${p.product_state eq 2}">
                          		판매중
                          	</c:when>
                          	<c:when test="${p.product_state eq 3}">
                          		new
                          	</c:when>
                          	<c:when test="${p.product_state eq 4}">
                          		best
                          	</c:when>
                          	<c:when test="${p.product_state eq 5}">
                          		추천상품
                          	</c:when>
                          	<c:when test="${p.product_state eq 6}">
                          		대표상품
                          	</c:when>
                          </c:choose>
                          </td>
                          <td>${p.product_point}</td>
                   </tr>
                 </c:forEach>     
                       
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
        
<%@ include file="./adminBottom.jsp" %>            