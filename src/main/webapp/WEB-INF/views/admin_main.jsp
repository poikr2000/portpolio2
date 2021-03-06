<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<content tag="local_script">
<script>
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
});
</script>
</content>
<body>
<form style="background:url('resources/images/maingym.jpg')no-repeat center center fixed; 
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;">
	<div style="height:800px">
		<div class="row">
			<div class="col-md-8 col-lg-8 offset-0 offset-sm-0 offset-md-2 offset-lg-2 ">
				<!-- title-01 -->
				<div class="title-01">
					<h2 class="title-01__title" style="margin-top: 120px;margin-bottom: 30px;">
						<font color="#FFFFFF"; face="Impact">ADMIN PAGE</font>
					</h2>
				</div><!-- End / title-01 -->
			</div>
		</div>
	</div>
	<div id="floatMenu">
		<ul>
			<li><a href="#">인적관리</a>
				<ul>
					<li><a href="memberList">회원 관리</a></li>
					<li><a href="staffList">직원 관리</a></li>
				</ul>
			</li>
			<li><a href="#">물적관리</a>
				<ul>
					<li><a href="partnerList">거래처 관리</a></li>
					<li><a href="receivingInsertForm">매입관리</a></li>
					<li><a href="receivingStatement">매입장</a></li>
					<li><a href="shippingStatement">출고장</a></li>
					<li><a href="consumableInsertForm">상품 등록</a></li>
					<li><a href="consumableList">상품수불장</a></li>
					<li><a href="equipmentInsertForm">기자재등록</a></li>
					<li><a href="equipmentStatement">기자재매입장</a></li>
					<li><a href="taskCloseForm">월말마감</a></li>
					<li><a href="balanceForm">거래현황</a></li>
				</ul>
			</li>
			<li><a href="serviceAdminForm">서비스신청 조회</a></li>
			<li><a href="orderListForm">상품주문 조회</a></li>
		</ul>
	</div>
</form>
</body>
</html>