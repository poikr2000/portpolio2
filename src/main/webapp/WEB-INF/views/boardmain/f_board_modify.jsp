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
<body>
	<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
		<form action="f_modify" method="post" encType="multiplart/form-data">
		<input type="hidden" id="f_seq" name="f_seq" value="${f_board.f_seq}">
			<h3 style="text-align: center; margin-top: 120px"><font color="#FFFFFF"; size="50" face="Viner Hand ITC">FREE MODIFY</font></h3>
			<div class="container" style="height: 750px">
				<table class="table table-bordered" style="margin-top: 30px; background-color: #424242; border: 1px solid white;">
					<tbody>
						<tr>
							<th><font color="#FFFFFF">제목 :</font></th>
							<td><input type="text" placeholder="제목을 입력하세요. "
								name="f_title" class="form-control" value="${f_board.f_title}" readonly="readonly" /></td>
						</tr>
	
						<tr>
							<th><font color="#FFFFFF">작성자:</font></th>
							<td><input type="text" placeholder="작성자를 입력하세요. "
								name="f_name" class="form-control" value="${f_board.f_name}" readonly="readonly" /></td>
						</tr>
	
						<tr>
							<th><font color="#FFFFFF">내용:</font></th>
							<td colspan="2" class="write"><script type="text/javascript"
									src="http://js.nicedit.com/nicEdit-latest.js"></script> <script
									type="text/javascript">
										//<![CDATA[
										bkLib.onDomLoaded(function() {
											nicEditors.allTextAreas()
										});
										//]]>
									</script> <textarea id="f_content" name="f_content" class="form-controll"
									cols="120" rows="10"><font color="#FFFFFF">${f_board.f_content}</font></textarea></td>
						</tr>
	
						<tr>
							<td colspan="2"><input type="submit" value="수정"
								class="pull-right"> <input type="button" value="reset"
								class="pull-left"> <input type="button"
								value="글 목록으로... " class="pull-right"
								onclick="javascript:location.href='f_board'" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
