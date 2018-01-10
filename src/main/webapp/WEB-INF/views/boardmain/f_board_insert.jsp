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
	<form action="f_insert" method="post" encType="multiplart/form-data"
		style="margin-top: 100pt">
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
						<td><input type="text" placeholder="작성자를 입력하세요. "
							name="f_name" class="form-control" /></td>
					</tr>

					<tr>
						<th>내용:</th>
						<td colspan="2" class="write"><script type="text/javascript"
								src="//editor.cafe24.com/js/nneditor.js"></script> <script
								type="text/javascript">
									NN.Config.instanceID = "f_content";
									NN.Config.value = "";
									NN.Config.toolbarType = "simple";

									//Editor Height
									NN.Config.height = 400;

									var oNN_content = new NNEditor();
									oNN_content.build();

									if (typeof $Editor != "object") {
										$Editor = {
											_obj : {},

											push : function(obj, id) {
												this._obj[id] = obj;
											},

											get : function(id) {
												return this._obj[id];
											},

											reset : function(id) {
												this._obj[id].getText().value = "";
												this._obj[id].getIFDoc().body.innerHTML = this._obj[id].Config.START_HTML;
											},

											contents : function(id, context) {
												this._obj[id].getText().value = context;
												this._obj[id].getIFDoc().body.innerHTML = this._obj[id].view
														.parsing(2);
											}
										};
									}

									$Editor.push(oNN_content, "content");
								</script> <input type="hidden" id="content_hidden"
							fw-filter="isSimplexEditorFill" fw-label="내용" value="oNN_content" /></td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" id="f_attach" name="file" class="form-control" /></td>
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
