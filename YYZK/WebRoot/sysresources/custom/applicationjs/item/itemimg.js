$(document).ready(function() {
	loadItemImgs();
});
function submitForm(){
	search();
}
function loadItemImgs(){
	openblockdiv();
	$("#isupload").html("");
	var url = ctx+"/itemImgs/item-imgs!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'itemImgsQuery.itemId='+$('#hiddenId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			var li = "";
			$.each(data.itemImgsList,function(i,o){
				li ='<li class="state-complete">'+
					'<p class="del" id="pimg'+o.id+'" style="margin:0px;width:50%;" onclick="javascript:delimg('+o.id+');">删除</p>';
				if(o.showIndexStatus==1){
					li +='<p class="del" id="indeximg'+o.id+'" style="margin:0px;width:50%;margin-left:50%;background-color:blue;" onclick="javascript:indeximg('+o.id+');">已设置</p>';
				}else{
					li +='<p class="del" id="indeximg'+o.id+'" style="margin:0px;width:50%;margin-left:50%;background-color:blue;" onclick="javascript:indeximg('+o.id+');">首页显示</p>';
				}
				li +='<p class="imgWrap"><img id="exist'+o.id+'" style="width:110px;height:110px;" data-respath="'+o.imgPath+'" src="'+ctx+'/'+o.imgPath+'"></p>'+
					'</li>';
				$("#isupload").append(li);
			});
			closeblockdiv();
		}
	});
}
function indeximg(id){
	var url = ctx+"/itemImgs/item-imgs!updateIndexImg.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'id='+id+"&itemId="+$('#hiddenId').val(),
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#indeximg'+id).html("已设置");
				$('#indeximg'+id).attr("src","javascript:void(0);");
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function delimg(id){
	var url = ctx+"/itemImgs/item-imgs!deleteToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'itemImgsId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#pimg'+id).parent().remove();
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
/**
 * 加载列表
 */
function search(){
	//$('#departmentIdQuery').val(teamId);
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/item/item!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"orderlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var serviceType = "";
					var feeType = "";
					if(o.serviceType==1){
						serviceType = "上门";
					}else if(o.serviceType==1){
						serviceType = "到店";
					}else{
						serviceType = "上门+到店";
					}
					if(o.feeType==1){
						feeType = "微信付款";
					}else{
						feeType = "线下付款";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+replaceNull(o.itemName)+'</td>';
					html+='<td>'+replaceNull(o.admin.adminName)+'</td>';
					html+='<td>'+replaceNull(o.itemPriceAux)+'</td>';
					html+='<td>'+replaceNull(o.consumTimes)+'</td>';
					html+='<td>'+serviceType+'</td>';
					html+='<td>'+replaceNull(null==o.module?"":o.module.moduleName)+'</td>';
					html+='<td>'+feeType+'</td>';
					html+='<td>'+replaceNull(null==o.activityInfo?"":o.activityInfo.activityName)+'</td>';
					html+='<td>'+replaceNull(0==o.itemSteps?"添加":o.itemSteps.length)+'</td>';
					html+='<td>'+replaceNull(0==o.itemImgs?"上传":o.itemImgs.length)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 查看详情
 * @param id
 */
function toDetail(id){
	window.location.href=ctx+"/designassist/designlistdetail.htm?did="+id;
}
/**
 * 导出为Excel
 * @param id
 */
function toExportAllExcel2007(){
	var id = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o) {
		id = $(o).val();
		cnt++;
	});
	if (cnt > 1) {
		newAlert("每次只能导出一个项目!");
		return;
	}
	if (cnt == 0) {
		newAlert("请选择要导出的项目!");
		return;
	}
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx
			+ "/designAssist/design-assist!exportAllExcel2007.htm?designAssistQuery.id="
			+ id;
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val('');
	$('#itemName').val('');
	$('#itemPriceAux').val('');
	$('#consumTimes').val('');
	$('#serviceType').val('1');
	$('#itemDesc').val('');
	openDiv('inputDiv');
}
/**
 * 点击添加按钮进行添加
 */
function toAddImages(){
	window.location.href=ctx+"/item/itemimg.htm"
}
/**
 * 保存
 */
function save(){
	var filesJson='';
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var allFile=[];
		$("ul#isupload li img").each(function(){
			if(null==$(this).attr("id")||undefined==$(this).attr("id")||""==$(this).attr("id")){
				var aFile={
					"resPath":$(this).attr("data-respath"),
					"newName":$(this).attr("data-newname"),
					"oldName":$(this).attr("data-oldname")	
				};
				allFile.push(aFile);
			}
		});
		filesJson = JSON.stringify(allFile).replace(/%/g, "%25").replace(/\&/g, "%26").replace(/\+/g, "%2B");
		$.ajax({
			type: "post",
			url: ctx+"/itemImgs/item-imgs!saveToJson.htm",
			data:$('#inputForm').serialize()+"&filesJson="+filesJson,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.resultInfo[0]=='0'){
					loadItemImgs();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
