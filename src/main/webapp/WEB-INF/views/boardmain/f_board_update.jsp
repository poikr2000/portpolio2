<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	$('#delbtn').on("click",function(){
		$('#f_board_ModalMsg').text("삭제 하시겠습니까?")
		$('#f_board_Modal').modal('show');
		var delvalue = $('#f_seq').val();
		$('#f_delbtn').on('click',function(){
			var url="f_board_delete?f_seq="+delvalue;
			$(location).attr('href',url);
			});	
	});
</script>
</content>
<body>
<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
	<form action="f_board_modify" method="post" encType="multiplart/form-data" id="f_board_modify">
	<h3 style="text-align: center; margin-top: 120px;" ><font color="#FFFFFF"; size="50" face="Viner Hand ITC">FREE BOARD</font></h3>
		<div class="container" style="height: 200px">
			<table class="table fade in" style="margin-top: 30px; background-color: #424242; border: 1px solid white;">
				<tbody>
					<tr>
						<hi class="pull-left"><strong><font color="#FFFFFF">제목 : ${f_board.f_title}</font></strong></hi>&nbsp&nbsp&nbsp
						<hi><strong><font color="#FFFFFF">작성자 : ${f_board.f_name}</font></strong></hi>
						<hi class="pull-right"><strong><font color="#FFFFFF">조회수 : ${f_board.f_hit}</font></strong></hi>
					</tr>
					<tr>
						<td style="vertical-align:middle; width: 60px"><strong><font color="#FFFFFF">내용 :</font></strong></td>
						<td><strong><font color="#FFFFFF">${f_board.f_content}</font></strong></td>
					</tr>
					<tr>
						<td colspan="2">
						<c:choose>
							<c:when test="${sessionid == f_board.f_name }">
								<div class="pull-right"><input type="submit" value="수정" class="input-sm"></div>
								<div class="pull-left"><input  id="delbtn" type="button" value="삭제" class="input-sm"/></div>	
							</c:when>
							<c:when test="${sessionemail eq 'admin@admin.com' }">
								<div class="pull-right"><input type="submit" value="수정" class="input-sm"></div>
								<div class="pull-left"><input  id="delbtn" type="button" value="삭제" class="input-sm"/></div>
							</c:when>
						</c:choose>
							<div class="pull-right"><input type="button"value="글 목록으로... " class="input-sm" 	onclick="javascript:location.href='f_board'" /></div>	
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="f_board_Modal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="f_board_ModalMsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" class="btn btn-success" data-dismiss="modal" id="f_delbtn">확인</button>
                  <button type="button" class="btn btn-success" data-dismiss="modal" id="">취소</button>
               </div>
            </div>
         </div>
     </div>
	</form>


	<form class="cf_insert" action="cf_insert" method="post" encType="multiplart/form-data" style="margin-top: 15pt" id="cf_insert">
	<input type="hidden" id="cf_name" name="cf_name" value="${sessionid}"/>
	<input type="hidden" id="f_seq" name="f_seq" value="${f_board.f_seq}"/>
		<div class="container" style="height: 500px">
			<table id="" class="" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th style="width: 50pt"></th>
						<th style="width: 85%"></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cf_comments" items="${cf_comments}">
						<tr>
							<td><strong><font color="#FFFFFF">${cf_comments.cf_name} :</font></strong></td>
							<td><strong><font color="#FFFFFF">${cf_comments.cf_content}</font></strong></td>
							<td><strong><font color="#FFFFFF">${cf_comments.cf_date}</font></strong></td>
							<c:choose>
								<c:when test="${sessionid eq cf_comments.cf_name }">
									<td><a href="cf_comment_delete?cf_seq=${cf_comments.cf_seq}&f_seq=${f_board.f_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
								</c:when>
								<c:when test="${sessionemail eq 'admin@admin.com'}">
									<td><a href="cf_comment_delete?cf_seq=${cf_comments.cf_seq}&f_seq=${f_board.f_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table fade in">
				<tbody>
					<c:choose>
						<c:when test="${sessionemail == null }"></c:when>
						<c:otherwise>
							<tr>
								<th style="text-align: center"><strong><font color="#FFFFFF">댓글:</font></strong></th>
								<td><div class="form-groub"><textarea  rows="1" cols="100" id="cf_content" name="cf_content" class="form-control"></textarea></div></td>
								<th><button class="input-sm" value="등록" id="cf_btn">등록</button></th>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</form>
</div>
</body>
</html>