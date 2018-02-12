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
		    $('#q_board').DataTable( {
		        dom: 'frtip',
		        buttons: [
		            {
		                text: '글쓰기',
		                action: function ( e, dt, node, config ) {
		                	$('.q_insert_form').submit();
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
			    $('#q_board').DataTable( {
			        dom: 'Bfrtip',
			        buttons: [
			            {
			                text: '글쓰기',
			                action: function ( e, dt, node, config ) {
			                	$('.q_insert_form').submit();
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
	<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
		<form class="q_insert_form" action="q_insert_form">
			<h3 style="text-align: center; margin-top: 120px"><font color="#FFFFFF"; size="50" face="Viner Hand ITC">Q&A BOARD</font></h3>
			<div class="container" style="height: 700px">
				<table id="q_board" class="table fade in" style="margin-top: 60px; background-color: #424242; border-radius: 1em; border: 1px solid white;" >
					<thead>
						<tr style="text-algin: center; color: white;">
							<th style="width: 10pt;text-align: center; color: white;">#</th>
							<th style="width: 100pt;text-align: center; color: white;">작성자</th>
							<th style="width: 60%; color: white;">제목</th>
							<th style="width: 10%; text-align: center; color: white;">작성일</th>
							<th style="text-align: center; color: white;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="n_boards" items="${n_boards}">
							<tr style="text-algin: center; vertical-algin: middle;">
								<td style="text-align: center; font-family: serif;"></h5><font color="#FE2E2E">${n_boards.n_seq}</font><h5></td>
								<td style="text-align: center;"><h5><font color="#FE2E2E">${n_boards.n_name}</font></h5></td>
								<td><h5><a href="n_board_detail?n_seq=${n_boards.n_seq}" style="color: #FE2E2E;">${n_boards.n_title}</a></h5></td>
								<td style="text-align: center;"><h5><font color="#FE2E2E">${n_boards.n_date}</font></h5></td>
								<td style="text-align: center;"><h5><font color="#FE2E2E">${n_boards.n_hit}</font></h5></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<c:forEach var="q_boards" items="${q_boards}">
							<tr style="vertical-algin: middle;">
								<td style="text-align: center;"><font color="#FFFFFF">${q_boards.q_seq}</font></td>
								<td style="text-align: center"><font color="#FFFFFF">${q_boards.q_name}</font></td>
								<td><a href="q_board_detail?q_seq=${q_boards.q_seq}" style="color: white;">${q_boards.q_title}
								<c:if test="${q_boards.q_cnt ne 0 }"><font color="#FFFFFF">[${q_boards.q_cnt}]</font></c:if>
								<c:if test="${q_boards.q_date eq today }"><img src="resources/images/new.gif" style="width:6%; height:80%"></c:if>
								</a></td>
								<td style="text-align: center"><font color="#FFFFFF">${q_boards.q_date}</font></td>
								<td style="text-align: center"><font color="#FFFFFF">${q_boards.q_hit}</font></td>
							</tr>
						</c:forEach>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</body>
</html>