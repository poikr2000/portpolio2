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

	function fc_desc(sort){
		$('#sort').val(sort);
		var params = $('#cf_insert').serialize();
		$.ajax({
			type:'Post',
			data:params,
			datatype:'json',
			url : 'cf_list_desc',
			success : function(data){
				$('#desc_list').html(data);
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function cf_del(cf_seq){
		$.ajax({
			type:'Post',
			data:{
				"cf_seq" : cf_seq
			},
			url:'cf_comment_delete',
			success : function(data){
				cf_desc();
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
				<th><a href="javascript:void(0);" onclick="fc_desc('desc')" style="color: white;">최신순</a>-<a href="javascript:void(0);" onclick="fc_desc('asc')" style="color: white;">등록순</a></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cf_comments" items="${cf_comments}">
			<input type="hidden" id="f_seq" name="f_seq" value="${f_board.f_seq }">
			<input type="hidden" id="cf_seq" name="cf_seq" value="${cf_comments.cf_seq }">
				<tr>
					<td style="color: white;">${cf_comments.cf_name} :</td>
					<td style="color: white;">${cf_comments.cf_content}</td>
					<td style="color: white;">${cf_comments.cf_date}</td>
					<c:choose>
						<c:when test="${sessionid eq cf_comments.cf_name }">
							<td><a href="javascript:void(0)" onclick="cf_del('${cf_comments.cf_seq }')"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
						</c:when>
						<c:when test="${sessionemail eq 'admin@admin.com'}">
							<td><a href="javascript:void(0)" onclick="cf_del('${cf_comments.cf_seq }')"><img src="resources/images/ximage.jpg" style="width: 10pt;height: 10pt"></a></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>   
			
		</tbody>
	</table>
</body>
</html>