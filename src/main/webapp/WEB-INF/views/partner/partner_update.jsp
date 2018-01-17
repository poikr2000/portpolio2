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
function officeno2_lengthchk(code){
	if(code.value.length==4){
		document.partnerupdate_form.officeno3.focus();
	}
}
function busno1_lengthchk(code){
	if(code.value.length==3){
		document.partnerupdate_form.busno2.focus();
	}
}
function busno2_lengthchk(code){
	if(code.value.length==2){
		document.partnerupdate_form.busno3.focus();
	}
}
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    document.partnerupdate_form.target = "pop";
    document.partnerupdate_form.action = "jusoPopup";
    document.partnerupdate_form.submit() ;
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.partnerupdate_form.newaddr.value = roadAddrPart1;
	document.partnerupdate_form.detailaddr.value = addrDetail;
	document.partnerupdate_form.zipcode.value = zipNo;
}
$(document).ready(function(){
	$(document).on("keyup","input:text[numberOnly]",function(){
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	$('#partnerupdatebtn').click(function(){
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
			$('#updateconfirmbtn').show();
			$('#deleteconfirmbtn').hide();
			var msg=""
			msg="- 변경 사항을 저장하시겠습니까? -";
			$('#updateconfirmModalMsg').text(msg);
			$('#updateconfirmModal').modal('show');
		}
	});
	$('#updateconfirmbtn').click(function(){
		$('#partnerupdate_form').attr('action','partnerUpdate');
		$('#partnerupdate_form').submit();
	});
	$('#partnerdeletebtn').click(function(){
		$('#updateconfirmbtn').hide();
		$('#deleteconfirmbtn').show();
		var msg=""
		msg="- 거래처를 삭제하시겠습니까 -";
		$('#updateconfirmModalMsg').text(msg);
		$('#updateconfirmModal').modal('show');
	})
	$('#deleteconfirmbtn').click(function(){
		$('#partnerupdate_form').attr('action','partnerDelete');
		$('#partnerupdate_form').submit();
	})
});
</script>
</content>
</head>
<body>
<form class="partnerupdate_form" name="partnerupdate_form"id="partnerupdate_form" method="POST" role="form">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<input type="submit" style="display: none" id="requirechk" name="requirechk">
	<div class="container col-sm-12">
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;text-align:center;">
			  <h2>${partner.name} 정보수정</h2>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:50px;">
			<label class="col-sm-2">코드</label>
			<div class="col-sm-4">
				<input class="form-control input-sm" id="code" name="code" type="text" value="${partner.code}"readonly="readonly">
			</div>
	  	</div>
	  	<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">상호명</label>
			<div class="col-sm-4">
				<input class="form-control input-sm" maxlength="14" id="name" name="name" value="${partner.name}" required="required" type="text">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">사업자번호</label>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="3"id="busno1" name="busno1" numberonly="true" value="${partner.busno1}"required="required" onkeyup="busno1_lengthchk(this)"type="text">
			</div>
			<div class="col-sm-1">
				<input class="form-control input-sm" maxlength="2"id="busno2" name="busno2" numberonly="true" value="${partner.busno2}"required="required" onkeyup="busno2_lengthchk(this)"type="text">
			</div>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="5"id="busno3" name="busno3" numberonly="true" value="${partner.busno2}"required="required" type="text">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">사업주</label>
			<div class="col-sm-4">
				<input class="form-control input-sm" maxlength="14" id="ceoname" name="ceoname" value="${partner.ceoname}"required="required" type="text">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-2">
				<input class="form-control input-sm" id="zipcode" name="zipcode" value="${partner.zipcode}"required="required" type="text">
			</div>
			<div class="input-group-btn">
			    <button class="btn btn-default" type="button" onclick="goPopup();">
			    	<i class="glyphicon glyphicon-search"></i>&nbsp주소지 검색
			   	</button>
		    </div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
	    	<div class="col-sm-offset-2 col-sm-4">
				<input class="form-control input-sm" id="newaddr" name="newaddr" value="${partner.newaddr}"required="required" type="text">
			</div>
			<div class="col-sm-4">
				<input class="form-control input-sm" id="detailaddr" name="detailaddr"value="${partner.detailaddr}"required="required" type="text" placeholder="상세 주소를 입력해 주세요.">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-2">
					<select id="officeno1" name="officeno1" class="form-control"> 
				    	<option value="010" <c:if test="${partner.officeno1=='010'}">selected</c:if>>010</option>
				    	<option value="011" <c:if test="${partner.officeno1=='011'}">selected</c:if>>011</option> 
				    	<option value="012" <c:if test="${partner.officeno1=='012'}">selected</c:if>>012</option> 
				    	<option value="016" <c:if test="${partner.officeno1=='016'}">selected</c:if>>016</option> 
				    	<option value="017" <c:if test="${partner.officeno1=='017'}">selected</c:if>>017</option> 
				    	<option value="018" <c:if test="${partner.officeno1=='018'}">selected</c:if>>018</option> 
				    	<option value="019" <c:if test="${partner.officeno1=='019'}">selected</c:if>>019</option> 
				    </select>
			</div>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="4"id="officeno2" name="officeno2" value="${partner.officeno2}"numberonly="true" required="required" onkeyup="officeno2_lengthchk(this)" type="text" placeholder="phone2">
			</div>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="4"id="officeno3" name="officeno3" value="${partner.officeno3}"numberonly="true" required="required" type="text" placeholder="phone3">
			</div>
		</div>
		<div class="col-sm-offset-4 col-sm-4" style="text-align:center;margin-top:50px;margin-bottom: 80px">
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn" type="button" onclick="history.back();">돌아가기</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<button class="btn" type="button" id="partnerdeletebtn" name="partnerdeletebtn">거래처삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn" type="button" id="partnerupdatebtn" name="partnerupdatebtn">정보수정</button>
		</div>
	</div>
	<div class="modal fade" id="updateconfirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	      	<span id="updateconfirmModalMsg">...</span>
		  </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      	<button type="button" id="updateconfirmbtn" style="display: none" class="btn btn-default">수정</button>
	      	<button type="button" id="deleteconfirmbtn" style="display: none" class="btn btn-default">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</body>
</html>