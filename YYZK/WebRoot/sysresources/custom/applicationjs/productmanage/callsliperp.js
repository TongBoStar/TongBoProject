$(document).ready(function() {
	countByType(1);
	window.simpleTable =$(document).SimpleTable({
		id:'callsliperppage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '100',
		order: '',
		orderBy: '',
		submitForm : loadcallslip//分页回调函数
	});	
	search();
});
function syncdata(){
	if(confirm('确定同步数据吗？')) {
		openblockdiv();
		var html='';
		var url = ctx+"/orderBom/order-bom!syncCallslip.htm";
		$.webAjax( {
			type : "post",
			url : url,
			success : function(data) {
				search();
				alert("同步成功!");
				closeblockdiv();
			}
		});
	}
}
function loadcallslip(){
	search();
}
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/orderBom/order-bom!findCallslip.htm";
	closeblockdiv();
}
function countByType(counttype){alert(counttype);
	$('#counttype').val(counttype);
	if(counttype==1){
		$('#unionbtn1').removeClass("btn-danger");
		$('#unionbtn1').addClass("btn-info");
		$('#unionbtn2').removeClass("btn-danger");
		$('#unionbtn2').addClass("btn-info");
		$('#unionbtn3').removeClass("btn-danger");
		$('#unionbtn3').addClass("btn-info");
		$('#detailbtn').removeClass("btn-info");
		$('#detailbtn').addClass("btn-danger");
	}else if(counttype==2){
		$('#detailbtn').removeClass("btn-danger");
		$('#detailbtn').addClass("btn-info");
		$('#unionbtn2').removeClass("btn-danger");
		$('#unionbtn2').addClass("btn-info");
		$('#unionbtn3').removeClass("btn-danger");
		$('#unionbtn3').addClass("btn-info");
		$('#unionbtn1').removeClass("btn-info");
		$('#unionbtn1').addClass("btn-danger");
	}else if(counttype==3){
		$('#detailbtn').removeClass("btn-danger");
		$('#detailbtn').addClass("btn-info");
		$('#unionbtn1').removeClass("btn-danger");
		$('#unionbtn1').addClass("btn-info");
		$('#unionbtn3').removeClass("btn-danger");
		$('#unionbtn3').addClass("btn-info");
		$('#unionbtn2').removeClass("btn-info");
		$('#unionbtn2').addClass("btn-danger");
	}else{
		$('#detailbtn').removeClass("btn-danger");
		$('#detailbtn').addClass("btn-info");
		$('#unionbtn1').removeClass("btn-danger");
		$('#unionbtn1').addClass("btn-info");
		$('#unionbtn2').removeClass("btn-danger");
		$('#unionbtn2').addClass("btn-info");
		$('#unionbtn3').removeClass("btn-info");
		$('#unionbtn3').addClass("btn-danger");
	}
	//search();
}