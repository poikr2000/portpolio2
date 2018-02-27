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
function updateMember(email) {
	$.ajax({
		type:'Post',
		data:"email="+email,
		datatype:'json',
		url : 'memberAdminDetail',
		success : function(data){
			$('#email').attr("value",data.email);
			$('#id').attr("value",data.id);
			$('#name').attr("value",data.name);
			$('#zipcode').attr("value",data.zipcode);
			$('#newaddr').attr("value",data.newaddr);
			$('#detailaddr').attr("value",data.detailaddr);
			$("#phone1").val(data.phone1).attr('selected', true);
			$('#phone2').attr("value",data.phone2);
			$('#phone3').attr("value",data.phone3);
			$('#memlevel').attr("value",data.memlevel);
			$('#mileage').attr("value",data.mileage);
			$('#program_code').attr("value",data.program_code);
			$('#memberNoticeModal').modal('show');
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
function phone2_lengthchk(code){
	if(code.value.length==4){
		document.update_form.phone3.focus();
	}
}
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    document.popup_form.target = "pop";
    document.popup_form.action = "jusoPopup";
    document.popup_form.submit() ;
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.update_form.newaddr.value = roadAddrPart1;
	document.update_form.detailaddr.value = addrDetail;
	document.update_form.zipcode.value = zipNo;
}
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
                		$('#memberUpdateModalBtn').text('삭제');
                		$('#memberUpdateModalBtn').show();
                		$('#memberUpdateModalClose').text('취소');
                		$('#memberUpdateModalClose').show();
                		$('#memberUpdateModalmsg').text("삭제 하시겠습니까?")
                		$('#memberUpdateModal').modal('show');
                		$('#memberUpdateModalBtn').on('click',function(){
                			$('.memberlist_form').submit();
                		});
                	}else{
                		$('#memberUpdateModalClose').text('확인');
                		$('#memberUpdateModalBtn').hide();
                		$('#memberUpdateModalClose').show();
            			$('#memberUpdateModalmsg').text("선택된 항목이 없습니다.")
                		$('#memberUpdateModal').modal('show');
            			return;
            		}
                }
            }
        ]
	});
	$('.dt-button').addClass('btn btn-primary').removeClass('dt-button');
	$(document).on("keyup","input:text[numberOnly]",function(){
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	$('#memberupdatebtn').click(function(){
		var id=$('#id').val();
		var name=$('#name').val();
		var zipcode=$('#zipcode').val();
		var newaddr=$('#newaddr').val();
		var detailaddr=$('#detailaddr').val();
		var phone2=$('#phone2').val();
		var phone3=$('#phone3').val();
		if(name==""||id==""||zipcode==""||newaddr==""||detailaddr==""||phone2==""||phone3==""){
			$('#requirechk').click();
			return;
		}
		var msg=""
		if($('#userpassword').val()==""&&$('#passwordchk').val()==""){
			$('#memberUpdateModalBtn').text('수정');
			$('#memberUpdateModalBtn').show();
			$('#memberUpdateModalClose').text('취소');
			$('#memberUpdateModalClose').show();
			msg="- 변경 사항을 저장하시겠습니까? -";
			$('#memberUpdateModalmsg').text(msg);
			$('#memberUpdateModal').modal('show');
		}
		if($('#userpassword').val()!=$('#passwordchk').val()){
			msg="- 비밀번호를 다시 확인 해주시기 바랍니다 -";
			$('#memberUpdateModalmsg').text(msg);
    		$('#memberUpdateModalBtn').hide();
    		$('#memberUpdateModalClose').text('확인');
    		$('#memberUpdateModalClose').show();
			$('#memberUpdateModal').modal('show');
			$('#passwordchk').val('');
			return;
		}
		$('#memberUpdateModalBtn').text('수정');
		$('#memberUpdateModalBtn').show();
		$('#memberUpdateModalClose').text('취소');
		$('#memberUpdateModalClose').show();
		msg="- 변경 사항을 저장하시겠습니까? -";
		$('#memberUpdateModalmsg').text(msg);
		$('#memberUpdateModal').modal('show');
	})
	$('#memberUpdateModalBtn').click(function(){
		$('#update_form').attr('action','adminMemberUpdate');
		$('#update_form').submit();
	})
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
});
</script>
</content>
</head>
<body>
<form class="memberlist_form" name="memberlist_form" method="POST" action="memberSelectedDelete">
	<div class="col-sm-12" style="background:black;height:90px;">
	</div>
	<div class="container col-sm-12" style="height:1000px;">
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>회원 리스트</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
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
							<td style="text-align:center;vertical-align:middle;"><input type="checkbox" id="memberunitchk" name="memberunitchk" value="${member.email}"></td>
							<td style="text-align:center;vertical-align:middle;"><a href="javascript:updateMember('${member.email}');">${member.email}</a></td>
							<td style="text-align:center;vertical-align:middle;"><a href="javascript:updateMember('${member.email}');">${member.id}</a></td>
							<td style="text-align:center;vertical-align:middle;"><a href="javascript:updateMember('${member.email}');">${member.name}</a></td>
							<td style="text-align:center;vertical-align:middle;">${member.phone1}-${member.phone2}-${member.phone3}</td>
							<td style="text-align:center;vertical-align:middle;">${member.mileage}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div id="floatMenu">
		<ul>
			<li><a href="#">인적관리</a>
				<ul>
					<li><a href="memberList">회원 관리</a></li>
					<li><a href="staffList">직원 관리</a></li>
				</ul>
			</li>
			<li><a href="#">물적관리</a>
				<ul>
					<li><a href="partnerList">거래처 관리</a></li>
					<li><a href="receivingInsertForm">매입관리</a></li>
					<li><a href="receivingStatement">매입장</a></li>
					<li><a href="shippingStatement">출고장</a></li>
					<li><a href="consumableInsertForm">상품 등록</a></li>
					<li><a href="consumableList">상품수불장</a></li>
					<li><a href="equipmentInsertForm">기자재등록</a></li>
					<li><a href="equipmentStatement">기자재매입장</a></li>
					<li><a href="taskCloseForm">월말마감</a></li>
					<li><a href="balanceForm">거래현황</a></li>
				</ul>
			</li>
			<li><a href="serviceAdminForm">서비스신청 조회</a></li>
			<li><a href="orderListForm">상품주문 조회</a></li>
		</ul>
	</div>
</form>
     <div id="memberNoticeModal" class="modal fade" role="dialog">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<form name="update_form" id="update_form" method="post" role="form" >
					<input type="submit" style="display: none" id="requirechk" name="requirechk">
					<div class="container col-sm-12" style="text-align:left;">
							<div class="form-group col-sm-12" style="margin-top:20px;">
								<label class="col-sm-3">이메일</label>
								<div class="col-sm-4">
									<input class="form-control input-sm" id="email" name="email" readonly="readonly" type="text">
								</div>
						  	</div>
						  	<div class="form-group col-sm-12">
								<label class="col-sm-3">닉네임</label>
								<div class="col-sm-4">
									<input class="form-control input-sm" maxlength="7" id="id" name="id" required="required"<c:if test="${sessionemail!='admin@admin.com'}">readonly="readonly"</c:if> type="text">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3">비밀번호</label>
								<div class="col-sm-3">
									<input class="form-control input-sm" maxlength="15"id="userpassword" name="password" type="password" placeholder="password">
								</div>
								<label class="col-sm-3">비밀번호 확인</label>
								<div class="col-sm-3">
									<input class="form-control input-sm" maxlength="15"id="passwordchk" name="passwordchk" type="password" placeholder="password">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3">이름</label>
								<div class="col-sm-4">
									<input class="form-control input-sm" maxlength="10"id="name" name="name"required="required" type="text" placeholder="name">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3">주소</label>
								<div class="col-sm-4">
									<input class="form-control input-sm" id="zipcode" name="zipcode"required="required" type="text">
								</div>
								<div class="input-group-btn">
								    <button class="btn btn-default" type="button" onclick="goPopup();">
								    	<i class="glyphicon glyphicon-search"></i>&nbsp주소지 검색
								   	</button>
							    </div>
							</div>
							<div class="form-group col-sm-12">
						    	<div class="col-sm-offset-3 col-sm-4">
									<input class="form-control input-sm" id="newaddr" name="newaddr"required="required" type="text">
								</div>
								<div class="col-sm-5">
									<input class="form-control input-sm" id="detailaddr" name="detailaddr"required="required" type="text" placeholder="상세 주소를 입력해 주세요.">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3">전화번호</label>
								<div class="col-sm-3">
									<select id="phone1" name="phone1" class="form-control"> 
								    	<option value="010">010</option>
								    	<option value="011">011</option> 
								    	<option value="012">012</option> 
								    	<option value="016">016</option> 
								    	<option value="017">017</option> 
								    	<option value="018">018</option> 
								    	<option value="019">019</option> 
								    </select>
								</div>
								<div class="col-sm-3">
									<input class="form-control input-sm"maxlength="4"id="phone2" name="phone2" numberonly="true" required="required" onkeyup="phone2_lengthchk(this)"type="text" placeholder="phone2">
								</div>
								<div class="col-sm-3">
									<input class="form-control input-sm"maxlength="4"id="phone3" name="phone3" numberonly="true" required="required" type="text" placeholder="phone3">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3">회원레벨</label>
								<div class="col-sm-4">
									<input class="form-control input-sm"id="memlevel" name="memlevel" numberonly="true" maxlength="1"type="text" required="required">
								</div>
						  	</div>
						  	<div class="form-group col-sm-12">
								<label class="col-sm-3">마일리지</label>
								<div class="col-sm-4">
									<input class="form-control input-sm"id="mileage" name="mileage" numberonly="true" maxlength="7"type="text" required="required">
								</div>
						  	</div>
						  	<div class="form-group col-sm-12">
								<label class="col-sm-3">수강코드</label>
								<div class="col-sm-4">
									<input class="form-control input-sm"id="program_code" name="program_code" numberonly="true" maxlength="4"type="text" required="required">
								</div>
						  	</div>
					</div>
				 	<div class="col-sm-12" style="text-align:center;margin-top:10px;margin-bottom: 20px;">
						&nbsp;&nbsp;&nbsp;
						<button class="btn" type="button" id="memberupdatebtn" name="memberupdatebtn">수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn" type="button" data-dismiss="modal">돌아가기</button>
					</div>
				</form>
               </div>
               <div class="modal-footer" style="text-align:center">
               </div>
            </div>
         </div>
     </div>
     <div id="memberUpdateModal" class="modal fade" role="dialog">
         <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               <div class="modal-body">
               	<p><span id="memberUpdateModalmsg"> Some text in modal</span>
               </div>
               <div class="modal-footer" style="text-align:center">
                  <button type="button" id="memberUpdateModalBtn"class="btn btn-success" style="display: none" data-dismiss="modal">삭제</button>
                  <button type="button" id="memberUpdateModalClose"class="btn btn-success" style="display: none" data-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
     </div>
     <form method="post" class="popup_form" name="popup_form"></form>
</body>
</html>