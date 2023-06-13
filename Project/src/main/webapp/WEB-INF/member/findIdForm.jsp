<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>

<!-- 아이디찾기/비밀번호찾기 -->
<div class="container-find">
	<div class="find">아이디/비밀번호 찾기</div>
	<div class="container-findidpw">
		<div class="findmenu-id">
			<a href="findid.mb"><b>아이디 찾기</b></a>
		</div>
		<div class="findmenu-pw">
			<a href="findpw.mb">비밀번호 찾기</a>
		</div>
	</div>
	<div class="container-findForm">
		<!-- 아이디 찾기 폼 -->
		<form action="findid.mb" method="POST">
			<table class="findIdForm">
				<tr>
					<td>이름</td>
					<td>
						<input type="text" class="inputText1" name="member_name" placeholder="이름" id="member_name">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" class="inputText1" name="member_birth" placeholder="ex) 19990101" id="member_birth">
					</td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td>
						<input type="text" class="inputText1" name="member_phone" placeholder="ex) 01012345678" id="member_phone">
					</td>
				</tr>
			</table>
			<div class="find-idpw-button">
				<input type="submit" class="findButton" value="아이디 찾기" onClick="return check_find_id()">
			</div>
		</form>
	</div>
</div>


<%@ include file="../main/mainFooter.jsp"%>