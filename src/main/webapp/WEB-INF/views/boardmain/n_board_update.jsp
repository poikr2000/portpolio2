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
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
</script>
</head>
<content tag="local_script">
<script>
	$('#delbtn').on("click", function() {
		$('#n_board_ModalMsg').text("삭제 하시겠습니까?")
		$('#n_board_Modal').modal('show');
		var delvalue = $('#n_seq').val();
		$('#n_delbtn').on('click', function() {
			var url = "n_board_delete?n_seq=" + delvalue;
			$(location).attr('href', url);
		});
	});
</script> 
</content>
<body>
	<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
		<form action="n_board_modify" method="post"
			encType="multiplart/form-data" id="n_board_modify">
			<input type="hidden" id="n_seq" name="n_seq" value="${n_board.n_seq}"/>
			<h3 style="text-align: center; margin-top: 120px"><font color="#FFFFFF"; size="50" face="Viner Hand ITC">N O T I C E</font></h3>
			<div class="container" style="height: 500px">
				<table class="table fade in" style="margin-top: 30px; background-color: #424242; border: 1px solid white;">
					<tbody>
						<tr>
							<hi class="pull-left"><strong><font color="#FFFFFF">제목 :</font> <font color="#FE2E2E">${n_board.n_title}</font></strong></hi>&nbsp&nbsp&nbsp
							<hi><strong><font color="#FFFFFF">작성자 : ${n_board.n_name}</font></strong></hi>
							<hi class="pull-right"><strong><font color="#FFFFFF">조회수 : ${n_board.n_hit}</font></strong></hi>
						</tr>
						<tr>
							<td style="vertical-align:middle; width: 60px;"><strong><font color="#FFFFFF">내용 :</font></strong></td>
							<td style="height: 300px"><strong><font color="#FFFFFF">${n_board.n_content}</font></strong></td>
						</tr>
						<tr>
							<td colspan="2"><c:choose>
									<c:when test="${sessionid == n_board.n_name }">
										<div class="pull-right">
											<input type="submit" value="수정" class="input-sm">
										</div>
										<div class="pull-left">
											<input id="delbtn" type="button" value="삭제" class="input-sm" />
										</div>
									</c:when>
								</c:choose>
								<div class="pull-right">
									<input type="button" value="글 목록으로... " class="input-sm"
										onclick="javascript:location.href='n_board'" />
								</div>
								</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="n_board_Modal" class="modal fade" role="dialog">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>
								<span id="n_board_ModalMsg"> Some text in modal</span>
						</div>
						<div class="modal-footer" style="text-align: center">
							<button type="button" class="btn btn-success" data-dismiss="modal"
								id="n_delbtn">확인</button>
							<button type="button" class="btn btn-success" data-dismiss="modal"
								id="">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>