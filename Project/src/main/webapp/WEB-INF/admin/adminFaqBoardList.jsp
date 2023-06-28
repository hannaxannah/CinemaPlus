<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./adminMenu.jsp" %>    
<%@ include file="../common/common.jsp" %>   

	adminFaqBoardList.jsp<br>
	
	<!-- 내용 -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>자주묻는질문 게시판 <small>전체</small></h3>
              </div>

            </div>
	
	 <div class="clearfix"></div>
	 
	  <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>자주묻는질문 리스트 <small>게시판</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                     	설명
                    </p>
                    
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                         	<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
                        </tr>
                      </thead>

                      <tbody>

						<c:if test="${fn:length(boardLists) == 0}">
							<tr>
								<td colspan="6" align="center">목록이 없습니다.</td>
							</tr>
						</c:if>

								<c:if test="${fn:length(boardLists) != 0}">
				<c:forEach var="board" items="${boardLists}">
                 	<tr>
                      <td align="center">${board.movie_num}</td>
					  <td align="center">${board.classification}</td>
					  <td align="left">
					<a href="detail.bd?movienum=${board.movie_num }&pageNumber=${pageInfo.pageNumber}">${board.question}</a>
					  </td>
					  <td align="center"><fmt:formatDate value="${board.qdate}" type="date" pattern="yyyy-MM-dd"/> </td>
					  <td align="center">${board.hits}</td>
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
	
<%@ include file="./adminBottom.jsp" %>            

