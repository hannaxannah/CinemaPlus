<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    membership.jsp<br>
    <!-- 
    멤버십은 멤버십 포인트를 기준으로 나누며, 등급은 Welcome -> Friends -> VIP -> MVP
    멤버십 포인트는 예매마다 포인트 형식으로 증가함
    product테이블의 경우 product_point가 있는데 상품 포인트 == 멤버쉽포인트가 됨
    회원은 멤버십 포인트가 3000P미만 -> 3000P이상 -> 5000P이상 -> 10000P이상이면 상위 등급으로 올라감
     -->
  <%@include file="../common/common.jsp"%>
<%@ include file="../main/mainHeader.jsp"%>
<%@ include file="mypageSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
	
<script type="text/javascript">
	function pointEvent(member_id,member_point) {
		
		if(member_point == 0 || member_point<3000) {
			member_point = 'Welcome';
		}else if(member_point>=3000 && member_point<5000) {
			member_point = 'Friends';
		}else if(member_point>=5000 && member_point<10000) {
			member_point = 'VIP';
		}else {
			member_point = 'MVP';
		}
		
		if(member_id == null) {
			alert('로그인 정보가 없어 등급 조회가 불가능합니다.');
			return;
		}
		
		alert(member_id+'회원님의 등급은 '+member_point+'입니다.');
	}
</script>
     
<style>
body {
	
}

.orderList {
	cursor: pointer;
	text-align: center;
}

.orderList:hover {
	transform: scale(1.1);
}

.panel-default {
	border-color: #ddd;
}

.panel-order .row {
	border-bottom: 1px solid #ccc;
}

.panel-order .row .col-md-1 {
	text-align: center;
	padding-top: 28px;
}

.panel-order .row .col-md-1 i {
	width: 50px;
	max-height: 50px;
}

.panel-order .row .row {
	border-bottom: 0;
}

.panel-order .row .col-md-11 {
	border-left: 1px solid #ccc;
}

.panel-order .row .row .col-md-12 {
	text-align: left;
	padding-top: 7px;
	padding-bottom: 7px;
}

.panel-order .row .row .col-md-12:last-child {
	font-size: 11px;
	color: #555;
	background: #efefef;
}

.panel-order .btn-group {
	margin: 0px;
	padding: 0px;
}

.panel-order .panel-body {
	padding-top: 0px;
	padding-bottom: 0px;
}

.panel-order .panel-deading {
	margin-bottom: 0;
}

a {
	color: #000000;
	text-decoration: none;
}

.row .row {
	text-align: left;
}

.panel-order .panel-heading {
	color: #333;
	background-color: #f5f5f5;
	border-color: #ddd;
	padding: 10px 15px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
}

.label-danger {
	background-color: #5cb85c;
}

.label {
	display: inline;
	padding: .2em .6em .3em;
	font-size: 75%;
	font-weight: 700;
	line-height: 1;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
}
</style>

 <form name="myform" action="membership.mp" method="post">
	<div class="col-lg-9" style="padding: 20px;">
	<!-- 회원 상세 정보 요약 -->
	<div class="card info-card customers-card">
		<div class="card-body align-items-center justify-content-center">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<font style="font-size: x-large;">멤버십 등급 서비스 안내</font>
				</li>
			</ul>
			
			<span><br>
 		<font style="font-size: medium; color: #A6A6A6" >* 회원 혜택은 매 선정마다 달라질 수 있습니다.</font>
		</span><br><br><br>
			
			<input type="button" name="member_point" value="나의 회원등급 확인하기" onclick="return pointEvent('${loginInfo.member_id}','${loginInfo.member_point}')">
			
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="reservation-tab-pane"
					role="tabpanel" aria-labelledby="reservation-tab" tabindex="0"
					style="display: flex; flex-flow: column; padding-top: 20px;">
					<div style="width: 100%;">
						<div style="width: 100%; display: flex;">
							<!-- Table -->
								<table border="1" width="950px">
										<thead>
											<tr>
												<td align="center">구분</td>
												<td align="center">조건</td>
											</tr>
											<tr align="center">
												<td>Welcome</td>
												<td>회원가입 시 기본 등급으로 혜택사항 없음</td>
											</tr>
											<tr align="center">
												<td>Friends</td>
												<td>스토어 상품 구매로 포인트가 3000이상이거나, 영화 5편 이상 관람</td>
											</tr>
											<tr align="center">
												<td>VIP</td>
												<td>스토어 상품 구매로 포인트가 5000이상이거나, 영화 10편 이상 관람</td>
											</tr>
											<tr align="center">
												<td>MVP</td>
												<td>스토어 상품 구매로 포인트가 10000이상이거나, 영화 15편 이상 관람</td>
											</tr>
										</thead>
								</table>
							</div>
					</div><br><br><br>
					
					
					<table>
									<tr>
										<td align="left"><font style="font-size: large;">멤버십
												안내</font><br></td>
									</tr>
									<tr>
										<td>
											<p>
												예매 횟수 또는 스토어 구매 두가지 중 한가지 조건만 만족하면 해당 등급이 적용됩니다. (결제완료 기준)<br>
												회원등급 적립금 혜택은 구매시 적립되며 일부 품목 및 이벤트 상품은 제외 될 수 있습니다.<br>
												회원등급은 구매가 없을 시 사전 고지 없이 등급 하향 조정될 수 있습니다.<br> 멤버십 혜택 및
												선정 기준은 사전 공지 후 변경될 수 있습니다.<br>
											</p>
										</td>
									</tr>

								</table>
				</div>
			</div>
		</div>
	</div>
</div>	
</form>	
	
	
			</div>
		</div>
	</div>
</section>

</main>
    	
    <%@include file="../main/mainFooter.jsp"%>
     
    
    
	
	
