<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	$('#adminservicetable').DataTable();
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
	$(document).on('click',"#servicecancel",function(){
		var val = $(this).val();
		$('#serviceCancelModalMsg').text('등록이 취소됩니다. 계속하시겠습니까?');
		$('#serviceCancelModal').modal('show');
		$('#serviceCancelConfirm').on('click',function(){
			var input=$("<input>")
			.attr("name","seq")
			.attr("type","hidden")
			.attr("value",val);
			$('.serviceadmin_form').append($(input));
			$('.serviceadmin_form').attr('action','serviceCansel');
			$('.serviceadmin_form').submit();
		});
	});
	$(document).on('click',"#serviceregister",function(){
		var val = $(this).val();
		$('#serviceCancelModalMsg').text('등록 하시겠습니까?');
		$('#serviceCancelModal').modal('show');
		$('#serviceCancelConfirm').on('click',function(){
			var input=$("<input>")
			.attr("name","seq")
			.attr("type","hidden")
			.attr("value",val);
			$('.serviceadmin_form').append($(input));
			$('.serviceadmin_form').attr('action','serviceRegister');
			$('.serviceadmin_form').submit();
		});
	});
	$(document).on('click',"#serviceexpired",function(){
		var val = $(this).val();
		$('#serviceCancelModalMsg').text('서비스를 끝내시겠습니까?');
		$('#serviceCancelModal').modal('show');
		$('#serviceCancelConfirm').on('click',function(){
			var input=$("<input>")
			.attr("name","seq")
			.attr("type","hidden")
			.attr("value",val);
			$('.serviceadmin_form').append($(input));
			$('.serviceadmin_form').attr('action','serviceExpired');
			$('.serviceadmin_form').submit();
		});
	});
});
</script>
</content>
<body>
<form class="serviceadmin_form" name="serviceadmin_form" id="serviceadmin_form" method="POST" enctype="multipart/form-data">
	<div class="col-sm-12" style="background:black;height:90px;">
	</div>
	<div class="container col-sm-12" style="height:800px;">
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>서비스신청 조회</h3>
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
		<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 70px;">
			<table class="table table-striped table-bordered" id="adminservicetable">
				<thead>
					<tr style="text-align:center;">
						<th style="text-align:center;vertical-align:middle;">순번</th>
						<th style="text-align:center;vertical-align:middle;">신청인</th>
						<th style="text-align:center;vertical-align:middle;">프로그램</th>
						<th style="text-align:center;vertical-align:middle;">신청날짜</th>
						<th style="text-align:center;vertical-align:middle;">등록날짜</th>
						<th style="text-align:center;vertical-align:middle;">승인여부</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="services" items="${services}" varStatus="status">
						<c:choose>
			        			<c:when test="${services.service_check==9}">
			        				<tr>
					        			<td class="text-center">${services.seq}</td>
					        			<td class="text-center">${services.member_name}</td>
					        			<td class="text-center">${services.program_name}</td>
					        			<td class="text-center">${services.apply_date}</td>
					        			<td class="text-center">${services.register_date}</td>
					        			<td class="text-center">기간만료</td>
					        			<td class="text-center"></td>
									</tr>
			        			</c:when>
			        			<c:when test="${services.service_check==5}">
			        				<tr>
					        			<td class="text-center">${services.seq}</td>
					        			<td class="text-center">${services.member_name}</td>
					        			<td class="text-center">${services.program_name}</td>
					        			<td class="text-center">${services.apply_date}</td>
					        			<td class="text-center">${services.register_date}</td>
					        			<td class="text-center">진행중</td>
					        			<td class="text-center">
					        				<button id="serviceexpired" value="${services.seq}" type="button" class="btn btn-default">기간만료</button>
					        			</td>
									</tr>
			        			</c:when>
			        			<c:otherwise>
					        		<tr>
					        			<td class="text-center">${services.seq}</td>
					        			<td class="text-center">${services.member_name}</td>
					        			<td class="text-center">${services.program_name}</td>
					        			<td class="text-center">${services.apply_date}</td>
					        			<td class="text-center">${services.register_date}</td>
					        			<td class="text-center">신청대기</td>
					        			<td class="text-center">
					        				<button id="serviceregister" value="${services.seq}" type="button" class="btn btn-default">등록</button>
					        				<button id="servicecancel" value="${services.seq}" type="button" class="btn btn-default">취소</button>
					        			</td>
									</tr>
					        	</c:otherwise>
			        	</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade" id="serviceCancelModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	      	 <span id="serviceCancelModalMsg">...</span>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" id="serviceCancelConfirm" data-dismiss="modal">확인</button>
	      	<button type="button" class="btn btn-default" id="serviceCancelClose" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</body>
</html>