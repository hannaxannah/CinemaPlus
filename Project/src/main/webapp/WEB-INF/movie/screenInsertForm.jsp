<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery.js"></script>
screenFrom.jsp
<br>
<form action="screenInsert.mv" method="post" name="scr">
	상영관: <select class="form-select" name="screen_name" id="s1"
		onchange="optionChange()" required="required">
		<option value="">선택하세요</option>
		<option value="1관">1관</option>
		<option value="2관">2관</option>
		<option value="3관">3관</option>
	</select><br> <br> 영화 오픈 시간: <select class="form-select"
		name=screen_time id="s2">
	</select><br>
	<br> <input type="hidden" name="seat_count" value="48"><br>
	영화 제목: <input type="text" name="movie_title" value="${movie_title}"
		readonly><span></span><br> <br> 특이 사항: <input
		type="radio" name="discount" value="first">조조 <input
		type="radio" name="discount" value="last">심야 <input
		type="radio" name="discount" value="normal" required="required">일반
	<br> 영화 관람등급: <input type="text" name="rating" value="${rating}"
		readonly> <br> 런타임: <input type="text" name="runtime"
		value="${movie_runtime}" readonly> <br> 티켓 가격: <input
		type="text" name="ticket_price" required="required"> <br>
	<input type="submit" value="추가하기"> <input type="reset"
		value="초기화">




</form>
<script>
      function optionChange() {
    	
        var v = $( '#s1' ).val();
        alert(v);
        var o =8;
        if ( v == '1관' ) {
          o = 8;
        } else if ( v == '2관' ) {
          o = 9;
        } else if ( v == '3관' ) {
          o = 10;
        }
        $('#s2').empty();
        alert()
        for ( var i = o; i < 25; i = i+3 ) {
        	$( '#s2' ).append( '<option>'+i+":00"+'</option>' );
        }
        	if('${fn:length(opendScreenTimes)}' != 0){
        		alert(2);
        	<c:forEach var="opendScreenTime" items="${opendScreenTimes}">
        			$('#s2').children("option[value='${opendScreenTime}']").remove();
         	</c:forEach>
        	}
        if(v == ""){
        	 $('#s2').empty();
        	}
        }
 </script>
</div>