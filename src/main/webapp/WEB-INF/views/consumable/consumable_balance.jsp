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
$(document).ready(function(){
	//기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
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
	$("#balancetable").dataTable();
});
</script>
</content>
<body>
<form class="productbalance_form" method="post" data-parsley-validate="true">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
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
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>거래현황</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div class="col-sm-offset-1 col-sm-11"style="margin-top:40px;height: 1000px;">
				<table id="balancetable" class="table table-striped table-bordered" cellspacing="0">
		        <thead>
		            <tr>
		                <th>거래년도</th>
		                <th>/</th>
		                <th>거래처명</th>
		                <th>전년이월잔액</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>현재잔액</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="balance" items="${balances}">
						<tr>
							<td class="text-center">${balance.yyyy}</td>
							<td class="text-center" style="vertical-align:middle;">
								<div class="bg-primary text-white">월별잔액</div>
								<div class="bg-success text-white">거래금액</div>
								<div class="bg-info text-white">지불금액</div>
							</td>
							<td class="text-center"><a href="balanceDetail?yyyy=${balance.yyyy}&bp_code=${balance.bp_code}">${balance.bp_name}</a></td>
							<td class="text-center">${balance.preyybalance}</td>
							<td class="text-center">${balance.balance01}<br>${balance.deal01}<br>${balance.pay01}</td>
							<td class="text-center">${balance.balance02}<br>${balance.deal02}<br>${balance.pay02}</td>
							<td class="text-center">${balance.balance03}<br>${balance.deal03}<br>${balance.pay03}</td>
							<td class="text-center">${balance.balance04}<br>${balance.deal04}<br>${balance.pay04}</td>
							<td class="text-center">${balance.balance05}<br>${balance.deal05}<br>${balance.pay05}</td>
							<td class="text-center">${balance.balance06}<br>${balance.deal06}<br>${balance.pay06}</td>
							<td class="text-center">${balance.balance07}<br>${balance.deal07}<br>${balance.pay07}</td>
							<td class="text-center">${balance.balance08}<br>${balance.deal08}<br>${balance.pay08}</td>
							<td class="text-center">${balance.balance09}<br>${balance.deal09}<br>${balance.pay09}</td>
							<td class="text-center">${balance.balance10}<br>${balance.deal10}<br>${balance.pay10}</td>
							<td class="text-center">${balance.balance11}<br>${balance.deal11}<br>${balance.pay11}</td>
							<td class="text-center">${balance.balance12}<br>${balance.deal12}<br>${balance.pay12}</td>
							<td class="text-center">${balance.balance}</td>
						</tr>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
    </div>
</form>
</body>
</html>