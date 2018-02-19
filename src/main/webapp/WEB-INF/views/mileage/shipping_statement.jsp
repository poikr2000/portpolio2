<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script>
$(document).ready(function(){
	
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day= date.getDate();
	$('#yyyy').attr('value',year);
	$('#mm').val(month).prop("selected",true);
	$('#dd').val(day).prop("selected",true);
	$('#shippingstatementmmbtn').click(function(){
		$('.shippingstatement_form').attr('action','shippingStatementMm');
		$('.shippingstatement_form').submit();
	});
	$('#shippingstatementddbtn').click(function(){
		$('.shippingstatement_form').attr('action','shippingStatementDd');
		$('.shippingstatement_form').submit();
	});
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
</head>
<body>
<form class="shippingstatement_form" name="shippingstatement_form" method="post"role="form">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="col-sm-12">
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>출고장</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div id="floatMenu">
			<ul>
				<li><a href="serviceAdminForm">서비스신청 조회</a></li>
				<li><a href="orderListForm">상품주문 조회</a></li>
				<li><a href="memberList">회원 관리</a></li>
				<li><a href="staffList">직원 관리</a></li>
				<li><a href="partnerList">거래처 관리</a></li>
				<li><a href="receivingInsertForm">매입관리</a></li>
				<li><a href="receivingStatement">매입장</a></li>
				<li><a href="shippingStatement">출고장</a></li>
				<li><a href="consumableInsertForm">상품 등록</a></li>
				<li><a href="consumableList">상품수불장</a></li>
				<li><a href="equipmentInsertForm">기자재등록</a></li>
				<li><a href="equipmentStatement">기자재매입장</a></li>
			</ul>
		</div>
		<div class="col-sm-offset-3 col-sm-6" style="margin-top:10px;margin-bottom:80px;">
	  	  	<div class="input-group">
			    <input type="text" id="yyyy" name="yyyy" class="form-control" placeholder="yyyy">
			    <span class="input-group-addon">년</span>
			    <select id="mm" name="mm" class="form-control" style="width: 100%"> 
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
			    </select>
			    <span class="input-group-addon">월</span>
			    
			    <select id="dd" name="dd" class="form-control" style="width: 100%"> 
					<c:forEach var="i" begin="1" end="31" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<span class="input-group-addon">일</span>
				<div class="input-group-btn">
					<button type="button" id="shippingstatementmmbtn" class="btn btn-primary"><i class="fa fa-calendar-times-o" aria-hidden="true"></i>&nbsp월출고장</button>
		  			<button type="button" id="shippingstatementddbtn" class="btn btn-primary"><i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp일출고장</button>
				</div>
		 	 </div>
		</div>
		<div class="col-sm-offset-3 col-sm-6" id="shipping_table" style="<c:if test="${number!=1}">margin-bottom:350px;</c:if>">
			<c:if test="${number==1}">
				<table class="table table-striped table-bordered" cellspacing="0"  width="100%" style="margin-bottom:80px;">
			        <thead>
			            <tr>
			                <th class="text-center">매입번호</th>
			                <th class="text-center">수취인</th>
			                <th class="text-center">품명</th>
			                <th class="text-center">단가</th>
							<th class="text-center">수량</th>
							<th class="text-center">금액</th>
			            </tr>
			        </thead>
			        <c:if test="${fn:length(shippings)==0}">
						<tfoot>
							<tr>
								<td colspan="6" style="text-align:center">출고 내역이 없습니다.</td>
							</tr>
						</tfoot>
					</c:if>
			        <tbody>
			        	<c:forEach var="shippings" items="${shippings}">
			        		<c:choose>
			        			<c:when test="${shippings.no!=0 &&shippings.hang==0}">
			        				<tr>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-info text-white">소계</td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-info text-white">${shippings.total}</td>
									</tr>
			        			</c:when>
			        			<c:when test="${shippings.no==0 &&shippings.hang==0 && shippings.dd !=null}">
			        				<tr>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-success text-white">일총계</td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-success text-white">${shippings.total}</td>
									</tr>
			        			</c:when>
			        			<c:when test="${shippings.no==0 &&shippings.hang==0 && shippings.dd ==null}">
			        				<tr>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-primary text-white">월총계</td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-primary text-white">${shippings.total}</td>
									</tr>
			        			</c:when>
			        			<c:otherwise>
			        				<tr>
					        			<td class="text-center">${shippings.yyyy}-${shippings.mm}-${shippings.dd}-${shippings.no}-${shippings.hang}</td>
					        			<td class="text-center">${shippings.member_name}</td>
					        			<td class="text-center">${shippings.consume_name}</td>
					        			<td class="text-center">${shippings.price}</td>
					        			<td class="text-center">${shippings.qty}</td>
					        			<td class="text-center">${shippings.total}</td>
									</tr>
			        			</c:otherwise>
			        		</c:choose>
						</c:forEach>
			        </tbody>
			    </table>
			</c:if>
		</div>
	</div>
</form>
</body>
</html>