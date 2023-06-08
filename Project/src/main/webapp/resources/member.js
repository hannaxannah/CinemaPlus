function check_member_login() {

	if($('input[name=member_id]').val() == "") {
		$('input[name=member_id]').focus();
		alert("아이디를 입력하세요");
		return false;
	}
	
	if($('input[name=member_pw]').val() == "") {
		$('input[name=member_pw]').focus();
		alert("비밀번호를 입력하세요");
		return false;
	}
}

function check_nonmember_login() {

	if($('input[name=nonmember_name]').val() == "") {
		$('input[name=nonmember_name]').focus();
		alert("이름을 입력하세요");
		return false;
	}

	if($('input[name=nonmember_phone]').val() == "") {
		$('input[name=nonmember_phone]').focus();
		alert("휴대폰번호를 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_birth]').val() == "") {
		$('input[name=nonmember_birth]').focus();
		alert("생년월일을 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_pw]').val() == "") {
		$('input[name=nonmember_pw]').focus();
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_pwcheck]').val() == "") {
		$('input[name=nonmember_pwcheck]').focus();
		alert("비밀번호 확인을 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_pw]').val() != $('input[name=nonmember_pwcheck]').val()) {
		alert("비밀번호가 일치하지 않습니다");
		return false;
	}
	
	if(!$('input:radio[name=nonmember_agree]').is(':checked')) {
		alert("개인정보 수집 동의 여부를 선택하세요");
		return false;
	}
}

function check_find_id() {

	if($('input[name=member_name]').val() == "") {
		$('input[name=member_name]').focus();
		alert("이름을 입력하세요");
		return false;
	}
	
	if($('input[name=member_birth]').val() == "") {
		$('input[name=member_birth]').focus();
		alert("생년월일을 입력하세요");
		return false;
	}
	
	if($('input[name=member_phone]').val() == "") {
		$('input[name=member_phone]').focus();
		alert("휴대폰번호를 입력하세요");
		return false;
	}
}

function check_find_pw() {

	if($('input[name=member_id]').val() == "") {
		$('input[name=member_id]').focus();
		alert("아이디를 입력하세요");
		return false;
	}

	if($('input[name=member_name]').val() == "") {
		$('input[name=member_name]').focus();
		alert("이름을 입력하세요");
		return false;
	}
	
	if($('input[name=member_birth]').val() == "") {
		$('input[name=member_birth]').focus();
		alert("생년월일을 입력하세요");
		return false;
	}
	
	if($('input[name=member_phone]').val() == "") {
		$('input[name=member_phone]').focus();
		alert("휴대폰번호를 입력하세요");
		return false;
	}
}

function check_reservation_check() {

	if($('input[name=nonmember_name]').val() == "") {
		$('input[name=nonmember_name]').focus();
		alert("이름을 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_birth]').val() == "") {
		$('input[name=nonmember_birth]').focus();
		alert("생년월일을 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_phone]').val() == "") {
		$('input[name=nonmember_phone]').focus();
		alert("휴대폰번호를 입력하세요");
		return false;
	}
	
	if($('input[name=nonmember_pw]').val() == "") {
		$('input[name=nonmember_pw]').focus();
		alert("비밀번호를 입력하세요");
		return false;
	}
}