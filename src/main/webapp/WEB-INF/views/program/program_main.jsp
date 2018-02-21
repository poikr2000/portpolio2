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
<style>
body {
  background: #B1A7A0;
	color: #FCF9F4;
  font-family: "Open Sans", "Arial";
}
main {
  max-width: 800px;
  margin: 30px auto;
	background: #3F3F3D;
	padding: 30px;
	box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
input[name=css-tabs] {
  display: none;
}
#tabs {
	padding: 0 0 0 50px;
	width: calc(100% + 50px);
	margin-left: -50px;
	height: 80px;
	border-bottom: 5px solid #f39c12;
	box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
#tabs::before {
	content: "";
	display: block;
	position: absolute;
	z-index: -100;
	width: 100%;
	left: 0;
	margin-top: 16px;
	height: 80px;
	background: #2B2A28;
	border-bottom: 5px solid #EB4E01;
}
#tabs::after {
	content: "";
	display: block;
	position: absolute;
	z-index: 0;
	height: 80px;
	width: 102px;
	background: #f39c12;
	transition: transform 400ms;
}
#tabs label {
	position: relative;
	z-index: 100;
	display: block;
	float: left;
  font-size: 11px;
	text-transform: uppercase;
	text-align: center;
	width: 100px;
	height: 100%;
	cursor: pointer;
}
#tabs label::before {
	content: "";
	display: block;
	height: 100px;
	width: 100px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	filter: invert(40%);
}
#tab1::before {
	background-image: url(resources/images/icon2.png);
}
#tab2::before {
	background-image: url(resources/images/icon1.png);
}
#tab3::before {
	background-image: url(resources/images/icon5.png);
}
#tab4::before {
	background-image: url(resources/images/icon3.png);
}
#radio1:checked ~ #tabs #tab1::before, #radio2:checked ~ #tabs #tab2::before, #radio3:checked ~ #tabs #tab3::before, #radio4:checked ~ #tabs #tab4::before {
	filter: invert(100%);
}
#radio1:checked ~ #tabs::after {
	transform: translateX(0);
}
#radio2:checked ~ #tabs::after {
	transform: translateX(101px);
}
#radio3:checked ~ #tabs::after {
	transform: translateX(202px);
}
#radio4:checked ~ #tabs::after {
	transform: translateX(303px);
}
#content {
	position: relative;
	height: 500px;
}
#content::before {
	content: "";
	display: block;
	position: absolute;
	width: 0;
	height: 0;
	margin-left: -50px;
}
#content::after {
	content: "";
	display: block;
	position: absolute;
	width: 0;
	height: 0;
	margin-left: calc(100% + 30px);
}
#content section {
	position: absolute;
	transform: translateY(50px);
	opacity: 0;
	transition: transform 500ms, opacity 500ms;
}
#radio1:checked ~ #content #content1, #radio2:checked ~ #content #content2, #radio3:checked ~ #content #content3, #radio4:checked ~ #content #content4 {
	transform: translateY(0);
	opacity: 1;
}
</style>
<form style="background:url('resources/images/bgimage.jpg')">
	<div style="height:2300px">
		<div class="row">
			<div class="col-md-8 col-lg-8 offset-0 offset-sm-0 offset-md-2 offset-lg-2 ">
				<!-- title-01 -->
				<div class="title-01">
					<h2 class="title-01__title" style="margin-top: 120px;">
						<font color="#FFFFFF"; face="Impact">program</font>
					</h2>
				</div><!-- End / title-01 -->
			</div>
		</div>
		<div class="col-sm-offset-1 col-md-10">
			<input id="radio1" type="radio" name="css-tabs" checked>
			<input id="radio2" type="radio" name="css-tabs">
			<input id="radio3" type="radio" name="css-tabs">
			<input id="radio4" type="radio" name="css-tabs">
			<div id="tabs">
				<label id="tab1" for="radio1"></label>
				<label id="tab2" for="radio2"></label>
				<label id="tab3" for="radio3"></label>
				<label id="tab4" for="radio4"></label>
			</div>
			<div id="content">
				<section id="content1">
					<div class="col-md-12"style="margin-top:30px;">
						<h2 class="post-03__title" ><font color="#FFFFFF" face="Impact">Health Training</font></h2>
					</div>
					<div class="col-md-12">
						<!-- post-03 -->
					<div class="post-03">
						<div class="post-03__media"><a href="#"><img src="resources/images/health2.jpg" alt=""/></a></div>
							<div class="post-03__body">
								<h2 class="post-03__title"><font color="#FFFFFF";>1. 해외 명품 브랜드 머신 완비 (MATRIX)</font></h2>
								<div class="post-03__description">전세계 1위 헬스 기구 기업인 매트릭스(MATRIX)의  명품 헬스기구 제품을 사용합니다.
	터치스크린, 비디오, 오디오 사용이 가능하고 가상현실을 이용한 실감나는 운동 경험을 제공합니다. 경사조절이 가능한 런닝머신, 계단이 움직이는 클라이밀, 노를 젓는 로잉머신 등의 헬스기구가 비치되어 있습니다.</div>
							</div>
						</div><!-- End / post-03 -->
						<!-- post-03 -->
						<div class="post-03 post-03__reverse">
							<div class="post-03__media"><img src="resources/images/health3.jpg" alt=""/></div>
							<div class="post-03__body">
								<h2 class="post-03__title"><font color="#FFFFFF";>2. 항시 플로팅 서비스</font></h2>
								<div class="post-03__description">지속적인 스터디와 교육이수를 통해 회원님의 건강을 위해 끊임 없이 연구하는 KOK Fitness 최고의 강사진이 회원님들께 올바른 운동 방법을 제공 해 드립니다.
	헬스 이용이 처음이시더라도 두려워 하지마세요! KOK Fitness 팀이 책임 지겠습니다! 운동 중 궁금한 점이 생기시면 언제든지 질문해 주세요!</div>
							</div>
						</div><!-- End / post-03 -->
						<!-- post-03 -->
						<div class="post-03">
							<div class="post-03__media"><img src="resources/images/health1.jpg" alt=""/></div>
							<div class="post-03__body">
								<h2 class="post-03__title"><font color="#FFFFFF";>3. 온탕, 사우나 무제한 이용!</font></h2>
								<div class="post-03__description">운동 후 제공되는  온탕과 사우나 시설을 이용해 수축된 근육의 이완과 매일매일 누적된 피로를 풀 수 있습니다. 저희 KOK Fitness는 하루 입장제한이 없으니, 자유롭게 온탕, 사우나 시설을 즐겨주세요!</div>
							</div>
						</div><!-- End / post-03 -->
					</div>
				</section>
				<section id="content2">
					<div class="col-md-12"style="margin-top:30px;margin-bottom:30px;">
						<h2 class="post-03__title" ><font color="#FFFFFF"face="Impact">P.T(Personal Training)</font></h2>
					</div>
					<div class="col-md-12">
						<img src="resources/images/PersonalTraining1.jpg" alt=""/>
					</div>
					<div class="col-md-12"style="margin-top:30px;margin-bottom:30px;">
						<div class="post-03__description"> 기존의 헬스 코치는 단순 기구 사용법이나 획일적인 사용횟수 혹은 세트 수에 의지한 프로그램을 실행하던 것에 반해 퍼스널 트레이닝은 보다 진보화된 다이어트, 근력강화, 재활, 체중증가, 키 크기 운동, 늘어진 살, 디스크 환자, 출산 전후 몸매관리, 단기간의 변화, 혹은 장기간의 전문적인 관리를 필요로 하신 분들 께 적합합니다.</div>
					</div>
					<div class="col-md-12">
						<img src="resources/images/personalTraining2.jpg" alt=""/>
					</div>
					<div  class="col-md-12" style="margin-top:30px;">
						<h6 class="post-03__subTitle" >step. 1</h6>
						<div class="post-03__description">회원님의 직업과 생활 유형을 파악하여 좀 더 구체적인 프로그램으로 개별화하는 단계입니다. 건강상태, 운동경험, 과거 병력, 운동 목표 등의 상담을 하며 신체 지수 측정, 체력 테스트 및 훈련을 통한 정확한 목표를 개선함으로써 보다 과학적이며 안전적인 트레이닝을 실시합니다.</div>
						<h6 class="post-03__subTitle">step. 2</h6>
						<div class="post-03__description">회원님의 안전교육 후 운동 유형을 파악하여 프로그램을 진행하는 단계입니다. 체계적인 프로그램을 통한 운동에 대한 관념과 기본 적응 시 겪게되는 반응을 관리함으로 트레이너와 회원님의 커뮤니케이션이 가장 중요한 단계입니다.</div>
						<h6 class="post-03__subTitle">step. 3</h6>
						<div class="post-03__description">시행한 운동 수행능력 테스트 결과를 토대로 개인 특성에 맞는 운동 처방을 내리게 됩니다.</div>
					</div>
				</section>
				
				<section id="content3" >
					<div class="col-md-12" style="margin-top:30px;margin-bottom:30px;"align="center">
						<h2 class="post-03__title" style="text-align: center"><font color="#FFFFFF"face="Impact">G.X(Group Exercise)</font></h2>
					</div>
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
					      <img src="resources/images/gximg2.png">
					    </div>
					    <div class="item">
					      <img src="resources/images/gximg3.png">
					    </div>
					    <div class="item">
					      <img src="resources/images/gximg4.png">
					    </div>
					    <div class="item">
					      <img src="resources/images/gximg5.png">
					    </div>
					    <div class="item">
					      <img src="resources/images/gximg6.png">
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
					<div class="post-03__description" style="margin-top:30px;margin-bottom:30px;">별도로 마련된 GX룸에서 요가, 댄스 뿐만 아니라 해외 최신 운동 프로그램 까지 다양한 프로그램으로 운동하실 수 있습니다.</div>
					<details open="open">
						<summary>스케쥴표 보기</summary>
						<img src="resources/images/gx_sch.png" style="margin-top:30px;">
					</details>
				</section>
				<section id="content4">
					<div class="col-md-12"style="margin-top:30px;">
						<h2 class="post-03__title" ><font color="#FFFFFF" face="Impact">Pilates</font></h2>
					</div>
					<div class="col-md-12">
						<img src="resources/images/pilatesimg2.jpg" style="margin-bottom:60px;"alt=""/>
					</div>
					<div class="col-sm-offset-1 col-md-10"align="left">
						<div class="post-03__description" style="margin-top:30px;">리포머, 체어, 캐딜락, 바렐 등 다양한 필라테스 기구들을 모두 이용하여 수준 높은 필라테스의 세계와 프로그램을 경험하실 수 있습니다. 특정한 신체 부위와 움직임을 통제하는 피트니스파이브의 전문 필라테스 강사와의 수업을 통해 근골격계 질환 개선, 자세 교정, 통증 완화, 심폐기능 강화, 혈액순환 향상, 관절 안정성 및 유연성 향상, 효율적인 몸의 기능 회복, 체형 교정 등 필라테스의 다양한 효과를 몸으로 직접 느낄 수 있습니다.​
						</div>
						<h6><font class="post-03__subTitle" style="color: #F7D358">정기적인 피지컬테스트로 과학적인 운동방법을 제시합니다.</font></h6>
						<div class="post-03__description">피트니스파이브에서는 담당 인스트럭터가 체성분 측정, 체형 측정, 보행 측정, 자세 측정, 유연성 측정 등 다양한 측정들을 통해 보다 과학적인 회원님들의 상태분석을 통해 최고의 운동방법을 제시합니다.​</div>
						
						<h6><font class="post-03__subTitle" style="color: #F7D358">맞춤 운동시간을 고려한 세션 패키지 상품입니다.</font></h6>
						<div class="post-03__description">회원님의 운동을 1:1 전문 강사들이 직접 설계하여 최적의 세션패키지를 안내하여 경제적이고 신뢰성을 더욱 높입니다. 담당 인스트럭터와 프로그램 미팅을 통하여 가능한 시간대에 예약하실 수 있습니다.​​</div>
						
						<h6><font class="post-03__subTitle" style="color: #F7D358">미국 최고의 발란스드바디사와 피크필라테스사 장비를 사용합니다.</font></h6>
						<div class="post-03__description">미국 피크 필라테스사의 다양한 장비로 더욱 과학적이고 안전한 운동을 보장해드립니다. 작은 차이가 명품을 만들듯이 좋은 장비로 작은 차이를 느끼십시오!​​</div>
						
						<h6><font class="post-03__subTitle" style="color: #F7D358">회원님의 특성, 라이프스타일까지 고려해 운동 목표를 달성해 드립니다.</font></h6>
						<div class="post-03__description">재활, 자세교정, 다이어트, 척추질환, 산전후, 어린이 성장, 골프컨디셔닝등 회원님의 필요한 목표를 달성해 드립니다.​​</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</form>
</body>
</html>