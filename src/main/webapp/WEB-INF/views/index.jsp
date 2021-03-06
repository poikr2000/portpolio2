<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<head>
<title>

</title>
</head>
<content tag="local_script">

<!-- 예제 시작 -->

<!-- http://localhost 에서 테스트 하시려면 cpw9RMOfkmb0qIa7Vz23 키를 사용해 보세요 -->

<!-- 맵 v3 스크립트 -->
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cpw9RMOfkmb0qIa7Vz23"></script>
<script type="text/javascript">

   // v3 버전 지도 생성
   
   var position = new naver.maps.LatLng(36.33853, 127.39245);
//    var position = new naver.maps.LatLng(36.40936, 127.19897);
   var map = new naver.maps.Map('mapArea', {
      center : position,
      zoom:12,
      mapTypeControl : true
   });
   
   var markerOptions = {
         position: position,
         map:map,
         icon:{
            url:'resources/images/itschool.swf',
            size: new naver.maps.Size(33,44),
            origin: new naver.maps.Point(0,0),
            anchor: new naver.maps.Point(11,35)
         }
   };
   var marker = new naver.maps.Marker(markerOptions);
</script>
</content>
<body>
<form>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="resources/images/slide1.png">
    </div>
    <div class="item">
      <img src="resources/images/slide2.png">
    </div>
    <div class="item">
      <img src="resources/images/slide3.png">
    </div>
    <div class="item">
      <img src="resources/images/slide4.png">
    </div>
    <div class="item">
      <img src="resources/images/slide5.png">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="col-md-12" style="height:300px;background-color: #0d0d0d;text-align: center;">
	<h3 style="margin-top: 80px"><font color="#f39c12">K.O.K FITNESS</font><font color="#FFFFFF">는</font></h3><p>
	<h3><font color="#FFFFFF">가상의 피트니트 센터 관리를 목적으로 하는</font></h3><p>
	<h3><font color="#f39c12">포트폴리오</font> <font color="#FFFFFF">사이트 입니다.</font></h3>
</div>
<div class="col-md-12" style="background:url('resources/images/bgimage.jpg');height:2500px;">
	<!-- post-03 -->
	<div class="post-03" style="margin-top: 100px;">
		<div class="post-03__media"><a href="#"><img src="resources/images/mainimg1.jpg" alt=""/></a></div>
		<div class="post-03__body" style="text-align: center;">
			<div class="post-03__description"><h4><font color="#FFFFFF";>본 홈페이지는 Itschool 정보기술교육원의</font></h4></div><p> 
			<div class="post-03__description"><h4><font color="#FFFFFF";>응용 SW개발자 양성</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>제 3차 교육과정(2017-08-03 ~ 2018-03-06)에서</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>KOK팀이 진행한 프로젝트 입니다.</font></h4></div>
		</div>
	</div><!-- End / post-03 -->
	<!-- post-03 -->
	<div class="post-03 post-03__reverse">
		<div class="post-03__media"><img src="resources/images/mainimg2.jpg" alt=""/></div>
		<div class="post-03__body" style="text-align: center;">
			<div class="post-03__description"><h4><font color="#FFFFFF";>본 홈페이지는 현재 비상업적으로 운영되고 있으며</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>서비스나 마일리지 샵은 신청 기능만 존재합니다.</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>게시판은 로그인을 한 상태에서 자유롭게</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>사용 가능하나 포트폴리오를 위한</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>저렴한 호스팅 서비스를 이용하고 있으므로</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>과도한 게시판 사용의 자제를 부탁드립니다.</font></h4></div><p>
		</div>
	</div><!-- End / post-03 -->
	<!-- post-03 -->
	<div class="post-03" style="margin-top: 100px;">
		<div class="post-03__media"><a href="#"><img src="resources/images/mainimg3.jpg" alt=""/></a></div>
		<div class="post-03__body" style="text-align: center;">
			<div class="post-03__description"><h4><font color="#FFFFFF";>회원가입을 하실때는 개인정보 보호를 위해</font></h4></div><p> 
			<div class="post-03__description"><h4><font color="#FFFFFF";>허구로 작성하실 것을 권유합니다.</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>관리자 권한을 보기위해선 관리자 아이디로</font></h4></div><p>
			<div class="post-03__description"><h4><font color="#FFFFFF";>로그인이 필요하며 관리자 계정은</font></h4></div>
			<div class="post-03__description"><h4>admin@admin.com/1111<font color="#FFFFFF";>입니다</font></h4></div>
			<div class="post-03__description"><h4><font color="#FFFFFF";>다음 프로젝트 에서는 더욱 발전된 모습을</font></h4></div>
			<div class="post-03__description"><h4><font color="#FFFFFF";>보여드리겠습니다. 감사합니다.</font></h4></div>
		</div>
	</div><!-- End / post-03 -->
	<div class="col-md-12">
		<style type="text/css">
		    #mapArea{
		       border:1px solid #ddd;display:block;
		       width:60%;
		       height:300px;
		       clear:both;
		    }
		</style>
		
		<div class="map_wrap" align="center">
		   <div id="mapArea" class="map_div"></div>
		   <div class="map_tit"><h4><font color="#FFFFFF";>찾아오는 길</font></h4></div>
		</div>
		<div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	      <a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="http://ktsmemo.cafe24.com/s/naver_map_v3/128" target="_blank"></a>
	   </div>
	</div>
</div>
</form>
</body>
</html>
