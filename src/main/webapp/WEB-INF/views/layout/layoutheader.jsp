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
$(document).ready(function(){
	$('#login').on("click",function(){
		$('#loginModal').modal('show');
	});
});
</script>
</content>
</head>
<body>
	<div class="page-wrap">
		<header class="header header__style-02">
			<div class="container">
				<div class="header__logo"><a href="index.html"><img src="resources/assets/img/logo.png" alt=""/></a></div>
				<div class="header__toogleGroup">
					<div class="btn" ><a id="login">로그인</a>&nbsp|&nbsp<a href="memberTerms">회원가입</a>
					</div>
				</div>
				<!-- consult-nav -->
				<nav class="consult-nav">
					
					<!-- consult-menu -->
					<ul class="consult-menu">
						<li class="current-menu-item"><a href="index.html">Home</a>
						</li>
						<li><a href="about.html">program</a>
						</li>
						<li><a href="service.html">staff</a>
						</li>
						<li class="menu-item-has-children"><a href="#">community</a>
							<ul class="sub-menu">
								<li><a href="n_board">공지사항</a>
								</li>
								<li><a href="f_board">자유게시판</a>
								</li>
								<li><a href="q_board">질문게시판</a>
								</li>
							</ul>
						</li>
						<li class="menu-item-has-children"><a href="project.html">services</a>
							<ul class="sub-menu">
								<li><a href="project-detail.html">Project detail</a>
								</li>
							</ul>
						</li>
						<li><a href="contact.html">mileage</a>
						</li>
						<li class="menu-item-has-children"><a href="project.html">option</a>
							<ul class="sub-menu">
								<li><a href="project-detail.html">Project detail</a>
								</li>
							</ul>
						</li>
					</ul><!-- consult-menu -->
					
					<div class="navbar-toggle"><span></span><span></span><span></span></div>
				</nav><!-- End / consult-nav -->
			</div>
		</header><!-- End / header -->
	</div>
	<form>
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		      	<div class="row">
		      		<h3 class="col-sm-offset-5" style="text-align:center;">Log In</h3>
		      	</div>
		      	<div class="col-sm-6">
				  <label for="email">이메일 주소</label>
				  <input type="email" class="form-control" id="email" name="email" required="required" placeholder="Email">
				</div>
				<div class="col-sm-6">
				  <label for="password">패스워드</label>
				  <input type="password" class="form-control" id="password" name="password" required="required" placeholder="Password">
				</div>
				<div class="row col-sm-12">
					<div class="col-sm-offset-10">
						<input type="checkbox"><span>이메일 저장</span>
					</div>
				</div>
				<div class="row col-sm-12">
					<div class="col-sm-offset-8">&nbsp&nbsp&nbsp
						<a href="memberTerms">회원가입</a>&nbsp&nbsp|&nbsp&nbsp
						<a href="">비밀번호 찾기</a>
					</div>
				</div>
				<div class="col-sm-12">
			      	<button type="submit" id="usebtn" class="btn btn-default" style="width:100%">로그인</button>
			      </div>
		      </div>
		      <div class="modal-footer">
		      </div>
		    </div>
		  </div>
		</div>
	</form>
</body>
</html>