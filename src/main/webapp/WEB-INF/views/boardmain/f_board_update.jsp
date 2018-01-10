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
<body>
	<form action="f_modify" method="post" encType="multiplart/form-data"
		style="margin-top: 100pt">
		<div class="container">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="" name="f_title"
							class="form-control" /></td>
					</tr>

					<tr>
						<th>작성자:</th>
						<td><input type="text" placeholder="" name="f_name"
							class="form-control" /></td>
					</tr>

					<tr>
						<th>내용:</th>
						<td><textarea cols="10" placeholder="" id="f_content"
								name="f_content" class="form-control"></textarea></td>
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

	<form encType="multiplart/form-data">
		<div class="container">
			<table class="table table-bordered">
				<tbody>
					<c:forEach var="cf_comments" items="${cf_comments}">
						<tr>
							<td>${cf_comments.cf_content}${cf_comments.name}${cf_comments.date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>

	<form action="cf_insert" method="post" encType="multiplart/form-data"
		style="margin-top: 15pt">
		<div class="container">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style="text-align: center">댓글:</th>
						<td><textarea cols="80" style="" id="cf_content"
								name="cf_content" class="form-control"></textarea></td>
						<th><input type="submit" value="등록"></th>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

	<div style="margin-top: 200pt">
		<form action="f_board">
			<div class="container">
				<h1 align="center" style="margin-top: 50pt">자유 게시판</h1>
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%" style="margin-top: 100pt">
					<thead>
						<tr style="text-algin: center">
							<td><input type="checkbox" id="allchek"></td>
							<td>글번호</td>
							<td>E-mail</td>
							<td>작성자</td>
							<td>제목</td>
							<td>첨부파일</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="boards" items="${boards}">
							<tr style="text-algin: center; vertical-algin: middle;">
								<td><input type="checkbox" id="allchek" name="unitchek"
									value="${boards.b_seq}"></td>
								<td>${boards.b_step}${boards.b_seq}</td>
								<td>${boards.b_email}</td>
								<td>${boards.b_name}</td>
								<td><a href="f_board_update?f_seq=${boards.f_seq}"> <c:if
											test="${boards.b_step == 1}">
											<img src="resources/images/reply1.png" width="15pt">
										</c:if>${boards.b_title}
								</a></td>
								<td><c:if test="${boards.b_attach != null}">
										<a href="boardDownload?f_attach=${boards.b_attach}"><i
											id="attach_file" name="attach_file" class="fa fa-file"
											aria-hidden="true"></i> </a>
									</c:if></td>
								<td>${boards.b_date}</td>
								<td>${boards.b_hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="write" onclick="location.href='f_board_insert'"
					type="button" style="margin-left: 94%">글쓰기</button>
				<button id="write" type="button"
					onclick="location.href='f_board_update'">삭제</button>
			</div>
		</form>
	</div>
</body>
</html>