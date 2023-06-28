<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./adminMenu.jsp"%>
<%@ include file="../common/common.jsp"%>
<%-- <c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery.js"></script> --%>
<!-- page content -->
<div class="right_col" role="main" style="min-height: 3535.8px;">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>상영 정보</h3>
			</div>

		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							상영 오픈<small>상영할 영화 정보를 입력해 주세요</small>
						</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br>
						<form id="demo-form2" name="screen_form"
							action="screenInsert.admin" method="post"
							onSubmit="return emptyCheck()" data-parsley-validate=""
							class="form-horizontal form-label-left" >

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">상영관
									<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select class="form-select" name="screen_name" id="s1"
										onchange="optionChange()" required="required">
										<option value="">선택하세요</option>
										<option value="1관">1관</option>
										<option value="2관">2관</option>
										<option value="3관">3관</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">영화
									오픈 시간<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select  name=screen_time id="s3">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">좌석수<span
									class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="seat_count" readonly="readonly">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">제목<span
									class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="movie_title" value="${movie_title}"
										readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">특이
									사항<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="radio" name="discount" value="first">조조 <input
										type="radio" name="discount" value="last">심야 <input
										type="radio" name="discount" value="normal"
										required="required">일반
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">관람등급
									<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="rating" value="${rating}" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">런타임
									<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="runtime" value="${movie_runtime}"
										readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">티켓
									가격 <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="ticket_price" required="required">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">예고편
									<span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="url">
								</div>
							</div>

							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<button class="btn btn-primary" type="reset">초기화</button>
									<button type="submit" class="btn btn-success">영화 오픈</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function optionChange() {

		var v = $('#s1').val();
		/* alert(v); */
		var o = 8;
		if (v == '1관') {
			o = 8;
			$('input[name=seat_count]').attr('value', "80");
		} else if (v == '2관') {
			o = 9;
			$('input[name=seat_count]').attr('value', "90");
		} else if (v == '3관') {
			o = 10;
			$('input[name=seat_count]').attr('value', "100");
		}
		$('#s3').empty();
		for (var i = o; i < 25; i = i + 3) {
			$('#s3').append('<option value = "' + i + ':00">' + i + ":00" + '</option>');
		}
		if ('${fn:length(opendScreenTimes)}' != 0) {
			/* alert(2); */
			<c:forEach var="opendScreenTime" items="${opendScreenTimes}">
			$("select#s3 option[value='${opendScreenTime}']").remove();
			</c:forEach>
		}
		if (v == "") {
			$('#s3').empty();
			$('input[name=seat_count]').attr('value', "0");
		}
	}

	function emptyCheck() {
		if (screen_form.screen_name.value.length == 0) {
			alert("상영관을 입력하세요");
			screen_form.screen_name.focus();
			return false;
		}//상영관 공백체크	

		if (screen_form.ticket_price.value.length == 0) {
			alert("가격을 입력하세요");
			screen_form.ticket_price.focus();
			return false;
		} else if (isNaN(screen_form.ticket_price.value)) {
			alert("가격은 숫자만 입력하세요");
			screen_form.ticket_price.value = "";
			screen_form.ticket_price.focus();
			return false;
		}//가격

		if (screen_form.url.value.length == 0) {
			alert("예고편 입력하세요");
			screen_form.url.focus();
			return false;
		}//예고편 체크
	}
</script>
<%@ include file="./adminBottom.jsp"%>