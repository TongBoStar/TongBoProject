$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'gameinfolistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_gameinfo.id',
		submitForm : submitForm//分页回调函数
	});	
	search();
});
function submitForm(){
	search();
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/gameinfo/gameinfo!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"gameinfolistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var gameType = "";
					if(null==o.gameType||''==o.gameType){
						return true;
					}
					if(o.gameType.indexOf("GAMELANG")>=0){
						gameType += "语言学习<br/>";
					}
					if(o.gameType.indexOf("GAMEDRAW")>=0){
						gameType += "绘画<br/>";
					}
					if(o.gameType.indexOf("GAMEMUSIC")>=0){
						gameType += "音乐<br/>";
					}
					if(o.gameType.indexOf("GAMESPATIAL")>=0){
						gameType += "空间想象<br/>";
					}
					if(o.gameType.indexOf("GAMELOGICAL")>=0){
						gameType += "逻辑思维<br/>";
					}
					if(o.gameType.indexOf("GAMESPORT")>=0){
						gameType += "运动<br/>";
					}
					if(o.gameType.indexOf("GAMEMATH")>=0){
						gameType += "数学<br/>";
					}
					if(o.gameType.indexOf("GAMEEMOTION")>=0){
						gameType += "情感沟通<br/>";
					}
					
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.gameName)+'</td>';
					html+='<td>'+replaceNull(o.gamePackage)+'</td>';
					html+='<td>'+gameType+'</td>';
					html+='<td>'+(o.isad == 1?"是":"否")+'</td>';
					html+='<td>'+(o.isrecommend == 1?"是":"否")+'</td>';
					html+='<td>'+o.fmark+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#gameName').val("");
	$('#gamePackage').val("");
	var gameTypeAll = $('input[name="gameType"]');
	for(var i = 0;i<gameTypeAll.length;i++){
		gameTypeAll[i].checked = false;
	}
	$('#isad').val("");
	$('#isrecommend').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	/*if($('#gameType').val().trim()==""){
		newAlert("必须选择类型!");
		return;
	}*/
	var gameTypes = $('[name="gameType"]:checked');
	var cnt = 0;
	$.each(gameTypes, function(i, o){			
		cnt++;
	});
	if(cnt == 0){
		alert("必须选择类型!");
		return;
	}
	if($('#gameName').val().trim()==""){
		alert("必须输入名称!");
		return;
	}
	if($('#gamePackage').val().trim()==""){
		alert("必须输入包名!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/gameinfo/gameinfo!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('inputDiv');
					search();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 编辑
 * @param id
 */
function toEdit(){
	var gameTypeAll = $('input[name="gameType"]');
	for(var i = 0;i<gameTypeAll.length;i++){
		gameTypeAll[i].checked = false;
	}
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid = $(o).val();
		cnt++;
	});
	if(cnt>1){
		newAlert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		newAlert("请选择一条编辑的记录!");
		return;
	}
	var url = ctx+"/gameinfo/gameinfo!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"gameinfoId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#gameName').val(replaceNull(data.model.gameName));
				$('#gamePackage').val(replaceNull(data.model.gamePackage));
				var gameTypeAll = $('input[name="gameType"]');
				var gameTypeBack = data.model.gameType.split(",");
				for(var n = 0;n<gameTypeBack.length;n++){
					for(var i = 0;i<gameTypeAll.length;i++){
						if(gameTypeAll[i].value == trimLeft(gameTypeBack[n]) ) {
							gameTypeAll[i].checked = true;
						}
					}
				}
				$('#isad').val(data.model.isad);
				$('#isrecommend').val(data.model.isrecommend);
				$('#fmark').val(data.model.fmark);
				openDiv('inputDiv');
			}
		}
	});
}
//去掉左边的空白  
function trimLeft(s){  
    if(s == null) {  
        return "";  
    }  
    var whitespace = new String(" \t\n\r");  
    var str = new String(s);  
    if (whitespace.indexOf(str.charAt(0)) != -1) {  
        var j=0, i = str.length;  
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){  
            j++;  
        }  
        str = str.substring(j, i);  
    }  
    return str;  
} 
/**
 * 删除
 * @param id
 */
function toDelete(id){
	var param = {};
	if(id) {
		param['checkedIdList[0]'] = id;
	} else {		
		var delareas = $('[name="checkedIdList"]:checked');
		var cnt = 0;
		$.each(delareas, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		newAlert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/gameinfo/gameinfo!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("删除成功!");
					search();
				}
			}
		});
	}
}
