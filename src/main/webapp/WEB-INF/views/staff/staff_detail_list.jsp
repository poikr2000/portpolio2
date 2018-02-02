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
function profileDetail(code) {
	$.ajax({
		type:'Post',
		data:"code="+code,
		datatype:'json',
		url : 'profileDetail',
		success : function(data){
			$('#code').attr("value",data.code);
			$('#profileInsertModal').modal('show');
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
$(document).ready(function() {
	$('.nicEdit-panelContain').parent().width('80%');
	$('.nicEdit-main').parent().width('80%').height('350px');
	$('.nicEdit-main').width('100%').height('100%');
	
	$('#profilesave').click(function(){
		var msg=""
		var notes = $("div.nicEdit-main").html();
		$('#profile').attr("value",notes);
		msg+="- 등록하시겠습니까? -";
		$('#profileModalMsg').text(msg);
		$('#usebtn').text("등록");
		$('#celbtn').text("취소");
		$('#profileModal').modal('show');
		$('#usebtn').on('click',function(){
			$('.profileinsert_form').attr('action','profileUpdate');
			$('.profileinsert_form').submit();
		});
	});
});
</script>
</content>
</head>
<body>
	<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
		<div class="row">
			<div class="col-md-8 col-lg-8 offset-0 offset-sm-0 offset-md-2 offset-lg-2 ">
				<!-- title-01 -->
				<div class="title-01">
					<h2 class="title-01__title" style="margin-top: 120px;">
						<font color="#FFFFFF"; face="Impact">KOK FITNESS HEALTH TRAINER</font>
					</h2>
				</div><!-- End / title-01 -->
			</div>
		</div>
					
		<div class="consult-project">
			<div class="row">
				<c:forEach items="${staffs}" var="staffs">
					<div class="col-sm-6 col-md-6 col-lg-6 col-xl-3 " style="padding-left: 5px; padding-right: 5px;">	
						<!-- post-02 -->
						<div class="post-02 post-02__style-02 js-post-effect">
							<div class="post-02__media" style="width: 400px; height: 500px;">
								<img src="${staffs.photo}" alt=""/>
							</div>
							<div class="post-02__body">
								<h2 class="post-02__title">
									<a href="#">Fitness Trainer <br> ${staffs.name} </a>
								</h2>
								<div class="post-02__department">
									${staffs.certificate1}<br> 
									${staffs.certificate2}<br> 
									${staffs.certificate3}
								</div>
								<div class="post-02__content">
									<div class="post-02__description">
										${staffs.profile}
									</div>
									<div>
										<a class="post-02__link" href="#"></a><br>
											<c:choose>
												<c:when test="${sessionemail=='admin@admin.com'}">
													<a class="post-02__link" href="javascript:profileDetail('${staffs.code}');">프로필 수정</a><br>
												</c:when>
											</c:choose>
									</div>
								</div>
							</div>
						</div><!-- End / post-02 -->
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="modal fade" id="profileInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	      </div>
	      <div class="modal-body">
	      <form class="profileinsert_form" name="profileinsert_form" method="POST">
	      	<input type="hidden" id="code" name="code">
	      		<div class="form-group col-sm-12" align="center">
						<h3><font face="Impact">PROFILE INSERT</font></h3>
				</div>
				<div class="col-lg-12" style="margin-top: 15px"align="center">
					<div class="col-lg-12" style="width: 100%;height:400px;">
						<script type="text/javascript"src="http://js.nicedit.com/nicEdit-latest.js">
						</script> 
						<script type="text/javascript">
								//<![CDATA[
								bkLib.onDomLoaded(function() {
									nicEditors.allTextAreas()
								});
								//]]>
						</script> 
						<input type="hidden" id="profile" name="profile">
						<textarea class="form-controll">${data.profile}</textarea>
					</div>
				  	<div class="col-sm-12" style="text-align:center;margin-top:10px;margin-bottom: 20px;">
						<button class="btn" type="button" id="profilesave" name="profilesave">등&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp록</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button class="btn" type="button" data-dismiss="modal" >돌아가기</button>
					</div>
				</div>
			</form>	
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      </div>
	      <div class="modal-body">
	        <span id="profileModalMsg">...</span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="usebtn" class="btn btn-default" data-dismiss="modal">확인</button>
	        <button type="button" id="celbtn" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>	
</body>
</html>