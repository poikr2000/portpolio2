<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>

	$('#cq_list_desc').on('click',function(){
	var q_seq = $('#q_seq').val();
		$.ajax({
			type:'Post',
			data:$('.cq_insert').serialize(),
			datatype:'json',
			url : 'cq_list_desced',
			success : function(data){
				$('#desc_list').html(data);
			},
			error : function(xhr,status,error){
				alert(xhr.status);
			}
		});
	});
	
	$('#cq_list_asc').on('click',function(){
	var q_seq = $('#q_seq').val();
		$.ajax({
			type:'Post',
			data:$('.cq_insert').serialize(),
			datatype:'json',
			url : 'cq_list_asced',
			success : function(data){
				
			},
			error : function(xhr,status,error){
				alert(xhr.status);
			}
		});
	});

</script>
<body>
	<table id="cq_list_del" class="" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th style="width: 50pt"></th>
				<th style="width: 82%"></th>
				<th><a href="javascript:void(0);" id="cq_list_desc" onclick="cq_list_desc">최신순</a>-<a href="javascript:void(0);" id="cq_list_asc" onclick="cq_list_asc">등록순</a></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cq_comments" items="${cq_comments}">
				<tr>
					<td>${cq_comments.cq_name} :</td>
					<td>${cq_comments.cq_content}</td>
					<td>${cq_comments.cq_date}</td>
					<c:choose>
						<c:when test="${sessionid eq cq_comments.cq_name }">
							<td><a href="cq_comment_delete?cq_seq=${cq_comments.cq_seq}&q_seq=${q_board.q_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
						</c:when>
						<c:when test="${sessionemail eq 'admin@admin.com'}">
							<td><a href="cq_comment_delete?cq_seq=${cq_comments.cq_seq}&q_seq=${q_board.q_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>