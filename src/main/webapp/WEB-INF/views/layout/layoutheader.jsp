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
	$('#passwordfindbtn').click( function () {
		$('#login_form').hide();
		$('#lost_form').show();
	});
	$('#loginModal').on('hidden.bs.modal', function () {
		$('#login_form').show();
		$('#lost_form').hide();
		$('#findemail').val("");
		$('#findname').val("");
		return;
	});
	$('#findbtn').on("click",function(){
		var email=$('#findemail').val();
		var name=$('#findname').val();
		if(email==""||name==""){
			$('#findsubmt').click();
			return;
		}
		$.ajax({
				type:'POST',
				data:"email="+email+"&name="+name,
				datatype:'json',
				url : 'passwordFind',
				success : function(data){
					if(data==0){
						$('#failpasswordModalMsg').text("입력된 정보가 일치하지 않습니다.");
						$('#failpasswordModal').modal('show');
					}else{
						$('#failpasswordModalMsg').text("새로운 비밀번호가 E-mail로 전송 되었습니다.");
						$('#failpasswordModal').modal('show');
						$('#loginModal').modal('hide');
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
		});
	});
	$('#login').on("click",function(){
		$('#loginModal').modal('show');
	});
	 // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputEmail = getCookie("userInputEmail");
    $("input[id='loginemail']").val(userInputEmail); 
     
    if($("input[id='loginemail']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#emailSaveChk").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#emailSaveChk").change(function(){ // 체크박스에 변화가 있다면,
        if($("#emailSaveChk").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputEmail = $("input[id='loginemail']").val();
            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputEmail");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[id='loginemail']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#emailSaveChk").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputEmail = $("input[id='loginemail']").val();
	            setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
	        }
	 });
	
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
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
					<div class="btn">
					<c:choose>
						<c:when test="${sessionemail==null}">
							<a id="login">로그인</a>&nbsp;|&nbsp;<a href="memberTerms">회원가입</a>
						</c:when>
						<c:when test="${sessionemail=='admin@admin.com'}">
							<a href="logout"><span>${sessionid}</span>&nbsplogout</a>&nbsp;|&nbsp;<a href="memberTerms">회원가입</a>
						</c:when>
						<c:otherwise>
							<a href="logout"><span>${sessionid}</span>&nbsp;logout</a>&nbsp;|&nbsp;
							<a href="memberDetail?email=${sessionemail}">내정보</a>
						</c:otherwise>
					</c:choose>	
					
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
						<c:choose>
							<c:when test="${sessionemail=='admin@admin.com'}">
								<li class="menu-item-has-children"><a href=""><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;option</a>
									<ul class="sub-menu">
										<li><a href="memberList">회원 리스트</a></li>
										<li><a href="partnerInsertForm">거래처 등록</a></li>
										<li><a href="partnerList">거래처 리스트</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>	
					</ul><!-- consult-menu -->
					
					<div class="navbar-toggle"><span></span><span></span><span></span></div>
				</nav><!-- End / consult-nav -->
			</div>
		</header><!-- End / header -->
	</div>
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <form class="login_form" id="login_form" action="login" method="post" role="form">
		      <div class="modal-body">
		      	<div class="row">
		      		<h3 class="col-sm-offset-5" style="text-align:center;">Log In</h3>
		      	</div>
		      	<div class="col-sm-6">
				  <label for="email">이메일 주소</label>
				  <input type="email" class="form-control" id="loginemail" name="email" required="required" placeholder="Email">
				</div>
				<div class="col-sm-6">
				  <label for="password">패스워드</label>
				  <input type="password" class="form-control" id="password" name="password" required="required" placeholder="Password">
				</div>
				<div class="row col-sm-12">
					<div class="col-sm-offset-10">
						<input type="checkbox" id="emailSaveChk"><span>이메일 저장</span>
					</div>
				</div>
				<div class="row col-sm-12">
					<div class="col-sm-offset-8">&nbsp&nbsp&nbsp
						<a href="memberTerms">회원가입</a>&nbsp&nbsp|&nbsp&nbsp
						<a id="passwordfindbtn">비밀번호 찾기</a>
					</div>
				</div>
				<div class="col-sm-12">
			      	<button type="submit" id="loginbtn" class="btn btn-default" style="width:100%">로그인</button>
			      </div>
		      </div>
	      </form>
	      <form class="lost_form" style="display:none;" id="lost_form" method="post" role="form">
	      	<div class="modal-body">
		      	  <div class="row">
		      		<h3 class="col-sm-offset-4" style="text-align:center;">비밀번호 찾기</h3>
		      	  </div>
		      	  <div class="col-sm-6">
				    <label for="email">이메일 주소</label>
				    <input type="email" class="form-control" id="findemail" name="findemail" required="required" placeholder="Email">
				  </div>
				  <div class="col-sm-6">
				    <label for="name">이름</label>
				    <input type="text" class="form-control" id="findname" name="findname" required="required" placeholder="name">
				  </div>
				  <div class="col-sm-12">
			      	<button type="button" id="findbtn" class="btn btn-default" style="width:100%">확인</button>
			      	<button type="submit" id="findsubmt" class="btn btn-default" style="display: none"></button>
			      </div>
		      </div>
	      </form>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
	<div id="failpasswordModal" class="modal fade" role="dialog" >
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
	               <div id="failpasswordModalMsg" style="color:ff0000">some msg</div>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button"class="btn btn-success" data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
     </div>
</body>
</html>