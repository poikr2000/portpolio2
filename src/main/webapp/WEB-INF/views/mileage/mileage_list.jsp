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
function goodsDelete(seq){
	$('#carttable').empty();
	$.ajax({
		type:'Post',
		data:"seq="+seq,
		datatype:'json',
		url : 'cartDelete',
		success : function(data){
			$("#goodslistdiv").load(window.location.href+"#goodslistdiv #goodslist");
			$('.badge-notify').text(data.cartcount);
			cartDetail(data.member_mail);
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
};
function cartDetail(member_mail){
	$.ajax({
		type:'Post',
		data:"member_mail="+member_mail,
		datatype:'json',
		url : 'cartDetail',
		success : function(data){
			if (!$.trim(data)){   
				$('#carttable').append('<tr><td style="text-align:center;"><h5>장바구니가 비어있습니다.</h5></td></tr>');
			}else{
				$.each(data, function( index, value ) {
					if(value.hang==""){
						$('#carttable').append('<tr><td>합계</td><td></td><td></td><td></td><td>'+value.mileagetotal+'</td><td></td></tr>');	
					}else{
						$('#carttable').append('<tr><td style="width: 50pt;"><input type="hidden" id="seq" name="seq" value="'+value.seq+'"><img src="'+value.photo+'" style="width:100%;"/></td><td>'+value.consume_name+'</td><td>'+value.mileageprice+'</td><td>'+value.qty+'</td><td>'+value.mileagetotal+'</td><td><a href="javascript:goodsDelete('+value.seq+');" class="btn btn-xs btn-danger my-product-remove">X</a></td></tr>');
					}
				});
			}
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
	$('#cartModal').modal('show');
};
function mileageDetail(code){
	$.ajax({
		type:'Post',
		data:"code="+code,
		datatype:'json',
		url : 'mileageDetail',
		success : function(data){
			$('#consume_code').attr("value",data.code);
			$('#mileageprice').attr("value",data.mileageprice);
			$('#price').attr("value",data.price);
			$('#goodsimg').attr("src",data.photo);
			$('#goodsqty').attr("max",data.stock);
			$('#goodsname').text(data.name);
			$('#goodsprice').text(data.mileageprice);
			$('#goodsexplanation').text(data.explanation);
			$('#mileageDetailModal').modal('show');
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
};
$(document).ready(function(){
	$('#cartModal').on('hidden.bs.modal', function(e){ 
        $('#carttable').empty();
        location.reload();
    });
	var usermileage = $('#usermileage').val();
	$("#goodsqty").bind('keyup mouseup', function () {
		var price = $('#goodsprice').text();
		var qty=$('#goodsqty').val();
		$('#goodstotal').text(qty*price);
		$('#mileagetotal').val(qty*price);
		var total=$('#goodstotal').text();
		$('#goodsbalance').text(usermileage-total);
	});
	$('#goodsSaveBtn').click(function(){
		var usermileage = $('#usermileage').val();
		var total=$('#goodstotal').text();
		if(usermileage-total<0){
			$('#mileageNoticeModalConfirm').hide();
			$('#mileageNoticeModalClose').show();
			$('#mileageNoticeModalClose').text("확인");
			$('#mileageNoticeModalMsg').text("마일리지가 부족합니다.");
			$('#mileageNoticeModal').modal('show');
		}else if($("#goodsqty").val()==0){
			$('#mileageNoticeModalConfirm').hide();
			$('#mileageNoticeModalClose').show();
			$('#mileageNoticeModalClose').text("확인");
			$('#mileageNoticeModalMsg').text("수량을 선택해 주세요");
			$('#mileageNoticeModal').modal('show');
		}else{
			var formData = $(".mileageCartForm").serialize();
			$.ajax({
				type:'Post',
				data:formData,
				datatype:'json',
				url : 'shippingInsert',
				success : function(data){
					$('.badge-notify').text(data.cartcount);
					location.reload();
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#checkoutbtn').click(function(){
		var seqarr=[];
		$('#seq').each(function(){
			seqarr.push($(this).val());
    	});
		if(seqarr.length>0){
			$('#mileageNoticeModalConfirm').show();
			$('#mileageNoticeModalClose').show();
			$('#mileageNoticeModalClose').text("취소");
			$('#mileageNoticeModalMsg').text("상품을 주문하시겠습니까?");
			$('#mileageNoticeModal').modal('show');
		}else{
			$('#mileageNoticeModalConfirm').hide();
			$('#mileageNoticeModalClose').show();
			$('#mileageNoticeModalClose').text("확인");
			$('#mileageNoticeModalMsg').text("상품을 등록하셔야 합니다.");
			$('#mileageNoticeModal').modal('show');
		}
	});
	$('#mileageNoticeModalConfirm').click(function(){
		$('.cartForm').submit();
	});
	$('#goodsApplyBtn').click(function(){
		var usermileage = $('#usermileage').val();
		var total=$('#goodstotal').text();
		if(usermileage-total<0){
			$('#mileageNoticeModalConfirm').hide();
			$('#mileageNoticeModalClose').show();
			$('#mileageNoticeModalClose').text("확인");
			$('#mileageNoticeModalMsg').text("마일리지가 부족합니다.");
			$('#mileageNoticeModal').modal('show');
		}else if($("#goodsqty").val()==0){
			$('#mileageNoticeModalConfirm').hide();
			$('#mileageNoticeModalClose').show();
			$('#mileageNoticeModalClose').text("확인");
			$('#mileageNoticeModalMsg').text("수량을 선택해 주세요");
			$('#mileageNoticeModal').modal('show');
		}else{
			$('#orderNoticeModalMsg').text("상품을 주문하시겠습니까?");
			$('#orderNoticeModal').modal('show');
		}
	});
	$('#orderNoticeModalConfirm').click(function(){
		$('.mileageCartForm').submit();
	});
	var floatPosition = parseInt($("#floatCart").css('top'));
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		$("#floatCart").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
});
</script>
</content>
</head>
<body>
<style>
.badge-notify{
     background:red;
     position:relative;
     -moz-transform: translate(-100%, -250%); /* For Firefox */
     -ms-transform: translate(-100%, -250%); /* for IE */
     -webkit-transform: translate(-100%, -250%); /* For Safari, Chrome, iOS */
     -o-transform: translate(-100%, -250%); /* For Opera */
     }
#floatCart {
	position: absolute;
	z-index:100;
	right: 130px;
	top: 230px;
	background-color: rgba( 255, 255, 255, 0 );
	color: #fff;
}

</style>
<form>
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="col-sm-12">
		<div class="col-sm-offset-3 col-sm-4" style="margin-top:50px;">
			  <h3>마일리지 샵</h3>
		</div>
		<c:if test="${sessionemail=='admin@admin.com'}">
			<div class="col-sm-3" align="right" style="margin-top:50px;">
				<button type="button" class="btn btn-default" onclick ="location.href='orderListForm'" id="orderSearch">상품주문 조회</button>
			</div>
		</c:if>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
	</div>
	<div class="container" id="floatCart"align="right">
      <a href="javascript:cartDetail('${sessionemail}');" style="font-size:60px;">
        <span class="glyphicon glyphicon-shopping-cart my-cart-icon"></span>
      </a>
      <span class="badge badge-notify">${cartcount}</span>
      <div><h6>내 마일리지 : ${sessionmileage}</h6></div>
    </div>
	<div class="container" id="goodslistdiv">
		<div id="goodslist">
			<c:forEach var="consumables" items="${consumables}">
				<!-- textbox -->
				<div class="textbox textbox__style-02 col-sm-3">
					<div class="textbox__image"><a href="javascript:mileageDetail('${consumables.code}');"><img src="${consumables.photo}" alt=""/></a></div>
					<div class="textbox__body">
						<h2 class="textbox__title"><a href="javascript:mileageDetail('${consumables.code}');">${consumables.name}</a></h2>
						<h6>${consumables.mileageprice} 마일리지</h6>
						<h6>수량 : ${consumables.stock} 개<h6>
						<div class="textbox__description">${consumables.explanation}</div>
						
					</div>
				</div><!-- End / textbox -->
			</c:forEach>
		</div>
	</div>
</form>
<div class="modal fade" id="mileageDetailModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" id="mileageDetailContent">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
	      <form class="mileageCartForm" method="post" action="directOrderInsert">
	      	<input type="hidden" value="${sessionemail}" id="member_mail" name="member_mail">
	      	<div class="col-sm-12">
	      		<div class="col-sm-offset-1 col-sm-4 textbox__image">
			     	<img id="goodsimg" name="goodsimg" src="" style="max-width: 100%;max-height: 100%"/>
			     	<h4 id="goodsexplanation"></h4>
			    </div>
			    <div  class="textbox__body col-sm-7" >
			     	<div class="col-sm-12" align="center">
			     		<h2 id="goodsname"></h2>
			     		<input type="hidden" name="consume_code" id="consume_code">
			     	</div>
			     	<div class="col-sm-12" align="right"style="margin-top: 10px;">
			     		<h5>가격 : <span id="goodsprice"></span> 마일리지</h5>
			     		<input type="hidden" name="mileageprice"id="mileageprice">
			     		<input type="hidden" name="price"id="price">
			     	</div>
			     	<div class="col-sm-12" style="margin-top: 140px;" align="right">
				     	<div class="col-sm-4">
				     		<h5><span>수량 : </span><input style="width:55px;" id="goodsqty" name="qty" type="number" value="0" min="0"></h5>
				     	</div>
				     	<div  class="col-sm-8">
				     		<h5>총 상품금액 : <span id="goodstotal">0</span> 마일리지</h5>
				     		<input type="hidden" name="mileagetotal"id="mileagetotal">
				     	</div>
			     	</div>
			     	<div align="right">
			     		<input type="hidden" id="usermileage" value="${sessionmileage}">
			     		<h5>남은 마일리지 : <span id="goodsbalance">0</span> 마일리지</h5>
			     	</div>
			    </div>
		     	<div class="col-sm-offset-7 col-sm-5" style="margin-top: 10px;">
		     		<button type="button" id="goodsSaveBtn"class="btn btn-success">장바구니</button>
		     		<button type="button" id="goodsApplyBtn"class="btn btn-success">상품 신청</button>
		     	</div>
	      	</div>
	      </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<form class="cartForm" method="post" action="orderInsert">
	<div class="modal fade" id="cartModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      	<h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-shopping-cart"></span> My Cart</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="modal-container col-sm-12">
				<table class="table fade in">
					<tbody id="carttable">
					</tbody>
				</table>
			</div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" id="checkoutbtn" class="btn btn-primary">상품신청</button>
	      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
<div class="modal fade" id="mileageNoticeModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      	 <span id="mileageNoticeModalMsg">...</span>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="mileageNoticeModalConfirm" style="display: none" data-dismiss="modal">확인</button>
      	<button type="button" class="btn btn-default" id="mileageNoticeModalClose" style="display: none" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="orderNoticeModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      	 <span id="orderNoticeModalMsg">...</span>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="orderNoticeModalConfirm" data-dismiss="modal">확인</button>
      	<button type="button" class="btn btn-default" id="orderNoticeModalClose" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>