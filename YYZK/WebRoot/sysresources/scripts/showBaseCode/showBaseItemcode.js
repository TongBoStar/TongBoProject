/**
 * 查询t_base_Item表中的itemcode,返回itemcode
 */
$(document.body).click(function(){
	$("#selectscodebody").remove();
});
function searchSelectCode(chooseid){
		if($("#selectscodebody").length<=0){//元素不存在
			var offset=$("#"+chooseid).offset();
			var left=offset.left;
			var top=parseInt(offset.top)+parseInt($("#"+chooseid).height()+parseInt(4));
			var codeDiv='';
			codeDiv+='<div id="selectscodebody" style="position: absolute; left:'+left+'px;top:'+top+'px;display: "></div>';
			$("#"+chooseid).after(codeDiv);
			$("#selectscodebody").show();
		}
		var itemcode=$("#"+chooseid).val();
		var url =ctx+"/baseItem/base-item!listToItem.htm";
		var html='<select id="selectBaseCode" onchange="changeSelectCode(\''+chooseid+'\');" style="width: 348px; height: 150px;background-color: gray"; multiple="true">';
	 	$.webAjax({
			type : "post",
			url : url,
			data:'baseItemQuery.itemcode='+itemcode,
			success : function(data) {
					data = $.parseJSON(data);
					var page = data.page;
						if(data.resultInfo[0]=='0')
						{
							$.each(page.result,function(i,o){
								html+='<option value="'+o.itemcode+'">'+o.itemcode+'&nbsp|&nbsp'+o.itemname+'&nbsp|&nbsp'+o.formatno+'</option>';
							});
						}else{
						alert(data.resultInfo[0]);
						}
					html+='</select>';
					$('#selectscodebody').html(html);
			}
		});	
}
function changeSelectCode(id){
	$("#"+id).val($("#selectBaseCode").val());
	$("#selectscodebody").remove();
}
