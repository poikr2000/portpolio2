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
	$('#partnerallchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=partnerunitchk]').prop('checked',true);
		}else{
			$('input[name=partnerunitchk]').prop('checked',false);
		}
	});
	$('#partnertable').DataTable({
		dom: 'ftBp',
        buttons: [
            {
                text: 'delete',
                action: function ( e, dt, node, config ) {
                	var checkboxarr=[];
                	$("input[name='partnerunitchk']:checked").each(function(){
                		checkboxarr.push($(this).val());
                	});
                	if(checkboxarr.length>0){
                		$('#partnerselectedmodalmsg').text("삭제 하시겠습니까?")
                		$('#partnerSelectedDeleteModal').modal('show');
                		$('#partnerSelectedModalDeleteBtn').on('click',function(){
                			$('.partnerlist_form').submit();
                		});
                	}else{
            			$('#partnerNoticeModalMsg').text("선택된 항목이 없습니다.")
                		$('#partnerNoticeModal').modal('show');
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
<form class="partnerlist_form" name="partnerlist_form" method="POST" action="partnerSelectedDelete">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;text-align:center;">
			  <h2>거래처 리스트</h2>
		</div>
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;margin-bottom: 70px;">
			<table class="table table-striped table-bordered" id="partnertable">
				<thead>
					<tr style="text-align:center;">
						<th style="text-align:center;vertical-align:middle;"><input type="checkbox" id="partnerallchk"></th>
						<th style="text-align:center;vertical-align:middle;">코드</th>
						<th style="text-align:center;vertical-align:middle;">상호명</th>
						<th style="text-align:center;vertical-align:middle;">사업자번호</th>
						<th style="text-align:center;vertical-align:middle;">사업주</th>
						<th style="text-align:center;vertical-align:middle;">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="partner" items="${partners}">
						<tr>
							<td class="text-center"><input type="checkbox" id="partnerunitchk" name="partnerunitchk" value="${partner.code}"></td>
							<td style="text-align:center;vertical-align:middle;"><a href="partnerDetail?code=${partner.code}">${partner.code}</a></td>
							<td style="text-align:center;vertical-align:middle;">${partner.name}</td>
							<td style="text-align:center;vertical-align:middle;">${partner.busno1}-${partner.busno2}-${partner.busno3}</td>
							<td style="text-align:center;vertical-align:middle;">${partner.ceoname}</td>
							<td style="text-align:center;vertical-align:middle;">${partner.officeno1}-${partner.officeno2}-${partner.officeno3}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div id="partnerSelectedDeleteModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="partnerselectedmodalmsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" id="partnerSelectedModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
     </div>
     <div id="partnerNoticeModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="partnerNoticeModalMsg"> Some text in modal</span>
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