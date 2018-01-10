<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/ncs3.js"></script>
</head>
<body>
	<form action="f_board">
		<div class="container">
			<h1 align="center" style="margin-top: 50pt">자유 게시판</h1>
			<table id="example" class="table table-striped table-bordered"
				cellspacing="0" width="100%" style="margin-top: 60px">
				<thead>
					<tr style="text-algin: center">
						<td><input type="checkbox" id="allchek"></td>
						<td>#</td>
						<td>작성자</td>
						<td>제목</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boards" items="${boards}">
						<tr style="text-algin: center; vertical-algin: middle;">
							<td><input type="checkbox" id="allchek" name="unitchek"
								value="${boards.f_seq}"></td>

							<td>${boards.f_step}${boards.f_seq}</td>
							<td>${boards.f_name}</td>
							<td><a
								href="boardDetail?f_seq=${boards.f_seq}">
									<c:if test="${boards.f_step == 1}">
										<img src="resources/images/reply1.png" width="15pt">
									</c:if>${boards.f_title}
							</a></td>
							<td>${boards.f_date}</td>
							<td>${boards.f_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button id="write" onclick="location.href='f_insert_form'"
				type="button" style="margin-left: 94%">글쓰기</button>
			<button id="write" type="button"
				onclick="location.href='f_board_update'">삭제</button>
			<button id="write" type="button"
				onclick="location.href='cf_selectListAll'">리스트</button>
		</div>
	</form>
</body>
</html>