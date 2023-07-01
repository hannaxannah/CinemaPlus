<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
<style type="text/css">
	table{
		margin: auto;
		width: 500px;
		height: 50px;
	}
	.err{
		color: red;
		font-size: 7px;
		font-weight: bold;
	}
</style>

<div class="col-lg-9" style="padding: 20px;">
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">

<form:form commandName="member"  action="myDelete.mp" method="post">
<input type="hidden" name="member_code" value="${member.member_code}">
<table style="margin-top: 50px; margin-left: 230px;">
	<tr align="left">
		<td colspan="2"><font style="font-size: medium;">* 회원님의 정보를 입력하시고 탈퇴 버튼을 클릭해주세요.</font></td>
	</tr>
	<tr>
		<th style="font-weight: 500;">아이디 </th>
		<td>
			 <input class="inputText3"  type="text" name="member_id" size="30" value="${loginInfo.member_id}" readonly>
		</td>
	</tr>
	
	<tr>
	<th style="font-weight: 500;">비밀번호 </th>
		<td>
		<input class="inputText3"  type="password" name="member_pw" size="30">
		</td>
	</tr>
	
	<tr>
	<th style="font-weight: 500;">연락처 </th>
		<td>
			<input class="inputText3"  type="text" name="member_phone" size="30" placeholder="'-'를 제외하고 입력하세요">
		</td>
	</tr>
	
	<tr align="left">
		<td colspan="2">
			<input type="submit" value="탈퇴" onclick="location.href='myDelete.mp'" style="background-color: #EBE4FC; color:#6b39ea; border-radius: 5px; padding: 5px; border:0; margin-left: 40px;">
			<input type="reset" value="취소" style="background-color: #EBE4FC; color:#6b39ea; border-radius: 5px; padding: 5px; border:0; margin-left: 15px;">
		</td>
	</tr>
</table>
</form:form>

</div>
				</div>
			</div>
		</div>
	</div>
</section>

</main>


<%@ include file="../main/mainFooter.jsp"%>

