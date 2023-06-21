<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<h1>빠른 예매</h1>
	<center>
		
			<table>
				<c:forEach var="fastReservation" items="${fastReservationList}">
					<form action="selectSeats.mv" method="post">
						<input type="hidden" name="screen_time" value="${fastReservation.screen_time}">
						<input type="hidden" name="movie_title" value="${fastReservation.movie_title}">
						<input type="hidden" name="seat_count" value="${fastReservation.seat_count}">
						<input type="hidden" name="screen_name" value="${fastReservation.screen_name}">
						<input type="hidden" name="ticket_price" value="${fastReservation.ticket_price}">
						<input type="hidden" name="rating" value="${fastReservation.rating}">
						<tr>
							<td>${fastReservation.rating}</td>
							<c:if test="${discount eq 'first'}">
							<td>조조</td>
							</c:if>
							<c:if test="${discount eq 'last'}">
							<td>심야</td>
							</c:if>
							<td>${fastReservation.screen_time}</td>
							<td>${fastReservation.movie_title}</td>
							<td>${fastReservation.seat_count}</td>
							<td>${fastReservation.screen_name}</td>
							<td><input type="submit" value="예매하기"></td>
						</tr>
					</form>
				</c:forEach>		
			</table>
		
	</center>