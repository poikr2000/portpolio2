<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<content tag="local_script">
	<c:if test="${sessionemail=='admin@admin.com'}">
		<script>
			$(document).ready(function() {
			    $('#n_board').DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            {
			                text: '글쓰기',
			                action: function ( e, dt, node, config ) {
			                	$('.n_insert_form').submit();
			                }
			            }
			        ]
			    } );
			} );
		</script>
	</c:if>
</content>
</head>
<body>
	<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
		<form class="n_insert_form" action="n_insert_form">
			<h3 style="text-align: center; margin-top: 120px"><font color="#FFFFFF"; size="50" face="Viner Hand ITC">N O T I C E</font></h3>
			<div class="container" style="height: 700px">
				<table id="n_board" class="table fade in" style="margin-top: 60px; background-color: #424242; border-radius: 1em; border: 1px solid white;">
					<thead>
						<tr style="text-algin: center; color: #FFFFFF;">
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
								<td style="text-align: center; font-family: serif;"><h5><font color="#FE2E2E">${n_boards.n_seq}</font></h5></td>
								<td style="text-align: center;"><h5><font color="#FE2E2E">${n_boards.n_name}</font></h5></td>
								<td><h5><a href="n_board_detail?n_seq=${n_boards.n_seq}" style="color: #FE2E2E">${n_boards.n_title}</a></h5></td>
								<td style="text-align: center;"><h5><font color="#FE2E2E">${n_boards.n_date}</font></h5></td>
								<td style="text-align: center;"><h5><font color="#FE2E2E">${n_boards.n_hit}</font></h5></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>