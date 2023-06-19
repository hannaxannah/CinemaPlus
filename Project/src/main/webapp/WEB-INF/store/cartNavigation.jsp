<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

	.cart_nav {
	    position: fixed;
	    bottom: 50px;
	    right: 50px;
	    justify-content: center;
	    width: 64px;
	    height: 64px;
	    border-radius: 100%;
	    color: #fff;
	    z-index: 998;
	    background-color: #333030;
	    display : flex;
	    align-items: center;
	}

	.cart_nav_num {
	    position: fixed;
	    bottom: 90px;
	    right: 100px;
	    justify-content: center;
	    width: 25px;
	    height: 25px;
	    border-radius: 100%;
	    color: #fff;
	    z-index: 999;
	    background-color: rgb(220,0,0);
	    display : flex;
	    align-items: center;
	    cursor : default;
	}
	
</style>

<script>
	function emptyCart(){
		alert("장바구니가 비었습니다.");
	}
	
	function nonmemberCart(){
		alert("로그인 후 이용가능한 서비스입니다. 로그인 페이지로 이동합니다.");
		location.href = 'memberlogin';
	}
</script>
<nav>
	<p class="cart_nav_num">
		<c:choose>
			<c:when test="${sessionScope.cartSize eq null}">0</c:when>
			<c:when test="${sessionScope.loginInfo eq null}">0</c:when>
			<c:otherwise>${sessionScope.cartSize}</c:otherwise>
		</c:choose>
	</p>
</nav>

	   
<nav>
	<c:choose>
		<c:when test="${sessionScope.loginInfo eq null}">
			<a class="cart_nav" href="javascript:void(0);" onClick="nonmemberCart()">
		</c:when>
		<c:when test="${sessionScope.cartSize eq null}">
			<a class="cart_nav" href="javascript:void(0);" onClick="emptyCart()">
		</c:when>
		<c:otherwise>
			<a class="cart_nav" href="cart.store">
		</c:otherwise>
</c:choose>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
			<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
		</svg>
	</a>
</nav>