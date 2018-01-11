<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="cf_selectListAll" method="get">
	   <div class="col-sm-12" style="background: black;height:90px;">
	   </div>
		<div class="container">
			<table class="table table-bordered">
			<thead>
				<tr>
					<th>#</th><th>작성자</th><th>내용</th><th>작성일자</th>
				</tr>
			</thead>
				<tbody>
					<c:forEach var="cf_comments" items="${cf_comments}">
						<tr>
							<td>${cf_comments.cf_seq}</td><td>${cf_comments.cf_name }</td><td>${cf_comments.cf_content}</td><td>${cf_comments.cf_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>