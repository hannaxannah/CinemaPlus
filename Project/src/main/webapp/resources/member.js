/* 회원 로그인 누락 검사 */
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

/* 비회원 로그인 누락 검사 */
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

/* 아이디 찾기 누락 검사 */
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

/* 비밀번호 찾기 누락 검사 */
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

/* 비회원 예매 누락 검사 */
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

/* 회원가입 */
$(document).ready(function(){
	//alert(1);
	
	var isCheck = false;
	var use;
	
	/* 아이디 중복체크 */
	$('#id_check').click(function(){
		//alert(11);
		isCheck = true;
		
		$.ajax({
			url : "id_check_proc.mb",
			data : ({
					inputid : $('input[name = member_id]').val()
			}),
			success : function(data){
				
				if($("input[name = member_id]").val() == ""){
					$('#idcheck-message').html("<font color='black'>아이디를 입력하세요</font>");
					$('#idcheck-message').show();
					$('input[name = member_id]').focus();
				
				}else if(data == 'N'){
					$('#idcheck-message').html("<font color='red'>이미 등록된 아이디입니다</font>");
					$('#idcheck-message').show();
					$('input[name = member_id]').select();
					use = "impossible";
					
				}else{
					$('#idcheck-message').html("<font color='blue'>사용 가능한 아이디입니다</font>");
					$('#idcheck-message').show();
					use = "possible";
				}
				
			}//success
			
		})//ajax
		
	})//click
	
	/* keydown */
	$("input[name = member_id]").keydown(function(){ 
		$('#idcheck-message').css('display','none');
	});//keydown
	
	/* 회원가입 누락 검사 */
	$('#join').click(function(){
		//alert("join");
		if($('input[name = member_name]').val() == ""){
			alert("이름을 입력하세요");
			$('input[name = member_name]').focus();
			return false;
		}
		
		if($('input[name = member_id]').val() == ""){
			alert("아이디를 입력하세요");
			$('input[name = member_id]').focus();
			return false;
		}
		
		if(!isCheck){
			alert("아이디 중복체크 버튼을 눌러주세요");
			$('#id_check').focus();
			return false;
		}
		
		if($('input[name = member_pw]').val() == ""){
			alert("비밀번호를 입력하세요");
			$('input[name = member_pw]').focus();
			return false;
		}
		
		if($('input[name = member_pwcheck]').val() == "") {
			alert("비밀번호 확인을 입력하세요");
			$('input[name = member_pwcheck]').focus();
			return false;
		}
		else if($('input[name = member_pw]').val() == $('input[name = member_pwcheck]').val()) {
			$('#pwcheck-message').html("<font color='blue'>비밀번호가 일치합니다</font>");
			$('#pwcheck-message').show();
		}
		else {
			$('#pwcheck-message').html("<font color='red'>비밀번호가 일치하지 않습니다</font>");
			$('#pwcheck-message').show();
			return false;
		}
		
		if($('input[name = pw_question]').val() == ""){
			alert("비밀번호 찾기 질문을 선택하세요");
			$('input[name = pw_question]').focus();
			return false;
		}
		
		if($('input[name = pw_answer]').val() == ""){
			alert("비밀번호 찾기 답변을 입력하세요");
			$('input[name = pw_answer]').focus();
			return false;
		}
		
		if($('input[name = member_phone]').val() == ""){
			alert("휴대폰 번호를 입력하세요");
			$('input[name = member_phone]').focus();
			return false;
		}
		
		if($('input[name = member_email]').val() == ""){
			alert("이메일을 입력하세요");
			$('input[name = member_email]').focus();
			return false;
		}
		
		if($('input[name = member_marketing_agree]').val() == ""){
			alert("마케팅 활용 동의 여부를 선택하세요");
			$('input[name = member_marketing_agree]').focus();
			return false;
		}
		
		if($('input[name = member_email_agree]').val() == ""){
			alert("마케팅 정보 email 수신 동의 여부를 선택하세요");
			$('input[name = member_email_agree]').focus();
			return false;
		}
		
		if($('input[name = member_sms_agree]').val() == ""){
			alert("마케팅 정보 sms 수신 동의 여부를 선택하세요");
			$('input[name = member_sms_agree]').focus();
			return false;
		}
		
		
	})//join
	
})//ready
