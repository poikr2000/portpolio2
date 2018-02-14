<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<content tag="local_script">
<script>
function serviceHealth(){
	$('#serviceHealthModal').modal('show');
};
function servicePt(){
	$('#servicePtModal').modal('show');
};
function serviceGx(){
	$('#serviceGxModal').modal('show');
};
function servicePilates(){
	$('#servicePilatesModal').modal('show');
};
$(document).ready(function(){
	$('#healthConfirmBtn').on("click",function(){
		$.ajax({
			type:'Post',
			datatype:'json',
			url : 'serviceChk',
			success : function(data){
				if(data>0){
					$('#noticeModalMsg').text('프로그램을 신청했거나 이미 진행중인 경우 더 이상 신청하실 수 없습니다.');
					$('#noticeModal').modal('show');
					return;
				}else{
					var radio = $("input[type=radio][name=healthradio]:checked").val();
					$.ajax({
						type:'Post',
						data:"radio="+radio,
						datatype:'json',
						url : 'serviceSelected',
						success : function(data){
							$('#serviceModalMsg').text(data.name+'을 신청하시겠습니까');
							$('#serviceModal').modal('show');
						},
						error : function(xhr,status,error){
							alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
						}
					});
				}
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
		$('#serviceModalConfirm').on("click",function(){
			var radio = $("input[type=radio][name=healthradio]:checked").val();
			$.ajax({
				type:'Post',
				data:"radio="+radio,
				datatype:'json',
				url : 'serviceInsert',
				success : function(data){
					$('#confirmModalMsg').text('신청이 완료되었습니다');
					$('#confirmModal').modal('show');
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
	$('#ptConfirmBtn').on("click",function(){
		$.ajax({
			type:'Post',
			datatype:'json',
			url : 'serviceChk',
			success : function(data){
				if(data>0){
					$('#noticeModalMsg').text('프로그램을 신청했거나 이미 진행중인 경우 더 이상 신청하실 수 없습니다.');
					$('#noticeModal').modal('show');
					return;
				}else{
					var radio = $("input[type=radio][name=ptradio]:checked").val();
					$.ajax({
						type:'Post',
						data:"radio="+radio,
						datatype:'json',
						url : 'serviceSelected',
						success : function(data){
							$('#serviceModalMsg').text(data.name+'를 신청하시겠습니까');
							$('#serviceModal').modal('show');
						},
						error : function(xhr,status,error){
							alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
						}
					});
				}
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
		$('#serviceModalConfirm').on("click",function(){
			var radio = $("input[type=radio][name=ptradio]:checked").val();
			$.ajax({
				type:'Post',
				data:"radio="+radio,
				datatype:'json',
				url : 'serviceInsert',
				success : function(data){
					$('#confirmModalMsg').text('신청이 완료되었습니다');
					$('#confirmModal').modal('show');
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
	$('#gxConfirmBtn').on("click",function(){
		$.ajax({
			type:'Post',
			datatype:'json',
			url : 'serviceChk',
			success : function(data){
				if(data>0){
					$('#noticeModalMsg').text('프로그램을 신청했거나 이미 진행중인 경우 더 이상 신청하실 수 없습니다.');
					$('#noticeModal').modal('show');
					return;
				}else{
					var radio = $("input[type=radio][name=gxradio]:checked").val();
					$.ajax({
						type:'Post',
						data:"radio="+radio,
						datatype:'json',
						url : 'serviceSelected',
						success : function(data){
							$('#serviceModalMsg').text(data.name+'을 신청하시겠습니까');
							$('#serviceModal').modal('show');
						},
						error : function(xhr,status,error){
							alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
						}
					});
				}
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
		$('#serviceModalConfirm').on("click",function(){
			var radio = $("input[type=radio][name=gxradio]:checked").val();
			$.ajax({
				type:'Post',
				data:"radio="+radio,
				datatype:'json',
				url : 'serviceInsert',
				success : function(data){
					$('#confirmModalMsg').text('신청이 완료되었습니다');
					$('#confirmModal').modal('show');
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
	$('#pilatesConfirmBtn').on("click",function(){
		$.ajax({
			type:'Post',
			datatype:'json',
			url : 'serviceChk',
			success : function(data){
				if(data>0){
					$('#noticeModalMsg').text('프로그램을 신청했거나 이미 진행중인 경우 더 이상 신청하실 수 없습니다.');
					$('#noticeModal').modal('show');
					return;
				}else{
					var radio = $("input[type=radio][name=pilatesradio]:checked").val();
					$.ajax({
						type:'Post',
						data:"radio="+radio,
						datatype:'json',
						url : 'serviceSelected',
						success : function(data){
							$('#serviceModalMsg').text(data.name+'을 신청하시겠습니까');
							$('#serviceModal').modal('show');
						},
						error : function(xhr,status,error){
							alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
						}
					});
				}
			},
			error : function(xhr,status,error){
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
		$('#serviceModalConfirm').on("click",function(){
			var radio = $("input[type=radio][name=pilatesradio]:checked").val();
			$.ajax({
				type:'Post',
				data:"radio="+radio,
				datatype:'json',
				url : 'serviceInsert',
				success : function(data){
					$('#confirmModalMsg').text('신청이 완료되었습니다');
					$('#confirmModal').modal('show');
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
	$('#confirmModal').on('hidden.bs.modal', function(e){
		location.href="serviceMember";
    });
});
</script>
</content>
<body>
<form style="background:url('resources/images/bgimage.jpg')">
	<div style="height:1500px">
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6" align="center">
				<!-- title-01 -->
				<div>
					<h2 class="title-01__title" style="margin-top: 120px;">
						<font color="#FFFFFF"; face="Impact">Fitness Service</font>
					</h2>
				</div><!-- End / title-01 -->
			</div>
		</div>
		<div class="row col-sm-12">
			<div class="grid">
				<figure class="effect-apollo effect">
					<img src="resources/images/fitnessimg.jpg" alt="fitnessimg"/>
					<figcaption>
						<h2><span style="text-shadow: 0 2px 0 rgba(255, 255, 255, .75);">Health</span></h2>
						<p>다양한 운동 기구와 냉난방시설로 최적의 헬스 환경 구성</p>
						<a href="javascript:serviceHealth();">View more</a>
					</figcaption>			
				</figure>
				<figure class="effect-apollo effect">
					<img src="resources/images/ptimg.jpg" alt="ptimg"/>
					<figcaption>
						<h2><span style="text-shadow: 0 2px 0 rgba(255, 255, 255, .75);">P . T</span></h2>
						<p>개인의 특성에 맞춘 초고밀도 1:1 대면 트레이닝</p>
						<a href="javascript:servicePt();">View more</a>
					</figcaption>			
				</figure>
			</div>
		</div>
		<div class="row col-sm-12">
			<div class="grid">
				<figure class="effect-apollo effect">
					<img src="resources/images/gximg.jpg" alt="gximg"/>
					<figcaption>
						<h2><span style="text-shadow: 0 2px 0 rgba(255, 255, 255, .75);">G . X</span></h2>
						<p>개인별 트레이닝이 어색하신 회원님을 위한 다양한 구성의 그룹 엑서사이즈</p>
						<a href="javascript:serviceGx();">View more</a>
					</figcaption>			
				</figure>
				<figure class="effect-apollo effect">
					<img src="resources/images/pilatesimg.jpg" alt="pilatesimg"/>
					<figcaption>
						<h2><span style="text-shadow: 0 2px 0 rgba(255, 255, 255, .75);">Pilates</span></h2>
						<p>국제적인 필라테스 교육을 이수한 유능한 강사가 지도하는 최상의 수업</p>
						<a href="javascript:servicePilates();">View more</a>
					</figcaption>			
				</figure>
			</div>
		</div>
	</div>
	<div class="modal fade" id="serviceHealthModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">헬스</h4>
	      </div>
	      <div class="modal-body" style="height: 550px;">
	        <div class="col-sm-3">
	        	<img alt="" src="resources/images/icon2.png" style="width: 200px;height: 200px;">
	        </div>
	         <div class="col-sm-offset-1 col-sm-7" style="margin-top: 40px;">
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="healthradio" value="1111" checked="checked"><h5>1개월 이용(운동복, 타월 제공) : 20,000 원(마일리지 10% 적립)</h5></label><br>
				<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="healthradio"value="1112"><h5>3개월 이용(운동복, 타월 제공) : 50,000 원(마일리지 10% 적립)</h5></label><br>
				<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="healthradio"value="1113"><h5>6개월 이용(운동복, 타월 제공) : 90,000 원(마일리지 10% 적립)</h5></label>
	        </div>
	        <div class="col-sm-offset-1 col-sm-10" style="border: 1px solid black;height: 300px;">
	        	<h5 style="margin-top: 20px;">* 시설 수용 인원에 따라 신청이 조기 마감 될 수 있습니다.</h5><br>
	        	<h5>* 등록 후 마일리지를 사용하실 경우 해당 서비스의 환불이 불가능 합니다.</h5><br>
	        	<h5>* 등록 후 결제는 본 시설에 방문하셨을 때 이루어 집니다.</h5><br>
	        	<h5>* 서비스 이용시간은 등록을 기준으로 익일부터 시작됩니다.</h5><br>
	        	<h5>* 이벤트 진행에 따라 서비스 가격이 달라질 수 있습니다.</h5><br>
	        </div>
	      </div>
	      <div class="modal-footer" >
	        <button type="button" id="healthConfirmBtn" class="btn btn-primary">신청</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade" id="servicePtModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">P . T</h4>
	      </div>
	      <div class="modal-body" style="height: 550px;">
	        <div class="col-sm-3">
	        	<img alt="" src="resources/images/icon1.png" style="width: 200px;height: 200px;">
	        </div>
	         <div class="col-sm-9" style="margin-top: 40px;">
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="ptradio"value="2111" checked="checked"><h5>10회(주2회, 1회당 50분, +헬스 1개월 이용) : 40만원(마일리지 10%적립)</h5></label><br>
				<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="ptradio"value="2112"><h5>20회(주2회, 1회당 50분, +헬스 2개월 이용) : 70만원(마일리지 10%적립)</h5></label><br>
				<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="ptradio"value="2113"><h5>30회(주2회, 1회당 50분, +헬스 3개월 이용) : 90만원(마일리지 10%적립)</h5></label>
	        </div>
	        <div class="col-sm-offset-1 col-sm-10" style="border: 1px solid black;height: 300px;">
	        	<h5 style="margin-top: 20px;">* 시설 수용 인원에 따라 신청이 조기 마감 될 수 있습니다.</h5><br>
	        	<h5>* 등록 후 마일리지를 사용하실 경우 해당 서비스의 환불이 불가능 합니다.</h5><br>
	        	<h5>* 등록 후 결제는 본 시설에 방문하셨을 때 이루어 집니다.</h5><br>
	        	<h5>* 서비스 이용시간은 등록을 기준으로 익일부터 시작됩니다.</h5><br>
	        	<h5>* 이벤트 진행에 따라 서비스 가격이 달라질 수 있습니다.</h5><br>
	        </div>
	      </div>
	      <div class="modal-footer" >
	        <button type="button" id="ptConfirmBtn"class="btn btn-primary">신청</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade" id="serviceGxModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">G . X</h4>
	      </div>
	      <div class="modal-body" style="height: 550px;">
	        <div class="col-sm-3">
	        	<img alt="" src="resources/images/icon5.png" style="width: 200px;height: 200px;">
	        </div>
	         <div class="col-sm-9" style="margin-top: 40px;">
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="gxradio"value="3111" checked="checked"><h5>1개월 이용(운동복, 타월 제공, +헬스 1개월 이용) : 5 만원(마일리지 10% 적립)</h5></label><br>
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="gxradio"value="3112"><h5>2개월 이용(운동복, 타월 제공, +헬스 2개월 이용) : 13 만원(마일리지 10% 적립)</h5></label><br>
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="gxradio"value="3113"><h5>3개월 이용(운동복, 타월 제공, +헬스 3개월 이용) : 25 만원(마일리지 10% 적립)</h5></label><br>
	        </div>
	        <div class="col-sm-offset-1 col-sm-10" style="border: 1px solid black;height: 300px;">
	        	<h5 style="margin-top: 20px;">* 시설 수용 인원에 따라 신청이 조기 마감 될 수 있습니다.</h5><br>
	        	<h5>* 등록 후 마일리지를 사용하실 경우 해당 서비스의 환불이 불가능 합니다.</h5><br>
	        	<h5>* 등록 후 결제는 본 시설에 방문하셨을 때 이루어 집니다.</h5><br>
	        	<h5>* 서비스 이용시간은 등록을 기준으로 익일부터 시작됩니다.</h5><br>
	        	<h5>* 이벤트 진행에 따라 서비스 가격이 달라질 수 있습니다.</h5><br>
	        </div>
	      </div>
	      <div class="modal-footer" >
	        <button type="button" id="gxConfirmBtn"class="btn btn-primary">신청</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade" id="servicePilatesModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">필라테스</h4>
	      </div>
	      <div class="modal-body" style="height: 550px;">
	        <div class="col-sm-3">
	        	<img alt="" src="resources/images/icon3.png" style="width: 200px;height: 200px;">
	        </div>
	         <div class="col-sm-9" style="margin-top: 40px;">
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="pilatesradio"value="4111" checked="checked"><h5>1개월 이용(운동복, 타월 제공, +헬스 1개월 이용) : 6 만원(마일리지 10% 적립)</h5></label><br>
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="pilatesradio"value="4112"><h5>2개월 이용(운동복, 타월 제공, +헬스 2개월 이용) : 16 만원(마일리지 10% 적립)</h5></label><br>
	        	<label class="radio-inline" style="margin-top: 10px;"><input type="radio" name="pilatesradio"value="4113"><h5>3개월 이용(운동복, 타월 제공, +헬스 3개월 이용) : 28 만원(마일리지 10% 적립)</h5></label><br>
	        </div>
	        <div class="col-sm-offset-1 col-sm-10" style="border: 1px solid black;height: 300px;">
	        	<h5 style="margin-top: 20px;">* 시설 수용 인원에 따라 신청이 조기 마감 될 수 있습니다.</h5><br>
	        	<h5>* 등록 후 마일리지를 사용하실 경우 해당 서비스의 환불이 불가능 합니다.</h5><br>
	        	<h5>* 등록 후 결제는 본 시설에 방문하셨을 때 이루어 집니다.</h5><br>
	        	<h5>* 서비스 이용시간은 등록을 기준으로 익일부터 시작됩니다.</h5><br>
	        	<h5>* 이벤트 진행에 따라 서비스 가격이 달라질 수 있습니다.</h5><br>
	        </div>
	      </div>
	      <div class="modal-footer" >
	        <button type="button" id="pilatesConfirmBtn"class="btn btn-primary">신청</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<div id="serviceModal" class="modal fade" role="dialog">
	    <div class="modal-dialog modal-sm" role="document">
	       <div class="modal-content">
	          <div class="modal-header">
	             <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	          <div class="modal-body">
	          	<p><span id="serviceModalMsg"> Some text in modal</span>
	          </div>
	          <div class="modal-footer" style="text-align:center">
	             <button type="button" id="serviceModalConfirm"class="btn btn-success"data-dismiss="modal">확인</button>
	             <button type="button"class="btn btn-success" data-dismiss="modal">취소</button>
	          </div>
	       </div>
	    </div>
   </div>
   <div id="confirmModal" class="modal fade" role="dialog">
	    <div class="modal-dialog modal-sm" role="document">
	       <div class="modal-content">
	          <div class="modal-header">
	             <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	          <div class="modal-body">
	          	<p><span id="confirmModalMsg"> Some text in modal</span>
	          </div>
	          <div class="modal-footer" style="text-align:center">
	             <button type="button"class="btn btn-success" data-dismiss="modal">확인</button>
	          </div>
	       </div>
	    </div>
	</div>
	<div id="noticeModal" class="modal fade" role="dialog">
	    <div class="modal-dialog modal-sm" role="document">
	       <div class="modal-content">
	          <div class="modal-header">
	             <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	          <div class="modal-body">
	          	<p><span id="noticeModalMsg"> Some text in modal</span>
	          </div>
	          <div class="modal-footer" style="text-align:center">
	             <button type="button"class="btn btn-success" data-dismiss="modal">확인</button>
	          </div>
	       </div>
	    </div>
	</div>
</form>
</body>
</html>