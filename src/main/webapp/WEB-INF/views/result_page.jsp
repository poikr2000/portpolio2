<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12"style="background:url('resources/images/resultpage.jpg');height:750px;background-size:auto;text-align:center;">
		<div style="text-align:center;margin-top:50px;">
			<h6 class="page-title__title">가입 완료</h6>
		</div>
		<div style="text-align:center;margin-top:50px;">
			<div><h5>${member.name}님의 회원가입을 진심으로 환영합니다.</h5></div>
			<div><h5>서비스를 이용하려면 우측 상단 로그인을 해 주시기 바랍니다</h5></div>
			<div><h5><a href="index"><홈으로 돌아가기></a></h5></div>
		</div>
	</div>
</form>
</body>
</html>