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
<div class="col-sm-12" style="background: black;height:90px;">
   </div>
	<form action="f_board_modify" method="post" encType="multiplart/form-data" id="f_board_modify">
	<h3 style="text-align: center;">게 시 판 수 정</h3>
		<div class="container">
			<table class="table fade in">
				<tbody>
					<tr>
						<hi class="pull-left">제목 : ${f_board.f_title}</hi>&nbsp&nbsp&nbsp
						<hi>작성자 : ${f_board.f_name}</hi>
						<hi class="pull-right">조회수 : ${f_board.f_hit}</hi>
					</tr>
					<tr>
						<td>내용:</td>
						<td>${f_board.f_content}</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정" class="pull-right">
						<input type="button" value="reset" class="pull-left"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

	<form class="cf_insert" action="cf_insert" method="post" encType="multiplart/form-data" style="margin-top: 15pt" id="cf_insert">
	<input type="hidden" id="cf_name" name="cf_name" value="${sessionid}"/>
	<input type="hidden" id="f_seq" name="f_seq" value="${f_board.f_seq}"/>
		<div class="container">
			<table class="table fade in">
				<thead>
					<tr>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cf_comments" items="${cf_comments}">
						<tr>
							<td>${cf_comments.cf_name}</td>
							<td>${cf_comments.cf_content}</td>
							<td>${cf_comments.cf_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<table class="table fade in">
			<tbody>
				<tr>
					<th style="text-align: center">댓글:</th>
					<td><textarea cols="80" id="cf_content" name="cf_content" class="form-control"></textarea></td>
					<th><button value="등록" id="cf_btn">등록</button></th>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>