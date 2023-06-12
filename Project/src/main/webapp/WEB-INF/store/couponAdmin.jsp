<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../common/common.jsp" %>   
<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
</style> 
<script type="text/javascript">
	function emptyCheck(){
		
	if(coupon_form.coupon_name.value.length == 0){
		alert("쿠폰이름을 입력하세요");
		coupon_form.coupon_name.focus();
		return false;
	}//쿠폰이름 공백체크	
	
	if(coupon_form.coupon_rate.value.length == 0){
		alert("할인률을 입력하세요");
		coupon_form.coupon_rate.focus();
		return false;
	}
	else if(parseInt(coupon_form.coupon_rate.value) < 1 || parseInt(coupon_form.coupon_rate.value) > 100){
		alert("할인률은 1~100% 사이만 입력하세요");
		return false;
	}
	else if(isNaN(coupon_form.coupon_rate.value)){
		alert("할인률은 숫자만 입력하세요");
		coupon_form.coupon_rate.value = "";
		coupon_form.coupon_rate.focus();
		return false;
	}//할인률 체크
	
	if(coupon_form.coupon_qty.value.length == 0){
		alert("발행갯수를 입력하세요");
		coupon_form.coupon_qty.focus();
		return false;
	}else if(parseInt(coupon_form.coupon_qty.value) < 1){
		alert("쿠폰 최소 발행갯수는 1개이상입니다.");
		return false;
	}	
	else if(isNaN(coupon_form.coupon_qty.value)){
		alert("쿠폰 발행갯수는 숫자만 입력하세요");
		coupon_form.coupon_qty.value = "";
		coupon_form.coupon_qty.focus();
		return false;
	}//발행갯수 체크
	
	
	}
</script> 
 <h2>쿠폰발행 페이지</h2>   
    
<form name="coupon_form" action="couponAdmin.store" method="post" onSubmit="return emptyCheck()"> 
	<table border="1">
		<tr>
			<td>
				*쿠폰이름
			</td>
			<td>
				<input type="text" name="coupon_name">
			</td>
		</tr>
		<tr>
			<td>
				*할인률(%)
			</td>
			<td>
				<input type="text" name="coupon_rate">
			</td>
		</tr>
		<tr>
			<td>
				*쿠폰 발행 갯수
			</td>
			<td>
				<input type="text" name="coupon_qty">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="쿠폰 발행하기">
			</td>
		</tr>
		
	</table>
	
</form>    