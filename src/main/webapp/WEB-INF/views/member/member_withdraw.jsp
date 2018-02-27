<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script>
$(document).ready(function(){
	$('#pwcheck').on("click",function(){
		$('#withdrawModal').modal('show');
		$('#usebtn').on('click',function(){
			$('.memberwithdraw_form').submit();
		});
	});
});
</script>
</content>
</head>
<body>
	<form class="memberwithdraw_form" name="memberwithdraw_form" method="POST" action="memberWithdraw">
		<div class="col-sm-12" style="background:black;height:90px;">
		</div>
		<div class="container col-sm-12" align="center" style="height:750px;">
			<div style="margin-top:50px;">
				<h3>비밀번호 확인</h3>
			</div>
			<div>
				<input type="hidden" id="idchk" name="email" value="${sessionemail}">
			</div>
			<div class="col-sm-offset-4 col-sm-4" align="center" style="margin-top:50px;">
				<input type="password" id="password" name="password">
			</div>
			<div class="col-sm-offset-4 col-sm-4" align="center" style="margin-top:20px;">
				<button type="button" id="pwcheck" class="btn btn-default">확인</button>
			</div>
		</div>
		
		<div id="withdrawModal" class="modal fade" role="dialog">
	         <div class="modal-dialog modal-sm" role="document">
	            <div class="modal-content">
	               <div class="modal-header">
	                  <button type="button" class="close" data-dismiss="modal">&times;</button>
	                  <h4 class="modal-title">회원탈퇴</h4>
	               </div>
	               <div class="modal-body">
	               	<p><span id="withdrawModalMsg">정말 회원을 탈퇴하시겠습니까?</span>
	               </div>
	               <div class="modal-footer" style="text-align:center">
	                  <button type="button" id="usebtn" class="btn btn-success" data-dismiss="modal">확인</button>
	                  <button type="button" id="celbtn" class="btn btn-success" data-dismiss="modal">취소</button>
	               </div>
	            </div>
	         </div>
	     </div>
	</form>
</body>
</html>