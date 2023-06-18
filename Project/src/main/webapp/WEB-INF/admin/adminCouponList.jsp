<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./adminMenu.jsp" %>    
    
<!-- 내용 -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>쿠폰리스트 <small>전체 생성되있는 쿠폰 리스트</small></h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>쿠폰 리스트 <small>쿠폰</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                     	설명
                    </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>쿠폰 고유 코드</th>
                          <th>쿠폰 이름</th>
                          <th>할인률</th>
                          <th>발급수량</th>
                          <th>여유 수량</th>
                        </tr>
                      </thead>


                      <tbody>
                 <c:forEach var="c" items="${couponList}">
                 	<tr>
                          <td>${c.coupon_code}</td>
                          <td>${c.coupon_name}</td>
                          <td>${c.coupon_rate}%</td>
                          <td>${c.coupon_qty}개</td>
                          <td>${c.coupon_remain_qty}개</td>
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