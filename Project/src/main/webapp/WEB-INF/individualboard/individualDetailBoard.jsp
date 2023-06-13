<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
individualDetailBoard.jsp<br>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>    

<style type="text/css">
    table {
        margin: auto;
        width: 650px;
        height: 40px;
        text-align: center;
    }

    td {
        width: 25%;
        height: 40px;
    }
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/board/detailBoard.js"></script>

<input type="hidden" name="movie_code" id="movie_code" value="${board.movie_code}">
<table border="1" style="margin-top: 100px;">
    <tr>
        <td>번호</td>
        <td>${board.movie_code}</td>
        <td>계정 아이디</td>
        <td>${board.customer_id}</td>
    </tr>
    <tr>
        <td>문의유형</td>
        <td>${board.question_type}</td>
        <td>작성일</td>
        <td>
           <fmt:formatDate value="${board.writeDate}" type="date" pattern="yyyy-MM-dd"/>
        </td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${board.subject}</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3">
            <textarea rows="15" cols="70" style="resize: none;" readonly>${board.content}</textarea>
        </td>
    </tr>
    <tr>
        <td>참고이미지</td>
        <td colspan="3">${board.image}</td>
    </tr>

    <c:if test="${sessionScope.loginInfo.member_id eq 'admin'}">
        <tr>
            <td>답글 달기</td>
            <td colspan="3">
                <textarea name="individual_content" id="individual_content" rows="5" cols="70"
                          style="resize: none;">${board.individual_content}</textarea>
            </td>
        </tr>
    </c:if>
    <c:if test="${empty sessionScope.loginInfo || sessionScope.loginInfo.member_id ne 'admin'}">
        <tr>
            <td>답글</td>
            <td colspan="3">
                <textarea rows="5" cols="70" style="resize: none;" readonly>${board.individual_content}</textarea>
            </td>
        </tr>
    </c:if>
    
    <tr>
        <td colspan="4" align="center">
            <input type="button" value="글목록" onClick="location.href='list.in?pageNumber=${param.pageNumber}'">
            <c:if test="${sessionScope.loginInfo.member_id eq 'admin'}">
                <c:if test="${not empty board.individual_content}">
                    <input type="button" value="답글수정" onClick="replyUpdate();">
                    <input type="button" value="답글삭제" onClick="replyDelete();">
                </c:if>
                <c:if test="${empty board.individual_content}">
                    <input type="button" value="답글작성" onClick="replyInsert();">&nbsp;
                </c:if>
            </c:if>
        </td>
    </tr>
</table>

<%@ include file="../main/mainFooter.jsp"%>


