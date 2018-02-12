<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<content tag="local_script">
<script>
	$(document).ready(function(){
		cq_desc();
	});
	
	function cq_desc(){
		var params = $('#cq_insert').serialize();
		$.ajax({
			type:'POST',
			data:params,
			url : 'cq_list_desc',
			success : function(data){
				$('#desc_list').html(data);
			},
			error : function(xhr,status,error){
				alert(xhr.status);
			}
		});
	}
	$('#delbtn').on("click",function(){
		$('#q_board_ModalMsg').text("삭제 하시겠습니까?")
		$('#q_board_Modal').modal('show');
		var delvalue = $('#q_seq').val();
		$('#q_delbtn').on('click',function(){
			var url="q_board_delete?q_seq="+delvalue;
			$(location).attr('href',url);
			});	
	});
	$('#cq_btn').on('click',function(){
		var params = $('#cq_insert').serialize();
		 $.ajax({
			type:'Post',
			data:params,
			datatype:'json',
			url : 'cq_insert',
			success : function(data){
				cq_desc();
				$('#cq_content').val("");
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	});
</script>
</content>
<body>
<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
	<form action="q_board_modify" method="post" encType="multipart/form-data" id="q_board_modify">
	<h3 style="text-align: center; margin-top: 120px;" ><font color="#FFFFFF"; size="50" face="Viner Hand ITC">FREE BOARD</font></h3>
		<div class="container" style="height: 700px">
			<table class="table fade in" style="margin-top: 30px; background-color: #424242; border: 1px solid white;">
				<tbody>
					<tr>
						<hi class="pull-left"><strong><font color="#FFFFFF">제목 : ${q_board.q_title}</font></strong></hi>&nbsp&nbsp&nbsp
						<hi><strong><font color="#FFFFFF">작성자 : ${q_board.q_name}</font></strong></hi>
						<hi class="pull-right"><strong><font color="#FFFFFF">조회수 : ${q_board.q_hit}</font></strong></hi>
					</tr>
					<tr>
						<td style="height: 300pt;"><strong><font color="#FFFFFF">내용 :</font></strong>&nbsp;&nbsp;&nbsp;<strong><font color="#FFFFFF">${q_board.q_content}</font></strong></td>
					</tr>
					<tr>
						<td colspan="2">
						<c:choose>
							<c:when test="${sessionid == q_board.q_name }">
								<div class="pull-right"><input type="submit" value="수정" class="input-sm"></div>
								<div class="pull-left"><input  id="delbtn" type="button" value="삭제" class="input-sm"/></div>	
							</c:when>
							<c:when test="${sessionemail eq 'admin@admin.com' }">
								<div class="pull-right"><input type="submit" value="수정" class="input-sm"></div>
								<div class="pull-left"><input  id="delbtn" type="button" value="삭제" class="input-sm"/></div>
							</c:when>
						</c:choose>
							<div class="pull-right"><input type="button"value="글 목록으로... " class="input-sm" 	onclick="javascript:location.href='q_board'" /></div>	
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="q_board_Modal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="q_board_ModalMsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" class="btn btn-success" data-dismiss="modal" id="q_delbtn">확인</button>
                  <button type="button" class="btn btn-success" data-dismiss="modal" id="">취소</button>
               </div>
            </div>
         </div>
     </div>
	</form>

	<form class="cq_insert" action="cq_insert" method="post" encType="multipart/form-data" style="margin-top: 15pt" id="cq_insert">
		<input type="hidden" id="cq_name" name="cq_name" value="${sessionid}"/>
		<input type="hidden" id="q_seq" name="q_seq" value="${q_board.q_seq}"/>
		<input type="hidden" id="email" name="email" value="${sessionemail}"/>
		<div class="container">
		<div id="desc_list">
<!-- 			<table id="" class="" width="100%" cellspacing="0"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th style="width: 50pt"></th> -->
<!-- 						<th style="width: 82%"></th> -->
<!-- 						<th><a href="javascript:void(0);" id="cq_list_desc">최신순</a>-<a href="javascript:void(0);">등록순</a></th> -->
<!-- 						<th></th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					<c:forEach var="cq_comments" items="${cq_comments}"> --%>
<!-- 						<tr> -->
<%-- 							<td>${cq_comments.cq_name} :</td> --%>
<%-- 							<td>${cq_comments.cq_content}</td> --%>
<%-- 							<td>${cq_comments.cq_date}</td> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${sessionid eq cq_comments.cq_name }"> --%>
<%-- 									<td><a href="cq_comment_delete?cq_seq=${cq_comments.cq_seq}&q_seq=${q_board.q_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td> --%>
<%-- 								</c:when> --%>
<%-- 								<c:when test="${sessionemail eq 'admin@admin.com'}"> --%>
<%-- 									<td><a href="cq_comment_delete?cq_seq=${cq_comments.cq_seq}&q_seq=${q_board.q_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td> --%>
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</tbody> -->
<!-- 			</table> -->
		</div>
			<table class="table fade in">
				<tbody>
					<c:choose>
						<c:when test="${sessionemail == null}"></c:when>
						<c:otherwise>
							<tr>
								<th style="text-align: center; color: white;">댓글:</th>
								<td><div class="form-groub"><textarea  rows="1" cols="100" id="cq_content" name="cq_content" class="form-control"></textarea></div></td>
								<th><button type="button" class="input-sm" value="등록" id="cq_btn">등록</button></th>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</form>
</body>
