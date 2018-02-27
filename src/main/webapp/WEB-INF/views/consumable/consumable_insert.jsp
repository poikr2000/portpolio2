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
function consumablecheck(strValue){
	if(strValue.length==8)
		return true;
	else
		return false;
}
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
	$('#consumableconfirm').click(function(){
		var code = $('#code').val()
		if($('#code').val()==""){
			$('#consumableModalMsg').text("코드를 입력해주세요.");
			$('#usebtn').text("확인");
			$('#consumableModal').modal('show');
			return;
		}else{
			var boolcode = consumablecheck(code);
			if(boolcode==false){
				$('#consumableModalMsg').text("코드번호 8자리를  입력해주세요.");
				$('#consumableModal').modal('show');
				return;
			}
			$.ajax({
				type:'Post',
				data:"code="+code,
				datatype:'json',
				url : 'consumableCodeConfirm',
				success : function(data){
					if(data>0){
						$('#consumableModalMsg').text("이미 사용중인 번호입니다.");
						$('#usebtn').text("확인");
						$('#consumableModal').modal('show');
						$('#code').val('');
						return;
					}else{
						$('#consumableModalMsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#consumableModal').modal('show');
						$('#consumableconfirmchk').attr("value","yes");
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#consumablesave').click(function(){
		var code=$('#code').val();
		var name=$('#name').val();
		var capacity=$('#capacity').val();
		var price=$('#price').val();
		if(code==""||name==""||capacity==""||price==""){
			$('#requirechk').click();
			return;
		}
		var category_code = $('#category_code').val();
		var bp_code = $('#bp_code').val();
		if(category_code == '0000000000'){
			$('#consumableModalMsg').text('- 카테고리를 선택하세요! -');
			$('#consumableModal').modal('show');
			return;
		}
		if(bp_code == '00000'){
			$('#consumableModalMsg').text('- 거래처를 선택하세요! -');
			$('#consumableModal').modal('show');
			return;
		}
		var msg=""
		if($('#consumableconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요 -";
			$('#consumableModalMsg').text(msg);
			$('#consumableModal').modal('show');
			return;
		}else{
			$('.consumableinsert_form').submit();
		}
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
<form class="consumableinsert_form" action="consumableInsert" method="post" role="form" enctype="multipart/form-data">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<input type="submit" style="display: none" id="requirechk" name="requirechk">
	<div class="container col-sm-12">
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>상품 등록</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
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
		<div class="col-sm-offset-4 col-sm-4" style="margin-top:20px;">
			<div class="row">
				<a href=#><img title="클릭후 이미지 변경"alt="클릭후 이미지 변경"style="WIDTH: 50%; border:1px solid"
				id="image"name="image"src="resources/images/noimage.jpg" class="img-responsive center-block"></a>
			</div>
			<div class="row">
				<input type="file" id="photo"name="imgfile" style="visibility:hidden;">
			</div>
		</div>
		<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-barcode" aria-hidden="true"></i>&nbsp; 상품코드</span>
			    <input id="code" name="code" type="text" numberonly="true" required="true" maxlength="8" class="form-control" placeholder="8자리 입력">
			    <input type="hidden" name="consumableconfirmchk" id="consumableconfirmchk" value="no">
			    <div class="input-group-btn">
			      <button id="consumableconfirm" class="btn btn-default" type="button">중복검사</button>
			    </div>
			</div>
	  	</div>
	  	<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-folder-o" aria-hidden="true"></i>&nbsp; 카테고리</span>
			    <select id="category_code" name="category_code" class="form-control"> 
			    	<c:forEach var="category" items="${categorys}">
						<option value="${category.code}">${category.name}</option>
					</c:forEach>
			    </select>
			</div>
		</div>
	  	<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp; 상&nbsp;&nbsp;품&nbsp;&nbsp;명</span>
			    <input id="name" name="name" type="text" required="true"class="form-control" placeholder="name">
			</div>
		</div>
		<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-gift" aria-hidden="true"></i>&nbsp; 규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</span>
			    <input id="capacity"  name="capacity" type="text" required="true" class="form-control"placeholder="capacity">
			</div>
		</div>
		<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-krw" aria-hidden="true"></i>&nbsp; 매&nbsp;&nbsp;입&nbsp;&nbsp;가</span>
			    <input id="price" name="price" type="text" numberonly="true" required="true" class="form-control" placeholder="price">
			</div>
		</div>
		<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i>&nbsp; 마일리지</span>
			    <input id="mileageprice" name="mileageprice" type="text" required="true" numberonly="true" class="form-control" placeholder="mileage">
			</div>
		</div>
		<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i>&nbsp; 취&nbsp;&nbsp;급&nbsp;&nbsp;처</span>
			    <select id="bp_code" name="bp_code" class="form-control"> 
			    	<c:forEach var="partner" items="${partners}">
						<option value="${partner.code}">${partner.name}</option>
					</c:forEach>
			    </select>
			</div>
		</div>
		<div class="form-group col-sm-offset-4 col-sm-4">
			<div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp; 상품설명</span>
			    <textarea class="form-control"id="explanation" name="explanation"></textarea>
			</div>
		</div>
		<div class="col-sm-offset-4 col-sm-4" style="text-align:center;margin-top:30px;margin-bottom: 80px">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn" type="button" onclick="history.back();">돌아가기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn" type="button" id="consumablesave" name="consumablesave">상품등록</button>
		</div>
	</div>
	<div class="modal fade" id="consumableModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      </div>
	      <div class="modal-body">
	        <span id="consumableModalMsg">...</span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="usebtn" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</body>
</html>