<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/mainHeader.jsp"%>

<!-- 비회원 예매확인 -->
<div class="container-nonmemberReservationCheck">
	<div class="reservationCheck">비회원 예매확인</div>
	<div class="container-reservationCheckForm">
		<!-- 비회원 예매확인 폼 -->
		<form action="nonmember-reservation.mb" method="POST">
			<table class="reservationCheckForm">
				<tr>
					<td>이름</td>
					<td>
						<input type="text" class="inputText1" name="nonmember_name" placeholder="이름">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" class="inputText1" name="nonmember_birth" placeholder="ex) 19990101">
					</td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td>
						<input type="text" class="inputText1" name="nonmember_phone" placeholder="ex) 01012345678">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="text" class="inputText1" name="nonmember_phone" placeholder="비밀번호">
					</td>
				</tr>
			</table>
			<div class="before-click-nrc-button">
				* 비회원 정보 오 입력 시 예매 내역 확인/취소 및 티켓 발권이 어려울 수 있으니 다시 한번 확인해 주시기 바랍니다.
			</div>
			<div class="nonmember-reservation-check-button">
				<input type="submit" class="checkButton" value="비회원 예매확인" onClick="return check_reservation_check()">
			</div>
		</form>
	</div>
</div>


<%@ include file="../main/mainFooter.jsp"%>