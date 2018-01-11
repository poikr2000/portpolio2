<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write something else you want</title>
</head>
<body>
	<form action="f_board_modify" method="post" encType="multiplart/form-data">
	<div class="col-sm-12" style="background: black;height:90px;">
    </div>
		<div class="container">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<hi>제목 : ${f_board.f_title }</hi>&nbsp&nbsp&nbsp
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

	<form>
		<div class="container">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cf_comments" items="${cf_comments}">
						<tr>
							<td>${cf_comments.cf_seq}</td>
							<td>${cf_comments.cf_name }</td>
							<td>${cf_comments.cf_content}</td>
							<td>${cf_comments.cf_date}</td>
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
					cellspacing="0" width="100%" style="margin-top: 60px">
					<thead>
						<tr style="text-algin: center">
							<td>#</td>
							<td>작성자</td>
							<td>제목</td>
							<td>내용</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="f_boards" items="${f_boards}">
							<tr style="text-algin: center; vertical-algin: middle;">
								<td>${f_boards.f_seq}</td>
								<td>${f_boards.f_name}</td>
								<td>${f_boards.f_title}</td>
								<td><a href="f_board_update?f_seq=${f_boards.f_seq}">${f_boards.f_content}</a></td>
								<td>${f_boards.f_date}</td>
								<td>${f_boards.f_hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="write" onclick="location.href='f_insert_form'"
					type="button" class="pull-right">글쓰기</button>
				<button id="write" type="button" class="pull-right"
					onclick="location.href='cf_selectListAll'">리스트</button>
			</div>
		</form>
		<form action="cf_comment" method="post">
			<div class="container">
				<button id="write" type="submit">댓글</button>
			</div>
		</form>
	</div>
</body>
</html>