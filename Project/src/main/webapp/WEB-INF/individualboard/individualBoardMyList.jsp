<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="../common/common.jsp"%>
<%@include file="../main/mainHeader.jsp"%>
	    
	individualMyBoard.jsp<br>
	
<style>
	.formList{
	margin: auto;
	text-align: center;
	}
	b{
	font-size: small;
	}	
</style>
	
	<table width="700px" class="formList">
		<tr>
			<td>
				<font style="font-size: x-large;">나의 문의내역</font>
			</td>
		</tr>
	</table><br>
	
	<table width="700px" style="margin: auto;">
		<tr>
			<td align="left">
				<p>
					<font style="font-size: small;">- 1:1문의를 통해 문의한 내역을 확인 하실 수 있습니다.</font>	
				</p>
			</td>
		</tr>
	</table><br>
	
<center>
			
	<table border="1" width="700px">
		<tr>
			<td align="right" colspan="6">
				<input type="button" onclick="location.href='insert.in'" value="1:1문의">
			</td>
		</tr>
		
		<tr>
			<th width="70">번호</th>
			<th>유형</th>
			<th>제목</th>
			<th>답변상태</th>
			<th>등록일</th>
			<th>정보확인</th>
		</tr>
		<c:if test="${fn:length(lists) == 0}">
			<tr>
				<td colspan="6" align="center">문의 내역이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="board" items="${lists}">
			<tr>
				<td align="center">${board.movie_code}</td>
				<td align="center">${board.question_type}</td>
				<td>
				<a <%-- href="detail.in?moviecode=${board.movie_code}&pageNumber=${pageInfo.pageNumber}" --%>>${board.subject}</a>
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
				<td align="center">
				<a href="detail.in?moviecode=${board.movie_code }&pageNumber=1">상세보기</a>
				</td>
			</tr>
		</c:forEach>	
</table>
</center>

<center>
	${pageInfo.pagingHtml}
</center>

<%@include file="../main/mainFooter.jsp"%>



	