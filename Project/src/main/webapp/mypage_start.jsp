<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ include file="../WEB-INF/common/common.jsp" %>   
    	
    	
 로그인접속자 : ${loginInfo.member_id}<br>
    	
	
    <%
    	String viewMember = "list.cm";
    	String login = "memberlogin.mb";
	%>

 <table border="1" width="200px" style="text-align: center;">
 <tr>
 	<td>
<a href="<%=login %>">로그인</a><br>
 	</td>
 </tr>
 <tr>
 	<td>
<a href="insert.in">1:1문의</a><br>
 	</td>
 </tr>
  <tr>
 	<td>
<a href="list.in">문의내역</a><br>
 	</td>
 </tr>
  <tr>
 	<td>
<a href="list.bd">FAQ목록보기</a><br>
 	</td>
 </tr>
  <tr>
 	<td>
<a href="">스토어 목록</a><br>
 	</td>
 </tr>
  <tr>
 	<td>
<a href="<%=viewMember %>">회원 목록보기</a><br>
 	</td>
 </tr>
  <tr>
 	<td>
<a href="mypage_update.mb?member_id=${loginInfo.member_id}">회원정보 수정하기</a><br>
 	</td>
 </tr>
 <tr>
 	<td>
<a href="mypage_delete.mb?member_id=${loginInfo.member_id}">회원 탈퇴하기</a><br>
 	</td>
 </tr>
 <tr>
 	<td>
<a href="mypage_main.mp?member_id=${loginInfo.member_id}">마이페이지 메인</a><br>
 	</td>
 </tr>

</table>    
    