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
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    document.partnerinsert_form.target = "pop";
    document.partnerinsert_form.action = "jusoPopup";
    document.partnerinsert_form.submit() ;
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
});
</script>
</content>
</head>
<body>
<form class="partnerinsert_form" name="partnerinsert_form"id="partnerinsert_form" method="POST" role="form">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;text-align:center;">
			  <h2>거래처 등록</h2>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8" style="margin-top:50px;">
			<label class="col-sm-2">코드</label>
			<div class="col-sm-4">
				<input class="form-control input-sm" id="code" name="code" required="required" type="text" maxlength="5" placeholder="다섯 자리">
			</div>
			<div class="input-group-btn">
			    <button class="btn btn-default" id="codeconfirm" name="codeconfirm" type="button">중복검사</button>
			    <input type="hidden" id="codeconfirmchk" name="codeconfirmchk" value="no">
		    </div>
	  	</div>
	  	<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">상호명</label>
			<div class="col-sm-4">
				<input class="form-control input-sm" maxlength="14" id="name" name="name" required="required" type="text">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">사업자번호</label>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="3"id="busno1" name="busno1" numberonly="true" required="required" type="text" placeholder="세자리">
			</div>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="2"id="busno2" name="busno2" numberonly="true" required="required" type="text" placeholder="두자리">
			</div>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="5"id="busno3" name="busno3" numberonly="true" required="required" type="text" placeholder="다섯자리">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">사업주</label>
			<div class="col-sm-4">
				<input class="form-control input-sm" maxlength="14" id="ceoname" name="ceoname" required="required" type="text">
			</div>
		</div>
		<div class="form-group col-sm-offset-3 col-sm-8">
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
		<div class="form-group col-sm-offset-3 col-sm-8">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-2">
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
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="4"id="officeno2" name="officeno2" numberonly="true" required="required" type="text" placeholder="phone2">
			</div>
			<div class="col-sm-2">
				<input class="form-control input-sm" maxlength="4"id="officeno3" name="officeno3" numberonly="true" required="required" type="text" placeholder="phone3">
			</div>
		</div>
		<div class="col-sm-offset-4 col-sm-4" style="text-align:center;margin-top:50px;margin-bottom: 80px">
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn" type="button" onclick="history.back();">돌아가기</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<button class="btn" type="button" id="membersave" name="membersave">등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;록</button>
		</div>
	</div>
</form>
</body>
</html>