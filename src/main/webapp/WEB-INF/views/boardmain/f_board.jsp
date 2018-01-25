<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<content tag="local_script">
<c:choose>
	<c:when test="${sessionemail == null }">
		<script>
		$(document).ready(function() {
		    $('#f_board').DataTable( {
		        dom: 'frtip',
		        buttons: [
		            {
		                text: '글쓰기',
		                action: function ( e, dt, node, config ) {
		                	$('.f_insert_form').submit();
		                }
		            }
		        ]
		    } );
		} );
		</script>
	</c:when>
	<c:otherwise>
		<script>
			$(document).ready(function() {
			    $('#f_board').DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            {
			                text: '글쓰기',
			                action: function ( e, dt, node, config ) {
			                	$('.f_insert_form').submit();
			                }
			            }
			        ]
			    } );
			} );
		</script>
	</c:otherwise>
</c:choose>

</content>
</head>
<body>
	<div class="col-sm-12" style="background: black; height: 90px;">
	</div>
	<form class="f_insert_form" action="f_insert_form">
		<h3 style="text-align: center;">자 유 게 시 판</h3>
		<div class="container">
			<table id="f_board" class="table fade in" style="margin-top: 60px">
				<thead>
					<tr style="text-algin: center">
						<th style="width: 10pt;text-align: center">#</th>
						<th style="width: 100pt;text-align: center">작성자</th>
						<th style="width: 60%">제목</th>
						<th style="width: 10%; text-align: center">작성일</th>
						<th style="text-align: center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n_boards" items="${n_boards}">
						<tr style="text-algin: center; vertical-algin: middle;">
							<td style="text-align: center;color: black; font-family: serif;"><h5>${n_boards.n_seq}<h5></td>
							<td style="text-align: center;color: black;"><h5>${n_boards.n_name}<h5></td>
							<td><h5><a href="n_board_detail?n_seq=${n_boards.n_seq}" style="color: black;">${n_boards.n_title}</a></h5></td>
							<td style="text-align: center;color: black; "><h5>${n_boards.n_date}<h5></td>
							<td style="text-align: center;color: black;"><h5>${n_boards.n_hit}<h5></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<c:forEach var="f_boards" items="${f_boards}">
						<tr style="text-algin: center; vertical-algin: middle;">
							<td style="text-align: center">${f_boards.f_seq} </td>
							<td style="text-align: center">${f_boards.f_name}</td>
							<td><a href="f_board_detail?f_seq=${f_boards.f_seq}">${f_boards.f_title} &nbsp
							<c:if test="${f_boards.f_cnt ne 0 }">[${f_boards.f_cnt}]</c:if>
							<c:if test="${f_boards.f_date eq today }"><img src="resources/images/new.gif" style="width:6%; height:80%"></c:if>
							</a></td>
							<td style="text-align: center">${f_boards.f_date}</td>
							<td style="text-align: center">${f_boards.f_hit}</td>
						</tr>
					</c:forEach>
				</tfoot>
			</table>
		</div>
	</form>
</body>
</html>