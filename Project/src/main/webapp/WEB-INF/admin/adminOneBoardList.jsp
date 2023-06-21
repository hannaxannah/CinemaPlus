<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./adminMenu.jsp" %>    
<%@ include file="../common/common.jsp" %>   
<!-- 	adminOneBoardList.jsp<br> -->
		
	  <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>문의게시판 <small>전체</small></h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>전체 문의 리스트 <small>게시판</small></h2>
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
									<th>계정ID</th>
									<th>유형</th>
									<th>제목</th>
									<th>답변상태</th>
									<th>등록일</th>
								</tr>
							</thead>

							<c:if test="${fn:length(inboardLists) == 0}">
								<tr>
									<td colspan="6" align="center">목록이 없습니다.</td>
								</tr>
							</c:if>

							<tbody>
          <c:if test="${fn:length(inboardLists) != 0}">
			<c:forEach var="board" items="${inboardLists}"> 
                 	<tr>
                        <td align="center">${board.movie_code}</td>
				<td align="center">${board.customer_id}</td>
				<td align="center">${board.question_type}</td>
				<td>
				<a href="inBoarddetail.admin?moviecode=${board.movie_code}&pageNumber=${pageInfo.pageNumber}">${board.subject}</a>
				</td>
				<td align="center">
					<c:if test="${empty board.individual_content}">
						미답변
					</c:if>
					<c:if test="${not empty board.individual_content}">
						답변완료
					</c:if>
				</td>
				<td align="center">
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
	
	<%-- 
<center>
	<!-- 검색 설정은 내부브라우저 말고 외부브라우저에서 실행 -->
	<form action="board.admin" method="get" style="margin-left: 550px">
		<select name="whatColumn">
			<option value="">전체</option>
			<option value="subject">제목</option>
			<option value="customer_id">계정ID</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	<table width="70%">
		<tr>
			<td align="left">
				<font style="font-size: small;">
				- 1:1문의를 통해 남기신 내역을 검색을 통해 확인 하실 수 있습니다.<br>
				- 접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.
				</font>
			</td>
		</tr>
	</table>
	
	<table border="1" width="70%">
		<tr>
			<td align="center">
				<span><b>전체 (${pageInfo.totalCount}건)</b></span>
			</td>
			<td align="right" colspan="6">
				<input type="button" onclick="location.href='insert.in'" value="1:1문의">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>계정ID</th>
			<th>유형</th>
			<th>제목</th>
			<th>답변상태</th>
			<th>등록일</th>
		</tr>
		
	<c:if test="${fn:length(inboardLists) == 0}">
		<tr>
			<td colspan="6" align="center">
				목록이 없습니다.
			</td>
		</tr>
	</c:if>
		
	<c:if test="${fn:length(inboardLists) != 0}">
		<c:forEach var="board" items="${inboardLists}">
			<tr>
				<td align="center">${board.movie_code}</td>
				<td align="center">${board.customer_id}</td>
				<td align="center">${board.question_type}</td>
				<td>
				<a href="detail.in?moviecode=${board.movie_code}&pageNumber=${pageInfo.pageNumber}">${board.subject}</a>
				</td>
				<td align="center">
					<c:if test="${empty board.individual_content}">
						미답변
					</c:if>
					<c:if test="${not empty board.individual_content}">
						답변완료
					</c:if>
				</td>
				<td align="center">
				<fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</center>
 --%>

<%@ include file="./adminBottom.jsp" %>            



	