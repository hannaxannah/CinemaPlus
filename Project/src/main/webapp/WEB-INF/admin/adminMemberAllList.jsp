<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./adminMenu.jsp" %>    
<%@ include file="../common/common.jsp" %>   
<!-- 	adminOneBoardList.jsp<br> -->
		
	  <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>회원 <small>전체</small></h3>
              </div>

            </div>

            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 리스트</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30" style="color:#F15F5F">
                     	* 총 회원 수는 ${fn:length(memberList)}명 입니다.
                    </p>
                    <table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>아이디</th>
									<th>생년월일</th>
									<th>핸드폰</th>
									<th>이메일</th>
								</tr>
							</thead>

							<c:if test="${fn:length(memberList) == 0}">
								<tr>
									<td colspan="6" align="center">회원이 없습니다.</td>
								</tr>
							</c:if>

							<tbody>
          <c:if test="${fn:length(memberList) != 0}">
			<c:forEach var="memberList" items="${memberList}"> 
                 	<tr>
                        <td align="center">${memberList.member_code}</td>
				<td align="center">${memberList.member_name}</td>
				<td align="center">${memberList.member_id}</td>
				<td align="center">${memberList.member_birth}</td>
				<td align="center">${memberList.member_phone}</td>
				<td align="center">${memberList.member_email}</td>
				<fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd"/>
				</td>
                   </tr>
                 </c:forEach>     
                      </c:if> 
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



	