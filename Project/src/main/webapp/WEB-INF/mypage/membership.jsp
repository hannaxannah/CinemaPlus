<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    membership.jsp<br>
    <!-- 
    멤버십은 멤버십 포인트를 기준으로 나누며, 등급은 Welcome -> Friends -> VIP -> MVP
    멤버십 포인트는 예매마다 포인트 형식으로 증가함
    product테이블의 경우 product_point가 있는데 상품 포인트 == 멤버쉽포인트가 됨
    회원은 멤버십 포인트가 3000P미만 -> 3000P이상 -> 5000P이상 -> 10000P이상이면 상위 등급으로 올라감
     -->
     <%@ include file="../main/mainHeader.jsp"%>    
     
<script type="text/javascript">
	function pointEvent(member_id,member_point) {
		
		if(member_point == null || member_point<3000) {
			member_point = 'Welcome';
		}else if(member_point>=3000 && member_point<5000) {
			member_point = 'Friends';
		}else if(member_point>=5000 && member_point<10000) {
			member_point = 'VIP';
		}else {
			member_point = 'MVP';
		}
		alert(member_id+'회원님의 등급은 '+member_point+'입니다.');
	}
</script>
     
<style>
	form{
	margin-top: 80px;
	}

	table {
	margin: auto;
	width: 750px;
	}
	tr{
	height: 40px; 
	}
</style>
     <form name="myform" action="membership.mp" method="post">
     <table>
 		<tr>
 			<td align="center">
 				<font style="font-size: x-large;">멤버십 등급 서비스 안내</font>
 			</td>
		</tr>
		<tr>	 			
 			<td align="left">
 		<font style="font-size: medium; color: #A6A6A6" >* 회원혜택은 매 선정마다 달라질 수 있습니다.</font>
 			</td>
 		</tr>
 		<tr>	
 			<td>
 				<input type="button" name="member_point" value="나의 회원등급 확인하기" onclick="return pointEvent('${loginInfo.member_id}','${loginInfo.member_point}')">
 			</td>
 		</tr>	
     </table><br><br>
 
     <table border="1">
     	<tr align="center">
     		<td>
     			구분
     		</td>
     		<td>
     			조건
     		</td>
     	</tr>
     		<tr align="center">
     		<td>
     			Welcome
     		</td>
     		<td>
     			회원가입 시 기본 등급으로 혜택사항 없음
     		</td>
     	</tr>
     		<tr align="center">
     		<td>
     			Friends
     		</td>
     		<td>
     			스토어 상품 구매로 포인트가 3000이상이거나, 영화 5편 이상 관람
     		</td>
     	</tr>
     		<tr align="center">
     		<td>
     			VIP
     		</td>
     		<td>
     			스토어 상품 구매로 포인트가 5000이상이거나, 영화 10편 이상 관람
     		</td>
     	</tr>
     		<tr align="center">
     		<td>
     			MVP
     		</td>
     		<td>
     			스토어 상품 구매로 포인트가 10000이상이거나, 영화 15편 이상 관람
     		</td>
     	</tr>
     </table><br><br>
     
     <table>
     	<tr>
     		<td align="left">
     			<font style="font-size: large;">멤버십 안내</font><br>
     			<hr align="left" width="80%">
     		</td>
     	</tr>
    	<tr>
    		<td>
    			<p>
    				예매 횟수 또는 스토어 구매 두가지 중 한가지 조건만 만족하면 해당 등급이 적용됩니다. (결제완료 기준)<br>
    				회원등급 적립금 혜택은 구매시 적립되며 일부 품목 및 이벤트 상품은 제외 될 수 있습니다.<br>
    				회원등급은 구매가 없을 시 사전 고지 없이 등급 하향 조정될 수 있습니다.<br>
    				멤버십 혜택 및 선정 기준은 사전 공지 후 변경될 수 있습니다.<br>
    			</p>
    		</td>
    	</tr>
    	
     </table>
   </form> 
     
    	
    <%@include file="../main/mainFooter.jsp"%>
     
    
    
    