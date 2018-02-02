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
	$(document).on("keyup","input:text[numberOnly]",function(){
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	$('#image').on('click',function(){
		$('input[type=file]').click();
		return false;
	});
	$('#photo').change(function(event){
		var tmppath=URL.createObjectURL(event.target.files[0]);
		$('#image').attr('src',tmppath);
	});
	$('#consumableupdatebtn').click(function(){
		var name=$('#name').val();
		var capacity=$('#capacity').val();
		var price=$('#price').val();
		var preyystock=$('#preyystock').val();
		var premmstock=$('#premmstock').val();
		var preddstock=$('#preddstock').val();
		var stock=$('#stock').val();
		var rcv01=$('#rcv01').val();var rcv02=$('#rcv02').val();var rcv03=$('#rcv03').val();var rcv04=$('#rcv04').val();
		var rcv05=$('#rcv05').val();var rcv06=$('#rcv06').val();var rcv07=$('#rcv07').val();var rcv08=$('#rcv08').val();
		var rcv09=$('#rcv09').val();var rcv10=$('#rcv10').val();var rcv11=$('#rcv11').val();var rcv12=$('#rcv12').val();
		var ship01=$('#ship01').val();var ship02=$('#ship02').val();var ship03=$('#ship03').val();var ship04=$('#ship04').val();
		var ship05=$('#ship05').val();var ship06=$('#ship06').val();var ship07=$('#ship07').val();var ship08=$('#ship08').val();
		var ship09=$('#ship09').val();var ship10=$('#ship10').val();var ship11=$('#ship11').val();var ship12=$('#ship12').val();
		if(name==""||capacity==""||price==""||preyystock==""||premmstock==""||preddstock==""||stock==""||rcv01==""||rcv02==""||rcv03==""||rcv04==""||rcv05==""||rcv06==""||rcv07==""||rcv08==""||rcv09==""||rcv10==""||rcv11==""||rcv12==""||ship01==""||ship02==""||ship03==""||ship04==""||ship05==""||ship06==""||ship07==""||ship08==""||ship09==""||ship10==""||ship11==""||ship12==""){
			$('#requirechk').click();
			return;
		}else{
			$('#consumableupdateconfirmbtn').show();
			$('#consumabledeleteconfirmbtn').hide();
			var msg=""
			msg="- 변경 사항을 저장하시겠습니까? -";
			$('#consumableconfirmModalMsg').text(msg);
			$('#consumableconfirmModal').modal('show');
		}
	});
	$('#consumableupdateconfirmbtn').click(function(){
		$('.consumableupdate_form').attr('action','consumableUpdate');
		$('.consumableupdate_form').submit();
	});
	$('#consumabledeletebtn').click(function(){
		$('#consumableupdateconfirmbtn').hide();
		$('#consumabledeleteconfirmbtn').show();
		var msg=""
		msg="- 해당 상품을 삭제하시겠습니까 -";
		$('#consumableconfirmModalMsg').text(msg);
		$('#consumableconfirmModal').modal('show');
	})
	$('#consumabledeleteconfirmbtn').click(function(){
		$('.consumableupdate_form').attr('action','consumableDelete');
		$('.consumableupdate_form').submit();
	})
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
<form class="consumableupdate_form" name="consumableupdate_form" method="POST"role="form" enctype="multipart/form-data">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<input type="submit" style="display: none" id="requirechk" name="requirechk">
	<div class="container col-sm-12">
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3><i class="fa fa-sign-in" aria-hidden="true"></i>${consumable.name} 상품 정보</h3>
		</div>
		<div id="floatMenu">
			<ul>
				<li><a href="memberList">회원 관리</a></li>
				<li><a href="staffList">직원 관리</a></li>
				<li><a href="partnerList">거래처 관리</a></li>
				<li><a href="receivingInsertForm">매입관리</a></li>
				<li><a href="receivingStatement">매입장</a></li>
				<li><a href="consumableInsertForm">상품 등록</a></li>
				<li><a href="consumableList">수불장</a></li>
			</ul>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div class="col-sm-offset-4 col-sm-4" style="margin-top:50px;">
			<div class="row">
				<a href=#><img title="클릭후 이미지 변경"alt="클릭후 이미지 변경"style="WIDTH: 50%; border:1px solid" id="image"name="image"src="${consumable.photo}" class="img-responsive center-block"></a>
				<input type="hidden" name="beforephoto" value="${consumable.photo}">
			</div>
			<div class="row">
				<input type="file" id="photo"name="imgfile" style="visibility:hidden;">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  <div class="input-group">
		    <span class="input-group-addon"><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp 상품코드</span>
		    <input id="code" name="code" type="text" readonly="readonly" class="form-control"value="${consumable.code}">
		  </div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  		<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp 상품설명</span>
			    <input id="explanation" name="explanation" type="text" value="${consumable.explanation}"class="form-control">
		  	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp 카테고리</span>
			    <select id="category_code" name="category_code" class="form-control"> 
			    	<c:forEach var="category" items="${categorys}">
			    		<c:choose>
		        			<c:when test="${category.code=='0000000000'}">
	        				</c:when>
		        			<c:otherwise>
		        				<option <c:if test="${category.code==consumable.category_code}">selected</c:if> value="${category.code}">${category.name}</option>
	        				</c:otherwise>
	        			</c:choose>
					</c:forEach>
			    </select>
			    <span class="input-group-addon"><i class="fa fa-gift" aria-hidden="true"></i>&nbsp 거&nbsp&nbsp래&nbsp&nbsp처</span>
			    <select id="bp_code" name="bp_code" class="form-control"> 
			    	<c:forEach var="partner" items="${partners}">
			    		<c:choose>
		        			<c:when test="${partner.code=='00000'}">
	        				</c:when>
		        			<c:otherwise>
		        				<option <c:if test="${partner.code==consumable.bp_code}">selected</c:if> value="${partner.code}">${partner.name}</option>
	        				</c:otherwise>
	        			</c:choose>
					</c:forEach>
			    </select>
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp 이&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp름</span>
			    <input id="name" name="name" type="text" value="${consumable.name}"required="true"class="form-control" placeholder="name">
			    <span class="input-group-addon"><i class="fa fa-gift" aria-hidden="true"></i>&nbsp 상품규격</span>
			    <input id="capacity" name="capacity" type="text" value="${consumable.capacity}"required="true"class="form-control" placeholder="capacity">
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-krw" aria-hidden="true"></i>&nbsp 매&nbsp&nbsp입&nbsp&nbsp가</span>
			    <input id="price" name="price" type="text" value="${consumable.price}"required="true" class="form-control" placeholder="price">
			    <span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i>&nbsp; 마일리지</span>
			    <input id="mileageprice" name="mileageprice" type="text" value="${consumable.mileageprice}" numberonly="true" class="form-control" placeholder="mileage">
		 	</div>
		</div>
		<div class="bg-warning text-white col-sm-offset-3 col-sm-6" style="margin-top:20px;margin-bottom: 10px">재고 현황</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">전년말재고</span>
			    <input id="preyystock" name="preyystock" numberOnly="true"value="${consumable.preyystock}" required="required" type="text"class="form-control">
			    <span class="input-group-addon">전월말재고</span>
			    <input id="premmstock" name="premmstock" numberOnly="true"value="${consumable.premmstock}" required="required" type="text"class="form-control">
			     <span class="input-group-addon">전일재고</span>
			    <input id="preddstock" name="preddstock" numberOnly="true"value="${consumable.preddstock}" required="required" type="text"class="form-control">
			    <span class="input-group-addon">현재재고</span>
			    <input id="stock" name="stock" numberOnly="true"value="${consumable.stock}" required="required" type="text"class="form-control">
		 	</div>
		</div>
		<div class="bg-warning text-white col-sm-offset-3 col-sm-6" style="margin-top:20px;margin-bottom: 10px">입고 출고 현황</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp1월입고&nbsp</span>
			    <input id="rcv01" name="rcv01" type="text"numberOnly="true"required="required" value="${consumable.rcv01}" class="form-control">
			    <span class="input-group-addon">&nbsp1월출고&nbsp</span>
			    <input id="ship01" name="ship01" type="text"numberOnly="true"required="required" value="${consumable.ship01}" class="form-control">
			     <span class="input-group-addon">&nbsp7월입고&nbsp</span>
			    <input id="rcv07" name="rcv07" type="text"numberOnly="true"required="required" value="${consumable.rcv07}" class="form-control">
			    <span class="input-group-addon">&nbsp7월출고&nbsp</span>
			    <input id="ship07" name="ship07" type="text"numberOnly="true"required="required" value="${consumable.ship07}" class="form-control">
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp2월입고&nbsp</span>
			    <input id="rcv02" name="rcv02" type="text"numberOnly="true"required="required" value="${consumable.rcv02}" class="form-control">
			    <span class="input-group-addon">&nbsp2월출고&nbsp</span>
			    <input id="ship02" name="ship02" type="text"numberOnly="true"required="required" value="${consumable.ship02}" class="form-control">
			     <span class="input-group-addon">&nbsp8월입고&nbsp</span>
			    <input id="rcv08" name="rcv08" type="text"numberOnly="true"required="required" value="${consumable.rcv08}" class="form-control">
			    <span class="input-group-addon">&nbsp8월출고&nbsp</span>
			    <input id="ship08" name="ship08" type="text"numberOnly="true"required="required" value="${consumable.ship08}" class="form-control">
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp3월입고&nbsp</span>
			    <input id="rcv03" name="rcv03" type="text"numberOnly="true"required="required" value="${consumable.rcv03}" class="form-control">
			    <span class="input-group-addon">&nbsp3월출고&nbsp</span>
			    <input id="ship03" name="ship03" type="text"numberOnly="true"required="required" value="${consumable.ship03}" class="form-control">
			     <span class="input-group-addon">&nbsp9월입고&nbsp</span>
			    <input id="rcv09" name="rcv09" type="text"numberOnly="true"required="required" value="${consumable.rcv09}" class="form-control">
			    <span class="input-group-addon">&nbsp9월출고&nbsp</span>
			    <input id="ship09" name="ship09" type="text"numberOnly="true"required="required" value="${consumable.ship09}" class="form-control">
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp4월입고&nbsp</span>
			    <input id="rcv04" name="rcv04" type="text"numberOnly="true"required="required" value="${consumable.rcv04}" class="form-control">
			    <span class="input-group-addon">&nbsp4월출고&nbsp</span>
			    <input id="ship04" name="ship04" type="text"numberOnly="true"required="required" value="${consumable.ship04}" class="form-control">
			     <span class="input-group-addon">10월입고</span>
			    <input id="rcv10" name="rcv10" type="text"numberOnly="true"required="required" value="${consumable.rcv10}" class="form-control">
			    <span class="input-group-addon">10월출고</span>
			    <input id="ship10" name="ship10" type="text"numberOnly="true"required="required" value="${consumable.ship10}" class="form-control">
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp5월입고&nbsp</span>
			    <input id="rcv05" name="rcv05" type="text"numberOnly="true"required="required" value="${consumable.rcv05}" class="form-control">
			    <span class="input-group-addon">&nbsp5월출고&nbsp</span>
			    <input id="ship05" name="ship05" type="text"numberOnly="true"required="required" value="${consumable.ship05}" class="form-control">
			     <span class="input-group-addon">11월입고</span>
			    <input id="rcv11" name="rcv11" type="text"numberOnly="true"required="required" value="${consumable.rcv11}" class="form-control">
			    <span class="input-group-addon">11월출고</span>
			    <input id="ship11" name="ship11" type="text"numberOnly="true"required="required" value="${consumable.ship11}" class="form-control">
		 	</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-6">
	  	  	<div class="input-group">
			    <span class="input-group-addon">&nbsp6월입고&nbsp</span>
			    <input id="rcv06" name="rcv06" type="text"numberOnly="true"required="required" value="${consumable.rcv06}" class="form-control">
			    <span class="input-group-addon">&nbsp6월출고&nbsp</span>
			    <input id="ship06" name="ship06" type="text"numberOnly="true"required="required" value="${consumable.ship06}" class="form-control">
			     <span class="input-group-addon">12월입고</span>
			    <input id="rcv12" name="rcv12" type="text"numberOnly="true"required="required" value="${consumable.rcv12}" class="form-control">
			    <span class="input-group-addon">12월출고</span>
			    <input id="ship12" name="ship12" type="text"numberOnly="true"required="required" value="${consumable.ship12}" class="form-control">
		 	</div>
		</div>
		
		<div class="form-group col-sm-offset-3 col-sm-6" style="text-align:center;margin-top:30px;margin-bottom: 80px">
		  	<button type="button" id="consumableupdatebtn" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp수&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
		  	<button type="button" id="consumabledeletebtn" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp삭&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
		  	<button type="button" onclick="javascript:location.href='consumableList';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		  	<input type="hidden" id="consumablecode" name="consumablecode" value="${consumable.code}">
		</div>
	</div>
	<div class="modal fade" id="consumableconfirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	      	<span id="consumableconfirmModalMsg">...</span>
		  </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      	<button type="button" id="consumableupdateconfirmbtn" style="display: none" class="btn btn-default">수정</button>
	      	<button type="button" id="consumabledeleteconfirmbtn" style="display: none" class="btn btn-default">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</body>
</html>