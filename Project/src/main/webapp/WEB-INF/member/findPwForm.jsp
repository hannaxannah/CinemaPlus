<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>

<!-- 아이디찾기/비밀번호찾기 -->
<div class="container-find">
	<div class="find">아이디/비밀번호 찾기</div>
	<div class="container-findidpw">
		<div class="findmenu-id">
			<a href="findid.mb">아이디 찾기</a>
		</div>
		<div class="findmenu-pw">
			<a href="findpw.mb"><b>비밀번호 찾기</b></a>
		</div>
	</div>
	<div class="container-findForm">
		<!-- 비밀번호 찾기 폼 -->
		<form action="findpw.mb" method="POST">
			<table class="findPwForm">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" class="inputText1" name="member_id" placeholder="아이디">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" class="inputText1" name="member_name" placeholder="이름">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" class="inputText1" name="member_birth" placeholder="ex) 19990101">
					</td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td>
						<input type="text" class="inputText1" name="member_phone" placeholder="ex) 01012345678">
					</td>
				</tr>
			</table>
			<div class="find-idpw-button">
				<input type="submit" class="findButton" value="비밀번호 찾기" onClick="return check_find_pw()">
			</div>
		</form>
	</div>
</div>


<%@ include file="../main/mainFooter.jsp"%>