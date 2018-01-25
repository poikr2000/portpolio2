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
function partnerUpdate(code){
	$.ajax({
		type:'Post',
		data:"code="+code,
		datatype:'json',
		url : 'partnerDetail',
		success : function(data){
			$("#partnercodeconfirm").hide();
			$('#partnersave').hide();
        	$('#partnerupdate').show();
        	$('#partnerdelete').show();
			$('#code').attr("value",data.code);
			$('#code').attr("readonly",true);
			$('#name').attr("value",data.name);
			$('#busno1').attr("value",data.busno1);
			$('#busno2').attr("value",data.busno2);
			$('#busno3').attr("value",data.busno3);
			$('#ceoname').attr("value",data.ceoname);
			$('#zipcode').attr("value",data.zipcode);
			$('#newaddr').attr("value",data.newaddr);
			$('#detailaddr').attr("value",data.detailaddr);
			$("#officeno1").val(data.officeno1).attr('selected', true);
			$('#officeno2').attr("value",data.officeno2);
			$('#officeno3').attr("value",data.officeno3);
			$('#partnerDetailModal').modal('show');
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
function partnercheck(strValue){
	if(strValue.length==5)
		return true;
	else
		return false;
}
function officeno2_lengthchk(code){
	if(code.value.length==4){
		document.partnerinsert_form.officeno3.focus();
	}
}
function busno1_lengthchk(code){
	if(code.value.length==3){
		document.partnerinsert_form.busno2.focus();
	}
}
function busno2_lengthchk(code){
	if(code.value.length==2){
		document.partnerinsert_form.busno3.focus();
	}
}
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    document.popup_form.target = "pop";
    document.popup_form.action = "jusoPopup";
    document.popup_form.submit() ;
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.partnerinsert_form.newaddr.value = roadAddrPart1;
	document.partnerinsert_form.detailaddr.value = addrDetail;
	document.partnerinsert_form.zipcode.value = zipNo;
}
$(document).ready(function(){
	$(document).on("keyup","input:text[numberOnly]",function(){
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	$('#partnerallchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=partnerunitchk]').prop('checked',true);
		}else{
			$('input[name=partnerunitchk]').prop('checked',false);
		}
	});
	$('#partnertable').DataTable({
		dom: 'ftBp',
        buttons: [
        	{
                text: 'insert',
                action: function ( e, dt, node, config ) {
                	$('#partnersave').show();
                	$('#partnerupdate').hide();
                	$('#partnerdelete').hide();
                	$("#partnercodeconfirm").show();
        			$('#code').attr("value","");
        			$('#code').attr("readonly",false);
        			$('#name').attr("value","");
        			$('#busno1').attr("value","");
        			$('#busno2').attr("value","");
        			$('#busno3').attr("value","");
        			$('#ceoname').attr("value","");
        			$('#zipcode').attr("value","");
        			$('#newaddr').attr("value","");
        			$('#detailaddr').attr("value","");
        			$("#officeno1").val('010').attr('selected', true);
        			$('#officeno2').attr("value","");
        			$('#officeno3').attr("value","");
                	$('#partnerDetailModal').modal('show');
                }
            }
        ]
	});
	$('#partnercodeconfirm').on("click",function(){
		var code = $('#code').val()
		if($('#code').val()==""){
			$('#partnerUtilModalmsg').text("코드를 입력해주세요.");
			$('#partnerUtilModalClose').text("확인");
			$('#partnerUtilModalBtn').hide();
			$('#partnerUtilModalDelete').hide();
			$('#partnerUtilModalClose').show();
			$('#partnerUtilModal').modal('show');
			return;
		}else{
			var boolcode = partnercheck(code);
			if(boolcode==false){
				$('#partnerUtilModalmsg').text("코드번호 5자리를  입력해주세요.");
				$('#partnerUtilModalClose').text("확인");
				$('#partnerUtilModalBtn').hide();
				$('#partnerUtilModalDelete').hide();
				$('#partnerUtilModalClose').show();
				$('#partnerUtilModal').modal('show');
				return;
			}
			$.ajax({
				type:'Post',
				data:"code="+code,
				datatype:'json',
				url : 'partnerCodeConfirm',
				success : function(data){
					if(data>0){
						$('#partnerUtilModalmsg').text("이미 사용중인 코드입니다.");
						$('#partnerUtilModalClose').text("확인");
						$('#partnerUtilModalBtn').hide();
						$('#partnerUtilModalDelete').hide();
						$('#partnerUtilModalClose').show();
						$('#partnerUtilModal').modal('show');
						$('#code').val('');
						return;
					}else{
						$('#partnerUtilModalmsg').text("사용가능 합니다.");
						$('#partnerUtilModalClose').text("확인");
						$('#partnerUtilModalBtn').hide();
						$('#partnerUtilModalDelete').hide();
						$('#partnerUtilModalClose').show();
						$('#partnerUtilModal').modal('show');
						$('#codeconfirmchk').attr("value","yes");
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#partnersave').click(function(){
		var code=$('#code').val();
		var name=$('#name').val();
		var busno1=$('#busno1').val();
		var busno2=$('#busno2').val();
		var busno3=$('#busno3').val();
		var zipcode=$('#zipcode').val();
		var newaddr=$('#newaddr').val();
		var detailaddr=$('#detailaddr').val();
		var officeno2=$('#officeno2').val();
		var officeno3=$('#officeno3').val();
		if(code==""||name==""||busno1==""||busno2==""||busno3==""||
				zipcode==""||newaddr==""||detailaddr==""||officeno2==""||officeno3==""){
			$('#requirechk').click();
			return;
		}
		var msg=""
		if($('#codeconfirmchk').val()=="no"){
			msg+="- 코드 중복 검사를 해주시기 바랍니다 -";
			$('#partnerUtilModalmsg').text(msg);
			$('#partnerUtilModalClose').text("확인");
			$('#partnerUtilModalBtn').hide();
			$('#partnerUtilModalDelete').hide();
			$('#partnerUtilModalClose').show();
			$('#partnerUtilModal').modal('show');
			return;
		}
		$('#partnerinsert_form').attr('action','partnerInsert');
		$('#partnerinsert_form').submit();
	})
	$('#partnerupdate').click(function(){
		var code=$('#code').val();
		var name=$('#name').val();
		var busno1=$('#busno1').val();
		var busno2=$('#busno2').val();
		var busno3=$('#busno3').val();
		var zipcode=$('#zipcode').val();
		var newaddr=$('#newaddr').val();
		var detailaddr=$('#detailaddr').val();
		var officeno2=$('#officeno2').val();
		var officeno3=$('#officeno3').val();
		if(code==""||name==""||busno1==""||busno2==""||busno3==""||
				zipcode==""||newaddr==""||detailaddr==""||officeno2==""||officeno3==""){
			$('#requirechk').click();
			return;
		}else{
			$('#partnerUtilModalBtn').text('수정');
			$('#partnerUtilModalClose').text("취소");
			$('#partnerUtilModalBtn').show();
			$('#partnerUtilModalDelete').hide();
			$('#partnerUtilModalClose').show();
			var msg=""
			msg="- 변경 사항을 저장하시겠습니까? -";
			$('#partnerUtilModalmsg').text(msg);
			$('#partnerUtilModal').modal('show');
		}
	});
	$('#partnerUtilModalBtn').click(function(){
		$('#partnerinsert_form').attr('action','partnerUpdate');
		$('#partnerinsert_form').submit();
	});
	$('#partnerdelete').click(function(){
		var bp_code = $('#code').val();
		$.ajax({
			type:'Post',
			data:"bp_code="+bp_code,
			datatype:'json',
			url : 'GoodsConfirm',
			success : function(data){
				if(data>0){
					$('#partnerUtilModalBtn').text('수정');
					$('#partnerUtilModalClose').text("확인");
					$('#partnerUtilModalBtn').hide();
					$('#partnerUtilModalDelete').hide();
					$('#partnerUtilModalClose').show();
					var msg=""
					msg="- 변경 사항을 저장하시겠습니까? -";
					$('#partnerUtilModalmsg').text("해당 거래처와 연결된 상품을 먼저 삭제해야 합니다.");
					$('#partnerUtilModal').modal('show');
					return;
				}else{
					$('#partnerUtilModalBtn').text('삭제');
					$('#partnerUtilModalClose').text("취소");
					$('#partnerUtilModalBtn').hide();
					$('#partnerUtilModalDelete').show();
					$('#partnerUtilModalClose').show();
					var msg=""
					msg="- 거래처를 삭제하시겠습니까 -";
					$('#partnerUtilModalmsg').text(msg);
					$('#partnerUtilModal').modal('show');
				}
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	})
	$('#partnerUtilModalDelete').click(function(){
		$('#partnerinsert_form').attr('action','partnerDelete');
		$('#partnerinsert_form').submit();
	})
});
</script>
</content>
</head>
<body>
<form class="partnerlist_form" name="partnerlist_form" method="POST">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>거래처 리스트</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 70px;">
			<table class="table table-striped table-bordered" id="partnertable">
				<thead>
					<tr style="text-align:center;">
						<th style="text-align:center;vertical-align:middle;">코드</th>
						<th style="text-align:center;vertical-align:middle;">상호명</th>
						<th style="text-align:center;vertical-align:middle;">사업자번호</th>
						<th style="text-align:center;vertical-align:middle;">사업주</th>
						<th style="text-align:center;vertical-align:middle;">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="partner" items="${partners}">
						<c:choose>
							<c:when test="${partner.code=='00000'}">
							</c:when>
							<c:otherwise>
								<tr>
									<td style="text-align:center;vertical-align:middle;"><a href="javascript:partnerUpdate('${partner.code}');">${partner.code}</a></td>
									<td style="text-align:center;vertical-align:middle;"><a href="javascript:partnerUpdate('${partner.code}');">${partner.name}</a></td>
									<td style="text-align:center;vertical-align:middle;">${partner.busno1}-${partner.busno2}-${partner.busno3}</td>
									<td style="text-align:center;vertical-align:middle;">${partner.ceoname}</td>
									<td style="text-align:center;vertical-align:middle;">${partner.officeno1}-${partner.officeno2}-${partner.officeno3}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</form>
<div id="partnerDetailModal" class="modal fade" role="dialog">
     <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
          <div class="modal-body">
          		<form class="partnerinsert_form" name="partnerinsert_form"id="partnerinsert_form" method="POST" role="form">
					<input type="submit" style="display: none" id="requirechk" name="requirechk">
					<div class="container col-sm-12">
						<div class="form-group col-sm-12" style="margin-top:50px;">
							<label class="col-sm-3">코드</label>
							<div class="col-sm-4">
								<input class="form-control input-sm" id="code" name="code" required="required" type="text" maxlength="5" placeholder="다섯 자리">
							</div>
							<div class="input-group-btn">
							    <button class="btn btn-default" id="partnercodeconfirm" name="partnercodeconfirm" type="button">중복검사</button>
							    <input type="hidden" id="codeconfirmchk" name="codeconfirmchk" value="no">
						    </div>
					  	</div>
					  	<div class="form-group col-sm-12">
							<label class="col-sm-3">상호명</label>
							<div class="col-sm-4">
								<input class="form-control input-sm" maxlength="14" id="name" name="name" required="required" type="text">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label class="col-sm-3">사업자번호</label>
							<div class="col-sm-3">
								<input class="form-control input-sm" maxlength="3"id="busno1" name="busno1" numberonly="true" required="required" onkeyup="busno1_lengthchk(this)"type="text">
							</div>
							<div class="col-sm-2">
								<input class="form-control input-sm" maxlength="2"id="busno2" name="busno2" numberonly="true" required="required" onkeyup="busno2_lengthchk(this)"type="text">
							</div>
							<div class="col-sm-3">
								<input class="form-control input-sm" maxlength="5"id="busno3" name="busno3" numberonly="true" required="required" type="text">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label class="col-sm-3">사업주</label>
							<div class="col-sm-4">
								<input class="form-control input-sm" maxlength="14" id="ceoname" name="ceoname" required="required" type="text">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label class="col-sm-3">주소</label>
							<div class="col-sm-3">
								<input class="form-control input-sm" id="zipcode" name="zipcode"required="required" type="text">
							</div>
							<div class="input-group-btn">
							    <button class="btn btn-default" type="button" onclick="goPopup();">
							    	<i class="glyphicon glyphicon-search"></i>&nbsp주소지 검색
							   	</button>
						    </div>
						</div>
						<div class="form-group col-sm-12">
					    	<div class="col-sm-offset-3 col-sm-4">
								<input class="form-control input-sm" id="newaddr" name="newaddr"required="required" type="text">
							</div>
							<div class="col-sm-4">
								<input class="form-control input-sm" id="detailaddr" name="detailaddr"required="required" type="text" placeholder="상세 주소를 입력해 주세요.">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<label class="col-sm-3">전화번호</label>
							<div class="col-sm-3">
								<select id="officeno1" name="officeno1" class="form-control"> 
							    	<option value="010" selected>010</option>
							    	<option value="011">011</option> 
							    	<option value="012">012</option> 
							    	<option value="016">016</option> 
							    	<option value="017">017</option> 
							    	<option value="018">018</option> 
							    	<option value="019">019</option> 
							    </select>
							</div>
							<div class="col-sm-3">
								<input class="form-control input-sm" maxlength="4"id="officeno2" name="officeno2" numberonly="true" required="required" onkeyup="officeno2_lengthchk(this)" type="text" placeholder="phone2">
							</div>
							<div class="col-sm-3">
								<input class="form-control input-sm" maxlength="4"id="officeno3" name="officeno3" numberonly="true" required="required" type="text" placeholder="phone3">
							</div>
						</div>
						<div class="col-sm-12" style="text-align:center;margin-top:10px;margin-bottom: 20px;">
							<button class="btn" type="button" id="partnersave" style="display: none"  name="partnersave">등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;록</button>
							<button class="btn" type="button" id="partnerupdate" style="display: none" name="staffupdate">수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn" type="button" id="partnerdelete" style="display: none" name="partnerdeletebtn">삭&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn" type="button" data-dismiss="modal">돌아가기</button>
						</div>
					</div>
				</form>
          </div>
          <div class="modal-footer" style="text-align:center">
          </div>
       </div>
    </div>
</div>
<div id="partnerUtilModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
       <div class="modal-content">
          <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
          	<p><span id="partnerUtilModalmsg"> Some text in modal</span>
          </div>
          <div class="modal-footer" style="text-align:center">
             <button type="button" id="partnerUtilModalBtn"class="btn btn-success" style="display: none" data-dismiss="modal">수정</button>
             <button type="button" id="partnerUtilModalDelete"class="btn btn-success" style="display: none" data-dismiss="modal">삭제</button>
             <button type="button" id="partnerUtilModalClose"class="btn btn-success" style="display: none" data-dismiss="modal">취소</button>
          </div>
       </div>
    </div>
</div>
<form method="post" class="popup_form" name="popup_form"></form>
</body>
</html>