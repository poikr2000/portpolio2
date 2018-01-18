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
function myFunction() {
	var qty = document.receivinginsert_form.qty.value;
	var price = document.receivinginsert_form.price.value;
	$('#total').attr("value",qty*price);
}
$(document).ready(function(){
	$(document).on("keyup","input:text[numberOnly]",function(){
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	var today = new Date();
	var year = today.getFullYear();
	var mm = today.getMonth()+1;
	var dd= today.getDate();
	$('#searchyyyy').attr("value",year);
	$('#searchmm').val(mm).prop("selected", true);
	$('#searchdd').val(dd).prop("selected", true);
	$("#select_consumable").change(function() {
		var code = $(this).val();
		$.ajax({
			type:'Post',
			data:"code="+code,
			datatype:'json',
			url : 'consumableSelected',
			success : function(data){
				$('#consume_code').attr("value",data.consume_code);
				$('#bp_name').attr("value",data.bp_name);
				$('#bp_code').attr("value",data.bp_code);
				$('#price').attr("value",data.price);
				$('#stock').attr("value",data.stock);
				$('#qty').focus();
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	});
	$('#receivinginsertbtn').click(function(){
		var selectconsumable = $('#select_consumable').val();
		if(selectconsumable == '00000000'){
			$('#modalmsgconsume').text('- 매입 상품을 선택하세요! -');
		}else{
			$('#modalmsgconsume').text('');
		}
		if($('#qty').val()==0){
			$('#qtyConfirmModalMsg').text('- 수량을 입력하세요! -');
		}else{
			$('#qtyConfirmModalMsg').text('');
		}
		if(selectconsumable == '0000000000000'||$('#qty').val()==""){
			$('#qtyConfirmModal').modal('show');
			return;
		}else{
			$('.receivinginsert_form').attr('action','receivingInsert');
			$('.receivinginsert_form').submit();
		}
	});
});
</script>
</content>
</head>
<body>
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="col-sm-offset-2 col-sm-8">
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;text-align:center;">
			  <h2>매입 관리</h2>
		</div>
		<form class="receivinginsert_form" name="receivinginsert_form" method="POST"role="form" data-parsley-validate="true">
			<div class="col-sm-5">
			  	<div class="row" style="margin-top:50px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">품&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp명</span>
					    <select id="select_consumable" name="consume_name" class="form-control"> 
					    	<c:forEach var="consumable" items="${consumables}">
								<option value="${consumable.code}">${consumable.name}</option>
							</c:forEach>
					    </select>
					    <input type="hidden" id="vendname" name="vendname">
					    <input type="hidden" id="seq" name="seq" value="0">
					    <input type="hidden" id="beforeprocode" name="beforeprocode">
					    <input type="hidden" id="beforeqty" name="beforeqty" value="0">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">거&nbsp&nbsp래&nbsp&nbsp처</span>
					    <input id="bp_name" name="bp_name" type="text" readonly="readonly" class="form-control">
					    <input id="bp_code" name="bp_code" type="hidden">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">매입번호</span>
					    <input id="yyyy" name="yyyy" readonly="readonly" value="${receiving.yyyy}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="mm" name="mm" readonly="readonly" value="${receiving.mm}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="dd" name="dd" readonly="readonly" value="${receiving.dd}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="no" name="no" readonly="readonly" value="${receiving.no}"type="text" class="form-control" >
					    <span class="input-group-addon">-</span>
					    <input id="hang" name="hang" readonly="readonly" value="${receiving.hang}"type="text" class="form-control" >
				 	</div>
				</div>
				<div class="row" style="margin-top:30px">
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">상품코드</span>
					    <input id="consume_code" name="consume_code" readonly="readonly" type="text" class="form-control">
					    <span class="input-group-addon">현&nbsp&nbsp재&nbsp&nbsp고</span>
					    <input id="stock" name="stock" type="text" readonly="readonly" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">단&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp가</span>
					    <input id="price" name="price" type="text" readonly="readonly" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp량</span>
					    <input id="qty" name="qty" type="text" numberonly="true"class="form-control" onkeyup="myFunction()">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp액</span>
					    <input id="total" name="total"value="0"readonly="readonly" type="text" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
			  	  	<div class="input-group">
					    <span class="input-group-addon">비&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp고</span>
					    <input id="memo" name="memo" type="text" class="form-control">
				 	</div>
				</div>
				<div class="row" style="margin-top:10px">
				  	<button type="button" id="receivinginsertbtn" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp저&nbsp&nbsp&nbsp&nbsp&nbsp장</button>
				  	<button type="reset" id="receivingreset" class="btn btn-primary"><i class="fa fa-eraser" aria-hidden="true"></i>&nbsp초&nbsp기&nbsp화</button>
				  	<button type="button" id="receivingupdate" class="btn btn-primary" style="display: none"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp수&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
				  	<button type="button" onclick="javascript:location.href='index';" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
				  	&nbsp&nbsp&nbsp&nbsp
				  	<button type="button" onclick="javascript:location.href='receivingInsertForm';"id="" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i>&nbspNew</button>
				</div>
			</div>
		</form>
		<div class="col-sm-1"></div>
		<form class="buysearch_form" name="buysearch_form" action="buySearch" method="POST"role="form" data-parsley-validate="true">
			<div class="col-sm-6">
				<div style="margin-top:50px;height: 470px;">
					<table width="100%">
						<tr>
							<td>
								 <input id="vendername" name="vendername" type="text" value="<c:if test="${receiving.bp_code!=null}">(${receiving.bp_code})${receiving.bp_name}</c:if>"class="form-control">
							</td>
							<td>
								 <input id="yymmdd" name="yymmdd" type="text" value="<c:if test="${receiving.yyyy!=null}">${receiving.yyyy}-${receiving.mm}-${receiving.dd}</c:if>"class="form-control">
							</td>
						</tr>
					</table>
					<div class="pre-scrollable">
						<table class="table table-striped table-bordered" cellspacing="0"  width="100%" >
				        <thead>
				            <tr>
				                <th>no</th>
				                <th>항번</th>
				                <th>품명</th>
				                <th>단가</th>
								<th>수량</th>
								<th>금액</th>
								<th></th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="receivings" items="${receivings}">
				        		<c:choose>
				        			<c:when test="${receivings.hang==0 && receivings.no !=0}">
				        					<tr>
							        			<td class="text-center"></td>
							        			<td class="text-center"></td>
							        			<td class="text-center"></td>
							        			<td class="text-center bg-info text-white">소계</td>
							        			<td class="text-center"></td>
							        			<td class="text-center bg-info text-white">${receivings.total}</td>
							        			<td class="text-center"></td>
											</tr>
				        				</c:when>
					        			<c:when test="${receivings.hang==0 && receivings.no ==0}">
					        				<tr>
							        			<td class="text-center"></td>
							        			<td class="text-center"></td>
							        			<td class="text-center"></td>
							        			<td class="text-center bg-primary text-white">총계</td>
							        			<td class="text-center"></td>
							        			<td class="text-center bg-primary text-white">${receivings.total}</td>
							        			<td class="text-center"></td>
											</tr>
					        			</c:when>
					        			<c:otherwise>
					        				<tr>
							        			<td class="text-center">${receivings.no}</td>
							        			<td class="text-center">${receivings.hang}</td>
							        			<td class="text-center"><a href="#" onclick="selectedSeq(${receivings.seq});">${receivings.consume_name}</a></td>
							        			<td class="text-center">${receivings.price}</td>
							        			<td class="text-center">${receivings.qty}</td>
							        			<td class="text-center">${receivings.total}</td>
							        			<td class="text-center"><a href="buyListDelete?seq=${receivings.seq}"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
											</tr>
				        				</c:otherwise>
				        			</c:choose>
								</c:forEach>
					        </tbody>
					    </table>
				    </div>
				</div>
				<div class="input-group" style="margin-top:10px;margin-bottom: 80px">
					<select id="searchvender" name="searchvender" class="form-control" style="width: 100px;"> 
				    	<c:forEach var="partner" items="${partners}">
							<option value="${partner.code}">${partner.name}</option>
						</c:forEach>
				    </select>
				    <span class="input-group-addon"></span>
					<input width="20" id="searchyyyy" name="searchyyyy" type="text" class="form-control" placeholder="yyyy">
					<span class="input-group-addon">-</span>
					<select id="searchmm" name="searchmm" class="form-control" style="width: 70px;"> 
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
				    </select>
					<span class="input-group-addon">-</span>
					<select id="searchdd" name="searchdd" class="form-control" style="width: 70px;"> 
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<div class="input-group-btn">
						<button type="button" id="buysearch_btn" class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i>&nbsp검&nbsp&nbsp&nbsp&nbsp&nbsp색</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="qtyConfirmModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="modalmsgconsume"></span>
               	<p><span id="qtyConfirmModalMsg"></span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
     </div>
</body>
</html>