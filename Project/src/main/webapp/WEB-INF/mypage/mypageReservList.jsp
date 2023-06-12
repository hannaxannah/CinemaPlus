<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mypageList.jsp<br>
<%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>    

<form name="mypageList" action="mypage_ReservList.mp" method="POST">
<table border="1" width="500px">
	<tr>
		<td colspan="2">
			<b>마이페이지 목록</b>
		</td>
	</tr>
	<tr>
		<td>
			아이디
		</td>
		<td>
			계정아이디
		</td>
	</tr>
	<tr>
		<td>
			이름
		</td>
		<td>
			계정이름
		</td>
	</tr>
	<tr>
		<td>
			이메일
		</td>
		<td>
			계정이메일
		</td>
	</tr>
	<tr>
		<td>
			연락처
		</td>
		<td>
			계정연락처
		</td>
	</tr>
	<tr>
		<td>
			주소
		</td>
		<td>
			계정주소
		</td>
	</tr>
	<tr>
		<td>
			멤버쉽 포인트
		</td>
		<td>
			계정 멤버쉽포인트
		</td>
	</tr>
</table>
</form>



<%@ include file="../main/mainFooter.jsp"%>

