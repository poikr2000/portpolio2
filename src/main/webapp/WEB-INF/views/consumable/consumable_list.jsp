<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	$('#consumableallchk').on("click",function(){
		if($(this).is(':checked')){
			$('input[name=consumableunitchk]').prop('checked',true);
		}else{
			$('input[name=consumableunitchk]').prop('checked',false);
		}
	});
	$('#consumabletable').DataTable({
		dom: 'ftBp',
        buttons: [
        	 {
                 text: 'insert',
                 action: function ( e, dt, node, config ) {
                 	var url="consumableInsertForm";
         			$(location).attr('href',url);
                 }
             },
            {
                text: 'delete',
                action: function ( e, dt, node, config ) {
                	var checkboxarr=[];
                	$("input[name='consumableunitchk']:checked").each(function(){
                		checkboxarr.push($(this).val());
                	});
                	if(checkboxarr.length>0){
                		$('#consumableselectedmodalmsg').text("삭제 하시겠습니까?")
                		$('#consumableSelectedDeleteModal').modal('show');
                		$('#consumableSelectedModalDeleteBtn').on('click',function(){
                			$('.consumablelist_form').submit();
                		});
                	}else{
            			$('#consumableNoticeModalMsg').text("선택된 항목이 없습니다.")
                		$('#consumableNoticeModal').modal('show');
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
<form class="consumablelist_form"  name="consumablelist_form" method="POST" action="consumableSelectedDelete">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:50px;text-align:center;">
			  <h2>수불장</h2>
		</div>
		<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 70px;">
			<table id="consumabletable" class="table table-striped table-bordered" cellspacing="0" width="100%">
		        <thead>
		            <tr>
		            	<th><input type="checkbox" id="consumableallchk"></th>
		                <th>코드</th>
		                <th>품명</th>
		                <th>거래처</th>
		                <th>전년말</th>
		                <th>구분</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>현재고</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="consumable" items="${consumables}">
		        		<c:choose>
		        			<c:when test="${consumable.code=='00000000'}">
		        			</c:when>
		        			<c:otherwise>
		        				<tr>
									<td class="text-center" style="vertical-align:middle;"><input type="checkbox" id="consumableunitchk" name="consumableunitchk" value="${consumable.code}"></td>
									<td class="text-center" style="vertical-align:middle;"><a href="consumableDetail?code=${consumable.code}">${consumable.code}</a></td>
									<td class="text-center" style="vertical-align:middle;"><a href="consumableDetail?code=${consumable.code}">${consumable.name}</a></td>
									<td class="text-center" style="vertical-align:middle;">${consumable.bp_name}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.preyystock}</td>
									<td class="text-center" style="vertical-align:middle;">
										<div class="bg-danger text-white">입고</div>
										<div class="bg-warning text-white">출고</div>
									</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv01}<br>${consumable.ship01}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv02}<br>${consumable.ship02}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv03}<br>${consumable.ship03}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv04}<br>${consumable.ship04}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv05}<br>${consumable.ship05}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv06}<br>${consumable.ship06}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv07}<br>${consumable.ship07}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv08}<br>${consumable.ship08}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv09}<br>${consumable.ship09}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv10}<br>${consumable.ship10}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv11}<br>${consumable.ship11}</td>
									<td class="text-center" style="vertical-align:middle;">${consumable.rcv12}<br>${consumable.ship12}</td>
									<td class="text-center bg-danger text-white" style="vertical-align:middle;">${consumable.stock}</td>
								</tr>
		        			</c:otherwise>
		        		</c:choose>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
	</div>
	<div id="consumableSelectedDeleteModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="consumableselectedmodalmsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" id="consumableSelectedModalDeleteBtn"class="btn btn-success" data-dismiss="modal">삭제</button>
                  <button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
     </div>
     <div id="consumableNoticeModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="consumableNoticeModalMsg"> Some text in modal</span>
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