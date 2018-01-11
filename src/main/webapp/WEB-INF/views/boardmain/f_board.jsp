<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="f_board">
	   <div class="col-sm-12" style="background: black;height:90px;">
	   </div>
		<div class="container">
			<h1 align="center" style="margin-top: 50px">자유 게시판</h1>
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
</body>
</html>