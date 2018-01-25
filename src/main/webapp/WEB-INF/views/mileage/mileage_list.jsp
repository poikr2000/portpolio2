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
				<div class="textbox__image"><a href="#"><img src="${consumables.photo}" alt=""/></a></div>
				<div class="textbox__body">
					<h2 class="textbox__title"><a href="#">${consumables.name}</a></h2>
					<h6><a href="#">${consumables.mileageprice} 마일리지</a></h6>
					<div class="textbox__description">${consumables.explanation}</div>
					<div class="textbox__description">수량 : ${consumables.stock} 개</div>
				</div>
			</div><!-- End / textbox -->
		</c:forEach>
	</div>
</form>
</body>
</html>