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
				
					<!-- post-03 -->
						<div class="post-03">
							<div class="post-03__media"><a href="#"><img src="resources/images/health2.jpg" alt=""/></a></div>
							<div class="post-03__body">
								<h2 class="post-03__title"><font color="#FFFFFF"; face="Impact">헬스 트레이닝</font></h2>
								<h6 class="post-03__subTitle">1. 해외 명품 브랜드 머신 완비 (MATRIX)</h6>
								<div class="post-03__description">전세계 1위 헬스 기구 기업인 매트릭스(MATRIX)의  명품 헬스기구 제품을 사용합니다.
터치스크린, 비디오, 오디오 사용이 가능하고 가상현실을 이용한 실감나는 운동 경험을 제공합니다. 경사조절이 가능한 런닝머신, 계단이 움직이는 클라이밀, 노를 젓는 로잉머신 등의 헬스기구가 비치되어 있습니다.</div>
							</div>
						</div><!-- End / post-03 -->
						
						
						<!-- post-03 -->
						<div class="post-03 post-03__reverse">
							<div class="post-03__media"><img src="resources/images/health3.jpg" alt=""/></div>
							<div class="post-03__body">
								<h6 class="post-03__subTitle">2. 항시 플로팅 서비스</h6>
								<div class="post-03__description">지속적인 스터디와 교육이수를 통해 회원님의 건강을 위해 끊임 없이 연구하는 KOK Fitness 최고의 강사진이 회원님들께 옳바른 운동 방법을 제공 해 드립니다.
헬스 이용이 처음이시더라도 두려워 하지마세요! KOK Fitness 팀이 책임 지겠습니다! 운동 중 궁금한 점이 생기시면 언제든지 질문해 주세요!</div>
							</div>
						</div><!-- End / post-03 -->
						
						
						<!-- post-03 -->
						<div class="post-03">
							<div class="post-03__media"><img src="resources/images/health1.jpg" alt=""/></div>
							<div class="post-03__body">
								<h6 class="post-03__subTitle">3. 온탕, 사우나 무제한 이용!</h6>
								<div class="post-03__description">운동 후 제공되는  온탕과 사우나 시설을 이용해 수축된 근육의 이완과 매일매일 누적된 피로를 풀 수 있습니다. 저희 KOK Fitness는 하루 입장제한이 없으니, 자유롭게 온탕, 사우나 시설을 즐겨주세요!</div>
							</div>
						</div><!-- End / post-03 -->
						
				</section>
				<section id="content2">
					<div class="col-md-12">
						<img src="resources/images/PersonalTraining1.jpg" alt=""/>
					</div>
					<div class="col-md-12"style="margin-top:30px;">
						<h2 class="post-03__title" ><font color="#FFFFFF";>P.T(Personal Training)</font></h2>
					</div>
					<div class="col-md-12">
						<div class="post-03__description"> 기존의 헬스 코치는 단순 기구 사용법이나 획일적인 사용횟수 혹은 세트 수에 의지한 프로그램을 실행하던 것에 반해 퍼스널 트레이닝은 보다 진보화된 다이어트, 근력강화, 재활, 체중증가, 키 크기 운동, 늘어진 살, 디스크 환자, 출산 전후 몸매관리, 단기간의 변화, 혹은 장기간의 전문적인 관리를 필요로 하신 분들 께 적합합니다.</div>
					</div>
					<div class="col-md-12">
						<img src="resources/images/personalTraining2.jpg" alt=""/>
					</div>
					<div  class="col-md-12" style="margin-top:30px;">
						<h6 class="post-03__subTitle">step. 1</h6>
						<div class="post-03__description">회원님의 직업과 생활 유형을 파악하여 좀 더 구체적인 프로그램으로 개별화하는 단계입니다. 건강상태, 운동경험, 과거 병력, 운동 목표 등의 상담을 하며 신체 지수 측정, 체력 테스트 및 훈련을 통한 정확한 목표를 개선함으로써 보다 과학적이며 안전적인 트레이닝을 실시합니다.</div>
						<h6 class="post-03__subTitle">step. 2</h6>
						<div class="post-03__description">회원님의 안전교육 후 운동 유형을 파악하여 프로그램을 진행하는 단계입니다. 체계적인 프로그램을 통한 운동에 대한 관념과 기본 적응 시 겪게되는 반응을 관리함으로 트레이너와 회원님의 커뮤니케이션이 가장 중요한 단계입니다.</div>
						<h6 class="post-03__subTitle">step. 3</h6>
						<div class="post-03__description">시행한 운동 수행능력 테스트 결과를 토대로 개인 특성에 맞는 운동 처방을 내리게 됩니다.</div>
					</div>
				</section>
				<section id="content3">
					<h3>Interesting Heading Text</h3>
					<p>Fusce pulvinar porttitor dui, eget ultrices nulla tincidunt vel. Suspendisse faucibus lacinia tellus, et viverra ligula. Suspendisse eget ipsum auctor, congue metus vel, dictum erat. Aenean tristique euismod molestie. Nulla rutrum accumsan nisl, ac semper sapien tincidunt et. Praesent tortor risus, commodo et sagittis nec, aliquam quis augue. Aenean non elit elementum, tempor metus at, aliquam felis.</p>
				</section>
				<section id="content4">
					<h3>Here Are Many Words</h3>
					<p>Vivamus convallis lectus lobortis dapibus ultricies. Sed fringilla vitae velit id rutrum. Maecenas metus felis, congue ut ante vitae, porta cursus risus. Nulla facilisi. Praesent vel ligula et erat euismod luctus. Etiam scelerisque placerat dapibus. Vivamus a mauris gravida urna mattis accumsan.</p>
					<p>Duis sagittis massa vel elit tincidunt, sed molestie lacus dictum. Mauris elementum, neque eu dapibus gravida, eros arcu euismod metus, vitae porttitor nibh elit at orci. Vestibulum laoreet id nulla sit amet mattis.</p>
				</section>
			</div>
		</div>
	</div>
</form>
</body>
</html>