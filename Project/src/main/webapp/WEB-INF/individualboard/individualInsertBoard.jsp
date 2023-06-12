<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
individualInsertBoard.jsp<br>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>    

<style>
    .t_red {
        color: #f55500
    }

    .err {
        font-size: 8px;
        color: red;
    }
    th {
	height: 30px;
	}
    
</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/board/insertBoard.js"></script>

<%
    String[] questionArr = {"영화정보문의", "회원 및 포인트문의", "예매/결제문의", "이벤트문의", "일반문의", "제안/건의"};
%>

<table  width="55%" style="text-align: left; margin: auto;">
<tr>
	<td>
<h3 align="left">1:1문의</h3><br>
	</td>
</tr>
<tr>
	<td>
	<p align="left">
    <b>고객님의 문의에 답변하는 직원은 <font color="red">고객 여러분의 가족 중 한 사람일 수 있습니다.</font></b><br>
    고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br>
    관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br><br>

    문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.<br><br><br>
</p>
	</td>
</tr>
</table>

<h2 align="center">문의글 작성</h2>
<form name="boardForm" action="insert.in" method="POST" enctype="multipart/form-data" >
    <table width="55%" border="1" style="margin: auto;">
        <caption style="text-align: right;"><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
        <colgroup>
            <col width="20%">
            <col width="*">
        </colgroup>
        <tr>
            <th>문의선택<span class="t_red">*</span></th>
            <td>
                <input id="select_type" name="select_type" size="60" value="${board.select_type}">
                <form:errors cssClass="err" path="select_type"/>
            </td>
        </tr>

        <tr>
            <th>문의유형<span class="t_red">*</span></th>
            <td>
                <select id="question_type" name="question_type">
                    <option value="">문의유형선택</option>
                    <c:forEach var="question_type" items="<%=questionArr%>">
                        <option value="${question_type}"
                                <c:if test="${board.question_type.contains(question_type)}">selected</c:if>>${question_type}</option>
                    </c:forEach>
                </select>
                <form:errors cssClass="err" path="question_type"/>
            </td>
        </tr>

        <tr>
            <th>이름<span class="t_red">*</span></th>
            <td>
                <%--<input id="name" name="name" value="${board.name}" size="35%"/>--%>
                ${name}
            </td>
        </tr>
        <tr>
            <th>이메일<span class="t_red">*</span></th>
            <td>
                <%--<input id="email" name="email" value="${board.email}" size="35%"/>--%>
                        ${email}
            </td>
        </tr>
        <tr>
            <th>휴대전화<span class="t_red">*</span></th>
            <td>
                <%--<input id="telnum" name="telnum" value="${board.telnum}" size="35%"/>--%>
                ${phone}
            </td>
        </tr>
        <tr>
            <th>제목<span class="t_red">*</span></th>
            <td>
                <input id="subject" name="subject" value="${board.subject}" size="98%"/>
                <form:errors cssClass="err" path="subject"/>
            </td>
        </tr>
        <tr>
            <th>내용<span class="t_red">*</span></th>
            <td>
               <textarea style="resize: none;" id="content" name="content" cols="103" rows="15"
					placeholder="- 문의내용에 개인정보(이름,연락처,카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.
- 회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다.">${board.content}</textarea>
                <form:errors cssClass="err" path="content"/>
            </td>
        </tr>
        <tr>
            <th>사진첨부<span class="t_red">*</span></th>
            <td>
                <input type="file" name="upload" id="upload" value="파일선택"><br>
                <span><font style="font-size: small;"> * 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</font></span>
                <form:errors cssClass="err" path="image"/>
            </td>
        </tr>
        <tr>
            <th style="height: 40px;">옵션</th>
            <td>
                <input type="checkbox" id="issecret" name="issecret" value="Y">
                <span style="font-size: unset;">비밀글 설정</span>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="등록">
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form><br><br>





<%@ include file="../main/mainFooter.jsp"%>








