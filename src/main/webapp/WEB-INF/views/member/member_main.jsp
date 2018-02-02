<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<content tag="local_script">
<script>
$(document).ready(function() {
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
});
</script>
</content>
<body>
<form style="background:url('resources/images/bgimage.jpg')">
	<div style="height:700px">
		<div class="row">
			<div class="col-md-8 col-lg-8 offset-0 offset-sm-0 offset-md-2 offset-lg-2 ">
				<!-- title-01 -->
				<div class="title-01">
					<h2 class="title-01__title" style="margin-top: 120px;">
						<font color="#FFFFFF"; face="Impact">MEMBER PAGE</font>
					</h2>
				</div><!-- End / title-01 -->
			</div>
		</div>
	</div>
	<div id="floatMenu">
		<ul>
			<li><a href="memberDetail?email=${sessionemail}">회원정보 수정</a></li>
			<li><a href="memberOrderList?email=${sessionemail}">주문상품 조회</a></li>
			<li><a href="">회원탈퇴</a></li>
		</ul>
	</div>
</form>
</body>
</html>