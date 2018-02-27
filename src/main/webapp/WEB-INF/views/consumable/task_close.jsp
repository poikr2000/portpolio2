<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	$('#yyyy').attr('value',year);
	$('#mm').val(month).prop("selected",true);
	$('#taskclosemm').click(function(){
		$('#taskCloseModalmsg').text('월말 마감하시겠습니까');
		$('#taskCloseModal').modal('show');
		$('#taskcloseusebtn').on('click',function(){
			$('.taskclose_form').attr('action','taskCloseMonth');
			$('.taskclose_form').submit();
		});
	});
	$('#taskcloseyear').click(function(){
		$('#taskCloseModalmsg').text('년말 마감하시겠습니까');
		$('#taskCloseModal').modal('show');
		$('#taskcloseusebtn').on('click',function(){
			$('.taskclose_form').attr('action','taskCloseYear');
			$('.taskclose_form').submit();
		});
	});
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
	
});
</script>
</content>
</head>
<body>
<form class="taskclose_form" method="post" data-parsley-validate="true">
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
			<h3>수불장</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div class="col-sm-offset-4 col-sm-4" align="center" style="margin-bottom: 70px;height: 700px;">
			<div class="row" style="margin-top:30px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 처리년도</span>
				    <input id="yyyy" name="yyyy" type="text" required="true" numberonly="true"maxlength="4"data-parsley-error-message="정확한 년도를 입력해 주세요." data-parsley-errors-container="div[id='yyyyError']"class="form-control" placeholder="ex)2017">
			 	</div>
			</div>
			<div class="row">
				<div id="yyyyError" style="color:#f00"></div>
			</div>
			<div class="row" style="margin-top:30px">
		  	  	<div class="input-group">
				    <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp 처&nbsp&nbsp리&nbsp&nbsp월</span>
				    <select id="mm" name="mm" class="form-control" required="required"> 
				    	<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
				    </select>
			 	</div>
			</div>
			<div class="row">
				<div id="mmError" style="color:#f00"></div>
			</div>
			<div class="col-sm-12" style="margin-top:30px">
			  	<button type="button" id="taskclosemm" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp월말마감</button>
			  	<button type="button" id="taskcloseyear" class="btn btn-primary"><i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp년말마감</button>
			  	<button type="button" onclick="javascript:location.href='adminMainForm';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
			</div>
		</div>
		<div id="taskCloseModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	               </div>
	               <div class="modal-body">
	               	<p><span id="taskCloseModalmsg"> Some text in modal</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="taskcloseusebtn" class="btn btn-success" data-dismiss="modal">확인</button>
	                  <button type="button" id="cancelbtn" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>

</body>
</html>