<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write something else you want</title>
<content tag="local_script">
<script>
$(document).ready(function(){
	if($("#f_name").val() ==""){ 
		$("#f_name").val("손님");
	}
});
</script>
</content>
</head>
<body>
	<div class="col-sm-12" style="background: black; height: 90px;">
	</div>
	<form action="f_insert" method="post" encType="multiplart/form-data">
	<h3 style="text-align: center;">게 시 판 작 성</h3>
		<div class="container">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="제목을 입력하세요. "
							name="f_title" class="form-control" /></td>
					</tr>
					<tr>
						<th>작성자:</th>
						<td><input type="text" name="f_name" id="f_name"class="form-control"
							value="${sessionid}" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td colspan="2" class="write"><script type="text/javascript"
								src="http://js.nicedit.com/nicEdit-latest.js"></script> <script
								type="text/javascript">
									//<![CDATA[
									bkLib.onDomLoaded(function() {
										nicEditors.allTextAreas()
									});
									//]]>
								</script> <textarea id="f_content" name="f_content" class="form-controll"
								cols="120" rows="10"></textarea></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="등록"
							class="pull-right"> <input type="button" value="reset"
							class="pull-left"> <input type="button"
							value="글 목록으로... " class="pull-right"
							onclick="javascript:location.href='f_board'" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>
