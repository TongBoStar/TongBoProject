

function resetbtn(){
	$('#itemcodeaddbtn').hide();
	$('#orderaddbtn').show();
	$('#ordernextbtn').show();
	
}


function giveOrderValue(){

	
	
	var newitemcode = $.trim($('#newitemcode').val());
	if(newitemcode == '') {
		alert('物料编码不能为空！');
		$('#newitemcode').focus();
		return false;
	} 
	var newitemname = $.trim($('#newitemname').val());
	if(newitemname == '') {
		if(newitemcode != ''&&flagResult){
			alert('物料名称不能为空！');
			$('#newitemname').focus();
		}
		return false;
	} 
	var newitemmode = $.trim($('#newitemmode').val());
	if(newitemmode == '') {
		alert('物料规格型号不能为空！');
		$('#newitemmode').focus();
		return false;
	} 

	var tt = 0;
	var list = $('input[name="itemdi"]');//点击确定
	for(var a = 0; a<list.length;a++){
		var c="radio"+$(list[a]).val();
		var ck =$('input[name="'+c+'"]:checked');
		tt+=ck.length;

	}
	if(tt<list.length){
		alert("物料编码不符合规范，请输入相应数据!");
		return false;
	}else{
		var lst = new Array();
		lst.push($('#newitemcode').val());//物料代码

	//	closeABC();
		opener.setValue(lst);

	}



}





function searchCode(){
	var code = $("#newitemcode").val();
	if(''==code){
	 alert("请先选择物料代码!");
	 $("#newitemcode").attr("value","");
	 $("#newitemPcode").attr("value","");
	 $('#newitemcode').focus();
	 flagResult=false;
	 return;
	}
	
	var data = 'baseItemQuery.itemcode='+code;//
	var url =ctx + '/baseItem/base-item!listToEntity.htm';//查询现有
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.baseItemList;
									if(list.length==0){
										alert("该物料编号不存在!请重新选择");
										
									}else{
									   // alert("该物料编号已经存在!");
									   // $("#newitemcode").attr("value","");
									   // $("#newitemPcode").attr("value","");
									   // $('#newitemcode').focus();
										giveOrderValue();
									}
					}
		});	
	
}


