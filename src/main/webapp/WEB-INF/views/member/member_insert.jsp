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
    document.insert_form.target = "pop";
    document.insert_form.action = "jusoPopup";
    document.insert_form.submit() ;
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.insert_form.newaddr.value = roadAddrPart1;
	document.insert_form.detailaddr.value = addrDetail;
	document.insert_form.zipcode.value = zipNo;
}
$(document).ready(function(){
	$('#emailconfirm').on("click",function(){
		var email = $('#email').val()
		if($('#email').val()==""){
			$('#signUpModalMsg').text("메일주소를 입력해주세요.");
			$('#usebtn').text("확인");
			$('#signUpModal').modal('show');
			return;
		}else{
			$.ajax({
				type:'Post',
				data:"email="+email,
				datatype:'json',
				url : 'emailConfirm',
				success : function(data){
					if(data>0){
						$('#signUpModalMsg').text("이미 사용중인 메일입니다.");
						$('#usebtn').text("확인");
						$('#signUpModal').modal('show');
						$('#email').val('');
						return;
					}else{
						$('#signUpModalMsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#signUpModal').modal('show');
						$('#emailconfirmchk').attr("value","yes");
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#idconfirm').on("click",function(){
		var id = $('#id').val()
		if($('#id').val()==""){
			$('#signUpModalMsg').text("별명을 입력해주세요.");
			$('#usebtn').text("확인");
			$('#signUpModal').modal('show');
			return;
		}else{
			$.ajax({
				type:'Post',
				data:"id="+id,
				datatype:'json',
				url : 'idConfirm',
				success : function(data){
					if(data>0){
						$('#signUpModalMsg').text("이미 사용중인 별명입니다.");
						$('#usebtn').text("확인");
						$('#signUpModal').modal('show');
						$('#id').val('');
						return;
					}else{
						$('#signUpModalMsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#signUpModal').modal('show');
						$('#idconfirmchk').attr("value","yes");
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#membersave').click(function(){
		var msg=""
		if($('#emailconfirmchk').val()=="no"){
			msg+="- 이메일 중복 검사를 해주시기 바랍니다 -";
			$('#signUpModalMsg').text(msg);
			$('#usebtn').text("확인");
			$('#signUpModal').modal('show');
			return;
		}
		if($('#idconfirmchk').val()=="no"){
			msg+="- 별명 중복 검사를 해주시기 바랍니다 -";
			$('#signUpModalMsg').text(msg);
			$('#usebtn').text("확인");
			$('#signUpModal').modal('show');
			return;
		}
		if($('#password').val()!=$('#passwordchk').val()){
			msg+="- 비밀번호를 다시 확인 해주시기 바랍니다 -";
			$('#signUpModalMsg').text(msg);
			$('#usebtn').text("확인");
			$('#signUpModal').modal('show');
			$('#passwordchk').val('');
			return;
		}
		if(typeof(grecaptcha)!='undefinded'){
			if(grecaptcha.getResponse()==""){
				msg+="- 자동가입 방지를 체크해 주시기 바랍니다 -";
				$('#signUpModalMsg').text(msg);
				$('#usebtn').text("확인");
				$('#signUpModal').modal('show');
				return;
			}
		}
		$('#insert_form').attr('action','memberInsert');
		$('#insert_form').submit();
	})
});
</script>
</content>
</head>
<body>
<form name="insert_form" id="insert_form" method="post" role="form" data-parsley-validate="true"enctype="multipart/form-data">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12" style="text-align:left;margin-top:50px;">
			<div class="col-sm-offset-3" style="margin-top:50px;">
				<h1 class="page-title__title">회원 가입</h1>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:50px;">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-4">
					<input class="form-control input-sm" id="email" name="email" required="required" type="email" placeholder="email">
				</div>
				<div class="input-group-btn">
				    <button class="btn btn-default" id="emailconfirm" name="emailconfirm" type="button">중복검사</button>
				    <input type="hidden" id="emailconfirmchk" name="emailconfirmchk" value="no">
			    </div>
		  	</div>
		  	<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:10px;">
				<label class="col-sm-2">별명</label>
				<div class="col-sm-4">
					<input class="form-control input-sm" maxlength="7" id="id" name="id" required="required" type="text" placeholder="7자 이내">
				</div>
				<div class="input-group-btn">
				    <button class="btn btn-default" id="idconfirm" name="idconfirm" type="button">중복검사</button>
				    <input type="hidden" id="idconfirmchk" name="idconfirmchk" value="no">
			    </div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:10px;">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input class="form-control input-sm" maxlength="15"id="password" name="password" required="required" type="password" placeholder="password">
				</div>
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input class="form-control input-sm" maxlength="15"id="passwordchk" name="passwordchk" required="required" type="password" placeholder="password">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:10px;">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-4">
					<input class="form-control input-sm" maxlength="10"id="name" name="name"required="required" type="text" placeholder="name">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:10px;">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-2">
					<input class="form-control input-sm" id="zipcode" name="zipcode"required="required" type="text">
				</div>
				<div class="input-group-btn">
				    <button class="btn btn-default" type="button" onclick="goPopup();">
				    	<i class="glyphicon glyphicon-search"></i>&nbsp주소지 검색
				   	</button>
			    </div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8">
		    	<div class="col-sm-offset-2 col-sm-4">
					<input class="form-control input-sm" id="newaddr" name="newaddr"required="required" type="text">
				</div>
				<div class="col-sm-4">
					<input class="form-control input-sm" id="detailaddr" name="detailaddr"required="required" type="text" placeholder="상세 주소를 입력해 주세요.">
				</div>
			</div>
			<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:10px;">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-2">
					<select id="phone1" name="phone1" class="form-control"> 
				    	<option value="010" selected>010</option>
				    	<option value="011">011</option> 
				    	<option value="012">012</option> 
				    	<option value="016">016</option> 
				    	<option value="017">017</option> 
				    	<option value="018">018</option> 
				    	<option value="019">019</option> 
				    </select>
				</div>
				<div class="col-sm-2">
					<input class="form-control input-sm" maxlength="4"id="phone2" name="phone2" required="required" type="text" placeholder="phone2">
				</div>
				<div class="col-sm-2">
					<input class="form-control input-sm" maxlength="4"id="phone3" name="phone3" required="required" type="text" placeholder="phone3">
				</div>
			</div>
	</div>
	<div class="col-sm-offset-5 col-sm-4" style="text-align:center;margin-top:30px;">
		<div class="g-recaptcha" data-sitekey="6Lfj5D8UAAAAAIlcxEx4RbEWnwlJsNXqNXRpu-nC"></div>
	</div>
 	<div class="col-sm-offset-4 col-sm-4" style="text-align:center;margin-top:50px;margin-bottom: 80px">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn" type="button" onclick="history.back();">돌아가기</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<button class="btn" type="button" id="membersave" name="membersave">회원가입</button>
	</div>
	
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      </div>
	      <div class="modal-body">
	        <span id="signUpModalMsg">...</span>
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