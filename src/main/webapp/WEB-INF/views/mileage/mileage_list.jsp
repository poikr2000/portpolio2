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
function mileageDetail(code){
	$.ajax({
		type:'Post',
		data:"code="+code,
		datatype:'json',
		url : 'mileageDetail',
		success : function(data){
			$('#goodsimg').attr("src",data.photo);
			$('#goodsqty').attr("max",data.stock);
			$('#goodsname').text(data.name);
			$('#goodsprice').text(data.mileageprice);
			$('#mileageDetailModal').modal('show');
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
};
var usermileage = $('#usermileage').val();
$("#goodsqty").bind('keyup mouseup', function () {
	var price = $('#goodsprice').text();
	var qty=$('#goodsqty').val();
	$('#goodstotal').text(qty*price);
	var total=$('#goodstotal').text();
	$('#goodsbalance').text(usermileage-total);
});
</script>
</content>
</head>
<body>
<form>
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="col-sm-12">
		<div class="col-sm-offset-3 col-sm-8" style="margin-top:50px;">
			  <h3>마일리지 샵</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
	</div>
	<div class="container">
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
</form>
<div class="modal fade" id="mileageDetailModal" name="mileageDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="col-sm-12">
	      		<div class="col-sm-offset-1 col-sm-5 textbox__image">
			     	<img id="goodsimg" name="goodsimg" src="" style="max-width: 100%;max-height: 100%"/>
			    </div>
			    <div  class="textbox__body col-sm-5" align="center" style="margin-top: 20px;">
			     	<div class="col-sm-12">
			     		<h3 id="goodsname"></h3>
			     	</div>
			     	<div class="col-sm-12" style="margin-top: 20px;">
			     		<h5>가격 : <span id="goodsprice"></span> 마일리지</h5>
			     		<input type="hidden" id="price">
			     	</div>
			     	<div class="col-sm-12" style="margin-top: 20px;">
			     		<h5><span>수량 : </span><input id="goodsqty" type="number" value="0" min="0"></h5>
			     	</div>
			     	<div class="col-sm-12" style="margin-top: 20px;">
			     		<h5>총 상품 금액 : <span id="goodstotal">0</span> 마일리지</h5>
			     	</div>
			     	<div>
			     		<input type="hidden" id="usermileage" value="${sessionmileage}">
			     		<h5>남은 마일리지 : <span id="goodsbalance">0</span> 마일리지</h5>
			     	</div>
			    </div>
		     	<div class="col-sm-offset-7 col-sm-5" style="margin-top: 20px;">
		     		<button type="button" id="goodsSaveBtn"class="btn btn-success" data-dismiss="modal">장바구니</button>
		     		<button type="button" id="goodsApplyBtn"class="btn btn-success" data-dismiss="modal">상품 신청</button>
            		<button type="button" id="goodsClose"class="btn btn-success" data-dismiss="modal">돌아가기</button>
		     	</div>
	      	</div>
		    
	      </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</body>
</html>