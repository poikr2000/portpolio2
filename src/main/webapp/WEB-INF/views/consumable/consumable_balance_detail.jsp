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
function sumprebalance(){ 
	var prebalance01 = parseInt(balancedetail_form.prebalance01.value);
	var prebalance02 = parseInt(balancedetail_form.prebalance02.value);
	var prebalance03 = parseInt(balancedetail_form.prebalance03.value);
	var prebalance04 = parseInt(balancedetail_form.prebalance04.value);
	var prebalance05 = parseInt(balancedetail_form.prebalance05.value);
	var prebalance06 = parseInt(balancedetail_form.prebalance06.value);
	var prebalance07 = parseInt(balancedetail_form.prebalance07.value);
	var prebalance08 = parseInt(balancedetail_form.prebalance08.value);
	var prebalance09 = parseInt(balancedetail_form.prebalance09.value);
	var prebalance10 = parseInt(balancedetail_form.prebalance10.value);
	var prebalance11 = parseInt(balancedetail_form.prebalance11.value);
	var prebalance12 = parseInt(balancedetail_form.prebalance12.value);
	balancedetail_form.prebalancesum.value = prebalance01+prebalance02+prebalance03+prebalance04+prebalance05+prebalance06+prebalance07+prebalance08+prebalance09+prebalance10+prebalance11+prebalance12;
} 

function sumdeal(){ 
	var deal01 = parseInt(balancedetail_form.deal01.value);
	var deal02 = parseInt(balancedetail_form.deal02.value);
	var deal03 = parseInt(balancedetail_form.deal03.value);
	var deal04 = parseInt(balancedetail_form.deal04.value);
	var deal05 = parseInt(balancedetail_form.deal05.value);
	var deal06 = parseInt(balancedetail_form.deal06.value);
	var deal07 = parseInt(balancedetail_form.deal07.value);
	var deal08 = parseInt(balancedetail_form.deal08.value);
	var deal09 = parseInt(balancedetail_form.deal09.value);
	var deal10 = parseInt(balancedetail_form.deal10.value);
	var deal11 = parseInt(balancedetail_form.deal11.value);
	var deal12 = parseInt(balancedetail_form.deal12.value);
	balancedetail_form.dealsum.value = deal01+deal02+deal03+deal04+deal05+deal06+deal07+deal08+deal09+deal10+deal11+deal12;
} 

function sumpay(){ 
	var pay01 = parseInt(balancedetail_form.pay01.value);
	var pay02 = parseInt(balancedetail_form.pay02.value);
	var pay03 = parseInt(balancedetail_form.pay03.value);
	var pay04 = parseInt(balancedetail_form.pay04.value);
	var pay05 = parseInt(balancedetail_form.pay05.value);
	var pay06 = parseInt(balancedetail_form.pay06.value);
	var pay07 = parseInt(balancedetail_form.pay07.value);
	var pay08 = parseInt(balancedetail_form.pay08.value);
	var pay09 = parseInt(balancedetail_form.pay09.value);
	var pay10 = parseInt(balancedetail_form.pay10.value);
	var pay11 = parseInt(balancedetail_form.pay11.value);
	var pay12 = parseInt(balancedetail_form.pay12.value);
	balancedetail_form.paysum.value = pay01+pay02+pay03+pay04+pay05+pay06+pay07+pay08+pay09+pay10+pay11+pay12;
}

function sumbalance(){ 
	var balance01 = parseInt(balancedetail_form.balance01.value);
	var balance02 = parseInt(balancedetail_form.balance02.value);
	var balance03 = parseInt(balancedetail_form.balance03.value);
	var balance04 = parseInt(balancedetail_form.balance04.value);
	var balance05 = parseInt(balancedetail_form.balance05.value);
	var balance06 = parseInt(balancedetail_form.balance06.value);
	var balance07 = parseInt(balancedetail_form.balance07.value);
	var balance08 = parseInt(balancedetail_form.balance08.value);
	var balance09 = parseInt(balancedetail_form.balance09.value);
	var balance10 = parseInt(balancedetail_form.balance10.value);
	var balance11 = parseInt(balancedetail_form.balance11.value);
	var balance12 = parseInt(balancedetail_form.balance12.value);
	balancedetail_form.balancesum.value = balance01+balance02+balance03+balance04+balance05+balance06+balance07+balance08+balance09+balance10+balance11+balance12;
}

</script>
</content>
<body>
<form class="balancedetail_form" name="balancedetail_form" action="balanceUpdate" method="post"role="form">
	<div class="col-sm-12" style="background: black;height:90px;">
	</div>
	<div class="container col-sm-12">
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
		<div class="col-sm-offset-3" style="margin-top:50px;">
			<h3>${balance.yyyy}년 ${balance.bp_name} 거래정보</h3>
		</div>
		<div>
			<hr class="col-sm-offset-2 col-sm-8" style="border: solid 1px black">
		</div>
		<div class="col-sm-offset-2 col-sm-8" align="center">
			<input type="hidden" id="yyyy" name="yyyy" value="${balance.yyyy}">
			<input type="hidden" id="vendcode" name="vendcode" value="${balance.bp_code}">
			<div class="row" style="margin-top:10px">
		  	  <div class="input-group">
			    <span class="input-group-addon"><i class="fa fa-file-text-o" aria-hidden="true"></i>&nbsp 전년이월</span>
			    <input id="preyybalance" name="preyybalance" type="text"class="form-control" value="${balance.preyybalance}">
			    <span class="input-group-addon"><i class="fa fa-krw" aria-hidden="true"></i>&nbsp 현재잔액</span>
			    <input id="balance" name="balance" type="text"class="form-control" value="${balance.balance}">
			  </div>
			</div>
			<div style="margin-top:10px">
				<table class="table table-striped table-bordered">
					<thead>
						<tr style="text-align:center;">
							<th>월</th>
							<th>전월이월</th>
							<th>거래금액</th>
							<th>지불금액</th>
							<th>잔액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">1월</td>
							<td class="text-center">
								<input id="prebalance01" numberonly="true" onKeyUp="sumprebalance();" name="prebalance01" type="text"value="${balance.prebalance01}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal01" numberonly="true"onKeyUp="sumdeal();" name="deal01" type="text"value="${balance.deal01}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay01" numberonly="true"onKeyUp="sumpay();" name="pay01" type="text"value="${balance.pay01}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance01" numberonly="true"onKeyUp="sumbalance();" name="balance01" type="text"value="${balance.balance01}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">2월</td>
							<td class="text-center">
								<input id="prebalance02"numberonly="true" onKeyUp="sumprebalance();" name="prebalance02" type="text"value="${balance.prebalance02}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal02"numberonly="true" onKeyUp="sumdeal();" name="deal02" type="text"value="${balance.deal02}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay02" numberonly="true"onKeyUp="sumpay();" name="pay02" type="text"value="${balance.pay02}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance02"numberonly="true" onKeyUp="sumbalance();" name="balance02" type="text"value="${balance.balance02}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">3월</td>
							<td class="text-center">
								<input id="prebalance03" numberonly="true"onKeyUp="sumprebalance();" name="prebalance03" type="text"value="${balance.prebalance03}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal03" numberonly="true"onKeyUp="sumdeal();" name="deal03" type="text"value="${balance.deal03}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay03" numberonly="true"onKeyUp="sumpay();" name="pay03" type="text"value="${balance.pay03}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance03" numberonly="true"onKeyUp="sumbalance();" name="balance03" type="text"value="${balance.balance03}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">4월</td>
							<td class="text-center">
								<input id="prebalance04"numberonly="true" onKeyUp="sumprebalance();" name="prebalance04" type="text"value="${balance.prebalance04}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal04"numberonly="true" onKeyUp="sumdeal();" name="deal04" type="text"value="${balance.deal04}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay04"numberonly="true" onKeyUp="sumpay();" name="pay04" type="text"value="${balance.pay04}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance04"numberonly="true" onKeyUp="sumbalance();" name="balance04" type="text"value="${balance.balance04}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">5월</td>
							<td class="text-center">
								<input id="prebalance05"numberonly="true" onKeyUp="sumprebalance();" name="prebalance05" type="text"value="${balance.prebalance05}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal05"numberonly="true" onKeyUp="sumdeal();" name="deal05" type="text"value="${balance.deal05}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay05" numberonly="true"onKeyUp="sumpay();" name="pay05" type="text"value="${balance.pay05}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance05"numberonly="true" onKeyUp="sumbalance();" name="balance05" type="text"value="${balance.balance05}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">6월</td>
							<td class="text-center">
								<input id="prebalance06"numberonly="true" onKeyUp="sumprebalance();" name="prebalance06" type="text"value="${balance.prebalance06}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal06"numberonly="true" onKeyUp="sumdeal();" name="deal06" type="text"value="${balance.deal06}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay06"numberonly="true" onKeyUp="sumpay();" name="pay06" type="text"value="${balance.pay06}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance06"numberonly="true" onKeyUp="sumbalance();" name="balance06" type="text"value="${balance.balance06}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">7월</td>
							<td class="text-center">
								<input id="prebalance07"numberonly="true" onKeyUp="sumprebalance();" name="prebalance07" type="text"value="${balance.prebalance07}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal07"numberonly="true" onKeyUp="sumdeal();" name="deal07" type="text"value="${balance.deal07}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay07" numberonly="true"onKeyUp="sumpay();" name="pay07" type="text"value="${balance.pay07}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance07"numberonly="true" onKeyUp="sumbalance();" name="balance07" type="text"value="${balance.balance07}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">8월</td>
							<td class="text-center">
								<input id="prebalance08"numberonly="true" onKeyUp="sumprebalance();" name="prebalance08" type="text"value="${balance.prebalance08}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal08"numberonly="true" onKeyUp="sumdeal();" name="deal08" type="text"value="${balance.deal08}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay08"numberonly="true" onKeyUp="sumpay();" name="pay08" type="text"value="${balance.pay08}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance08"numberonly="true" onKeyUp="sumbalance();" name="balance08" type="text"value="${balance.balance08}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">9월</td>
							<td class="text-center">
								<input id="prebalance09"numberonly="true" onKeyUp="sumprebalance();" name="prebalance09" type="text"value="${balance.prebalance09}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal09" numberonly="true"onKeyUp="sumdeal();" name="deal09" type="text"value="${balance.deal09}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay09"numberonly="true" onKeyUp="sumpay();" name="pay09" type="text"value="${balance.pay09}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance09"numberonly="true" onKeyUp="sumbalance();" name="balance09" type="text"value="${balance.balance09}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">10월</td>
							<td class="text-center">
								<input id="prebalance10"numberonly="true" onKeyUp="sumprebalance();" name="prebalance10" type="text"value="${balance.prebalance10}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal10" numberonly="true"onKeyUp="sumdeal();" name="deal10" type="text"value="${balance.deal10}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay10"numberonly="true" onKeyUp="sumpay();" name="pay10" type="text"value="${balance.pay10}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance10"numberonly="true" onKeyUp="sumbalance();" name="balance10" type="text"value="${balance.balance10}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">11월</td>
							<td class="text-center">
								<input id="prebalance11"numberonly="true" onKeyUp="sumprebalance();" name="prebalance11" type="text"value="${balance.prebalance11}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal11"numberonly="true" onKeyUp="sumdeal();" name="deal11" type="text"value="${balance.deal11}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay11"numberonly="true" onKeyUp="sumpay();" name="pay11" type="text"value="${balance.pay11}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance11"numberonly="true" onKeyUp="sumbalance();" name="balance11" type="text"value="${balance.balance11}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">12월</td>
							<td class="text-center">
								<input id="prebalance12"numberonly="true" onKeyUp="sumprebalance();" name="prebalance12" type="text"value="${balance.prebalance12}" class="form-control">
							</td>
							<td class="text-center">
								<input id="deal12"numberonly="true" onKeyUp="sumdeal();" name="deal12" type="text"value="${balance.deal12}" class="form-control">
							</td>
							<td class="text-center">
								<input id="pay12"numberonly="true" onKeyUp="sumpay();" name="pay12" type="text"value="${balance.pay12}" class="form-control">
							</td>
							<td class="text-center">
								<input id="balance12"numberonly="true" onKeyUp="sumbalance();" name="balance12" type="text"value="${balance.balance12}" class="form-control">
							</td>
						</tr>
						<tr>
							<td class="text-center">합계</td>
							<td class="text-center">
								<input id="prebalancesum" readonly="readonly" name="prebalancesum" type="text" class="form-control">
							</td>
							<td class="text-center">
								<input id="dealsum" readonly="readonly" name="dealsum" type="text" class="form-control">
							</td>
							<td class="text-center">
								<input id="paysum" readonly="readonly" name="paysum" type="text" class="form-control">
							</td>
							<td class="text-center">
								<input id="balancesum" readonly="readonly" name="balancesum" type="text" class="form-control">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-sm-offset-2 col-sm-8" style="margin-top:10px;margin-bottom: 50px;" align="center">
		  	<button id="balancedetailupdate" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp수&nbsp&nbsp&nbsp&nbsp&nbsp정</button>
		  	<button type="button" onclick="javascript:history.back();" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp돌아가기</button>
		</div>
	</div>
</form>
</body>
</html>