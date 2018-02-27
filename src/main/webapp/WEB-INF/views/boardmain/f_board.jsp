<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<content tag="local_script">
<c:choose>
	<c:when test="${sessionemail == null}">
		<script>
		$(document).ready(function(){
		    $('#f_board').DataTable();
		});
		</script>
	</c:when>
	<c:otherwise>
		<script>
			$(document).ready(function(){
			    $('#f_board').DataTable({
		    	    dom: 'Bfrtip',
			        buttons: [
			            {
			                text: '글쓰기',
			                action: function ( e, dt, node, config ) {
			                	$('.f_insert_form').submit();
			                }
			            }
			        ]
			    });
			    $('.dt-button').addClass('btn btn-primary').removeClass('dt-button');
			} );
		</script>
	</c:otherwise>
</c:choose>

</content>
</head>
<body>
	<div class="container col-sm-12" style="background:url('resources/images/staff.jpg');">
		<form class="f_insert_form" action="f_insert_form">
			<h3 style="text-align: center; margin-top: 120px"><font color="#FFFFFF"; size="50" face="Impact">FREE BOARD</font></h3>
			<div class="container" style="height: 700px">
				<table id="f_board" class="table fade in" style="margin-top: 60px; background-color: #424242; border-radius: 1em; border: 1px solid white;">
					<thead>
						<tr style="text-algin: center">
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
								<td style="text-align: center; font-family: serif;"></h5><font color="#f39c12">${n_boards.n_seq}</font><h5></td>
								<td style="text-align: center;"><h5><font color="#f39c12">${n_boards.n_name}</font></h5></td>
								<td><h5><a href="n_board_detail?n_seq=${n_boards.n_seq}" style="color: #f39c12;">${n_boards.n_title}</a></h5></td>
								<td style="text-align: center;"><h5><font color="#f39c12">${n_boards.n_date}</font></h5></td>
								<td style="text-align: center;"><h5><font color="#f39c12">${n_boards.n_hit}</font></h5></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<c:forEach var="f_boards" items="${f_boards}">
							<tr style="text-algin: center; vertical-algin: middle;">
								<td style="text-align: center"><font color="#FFFFFF">${f_boards.f_seq}</font> </td>
								<td style="text-align: center"><font color="#FFFFFF">${f_boards.f_name}</font></td>
								<td><a href="f_board_detail?f_seq=${f_boards.f_seq}&?cf_seq=${cf_comment.cf_seq}" style="color: white;">${f_boards.f_title} &nbsp
								<c:if test="${f_boards.f_cnt ne 0 }"><font color="#FFFFFF">[${f_boards.f_cnt}]</font></c:if>
								<c:if test="${f_boards.f_date eq today }"><img src="resources/images/new.gif" style="width:6%; height:80%"></c:if>
								</a></td>
								<td style="text-align: center"><font color="#FFFFFF">${f_boards.f_date}</font></td>
								<td style="text-align: center"><font color="#FFFFFF">${f_boards.f_hit}</font></td>
							</tr>
						</c:forEach>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</body>
</html>