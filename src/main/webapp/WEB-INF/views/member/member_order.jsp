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
	$('#ordercancelbtn').click(function(){
		$('#orderCancelModalMsg').text("주문을 취소하시겠습니까?");
		$('#orderCancelModal').modal('show');
	});
	$('#orderCancelConfirm').click(function(){
		$('."orderlist_form"').submit();
	});
});
</script>
</content>
<body>

	<div class="col-sm-12" style="background:black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div id="floatMenu">
			<ul>
				<li><a href="memberDetail?email=${sessionemail}">회원정보 수정</a></li>
				<li><a href="memberOrderList?email=${sessionemail}">주문상품 조회</a></li>
				<li><a href="">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>상품주문 조회</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 70px;">
			<table class="table table-striped table-bordered" id="ordertable">
				<thead>
					<tr style="text-align:center;">
						<th style="text-align:center;vertical-align:middle;">순번</th>
						<th style="width: 50pt;text-align:center;vertical-align:middle;">이미지</th>
						<th style="text-align:center;vertical-align:middle;">상품명</th>
						<th style="text-align:center;vertical-align:middle;">가격</th>
						<th style="text-align:center;vertical-align:middle;">수량</th>
						<th style="text-align:center;vertical-align:middle;">총합계</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="shippings" items="${shippings}">
						<c:choose>
			        			<c:when test="${shippings.seq==0}">
			        				<tr>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-primary text-white">총계</td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center"></td>
					        			<td class="text-center bg-primary text-white">${shippings.mileagetotal}</td>
					        			<td></td>
									</tr>
			        			</c:when>
			        			<c:otherwise>
				        			<form class="orderlist_form" name="orderlist_form" method="POST" action="orderDelete">
					        			<tr>
											<td style="text-align:center;vertical-align:middle;"><input type="hidden" id="seq" name="seq" value="${shippings.seq}">${shippings.seq}</td>
											<td style="width: 50pt;text-align:center;vertical-align:middle;"><img src="${shippings.photo}" style="width:100%;"/></td>
											<td style="text-align:center;vertical-align:middle;">${shippings.consume_name}</td>
											<td style="text-align:center;vertical-align:middle;">${shippings.mileageprice}</td>
											<td style="text-align:center;vertical-align:middle;">${shippings.qty}</td>
											<td style="text-align:center;vertical-align:middle;">${shippings.mileagetotal}</td>
											<td style="text-align:center;vertical-align:middle;"><button type="button" class="btn btn-default" id="ordercancelbtn">상품취소</button></td>
										</tr>
									</form>
					        	</c:otherwise>
			        	</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade" id="orderCancelModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	      	 <span id="orderCancelModalMsg">...</span>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" id="orderCancelConfirm" data-dismiss="modal">확인</button>
	      	<button type="button" class="btn btn-default" id="orderCancelClose" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>