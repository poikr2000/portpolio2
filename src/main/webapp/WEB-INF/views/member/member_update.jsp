<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    document.update_form.target = "pop";
    document.update_form.action = "jusoPopup";
    document.update_form.submit() ;
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.update_form.newaddr.value = roadAddrPart1;
	document.update_form.detailaddr.value = addrDetail;
	document.update_form.zipcode.value = zipNo;
}
$(document).ready(function(){
	$('#memberupdatebtn').click(function(){
		var msg=""
		if($('#userpassword').val()!=$('#passwordchk').val()){
			msg="- 비밀번호를 다시 확인 해주시기 바랍니다 -";
			$('#updateModalMsg').text(msg);
			$('#usebtn').text("확인");
			$('#updateModal').modal('show');
			$('#passwordchk').val('');
			return;
		}
		msg="- 변경 사항을 저장하시겠습니까? -";
		$('#confirmModalMsg').text(msg);
		$('#confirmModal').modal('show');
	})
	$('#confirmbtn').click(function(){
		$('#update_form').attr('action','memberUpdate');
		$('#update_form').submit();
	})
});
</script>
</content>
</head>
<body>
<form name="update_form" id="update_form" method="post" role="form" data-parsley-validate="true"enctype="multipart/form-data">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12" style="text-align:left;">
			<div class="col-sm-offset-3" style="margin-top:50px;">
				<h3>정보 수정</h3>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:50px;">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-4">
					<input class="form-control input-sm" value="${member.email}"id="email" name="email"readonly="readonly" type="text">
				</div>
		  	</div>
		  	<div class="form-group col-sm-offset-3 col-sm-8">
				<label class="col-sm-2">닉네임</label>
				<div class="col-sm-4">
					<input class="form-control input-sm" maxlength="7" value="${member.id}"id="id" name="id" readonly="readonly" type="text">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input class="form-control input-sm" maxlength="15"id="userpassword" name="password" required="required" type="password" placeholder="password">
				</div>
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input class="form-control input-sm" maxlength="15"id="passwordchk" name="passwordchk" required="required" type="password" placeholder="password">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-4">
					<input class="form-control input-sm" maxlength="10"value="${member.name}"id="name" name="name"required="required" type="text" placeholder="name">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-2">
					<input class="form-control input-sm" id="zipcode" value="${member.zipcode}" name="zipcode"required="required" type="text">
				</div>
				<div class="input-group-btn">
				    <button class="btn btn-default" type="button" onclick="goPopup();">
				    	<i class="glyphicon glyphicon-search"></i>&nbsp주소지 검색
				   	</button>
			    </div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8">
		    	<div class="col-sm-offset-2 col-sm-4">
					<input class="form-control input-sm" id="newaddr" value="${member.newaddr}"name="newaddr"required="required" type="text">
				</div>
				<div class="col-sm-4">
					<input class="form-control input-sm" id="detailaddr" value="${member.detailaddr}"name="detailaddr"required="required" type="text" placeholder="상세 주소를 입력해 주세요.">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-2">
					<select id="phone1" name="phone1" class="form-control"> 
				    	<option value="010" <c:if test="${member.phone1=='010'}">selected</c:if>>010</option>
				    	<option value="011" <c:if test="${member.phone1=='011'}">selected</c:if>>011</option> 
				    	<option value="012" <c:if test="${member.phone1=='012'}">selected</c:if>>012</option> 
				    	<option value="016" <c:if test="${member.phone1=='016'}">selected</c:if>>016</option> 
				    	<option value="017" <c:if test="${member.phone1=='017'}">selected</c:if>>017</option> 
				    	<option value="018" <c:if test="${member.phone1=='018'}">selected</c:if>>018</option> 
				    	<option value="019" <c:if test="${member.phone1=='019'}">selected</c:if>>019</option> 
				    </select>
				</div>
				<div class="col-sm-2">
					<input class="form-control input-sm" value="${member.phone2}" maxlength="4"id="phone2" name="phone2" required="required" type="text" placeholder="phone2">
				</div>
				<div class="col-sm-2">
					<input class="form-control input-sm" value="${member.phone3}"maxlength="4"id="phone3" name="phone3" required="required" type="text" placeholder="phone3">
				</div>
			</div>
	</div>
 	<div class="col-sm-offset-4 col-sm-4" style="text-align:center;margin-top:50px;margin-bottom: 80px">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn" type="button" onclick="history.back();">돌아가기</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<button class="btn" type="button" id="memberupdatebtn" name="memberupdatebtn">수정</button>
	</div>
	
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      </div>
	      <div class="modal-body">
	        <span id="updateModalMsg">...</span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="updatebtn" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	      	<span id="confirmModalMsg">...</span>
		  </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      	<button type="button" id="confirmbtn" class="btn btn-default">변경</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</body>
</html>