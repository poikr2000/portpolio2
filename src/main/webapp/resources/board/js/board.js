$(document).ready(function(){
	$.ajax({
		type:'Post',
		data:"cf_seq="+cf_seq,
		datatype:'json',
		url : 'cf_selectListAll',
		success : function(data){
		}
	});
});