<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style>
.ui-datepicker{ font-size: 13px; width: 300px;}
.ui-datepicker select.ui-datepicker-month{ width:40%; font-size: 13px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 13px; }
</style>

<script>
function phone2_lengthchk(code){
	if(code.value.length==4){
		document.staffinsert_form.phone3.focus();
	}
}

function codecheck(strValue){
	if(strValue.length==6)
		return true;
	else
		return false;
}

$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    yearRange: "1900:2050",
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년'
  });  
});
	
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/resources/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
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
	document.staffinsert_form.newaddr.value = roadAddrPart1;
	document.staffinsert_form.detailaddr.value = addrDetail;
	document.staffinsert_form.zipcode.value = zipNo;
}

function updateStaff(code){
	$.ajax({
		type:'Post',
		data:"code="+code,
		datatype:'json',
		url : 'staffDetail',
		success : function(data){
			$("#staffsave").hide();
			$("#codeconfirm").hide();
			$("#staffupdate").show();
			$('#code').attr("value",data.code);
			$('#code').attr("readonly",true);
			$('#name').attr("value",data.name);
			$('#datepicker1').attr("value",data.birth_date);
			$('#zipcode').attr("value",data.zipcode);
			$('#newaddr').attr("value",data.newaddr);
			$('#detailaddr').attr("value",data.detailaddr);
			$("#phone1").val(data.phone1).attr('selected', true);
			$('#phone2').attr("value",data.phone2);
			$('#phone3').attr("value",data.phone3);
			$('#beforephoto').attr("value",data.photo);
			$('#certificate1').attr("value",data.certificate1);
			$('#certificate2').attr("value",data.certificate2);
			$('#certificate3').attr("value",data.certificate3);
			$('#staffInsertModal').modal('show');
		},
		error : function(xhr,status,error){
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
	$(document).ready(function() {
		$(document).on("keyup","input:text[numberOnly]",function(){
			$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
		});
		$('#staffallchk').on("click",function(){
			if($(this).is(':checked')){
				$('input[name=staffunitchk]').prop('checked',true);
			}else{
				$('input[name=staffunitchk]').prop('checked',false);
			}
		});
		$('#stafftable').DataTable({
			dom: 'ftBp',
	        buttons: [
	        	{
	                text: 'delete',
	                action: function ( e, dt, node, config ) {
	                	var checkboxarr=[];
	                	$("input[name='staffunitchk']:checked").each(function(){
	                		checkboxarr.push($(this).val());
	                	});
	                	if(checkboxarr.length>0){
	                		$('#codeModalMsg').text("삭제 하시겠습니까?")
	            			$('#usebtn').text("삭제");
	            			$('#closebtn').text("취소");
	            			$('#usebtn').show();
	            			$('#closebtn').show();
	            			$('#codeModal').modal('show');
	                		$('#usebtn').on('click',function(){
	                			$('.stafflist_form').submit();
	                		});
	                	}else{
	                		$('#usebtn').hide();
	                		$('#closebtn').text('확인');
	                		$('#closebtn').show();
	            			$('#codeModalMsg').text("선택된 항목이 없습니다.")
	                		$('#codeModal').modal('show');
	            			return;
	            		}
	                }
	            },
	        	{
	                text: 'insert',
	                action: function ( e, dt, node, config ) {
	                	$("#staffsave").show();
	        			$("#codeconfirm").show();
	        			$("#staffupdate").hide();
	        			$('#code').attr("readonly",false);
	        			$('#code').attr("value","");
	        			$('#name').attr("value","");
	        			$('#datepicker1').attr("value","");
	        			$('#zipcode').attr("value","");
	        			$('#newaddr').attr("value","");
	        			$('#detailaddr').attr("value","");
	        			$("#phone1").val('010').attr('selected', true);
	        			$('#phone2').attr("value","");
	        			$('#phone3').attr("value","");
	        			$('#beforephoto').attr("value","");
	        			$('#certificate1').attr("value","");
	        			$('#certificate2').attr("value","");
	        			$('#certificate3').attr("value","");
	                	$('#staffInsertModal').modal('show');
	                }
	            }
	        ]
		});
	    $('#codeconfirm').on("click",function(){
			var code = $('#code').val()
			if($('#code').val()==""){
				$('#nullMsg').show();
				$('#confirmMsg').hide();
				$('#failMsg').hide();
				$('#trueMsg').hide();
				return;
			}else{
				var boolcode = codecheck(code);
				if(boolcode==false){
					$('#nullMsg').hide();
					$('#confirmMsg').show();
					$('#failMsg').hide();
					$('#trueMsg').hide();
					return;
				}
				$.ajax({
					type:'Post',
					data:"code="+code,
					datatype:'json',
					url : 'staffCodeConfirm',
					success : function(data){
						if(data>0){
							$('#nullMsg').hide();
							$('#confirmMsg').hide();
							$('#failMsg').show();
							$('#trueMsg').hide();
							$('#code').val('');
							return;
						}else{
							$('#nullMsg').hide();
							$('#confirmMsg').hide();
							$('#failMsg').hide();
							$('#trueMsg').show();
							$('#codeconfirmchk').attr("value","yes");
						}
					},
					error : function(xhr,status,error){
						alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
	    
		$('#staffsave').click(function(){
			var msg=""
			if($('#codeconfirmchk').val()=="no"){
				msg+="- 중복 검사를 하세요 -";
				$('#codeModalMsg').text(msg);
				$('#codeModal').modal('show');
				$('#closebtn').text("확인");
				$('#usebtn').hide();
				$('#closebtn').show();
				return;
			}else{
				msg+="- 등록하시겠습니까? -";
				$('#codeModalMsg').text(msg);
				$('#usebtn').text("등록");
				$('#closebtn').text("취소");
				$('#usebtn').show();
				$('#closebtn').show();
				$('#codeModal').modal('show');
				$('#usebtn').on('click',function(){
					$('#staffInsertForm').attr('action','staffInsert');
					$('#staffInsertForm').submit();
				});
			}
		});
		
		$('#staffupdate').click(function(){
			var msg=""
			msg+="- 수정하시겠습니까? -";
			$('#codeModalMsg').text(msg);
			$('#usebtn').text("수정");
			$('#closebtn').text("취소");
			$('#usebtn').show();
			$('#closebtn').show();
			$('#codeModal').modal('show');
			$('#usebtn').on('click',function(){
				$('#staffInsertForm').attr('action','staffUpdate');
				$('#staffInsertForm').submit();
			});
		});
	});
</script>
</content>
</head>
<body>
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
		<div class="col-sm-offset-3" style="text-align:left;margin-top:50px;">
			<h3>직원 리스트</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
	</div>
	<div class="col-sm-12">
		<form class="stafflist_form" action="staffDelete" method="POST">
			<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 70px;">
				<table class="table table-striped table-bordered" id="stafftable">
					<thead>
						<tr>
							<th style="text-align:center;vertical-align:middle;"><input type="checkbox" id="staffallchk"></th>
				        	<th style="text-align:center;vertical-align:middle;">사진</th>
				        	<th style="text-align:center;vertical-align:middle;">사원코드</th>
				        	<th style="text-align:center;vertical-align:middle;">이름</th>
				        	<th style="text-align:center;vertical-align:middle;">생년월일</th>
				        	<th style="text-align:center;vertical-align:middle;">주소</th>
				        	<th style="text-align:center;vertical-align:middle;">전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="staff" items="${staffs}">
							<tr>
								<td style="text-align:center; vertical-align:middle;"><input type="checkbox" id="staffunitchk" name="staffunitchk" value="${staff.code}"></td>
								<td style="text-align:center; vertical-align:middle;"><img src="${staff.photo}" width="50" height="50"></td>
								<td style="text-align:center; vertical-align:middle;"><a href="javascript:updateStaff('${staff.code}');">${staff.code}</a></td>
								<td style="text-align:center; vertical-align:middle;"><a href="javascript:updateStaff('${staff.code}');");">${staff.name}</a></td>
								<td style="text-align:center; vertical-align:middle;">${staff.birth_date}</td>
								<td style="text-align:center; vertical-align:middle;">${staff.newaddr}&nbsp;${staff.detailaddr}</td>
								<td style="text-align:center; vertical-align:middle;">${staff.phone1}-${staff.phone2}-${staff.phone3}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
		<div class="modal fade" id="staffInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      </div>
			      <div class="modal-body">
			        <form class="staffinsert_form" name="staffinsert_form" id="staffInsertForm" method="POST" enctype="multipart/form-data">
						<div class="container col-sm-12" align="center">
							<div class="form-group col-sm-12">
								<label class="col-sm-3">사원코드</label>
								<div class="col-sm-4">
									<input class="form-control input-sm" maxlength="6" numberonly="true" id="code" name="code" 
										type="text" placeholder="ex)123456">
								</div>
								<div class="input-group-btn  col-sm-2">
								    <button class="btn btn-default" id="codeconfirm" name="codeconfirm" type="button">중복검사</button>
								    <input type="hidden" id="codeconfirmchk" name="codeconfirmchk" value="no">
							    </div>
						  	</div>
						  	<div class="col-sm-offset-1 col-sm-8">
						    	<span id="confirmMsg" style="display: none;color: red;">※ 코드번호 여섯자리를 입력해 주세요.</span>
						    	<span id="nullMsg" style="display: none;color: red;">※ 코드를 입력해 주세요.</span>
						    	<span id="failMsg" style="display: none;color: red;">※ 중복된 코드 입니다.</span>
						    	<span id="trueMsg" style="display: none;color: green;">※ 사용 가능합니다.</span>
						    </div>
							
							<div class="form-group col-sm-12">
								<label class="col-sm-3">이름</label>
								<div class="col-sm-4">
									<input class="form-control input-sm" id="name" name="name" required="required" type="text">
								</div>
						  	</div>
						  	<div class="form-group col-sm-12">
								<label class="col-sm-3">생년월일</label>
								<div class="col-sm-4">
									<input type="text" id="datepicker1" name="birth_date">
								</div>
							</div>
							
							<div class="form-group col-sm-12">
								<label class="col-sm-3">주소</label>
								<div class="col-sm-3">
									<input class="form-control input-sm" maxlength="5" id="zipcode" name="zipcode"required="required" type="text">
								</div>
								<div class="input-group-btn col-sm-2">
								    <button class="btn btn-default" type="button" onclick="goPopup();">
								    	<i class="glyphicon glyphicon-search"></i>&nbsp주소지 검색
								   	</button>
							    </div>
							</div>
							<div class="form-group col-sm-12">
						    	<div class="col-sm-offset-3 col-sm-4">
									<input class="form-control input-sm" id="newaddr" name="newaddr"required="required" type="text">
								</div>
								<div class="col-sm-4">
									<input class="form-control input-sm" id="detailaddr" name="detailaddr"required="required" type="text" placeholder="상세 주소">
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-3">전화번호</label>
								<div class="col-sm-3">
									<select id="phone1" name="phone1" class="form-control"> 
								    	<option value="010" selected>010</option>
								    	<option value="011">011</option> 
								    	<option value="012">012</option> 
								    	<option value="016">016</option> 
								    	<option value="017">017</option> 
								    	<option value="018">018</option> 
								    	<option value="019">019</option> 
								    </select>
								</div>
								<div class="col-sm-3">
									<input class="form-control input-sm" numberonly="true" maxlength="4"id="phone2" name="phone2" 
										required="required" type="text" placeholder="phone2" onkeyup="phone2_lengthchk(this)">
								</div>
								<div class="col-sm-3">
									<input class="form-control input-sm" numberonly="true" maxlength="4"id="phone3" name="phone3" required="required" type="text" placeholder="phone3">
								</div>
							</div>
							
							<div class="form-group col-sm-12">
								<label class="col-sm-3">사진</label>
								<div class="col-sm-6">
									<input class="form-control input-sm" type="file" readonly="readonly" id="photo" name="imgfile">
									<input type="hidden" name="beforephoto" id="beforephoto">
								</div>
							</div>
							
							<div class="form-group col-sm-12">
								<label class="col-sm-3">자격증</label>
								<div class="col-sm-6">
									<input class="form-control input-sm" id="certificate1" name="certificate1" required="required" type="text">
								</div>
						  	</div>
						  	<div class="form-group col-sm-12">
								<label class="col-sm-3"></label>
								<div class="col-sm-6">
									<input class="form-control input-sm" id="certificate2" name="certificate2" required="required" type="text">
								</div>
						  	</div>
						  	<div class="form-group col-sm-12">
								<label class="col-sm-3"></label>
								<div class="col-sm-6">
									<input class="form-control input-sm" id="certificate3" name="certificate3" required="required" type="text">
								</div>
						  	</div>
						  	<div class="col-sm-12" style="text-align:center;margin-top:10px;margin-bottom: 20px;">
								<button class="btn" type="button" id="staffsave" name="staffsave">등&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp록</button>
								<button class="btn" type="button" id="staffupdate" style="display: none" name="staffupdate">수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<button class="btn" type="button" data-dismiss="modal" >돌아가기</button>
								
							</div>
						</div>
					</form>
			      </div>
			      <div class="modal-footer">
		      </div>
		    </div>
		  </div>
		</div>
		<div class="modal fade" id="codeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body">
		      	<span id="codeModalMsg">...</span>
			  </div>
		      <div class="modal-footer">
		      	<button type="button" id="usebtn" style="display: none;" class="btn btn-default">확인</button>
		      	<button type="button" id="closebtn" class="btn btn-default" style="display: none;" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		<form method="post" class="popup_form" name="popup_form"></form>
	</div>
</body>
</html>