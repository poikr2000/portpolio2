<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script>
$(document).ready(function(){
	$('#memberallchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=memberunitchk]').prop('checked',true);
		}else{
			$('input[name=memberunitchk]').prop('checked',false);
		}
	});
	$('#membertable').DataTable({
		dom: 'ftBp',
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
	});
});
</script>
</content>
</head>
<body>
<form class="memberlist_form" name="memberlist_form" method="POST" action="memberSelectedDelete">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;text-align:center;">
			  <h2>회원 리스트</h2>
		</div>
		<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 70px;">
			<table class="table table-striped table-bordered" id="membertable">
				<thead>
					<tr style="text-align:center;">
						<th style="text-align:center;vertical-align:middle;"><input type="checkbox" id="memberallchk"></th>
						<th style="text-align:center;vertical-align:middle;">E-mail</th>
						<th style="text-align:center;vertical-align:middle;">닉네임</th>
						<th style="text-align:center;vertical-align:middle;">이름</th>
						<th style="text-align:center;vertical-align:middle;">전화번호</th>
						<th style="text-align:center;vertical-align:middle;">마일리지</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${members}">
						<tr>
							<td class="text-center"><input type="checkbox" id="memberunitchk" name="memberunitchk" value="${member.email}"></td>
							<td style="text-align:center;vertical-align:middle;"><a href="memberDetail?email=${member.email}">${member.email}</a></td>
							<td style="text-align:center;vertical-align:middle;"><a href="memberDetail?email=${member.email}">${member.id}</a></td>
							<td style="text-align:center;vertical-align:middle;"><a href="memberDetail?email=${member.email}">${member.name}</a></td>
							<td style="text-align:center;vertical-align:middle;">${member.phone1}-${member.phone2}-${member.phone3}</td>
							<td style="text-align:center;vertical-align:middle;">${member.mileage}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div id="memberSelectedDeleteModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="memberselectedmodalmsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" id="memberSelectedModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
     </div>
     <div id="memberNoticeModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="memberNoticeModalMsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" class="btn btn-success" data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
     </div>
</form>
</body>
</html>