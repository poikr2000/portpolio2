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

	$('#cf_list_desc').on('click',function(){
	var f_seq = $('#f_seq').val();
		$.ajax({
			type:'Post',
			data:"f_seq: "+f_seq,
			datatype:'json',
			url : 'cf_list_desced',
			success : function(data){
				alert("");
			},
			error : function(xhr,status,error){
				alert(xhr.status);
			}
		});
	});
	
	function fc_del(){
// 		var f_seq = $('#f_seq').val();
// 		var cf_seq = $('#cf_seq').val();
		var deleted = $('#deleted').serialize();
		$.ajax({
			type:'Post',
			data:deleted,
			datatype:'json',
			url:'cf_comment_delete',
			success : function(data){
				alert("");
			},
			error : function(xhr,status,error){
				alert(xhr.status);
			}
		});
	}

</script>
<body>
	<table id="deleted" class="" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th style="width: 50pt"></th>
				<th style="width: 82%"></th>
				<th><a href="javascript:void(0);" id="cf_list_desc">최신순</a>-<a href="javascript:void(0);">등록순</a></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cf_comments" items="${cf_comments}">
			<input type="text" id="f_seq" name="f_seq" value="${f_board.f_seq }">
			<input type="text" id="cf_seq" name="cf_seq" value="${cf_comments.cf_seq }">
				<tr>
					<td>${cf_comments.cf_name} :</td>
					<td>${cf_comments.cf_content}</td>
					<td>${cf_comments.cf_date}</td>
					<c:choose>
						<c:when test="${sessionid eq cf_comments.cf_name }">
							<td><a href="javascript:void(0)?cf_seq=${cf_comments.cf_seq}&f_seq=${f_board.f_seq}" onclick="fc_del()"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
						</c:when>
						<c:when test="${sessionemail eq 'admin@admin.com'}">
							<td><a href="javascript:void(0)?cf_seq=${cf_comments.cf_seq}&f_seq=${f_board.f_seq}"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>