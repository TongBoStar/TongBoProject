$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'agreementtitlepage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_agreement_title.id',
		submitForm : submitForm//分页回调函数
		});	
	search();
	loadvars();
});
function submitForm(){
	search();
}
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/agreementTitle/agreement-title!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"agreementtitlepage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var agreeType='';
					if(o.agreeType==1){
						agreeType='数据协议';
					}else if(o.agreeType==2){
						agreeType='报警协议';
					}else if(o.agreeType==3){
						agreeType='配置协议';
					}else if(o.agreeType==4){
						agreeType='控制协议';
					}else{
						agreeType='查询协议';
					}
					var fvalid='';
					if(o.fvalid==1){
						fvalid='生效';
					}else{
						fvalid='失效';
					}
					html+='<tr align="center">';
					//html+= '<td><input type="checkbox" id="checkedIdList" name="checkedIdList" value="' + o.id + '" /></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+(o.agreeName==null?"":o.agreeName)+'</a></td>';
					html+='<td>'+(o.agreeVersion==null?"":o.agreeVersion)+'</td>';
					html+='<td>'+(o.fvlen==null?"":o.fvlen)+'</td>';
					html+='<td>'+agreeType+'</td>';
					html+='<td>'+fvalid+'</td>';
					html+='<td>'+(o.fnote==null?"":o.fnote)+'</td>';//<a href="#" onclick="toDelete('+o.id+');">删除</a>
					html+='<td style="font-size:14px;"><a href="#" onclick="toEdit('+o.id+');">编辑</a> | <a href="#" onclick="toSetUP('+o.id+');">设置</a>| <a href="#" onclick="toSample('+o.id+');">样例</a></td>';
					html+='</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
			}
		}
	});
}
/**
 * 添加协议
 */
function addAgreement(){
	$('#hiddenId').val('');
	$('#agreeName').val('');
	$('#agreeVersion').val('');
	$('#fvlen').val('');
	$('#agreeType').val(1);
	$('#fvalid').val(0);
	$('#fnote').val('');
	openDiv('inputDiv');
}
/**
 * 保存协议
 */
function save(){
	if($('#agreeName').val().trim()==''){
		alert("协议名称不能为空");
		return;
	}
	if($('#agreeVersion').val().trim()==''){
		alert("协议版本不能为空");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/agreementTitle/agreement-title!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					closeDiv('inputDiv');
					closeblockdiv();
					search();
				}
			}
		});
	}
}
/**
 * 编辑协议
 * @param id 要编辑的协议的ID
 */
function toEdit(id){
	openblockdiv();
	var url = ctx+"/agreementTitle/agreement-title!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"agreementTitleId="+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(id);
				$('#agreeName').val(data.model.agreeName);
				$('#agreeVersion').val(data.model.agreeVersion);
				$('#fvlen').val(data.model.fvlen);
				$('#agreeType').val(data.model.agreeType);
				$('#fvalid').val(data.model.fvalid);
				$('#fnote').val(data.model.fnote);
				closeblockdiv();
				openDiv('inputDiv');
			}
		}
	});
}
/**
 * 删除协议 在此不能删除协议，只能改为失效状态
 * @param id 要删除的协议的ID
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
		alert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/agreementTitle/agreement-title!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert("删除成功!");
					closeblockdiv();
					search();
				}
			}
		});
	}
}
/**
 * 设置操作 初始化
 * @param id 要设置的协议的ID
 */
function toSetUP(id){
	openblockdiv();
	seq = 1;
	$('#hiddenAgreeId').val(id);
	var url = ctx+"/agreementContent/agreement-content!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'agreementContentQuery.agreeId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var htmlcontent='';
				$.each(data.agreementContentList,function(i,o){
					htmlcontent+="<tr id='contentTR"+o.contentAttr+"'><td><input type='hidden' class='hiclass' id='idhidden"+o.contentAttr+"' value='"+o.contentAttr+"'/>"+(i+1)+"</td>";
					htmlcontent+="<td><input type='hidden' name='contentAttrs' id='contentAttr"+o.contentAttr+"' value='"+o.contentAttr+"'/><input class='input80' id='attrName"+o.contentAttr+"' value='"+o.attrName+"'/></td>";
					htmlcontent+="<td><input class='input80' id='fmark"+o.contentAttr+"' value='"+o.fmark+"'/></td>";
					htmlcontent+="<td><input class='input80' name='flens' id='flen"+o.contentAttr+"' value='"+o.flen+"'/></td>";
					htmlcontent+="<td><input class='input80' name='startPositions' id='start"+o.contentAttr+"' value='"+o.startPosition+"'/></td><td><input class='input80' name='endPositions' value='"+o.endPosition+"' id='end"+o.contentAttr+"'/></td>";
					htmlcontent+="<td><input class='input80' name='contents' id='content"+o.contentAttr+"' value='"+o.content+"'/></td><td><input class='input80' name='seqnos' id='seqno"+o.contentAttr+"' value='"+o.seqno+"'/></td></tr>";
					$("#selectcheckbox"+o.contentAttr).attr("checked", true);
				});
				if(htmlcontent!=''){
					$("#agreementcontent").html(htmlcontent);
					closeblockdiv();
					openDiv("setupDiv");
				}else{
					loadvars();
					openDiv("setupDiv");
				}
			}else{
				alert(data.resultInfo[1]);
				closeblockdiv();
			}
		}
	});
}
/**
 * 样例 生成
 * @param id 要生成样例的协议的ID
 */
function toSample(id){
	var url = ctx+"/agreementContent/agreement-content!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'agreementContentQuery.agreeId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var keys='<tr>';
				var values='<tr>';
				$.each(data.agreementContentList,function(i,o){
					keys+='<th>'+o.attrName+'</th>';
					if(o.fmark=='HAND_SIGN'){
						values+='<td>'+o.content+'</td>';
					}else if(o.fmark=='TAKE_TIME'){
						var myDate = new Date();
						myDate.getYear();        //获取当前年份(2位)
						myDate.getFullYear();    //获取完整的年份(4位,1970-????)
						myDate.getMonth();       //获取当前月份(0-11,0代表1月)
						myDate.getDate();        //获取当前日(1-31)
						myDate.getDay();         //获取当前星期X(0-6,0代表星期天)
						myDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)
						myDate.getHours();       //获取当前小时数(0-23)
						myDate.getMinutes();     //获取当前分钟数(0-59)
						myDate.getSeconds();     //获取当前秒数(0-59)
						myDate.getMilliseconds();    //获取当前毫秒数(0-999)
						myDate.toLocaleDateString();     //获取当前日期
						var mytime=myDate.toLocaleTimeString();     //获取当前时间
						myDate.toLocaleString( );        //获取日期与时间
						var mytime2 = myDate.getFullYear()+""+(myDate.getMonth()+1)+""+myDate.getDate()+""+myDate.getHours()+""+myDate.getMinutes()+""+myDate.getSeconds();
						values+='<td>'+mytime2+'</td>';
					}else{
						values+='<td>'+createvalue(o.flen)+'</td>';
					}
				});
				keys+='</tr>';
				values+='</tr>';
				$("#samplekey").html(keys);
				$("#samlevalue").html(values);
				openDiv("sampleDiv");
			}else{
				alert(data.resultInfo[1]);
				closeblockdiv();
			}
		}
	});
}
/**
 * 创建样例数据
 * @param len 数据长度
 * @returns {String} 返回创建的结果
 */
function createvalue(len){
	var str = '';
	for(var i=0;i<len;i++){
		str+='1';
	}
	return str;
}
/**
 * 选择顶部变量后在列表域进行添加
 */
var seq = 1;
function selectcheckbox(id,attrName,fmark,flen){
	var htmlcontent = '';
	if($('#selectcheckbox'+id).is(':checked')==true){
		htmlcontent+="<tr id='contentTR"+id+"'><td><input type='hidden' class='hiclass' id='idhidden"+id+"' value='"+id+"'/>"+seq+"</td>";
		htmlcontent+="<td><input type='hidden' name='contentAttrs' id='contentAttr"+id+"' value='"+id+"'/><input class='input80' id='attrName"+id+"' value='"+attrName+"'/></td>";
		htmlcontent+="<td><input class='input80' id='fmark"+id+"' value='"+fmark+"'/></td>";
		htmlcontent+="<td><input class='input80' name='flens' id='flen"+id+"' value='"+flen+"'/></td>";
		htmlcontent+="<td><input class='input80' name='startPositions' id='start"+id+"'/></td><td><input class='input80' name='endPositions' id='end"+id+"'/></td>";
		htmlcontent+="<td><input class='input80' name='contents' id='content"+id+"'/></td><td><input class='input80' name='seqnos' id='seqno"+id+"' value='"+seq+"'/></td></tr>";
		$("#agreementcontent").append(htmlcontent);
		seq += 1;
	}else{
		if(undefined!=$('#contentTR'+id)){
			$('#contentTR'+id).remove();
		}
	}
}
/**
 * 加载顶部的变量
 */
function loadvars(){
	var html = '';
	var url = ctx+"/agreementVar/agreement-var!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var tabstart = 0;
				var tabend = 0;
				var htmlcontent='';
				$.each(data.agreementVarList,function(i,o){
					var checked = "";
					if(o.fmust==1){
						checked = "checked";
						tabend = tabstart+parseInt(o.attrLen);
						htmlcontent+="<tr id='contentTR"+o.id+"'><td><input type='hidden' class='hiclass' id='idhidden"+o.id+"' value='"+o.id+"'/>"+seq+"</td>";
						htmlcontent+="<td><input type='hidden' name='contentAttrs' id='contentAttr"+o.id+"' value='"+o.id+"'/><input class='input80' id='attrName"+o.id+"' value='"+o.attrName+"'/></td>";
						htmlcontent+="<td><input class='input80' id='fmark"+o.id+"' value='"+o.fmark+"'/></td>";
						htmlcontent+="<td><input class='input80' name='flens' id='flen"+o.id+"' value='"+o.attrLen+"'/></td>";
						htmlcontent+="<td><input class='input80' name='startPositions' id='start"+o.id+"'/></td><td><input class='input80' name='endPositions' id='end"+o.id+"'/></td>";
						htmlcontent+="<td><input class='input80' name='contents' id='content"+o.id+"'/></td><td><input class='input80' name='seqnos' id='seqno"+o.id+"' value='"+seq+"'/></td></tr>";
						tabstart = tabend+1;
						seq += 1;
					}
					$("#agreementcontent").html(htmlcontent);
					html+='<td style="text-align:right;"><input type="checkbox" name="selectcheckbox" id="selectcheckbox'+o.id+'" style="width:20px;height:20px;" onclick="selectcheckbox('+o.id+',\''+o.attrName+'\',\''+o.fmark+'\','+o.attrLen+');"/></td><td style="text-align:left;">'+o.attrName+'</td>';
				});
				$('#varTR').html(html);
				closeblockdiv();
			}
		}
	});
}
/**
 * 排序
 */
function order(){
	var len = $('.hiclass').length;
	var htmlcontent='';
	var startPosition = 0;
	var endPosition = 0;
	for(var i=0;i<len;i++){
		var id;
		var lent;
		for(var j=0;j<len;j++){
			var idt=$('.hiclass').eq(j).val();
			if($('#seqno'+idt).val()==(i+1)){
				id=$('.hiclass').eq(j).val();
			}
		}
		var attrName = $('#attrName'+id).val();
		var fmark = $('#fmark'+id).val();
		var flen = $('#flen'+id).val();
		var content = $('#content'+id).val();
		endPosition = startPosition + parseInt(flen);
		htmlcontent+="<tr id='contentTR"+id+"'><td><input type='hidden' class='hiclass' id='idhidden"+id+"' value='"+id+"'/>"+(i+1)+"</td>";
		htmlcontent+="<td><input type='hidden' name='contentAttrs' id='contentAttr"+id+"' value='"+id+"'/><input class='input80' id='attrName"+id+"' value='"+attrName+"'/></td>";
		htmlcontent+="<td><input class='input80' id='fmark"+id+"' value='"+fmark+"'/></td>";
		htmlcontent+="<td><input class='input80' name='flens' id='flen"+id+"' value='"+flen+"'/></td>";
		htmlcontent+="<td><input class='input80' name='startPositions' id='start"+id+"' value='"+startPosition+"'/></td><td><input class='input80' name='endPositions' value='"+endPosition+"' id='end"+id+"'/></td>";
		htmlcontent+="<td><input class='input80' name='contents' id='content"+id+"' value='"+content+"'/></td><td><input class='input80' name='seqnos' id='seqno"+id+"' value='"+(i+1)+"'/></td></tr>";
		startPosition = endPosition;
	}
	$("#agreementcontent").html(htmlcontent);
}
/**
 * 保存协议的内容
 */
function saveContent(){
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#contentForm').serialize();
		var url = ctx+"/agreementContent/agreement-content!saveAll.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					alert(data.resultInfo[1]);
					closeDiv('setupDiv');
					closeblockdiv();
					search();
				}else{
					alert(data.resultInfo[1]);
					closeblockdiv();
				}
			}
		});
	}
}