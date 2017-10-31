var ruleNameNumber=0;
var ruleDetailNumber=0;
var newruleDetailNumber=0;
var newruleNameNumber=0;
//页面加载
$(document).ready(function(){
	loadpositions();
	 
});
//异步查找树结构
function loadpositions(){
	$('#navigation').html('<img src="../images/icon_load.gif"/>');
	var html='';
	var url = ctx+"/items/listToTreeNew.htm";
		$.webAjax( {
			type : "post",
			url : url,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0')
				{
					$('#navigation').html(data.tree);
					inittreeview();
					//根据用户权限设置绑定右键权限
					bindright();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	
}
//将查找到的树的html形成树
function inittreeview()
{
	$("#navigation").treeview({
		collapsed: true,
		unique: true,
		persist: "cookie",
		control: "#treecontrol",
		cookieId: "treeview-pd",
		animated:"fast"
	});
}
//重新加载树，适用于添加了好几个目录之后进行。
function toLoadTree(){
	$('#navigation').html('<img src="../images/icon_load.gif"/>');
	var html='';
	var url = ctx+"/items/updateBitcCategory.htm";
		$.webAjax( {
			type : "post",
			url : url,
			success : function(data) {
			data = $.parseJSON(data);
				if(data.resultInfo[0]=='0')
				{
					$('#navigation').html(data.tree);
					inittreeview();
					//根据用户权限设置绑定右键权限
					bindright();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
}
//为树的各个节点加右键弹出菜单
function bindright()
{
	$('#navigation span').contextMenu('myMenu1', {//myMenu1一级目录(排除ROOT)
		bindings: {
			'add': function(t) {
				openDiv('addDiv');						
				$("#titletxt").html("添加目录节点");	
				//showType();	
				var id = $(t).attr('ref');
				$("#parentid").val(id);
				//
				$("#itemid").val('');					
			 },
			 'edit': function(t) {
				 $("#titletxt").html("修改目录节点");
					$.openDiv('addDiv');						
					var id = $(t).attr('ref');
					var name=$(t).attr('spanname');
					var code=$(t).attr('spancode');
					
					//var type=$(t).attr('spantype');
					var pid=$(t).attr('pid');
					 //showType(type);
					 
					 $("#itemid").val(id);
					 $("#itemname").val(name);
					 $("#itemcode").val(code);
					 $("#parentid").val(pid);
					 //编辑的时候需要记录旧的规则短编码
					 //alert("code:"+code);
					 $("#olditemcode").val(code);
					 
				 },
			 'delete': function(t) {
					//alert("暂不提供删除!!");
					//begin add by tianliyuan for  at 20150305
					var id = $(t).attr('ref');
					if(confirm("确定删除此规则与子规则吗？"))
					{
						block_viewport();	
					var url = ctx+"/items/items!deleteAlone.htm";
					//var url = "${ctx}/itemParent/item-parent!deleteCategoryInfo.htm";
					//var url = "${ctx}/itemParent/item-parent!deleteCategory.htm";
					//var url = "${ctx}/measureCategory/measure-category!deleteCategory.htm";
					$.webAjax( {
						type : "post",
						url : url,
						//data:'fItemIDList='+id,
						data:'itemId='+id,
						success : function(data) {
							data = $.parseJSON(data);
							xval.remove();//移除遮罩层
							if(data.resultInfo[0]=='0')
							{
								alert(data.resultInfo[1]);
								loadpositions();
								
							}
							else{
								alert(data.resultInfo[1]);
							}				
						} 
					});	
				 	}
					//end add by tianliyuan for  at 20150305
				 },
			/*'add': function(t) {
				openDiv('addDiv');						
				$("#titletxt").html("添加");	
				showType();	
				var id = $(t).attr('ref');
				$("#fparentid").val(id);
				$("#fitemid").val('');					
			 },
			 'edit': function(t) {
				openDiv('addDiv');
				var id = $(t).attr('ref');
				//根据id去后台查值
				var name=$(t).attr('spanname');
				var code=$(t).attr('spancode');
				var type=$(t).attr('spantype');
				var pid=$(t).attr('pid');
				 showType(type);
				 $("#fitemid").val(id);
				 $("#fname").val(name);
				 $("#fnumber").val(code);
				 $("#fparentid").val(pid);
				 //编辑的时候需要记录旧的规则短编码
				 //$("#olditemcode").val(code);
				 
			 },
			 'delete': function(t) {
				var id = $(t).attr('ref');
				
				if(confirm("确定删除此规则与子规则吗？"))
				{
				var url = ctx+"/bitem/bitem!deleteAlone.htm";
				$.webAjax( {
					type : "post",
					url : url,
					data:'bitemId='+id,
					success : function(data) {
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0')
						{
							alert(data.resultInfo[1]);
							loadpositions();
						}
						else{
							alert(data.resultInfo[1]);
						}				
					} 
				});	
			 	}
			 },*/
			  'bind': function(t) {
				showAddRule($(t).attr('ref'));
			 }
				 /**,
			 'edit': function(t) {
			 
<<<<<<< .mine
				 	$.openDiv('addDiv');//打开编辑窗口
					var id = $(t).attr('ref');//获取节点ID
					var name=$(t).attr('spanname');//获取节点NAME
					$("#fitemid").val(id);//在弹出框中显示当前节点ID
					$("#fname").val(name);//在弹出框中显示当前节点NAME
					
					//var type=$(t).attr('spantype');
					var pid=$(t).attr('pid');//获取节点PID
					 //showType(type);
					 //$("#itemid").val(id);
					 //$("#itemname").val(name);
					 $("#itemcode").val(code);//在弹出框中显示当前节点编号
					 $("#parentid").val(pid);//在弹出框中显示当前节点父节点ID隐藏域
					 //编辑的时候需要记录旧的规则短编码
					 //alert("code:"+code);
					 $("#olditemcode").val(code);//在弹出框中显示当前节点修改前的编号隐藏域
=======
				 	openDiv('addDiv');
					var id = $(t).attr('ref');
					var name=$(t).attr('spanname');
					$("#fitemid").val(id);
					$("#fname").val(name);
//>>>>>>> .r247
					 
			 }**/
		}
	});	
	
	/**/
	$('#navigation b').contextMenu('myMenuB', {
		bindings: {
			'add': function(t) {
				openDiv('addDiv');						
				$("#titletxt").html("添加目录节点");	
				//showType();	
				var id = $(t).attr('ref');
				//alert("id:"+id);
				$("#parentid").val(id);
				$("#itemid").val('');
			 }
		}
	});	
	
	$('#navigation div').contextMenu('myMenuDiv', {//二级目录右键菜单
		bindings: {
			/*'add': function(t) {
				openDiv('addDiv');						
				$("#titletxt").html("添加");	
				showType();	
				var id = $(t).attr('ref');
				$("#fparentid").val(id);	
				$("#fitemid").val('');			
			 },
			 'edit': function(t) {
				 	openDiv('addDiv');
					var id = $(t).attr('ref');
					var name=$(t).attr('spanname');
					var code=$(t).attr('spancode');
					var type=$(t).attr('spantype');
					var pid=$(t).attr('pid');
					 showType(type);
					 
					 $("#fitemid").val(id);
					 $("#fname").val(name);
					 $("#fnumber").val(code);
					 $("#fparentid").val(pid);
					 // $("#olditemcode").val(code);
					 
			 },
			 'delete': function(t) {
				var id = $(t).attr('ref');
				
				if(confirm("确定删除此规则与子规则吗？"))
				{
				var url = ctx+"/bitem/bitem!deleteAlone.htm";
				$.webAjax( {
					type : "post",
					url : url,
					data:'bitemId='+id,
					success : function(data) {
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0')
						{
							alert(data.resultInfo[1]);
							loadpositions();
						}
						else{
							alert(data.resultInfo[1]);
						}				
					} 
				});	
			 	}
			 },*/
			/**,
			 'edit': function(t) {
				 	openDiv('addDiv');
					var id = $(t).attr('ref');
					var name=$(t).attr('spanname');
					$("#fitemid").val(id);
					$("#fname").val(name);
					 
			 }**/
			'add': function(t) {
				openDiv('addDiv');						
				$("#titletxt").html("添加目录节点");	
				//showType();	
				var id = $(t).attr('ref');
				$("#parentid").val(id);	
				//alert("parentid"+id);
				$("#itemid").val('');			
			
			 },
			 'edit': function(t) {
				    $("#titletxt").html("修改目录节点");
				 	openDiv('addDiv');						
					var id = $(t).attr('ref');
					var name=$(t).attr('spanname');
					var code=$(t).attr('spancode');
					//var type=$(t).attr('spantype');
					var pid=$(t).attr('pid');
					 //showType(type);
					 
					 $("#itemid").val(id);
					 $("#itemname").val(name);
					 $("#itemcode").val(code);
					 $("#parentid").val(pid);
					  $("#olditemcode").val(code);
					 
			 },
			'delete': function(t) {
				//alert("暂不提供删除!!");
				//begin add by tianliyuan for  at 20150305
				var id = $(t).attr('ref');
				if(confirm("确定删除此规则与子规则吗？"))
				{
					block_viewport();
				var url = ctx+"/items/items!deleteAlone.htm";
				$.webAjax( {
					type : "post",
					url : url,
					//data:'fItemIDList='+id,
					data:'itemId='+id,
					success : function(data) {
						data = $.parseJSON(data);
						xval.remove();//移除遮罩层
						if(data.resultInfo[0]=='0')
						{
							alert(data.resultInfo[1]);
							loadpositions();
						}
						else{
							alert(data.resultInfo[1]);
						}				
					} 
				});	
			 	}
				//end add by tianliyuan for  at 20150305
			 },
			 'bind': function(t) {
				showAddRule($(t).attr('ref'));
			 }
			 /**,
			 'edit': function(t) {
				 	openDiv('addDiv');
					var id = $(t).attr('ref');
					var name=$(t).attr('spanname');
					$("#fitemid").val(id);
					$("#fname").val(name);
					 
			 }**/
		}
	});	
}
//显示新增树节点的类别
function showType(type){
	/*var html='';
	var url=ctx+"/system/listTosortcode.htm";		
	 $.webAjax( {
		type : "post",
		url : url,
		data :'sortcodesecQuery.sortcodefir.fircode=ITEM_TYPE',
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				$.each(data.sortcodesecList,function(i,o){
					html+='<option value="'+o.secid+'">'+o.secname+'</option>';	
				});
				$("#seltype").html(html);
				if(type){
				$("#seltype").val(type);
				}
			}else{
			alert(data.resultInfo[1]);
			}
		}
	});*/ 
}
/**
 * 保存或更新ITEMS表
 */
function saveItems(){
	block_viewport();
	//return;
    //var itemid = $.trim($('#itemid').val());
    //if(null!=itemid){//说明是修改操作
	//	if(!confirm("该修改操作会同时修改物料目录及先关子节点的信息,确定修改此项？")){
		//	return ;
		//}
	//}
	
	var itemcode = $.trim($('#itemcode').val());
	if(null==itemcode||''==itemcode){
	     alert("代码不能为空!");
	     return ;
	}
	if(!(/^[a-zA-Z0-9]*$/g.test(itemcode))){
		alert("代码只能是英文和数字!");
	     return ;
	}
	var itemname = $.trim($('#itemname').val());
	if(null==itemname||''==itemname){
	     alert("名称不能为空!");
	     return ;
	}
	
	
	var formParam = $('#inputForm').serialize();
	var url = ctx+"/items/items!saveAlone.htm";
	//return;
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
			data = $.parseJSON(data);
			xval.remove();//移除遮罩层
			if(data.resultInfo[0]=='0')
			{
			//	$("#itemname").val("");
			//	$("#itemcode").val("");
			//	$("#parentid").val("");
			//	$.closeDiv('addDiv');
					
				alert(data.resultInfo[1]);
							loadpositions();
							closeAddDiv();
			}else{
				alert(data.resultInfo[1]);
			}				
		}
	});	
}
//更改物料树名称
function save(){
	
	var fname = $.trim($('#fname').val());
	if(null==fname||''==fname){
	     alert("名称不能为空!");
	     return ;
	}
	block_viewport();
	var formParam = $('#inputForm').serialize();
	var url = ctx+"/items/items!saveAloneNew.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
			data = $.parseJSON(data);
			xval.remove();//移除遮罩层
			if(data.resultInfo[0]=='0')
			{
				alert(data.resultInfo[1]);
				loadpositions();
				closeAddDiv();
			}else{
				alert(data.resultInfo[1]);
			}				
		}
	});	
	
}

var xval, tval, bval, rval, lval;
/**添加遮罩层*/
function block_viewport() {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.1, text:'该操作会同步更新ERP目录,请耐心等待...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}
//关闭bitem新增或修改页
function closeAddDiv(){
	/**
	$('#fnumber').val('');
	$('#fparentid').val('');
	$('#fitemid').val('');
	$('#fname').val('');
	**/
	$('#itemcode').val('');
	$('#parentid').val('');
	$('#itemid').val('');
	$('#itemname').val('');
	
	closeDiv('addDiv'); 
}


//点击创建规则事件
function showAddRule(itemid){
	//根据itemid查找最底层的父节点			
	var url1 = ctx+"/items/items!findRoot.htm";
	$.webAjax( {
		type : "post",
		url : url1,
		data:'itemQuery.itemid='+itemid,
		success : function(data) {
			data = $.parseJSON(data);
			var item = data.model;
			if(data.resultInfo[0]=='0'){
				if(item!=null&&item.itemid==itemid){
					ruleNameNumber=0;
					openDiv('addRuleDiv');
					$("#ruleitemid").val(itemid);
					var html='';			
					var url = ctx+"/itemRule/item-rule!listToQuery.htm";
					$.webAjax( {
						type : "post",
						url : url,
						data:'itemRuleQuery.itemid='+itemid,
						success : function(data) {
							data = $.parseJSON(data);
							if(data.resultInfo[0]=='0')
							{
								html+='<tr><th>名称</th><th>序号</th><th>分隔符</th><th>显示顺序</th></tr>';
								if(data.itemRuleList==null||data.itemRuleList.length<=0){
									newruleNameNumber++;
									html+='<tr id="trnew'+newruleNameNumber+'"><td>';
									html+='<input name="rulenamelist" type="text" class="inputstyle" value="压力等级" readonly="readonly"/><input name="itemruleidlist" type="hidden"/></td>';
									html+='<td><input name="seqlist" type="text" class="inputstyle" style="width:30%;margin-left:10px;" value="1"/></td><td><select name="signlist"  class="selectall"><option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="">空</option></select></td>';
									html+='<td><input name="showseqlist" type="text" class="inputstyle" style="width:40%;" value="1"/></td></tr>';
									
									newruleNameNumber++;
									html+='<tr id="trnew'+newruleNameNumber+'"><td>';
									html+='<input name="rulenamelist" type="text" class="inputstyle" value="生产商" readonly="readonly"/><input name="itemruleidlist" type="hidden"/></td>';
									html+='<td><input name="seqlist" type="text" class="inputstyle" style="width:30%;margin-left:10px;" value="2"/></td><td><select name="signlist"  class="selectall"><option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="">空</option></select></td>';
									html+='<td><input name="showseqlist" type="text" class="inputstyle" style="width:40%;" value="2"/></td></tr>';
									
									newruleNameNumber++;
									html+='<tr id="trnew'+newruleNameNumber+'"><td>';
									html+='<input name="rulenamelist" type="text" class="inputstyle" value="口径" readonly="readonly"/><input name="itemruleidlist" type="hidden"/></td>';
									html+='<td><input name="seqlist" type="text" class="inputstyle" style="width:30%;margin-left:10px;" value="3"/></td><td><select name="signlist"  class="selectall"><option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="">空</option></select></td>';
									html+='<td><input name="showseqlist" type="text" class="inputstyle" style="width:40%;" value="3"/></td></tr>';
									
									newruleNameNumber++;
									html+='<tr id="trnew'+newruleNameNumber+'"><td>';
									html+='<input name="rulenamelist" type="text" class="inputstyle" value="原产地" readonly="readonly"/><input name="itemruleidlist" type="hidden"/></td>';
									html+='<td><input name="seqlist" type="text" class="inputstyle" style="width:30%;margin-left:10px;" value="4"/></td><td><select name="signlist"  class="selectall"><option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="">空</option></select></td>';
									html+='<td><input name="showseqlist" type="text" class="inputstyle" style="width:40%;" value="4"/></td></tr>';
								}else{
									$.each(data.itemRuleList,function(i,o){
									    ruleNameNumber++;//数据库已经有的一级规则数
										html+='<tr id="tr'+ruleNameNumber+'">';
										if(o.rulename!=null&&(o.rulename=="压力等级"||o.rulename=="生产商"||o.rulename=="口径"||o.rulename=="原产地")){
											html+='<td>';
											html+='<input name="rulenamelist" value="'+o.rulename+'" type="text" class="inputstyle"  readonly="readonly"/><input name="itemruleidlist" value="'+o.itemruleid+'" type="hidden"/></td>';
										}else{
											html+='<td><img src="'+ctx+'/images/delete_small.gif" onclick="delDbRuleName('+o.itemruleid+','+ruleNameNumber+')"/>';
											html+='<input name="rulenamelist" value="'+o.rulename+'" type="text" class="inputstyle"/><input name="itemruleidlist" value="'+o.itemruleid+'" type="hidden"/></td>';
										}
										
										html+='<td><input name="seqlist" value="'+o.seq+'" type="text" class="inputstyle" style="margin-left:10px;width:40%;" /></td><td>';
										if(o.sign==null){
											html+='<select name="signlist" value ="."  class="selectall">';
										}else{
											html+='<select name="signlist" value="'+o.sign+'" class="selectall">';
										}
										
										/*if(o.sign==""){
											html+='<option value =".">.</option><option value ="/">/</option><option value ="-">-</option><option value="" selected="selected">空</option>';
										}else if(o.sign=="."){
											html+='<option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="" >空</option>';
										}else if(o.sign=="/"){
											html+='<option value =".">.</option><option value ="/" selected="selected">/</option><option value ="-">-</option><option value="" >空</option>';
										}else if(o.sign=="-"){
											html+='<option value =".">.</option><option value ="/">/</option><option value ="-"  selected="selected">-</option><option value="" >空</option>';
										}else{
											html+='<option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="" >空</option>';
										}*/
										if(o.sign==""){
											html+='<option value ="/">/</option><option value ="-">-</option><option value="" selected="selected">空</option>';
										}else if(o.sign=="/"){
											html+='<option value ="/" selected="selected">/</option><option value ="-">-</option><option value="" >空</option>';
										}else if(o.sign=="-"){
											html+='<<option value ="/">/</option><option value ="-"  selected="selected">-</option><option value="" >空</option>';
										}else{
											html+='<option value ="/" selected="selected">/</option><option value ="-">-</option><option value="" >空</option>';
										}
										
										html+='</select></td><td><input name="showseqlist" value="'+o.showseq+'" type="text" class="inputstyle" style="width:40%;" />&nbsp;&nbsp;<a href="javascript:showRuleDetail('+o.itemruleid+','+itemid+');">详细</a></td>';
										html+='</tr>';
									});
								}
								
							$("#ruletable").html(html);
							$("#ruleaddbtn").show();
							$("#rulesavebtn").show();
							}else{
							alert(data.resultInfo[1]);
							}
						}
					});	
				}else if(item!=null&&item.itemid!=itemid){
					ruleNameNumber=0;
					openDiv('addRuleDiv');
					var html='';			
					var url = ctx+"/itemRule/item-rule!listToQuery.htm";
					$.webAjax( {
						type : "post",
						url : url,
						data:'itemRuleQuery.itemid='+item.itemid,
						success : function(data) {
							data = $.parseJSON(data);
							if(data.resultInfo[0]=='0')
							{
								$("#hideitemid").val(itemid);
								var num=0;
								ruleNameNumber++;	
								$.each(data.itemRuleList,function(i,o){
									html+='<tr id="tr'+ruleNameNumber+'">';
									if(o.hideitemids!=null&&$.trim(o.hideitemids)!=""&&$.trim(o.hideitemids).indexOf(itemid)>-1){
								    	html+='<td align="center"><input type="checkbox" name="checkedrule" value="' + o.itemruleid + '" checked="checked" onchange="selectCheckRule1(\'allcheckrule\', \'checkedrule\')"/></td>';
								    	num++;
								    }else{
								    	html+='<td align="center"><input type="checkbox" name="checkedrule" value="' + o.itemruleid + '" onchange="selectCheckRule1(\'allcheckrule\', \'checkedrule\')"/></td>';
								    }
									html+='<td>';
									var hideitemids = o.hideitemids==null?"":o.hideitemids;
									html+='<input name="itemruleidlist" value="'+o.itemruleid+'" type="hidden"/><input name="hideitemidslist" value="'+hideitemids+'" type="hidden"/>';
									html+='<input name="rulenamelist" value="'+o.rulename+'" type="text" class="inputstyle" readonly="readonly"/></td>';
									html+='<td><input name="seqlist"  value="'+o.seq+'" type="text" class="inputstyle" style="margin-left:10px;width:40%;" readonly="readonly"/></td><td>';
									html+='<input name="signlist" value="'+o.sign+'" type="hidden"/>';
									if(o.sign==null){
										html+='<select   value ="."  class="selectall" disabled="disabled">';
									}else{
										html+='<select    value="'+o.sign+'" class="selectall" disabled="disabled">';
									}
									
									/*if(o.sign==""){
										html+='<option value =".">.</option><option value ="/">/</option><option value ="-">-</option><option value="" selected="selected">空</option>';
									}else if(o.sign=="."){
										html+='<option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="" >空</option>';
									}else if(o.sign=="/"){
										html+='<option value =".">.</option><option value ="/" selected="selected">/</option><option value ="-">-</option><option value="" >空</option>';
									}else if(o.sign=="-"){
										html+='<option value =".">.</option><option value ="/">/</option><option value ="-"  selected="selected">-</option><option value="" >空</option>';
									}else{
										html+='<option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="" >空</option>';
									}*/
									if(o.sign==""){
										html+='<option value ="/">/</option><option value ="-">-</option><option value="" selected="selected">空</option>';
									}else if(o.sign=="/"){
										html+='<option value ="/" selected="selected">/</option><option value ="-">-</option><option value="" >空</option>';
									}else if(o.sign=="-"){
										html+='<option value ="/">/</option><option value ="-"  selected="selected">-</option><option value="" >空</option>';
									}else{
										html+='<option value ="/" selected="selected">/</option><option value ="-">-</option><option value="" >空</option>';
									}
									html+='</select></td><td><input name="showseqlist" value="'+o.showseq+'" type="text" class="inputstyle" style="width:40%;" readonly="readonly"/><a href="javascript:showRuleDetail('+o.itemruleid+','+itemid+');">详细</a></td>';
									html+='</tr>';
								});
								if(num == data.itemRuleList.length){
									html='<tr><th style="text-align:center;"><input type="checkbox" name="allcheckrule"  value="全选" checked="checked" onchange="selectCheckRule(\'allcheckrule\', \'checkedrule\')"/>不显示</th><th>名称</th><th>序号</th><th>分隔符</th><th>显示顺序</th></tr>'+html;
								}else{
									html='<tr><th style="text-align:center;"><input type="checkbox" name="allcheckrule" value="全选" onchange="selectCheckRule(\'allcheckrule\', \'checkedrule\')"/>不显示</th><th>名称</th><th>序号</th><th>分隔符</th><th>显示顺序</th></tr>'+html;
								}
							$("#ruletable").html(html);
							$("#ruleaddbtn").hide();
							$("#rulesavebtn").show();
							}else{
								alert(data.resultInfo[1]);
							}
						}
					});	
				}
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
	
	
	
			
}
//规则列表中的全选全不选
function selectCheckRule(select1,select2){
	var checkBoxs = $("input[name='"+select2+"']");
	alert($("input[name='"+select1+"']:checked").val());
	if($("input[name='"+select1+"']:checked").val()){
		$.each(checkBoxs,function(i,o){
			$(this).attr('checked', 'checked');
		});
	}else{
		$.each(checkBoxs,function(i,o){
			$(this).removeAttr('checked');
		});
	}
}
function selectCheckRule1(select1,select2){
	var checkBoxs = $("input[name='"+select2+"']");
	var checks = $("input[name='"+select2+"']:checked");
	if(checkBoxs.length==checks.length){
		$("input[name='"+select1+"']").attr('checked', 'checked');
	}else{
		$("input[name='"+select1+"']").removeAttr('checked');
	}
	
}

//规则列表中保存事件
function saveRuleName(){
	var rulenamelist=$("input[name='rulenamelist']");
	var seqlist=$("input[name='seqlist']");
	var signlist = $("select[name='signlist']");
	var showseqlist = $("input[name='showseqlist']");
	if(0==newruleNameNumber&&0==ruleNameNumber){//说明当前没有数据就保存了
	   alert("还没有数据,请添加后再操作!");
	   ispass=1;
	   return false;
	}
	if(ispass==1){
	   return ;
	}
	
	var newruleNameNumberParam=newruleNameNumber;//说明当前要保存的有新添加的
	var ruleNameNumberParam=ruleNameNumber;//第一次查询出的数据库中的一级规则数
	
	$("#newruleNameNumber").val(newruleNameNumberParam);
	$("#ruleNameNumber").val(ruleNameNumberParam);
	
	var ispass=0;
	var names = new Array();
	$.each(rulenamelist,function(i,o){
		if(!$(o).val()){
			alert("名称不能为空!");ispass=1;return false;
		}else{
			names.push($(o).val());
		}
		
	});
	if(ispass==1){
		return ;
	}else{
		if(isRepeat(names)){
			alert("名称不能重复！");
			return;
		}
	}
	
	
	var seqs = new Array();
	$.each(seqlist,function(i,o){
		var reg = /^\d+$/;
		if(!$(o).val()){
			alert("序号不能为空!");ispass=1;return false;
		}else if (!$(o).val().match(reg)){
			alert("序号只能为数字!");ispass=1;return false;
		}else{
			seqs.push($(o).val());
		}
	});
	if(ispass==1){
	return ;
	}else{
		if(isRepeat(seqs)){
			alert("序号不能重复！");
			return;
		}
	}
	
	var showseqs = new Array();
	$.each(showseqlist,function(i,o){
		var reg = /^\d+$/;
		if(!$(o).val()){
			alert("显示顺序不能为空!");ispass=1;return false;
		}else if (!$(o).val().match(reg)){
			alert("显示顺序只能为数字!");ispass=1;return false;
		}else{
			showseqs.push($(o).val());
		}
	});
	if(ispass==1){
		return ;
	}else{
		if(isRepeat(showseqs)){
			alert("显示顺序不能重复！");
			return;
		}
	}
	var delIds ="";
	var dels = $('[name="checkedrule"]:checked');
	if(dels!=null&&dels.length>0){
		$.each(dels, function(i, o){	
			if(i==(dels.length-1)){
				delIds+= $(o).val();
			}else{
				delIds+= $(o).val()+",";
			}
			 
		});
	}
	
	var formParam = $('#addruleForm').serialize();
	var url = ctx+"/itemRule/item-rule!saveRule.htm";
	var itemid = $.trim($('#ruleitemid').val());
	var hideitemid = $.trim($('#hideitemid').val());
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam+"&delIds="+delIds,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				newruleNameNumber=0;
				if(hideitemid!=null&&hideitemid!=""){
					showAddRule(hideitemid);
					searchrule(null,hideitemid,null,null);
				}else{
					showAddRule(itemid);
					searchrule(null,itemid,null,null);
				}
				
				
				
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}
//判断数组中是否有重复元素
function isRepeat(arr) {
   var hash = {};
   for(var i in arr) {
       if(hash[arr[i]])
       {
           return true;
       }
       // 不存在该元素，则赋值为true，可以赋任意值，相应的修改if判断条件即可
       hash[arr[i]] = true;
    }
   return false;
} 

//规则列表中添加一行
function addRuleName(){
	newruleNameNumber++;
	var html='';
	html+='<tr id="trnew'+newruleNameNumber+'"><td><img src="'+ctx+'/images/delete_small.gif" onclick="delRuleName('+newruleNameNumber+')"/>';
	html+='<input name="rulenamelist" type="text" class="inputstyle" /><input name="itemruleidlist" type="hidden"/></td>';
	html+='<td><input name="seqlist" type="text" class="inputstyle" style="width:40%;margin-left:10px;" /></td><td><select name="signlist"  class="selectall"><option value ="." selected="selected">.</option><option value ="/">/</option><option value ="-">-</option><option value="">空</option></select></td>';
	html+='<td><input name="showseqlist" type="text" class="inputstyle" style="width:40%;" /></td></tr>';
	$("#ruletable").append(html);
		
}


//点击规则页面的详情按钮事件
function showRuleDetail(itemruleid,itemid){
	//先根据itemid找到root节点（父节点为0的节点）
	var url1 = ctx+"/items/items!findRoot.htm";
	$.webAjax( {
		type : "post",
		url : url1,
		data:'itemQuery.itemid='+itemid,
		success : function(data) {
			data = $.parseJSON(data);
			var item = data.model;
			if(data.resultInfo[0]=='0'){
				if(item!=null&&item.itemid==itemid){
					//没有复选框（不能选择不可显示）目前做成不可删除
					loadRuleDetailRoot(itemruleid,itemid);
				}else if(item!=null&&item.itemid!=itemid){
					//有复选框，并且将父节点的id和本节点的id传到后台
					loadRuleDetailChlid(itemruleid,item.itemid,itemid);
				}
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
	
	
	
	
}
//父级节点加载规则详细
function loadRuleDetailRoot(itemruleid,itemid){
	ruleDetailNumber=0;
	openDiv('ruleDetailDiv');
	$("#ruleDetailitemid").val(itemid);
	$("#DetailitemRuleid").val(itemruleid);
	$("#delitemid").val("");
	var html='';			
	var url = ctx+"/itemRuleDetail/item-rule-detail!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleDetailQuery.itemruleid='+itemruleid+'&itemRuleDetailQuery.sortColumns=seq',
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				html+='<tr id="headtr"><th>名称</th><th>代码</th><th>操作</th></tr>';
				$.each(data.itemRuleDetailList,function(i,o){
				    ruleDetailNumber++;//显示某个规则的二级规则
				    //带删除操作
					//html+='<tr id="trdetail'+ruleDetailNumber+'" ><td><img src="/images/delete_small.gif"  onclick="delDbRuleDetail('+o.detailid+','+ruleDetailNumber+')" />';
				    html+='<tr id="trdetail'+ruleDetailNumber+'" ><td>';
				    html+='<input type="text" name="fnamelist" value="'+o.fname+'" class="inputstyle" /><input name="detailidlist" type="hidden" value="'+o.detailid+'"/></td>';
					html+='<td><input type="text" name="fcodelist" value="'+o.fcode+'" class="inputstyle"/></td>';
					html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetail'+ruleDetailNumber+'\')" class="btnall"/></td>';
					html+='</tr>';
					
				});
				$("#ruleDetailTable").html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}
function addRuleDetailNew(trid){
	var ths = $("#headtr>th");
    var itemruleid =$('#DetailitemRuleid').val()
    var mark = $.trim($('#mark'+itemruleid).val());
	var html='';
	newruleDetailNumber++;
	if(ths.length==3){
		html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td><img src="'+ctx+'/images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" />';
	}else if(ths.length==4){
		html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td></td><td><img src="'+ctx+'/images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" /><input name="delitemidslist" type="hidden" value=""/>';
	}
	html+='<input type="text" name="fnamelist" class="inputstyle" style="width:70%"/><input name="detailidlist" type="hidden"/></td>';
	html+='<td><input type="text" name="fcodelist"  value="'+mark+'"    class="inputstyle"/></td>';
	html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetailnew'+ruleDetailNumber+'\')" class="btnall"/></td></tr>';
	
	$("#"+trid).after(html);
}


//子集节点加载规则详细
function loadRuleDetailChlid(itemruleid,pitemid,itemid){
	//delitemid
	ruleDetailNumber=0;
	openDiv('ruleDetailDiv');
	$("#ruleDetailitemid").val(pitemid);
	$("#DetailitemRuleid").val(itemruleid);
	$("#delitemid").val(itemid);
	var html='';			
	var url = ctx+"/itemRuleDetail/item-rule-detail!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleDetailQuery.itemruleid='+itemruleid+'&itemRuleDetailQuery.sortColumns=seq',
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				//html+='<tr><th style="text-align:center;"><input type="checkbox" id="allcheckbox" name="allcheckbox" onclick="$.antiSelectAllCheckboxes(\'ruleDetailForm\', \'checkedpro\')"/>不显示</th><th>名称</th><th>代码</th></tr>';
				var num=0;
				$.each(data.itemRuleDetailList,function(i,o){
				    ruleDetailNumber++;//显示某个规则的二级规则
				    //带删除操作
					//html+='<tr id="trdetail'+ruleDetailNumber+'" ><td><img src="/images/delete_small.gif"  onclick="delDbRuleDetail('+o.detailid+','+ruleDetailNumber+')" />';
				    html+='<tr id="trdetail'+ruleDetailNumber+'" >';
				    
				    if(o.delitemids!=null&&$.trim(o.delitemids)!=""&&$.trim(o.delitemids).indexOf(itemid)>-1){
				    	num++;
				    	html+='<td align="center"><input type="checkbox" name="checkedpro" value="' + o.detailid + '" checked="checked" onchange="selectCheckBox1(\'allcheckbox\', \'checkedpro\')"/></td>';
				    }else{
				    	html+='<td align="center"><input type="checkbox" name="checkedpro" value="' + o.detailid + '" onchange="selectCheckBox1(\'allcheckbox\', \'checkedpro\')"/></td>';
				    }
				    
				    html+='<td><input type="text" name="fnamelist" value="'+o.fname+'" class="inputstyle" readonly="readonly" />';
				    if(o.delitemids!=null&&$.trim(o.delitemids)!=""){
				    	html+='<input name="delitemidslist" type="hidden" value="'+o.delitemids+'"/>';
				    }else{
				    	html+='<input name="delitemidslist" type="hidden" value=""/>';
				    }
				    html+='<input name="detailidlist" type="hidden" value="'+o.detailid+'"/></td>';
					html+='<td><input type="text" name="fcodelist" value="'+o.fcode+'" class="inputstyle" readonly="readonly"/></td>';
					html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetail'+ruleDetailNumber+'\');" class="btnall"/></td></tr>';
				});
				if(num == data.itemRuleDetailList.length){
					html='<tr id="headtr"><th style="text-align:center;"><input type="checkbox" id="allcheckbox" name="allcheckbox" value="全选" checked="checked" onchange="selectCheckBox(\'allcheckbox\', \'checkedpro\')"/>不显示</th><th>名称</th><th>代码</th><th>操作</th></tr>'+html;
				}else{
					html='<tr id="headtr"><th style="text-align:center;"><input type="checkbox" id="allcheckbox" name="allcheckbox" value="全选" onchange="selectCheckBox(\'allcheckbox\', \'checkedpro\')"/>不显示</th><th>名称</th><th>代码</th><th>操作</th></tr>'+html;
				}
				$("#ruleDetailTable").html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}
//规则详细中的全选全不选
function selectCheckBox(select1,select2){
	var checkBoxs = $("input[name='"+select2+"']");
	if($("input[name='"+select1+"']:checked").val()){
		$.each(checkBoxs,function(i,o){
			$(this).attr('checked', 'checked');
		});
	}else{
		$.each(checkBoxs,function(i,o){
			$(this).removeAttr('checked');
		});
	}
}
function selectCheckBox1(select1,select2){
	var checkBoxs = $("input[name='"+select2+"']");
	var checks = $("input[name='"+select2+"']:checked");
	if(checkBoxs.length==checks.length){
		$("input[name='"+select1+"']").attr('checked', 'checked');
	}else{
		$("input[name='"+select1+"']").removeAttr('checked');
	}
	
}

//关闭规则列表
function closeAddRuleDiv(){
	closeDiv('addRuleDiv');
}
//关闭规则详细
function closeruleDetailDiv(){
	closeDiv('ruleDetailDiv');
	
}

//规则详细中的添加事件
function addRuleDetail(){
		var ths = $("#headtr>th");
        var itemruleid =$('#DetailitemRuleid').val()
        var mark = $.trim($('#mark'+itemruleid).val());
		var html='';
		newruleDetailNumber++;
		if(ths.length==3){
			html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td><img src="'+ctx+'/images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" />';
		}else if(ths.length==4){
			html+='<tr id="trdetailnew'+newruleDetailNumber+'" ><td></td><td><img src="'+ctx+'/images/delete_small.gif"  onclick="delRuleDetail('+newruleDetailNumber+')" /><input name="delitemidslist" type="hidden" value=""/>';
		}
		html+='<input type="text" name="fnamelist" class="inputstyle" style="width:70%"/><input name="detailidlist" type="hidden"/></td>';
		html+='<td><input type="text" name="fcodelist"  value="'+mark+'"    class="inputstyle"/></td>';
		html+='<td><input type="button" value="添加行" onclick="addRuleDetailNew(\'trdetailnew'+newruleDetailNumber+'\');" class="btnall"/></td></tr>';
		$("#ruleDetailTable").append(html);

}


//规则详细中的保存事件
function saveRuleDetail(){
    var fnamelist=$("input[name='fnamelist']");
	var fcodelist=$("input[name='fcodelist']");
	var ispass=0;
	var names = new Array();
	$.each(fnamelist,function(i,o){
		if(!$(o).val()){
			alert("名称不能为空!");ispass=1;return false;
		}else{
			names.push($(o).val());
		}
	});
	if(ispass==1){
		return ;
	}else{
		if(isRepeat(names)){
			alert("名称不能重复！");
			return;
		}
	}
	var codes = new Array();
	$.each(fcodelist,function(i,o){
		if($(o).val()&&$.trim($(o).val())!=""){
			codes.push($(o).val());
		}
	});
	if(ispass==1){
		return ;
	}else{
		if(isRepeat(codes)){
			alert("代码不能重复！");
			return;
		}
	}
	
	if(0==newruleDetailNumber&&0==ruleDetailNumber){//说明当前没有数据就保存了
	   alert("还没有数据,请添加后再操作!");
	   ispass=1;
	   return false;
	}
	if(ispass==1){
	   return ;
	}
    var newruleDetailNumberParam=newruleDetailNumber;
    var ruleDetailNumberParam=ruleDetailNumber;
    $("#newruleDetailNumber").val(newruleDetailNumberParam);
	$("#ruleDetailNumber").val(ruleDetailNumberParam);
	var delIds ="";
	var dels = $('[name="checkedpro"]:checked');
	$.each(dels, function(i, o){	
		if(i==(dels.length-1)){
			delIds+= $(o).val();
		}else{
			delIds+= $(o).val()+",";
		}
		 
	});
	var formParam = $('#ruleDetailForm').serialize();
	var url = ctx+"/itemRuleDetail/item-rule-detail!saveAll.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam+'&delIds='+delIds,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				alert(data.resultInfo[1]);
				newruleDetailNumber=0;
				if($("#delitemid").val()){
					showRuleDetail( $("#DetailitemRuleid").val(),$("#delitemid").val() ); 
					showAddRule($("#delitemid").val());
					searchrule(null,$("#delitemid").val(),null,null);
				}else{
					showRuleDetail( $("#DetailitemRuleid").val(),$("#ruleDetailitemid").val() ); 
					showAddRule($("#ruleDetailitemid").val());
					searchrule(null,$("#ruleDetailitemid").val(),null,null);
				}
				
				
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}

//删除规则详情中的一行(未保存的)
function delRuleDetail(number){
	$("#trdetailnew"+number).remove();
	if(0<newruleDetailNumber){
		newruleDetailNumber--;
	}
}

//删除规则详情数据库中已经存在的行
function delDbRuleDetail(detailid,number){
	if(!confirm("确定删除此项？")){
		return ;
	}
	var url = ctx+"/itemRuleDetail/item-rule-detail!deleteAlone.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleDetailQuery.detailid='+detailid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				$("#trdetail"+number).remove();
				if(0<ruleDetailNumber){//数据中二级规则页面显示的减一
					  ruleDetailNumber--;
			    }
				searchrule(null,$.trim($("#ruleDetailitemid").val()),null,null);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}

//删除规则列表中一行（未保存的）
function delRuleName(number){
	$("#trnew"+number).remove();
	if(0<newruleNameNumber){
		newruleNameNumber--;
	}
}


//删除规则列表中的一行（已经存在的）
function delDbRuleName(itemruleid,number){
	if(!confirm("确定删除此项？（删除此项会删除此项所有详细规则！）")){
		return ;
	}
	var url = ctx+"/itemRule/item-rule!deleteAlone.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'itemRuleQuery.itemruleid='+itemruleid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				$("#tr"+number).remove();
				if(0<ruleNameNumber){//数据中一级规则页面显示的减一
					  ruleNameNumber--;
			    }
				searchrule(null,$.trim($('#ruleitemid').val()),null,null);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});	
}


//在右侧显示修改后的规则
function searchrule(parentid,itemid,code,itemname){
	//根据传的itemid判断是否是根节点
	var url1 = ctx+"/items/items!findRoot.htm";
	$.webAjax( {
		type : "post",
		url : url1,
		data:'itemQuery.itemid='+itemid,
		success : function(data) {
			data = $.parseJSON(data);
			var item = data.model;
			if(data.resultInfo[0]=='0'){
				if(item!=null&&item.itemid!=null){
					var html='';
					var url = ctx+"/itemRule/item-rule!listToDetail.htm";
					$.webAjax( {
						type : "post",
						url : url,
						data:'itemRuleQuery.itemid='+item.itemid+'&itemRuleDetailId='+itemid,
						success : function(data) {
							data = $.parseJSON(data);
							if(data.resultInfo[0]=='0')
							{
								var maxlemgth=0;
								html+='<tr>';
								$.each(data.itemRuleList,function(i,o){
									html+='<th width="180px;">';
									html+=o.rulename;
									html+='</th>';
									if(o.itemRuleDetaillist.length>maxlemgth){
										maxlemgth=o.itemRuleDetaillist.length;
									}
									
								});						
								html+='</tr>';
								//------表头END----
								for(var ll=0;ll<maxlemgth;ll++){
									html+='<tr>';
									$.each(data.itemRuleList,function(i,o){
										html+='<td>';
										html+='<div class="tdleftDiv">'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fname)+'</div><div class="tdrightDiv">'+(o.itemRuleDetaillist[ll]==null?"":o.itemRuleDetaillist[ll].fcode)+'</div>';
										html+='</td>';
									});
									html+='</tr>';
								}
								$("#detailAll").html(html);
							}else{
								alert(data.resultInfo[1]);
							}
						}
					});	
				}
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
	
	
					
}