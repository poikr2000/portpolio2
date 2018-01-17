<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<content tag="local_script">
<script>
$(document).ready(function(){
	$('#f_board').DataTable({
		dom: 'Bftp',
        buttons: [
            {
                text: 'delete',
                action: function ( e, dt, node, config ) {
                	var checkboxarr=[];
                	$("input[name='memberunitchk']:checked").each(function(){
                		checkboxarr.push($(this).val());
                	});
                	if(checkboxarr.length>0){
                		$('#memberselectedmodalmsg').text("삭제 하시겠습니까?")
                		$('#memberSelectedDeleteModal').modal('show');
                		$('#memberSelectedModalDeleteBtn').on('click',function(){
                			$('.memberlist_form').submit();
                		});
                	}else{
            			$('#memberNoticeModalMsg').text("선택된 항목이 없습니다.")
                		$('#memberNoticeModal').modal('show');
            			return;
            		}
                }
            }
        ]
	})
});
</script>
</content>
</head>
<body>
	<div class="col-sm-12" style="background: black; height: 90px;">
	</div>
	<form action="f_board">
		<h3 style="text-align: center;">게 시 판</h3>
		<div class="container">
			<table id="f_board" class="table fade in" style="margin-top: 60px">
				<thead>
				<button id="write" onclick="location.href='f_insert_form'" type="button" class="pull-right">글쓰기</button>
					<tr style="text-algin: center">
						<th>#</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="f_boards" items="${f_boards}">
						<tr style="text-algin: center; vertical-algin: middle;">
							<td>${f_boards.f_seq}</td>
							<td>${f_boards.f_name}</td>
							<td><a href="f_board_detail?f_seq=${f_boards.f_seq}">${f_boards.f_title}</a></td>
							<td>${f_boards.f_date}</td>
							<td>${f_boards.f_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>