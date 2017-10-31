<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>角色管理</title>  
<%@ include file="/sysresources/common/include.jsp"%>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
/*bootstrap重写*/
.checkbox, .radio {
    display: block;
    margin-bottom: 1px;
    margin-top: -1px;
    position: relative;
}

#leftDiv {
 background-color:#fff;
 position:absolute;
 height: 625px;
 width: 20%;
 left:0px;
 top:0px;
 overflow:auto;
 border: 1px solid #CCC;
 margin-left: 0px;
}
#rightDiv {
 float: left;
 height: 625px;
 width:81%;
 overflow:auto;
 border: 1px solid #CCC;
 margin-left:19%;
 margin-top:-2px;
}
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;font-size:14px;background:#E7EFF1;margin-top: -3px;}
input.input120{border:1px #ccc solid; width:120px; height:20px;margin-top: 2px;text-align: left;}
.select120{
	width:120px;
	margin-top: 2px;
	text-align: left;
}
</style>
<script type="text/javascript">
$(function () {
	var html1='<option value="">--</option>';
	var url = "${ctx}/roleAdd/role-add!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.roleList;
			if(data.resultInfo[0]=='0')
			{
				$.each(page,function(i,o){
					html1+='<option value="'+o.id+'">'+o.name+'</option>';
				});
				$('#pIdSelect').html(html1);
			}
		}
	});
	loadTree();
    $('#centertreegrid').treegrid({
    	url: '${ctx}/menu/menu!treeGrid.htm',
        title: '菜单管理',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        iconCls:'icon-list',
        idField:'id',
        treeField:'name',
        frozenColumns:[[ 
     		{ title: 'ID', field: 'id', align: 'center' },
         	{ title: '菜单名称', field: 'name', align: 'left' },
         	{ field: 'keywords', title: 'KEY' }
    	]],
        columns: [[
			{title: '是否显示', field: 'isshow', align: 'center',halign:'left',width:'60px',
        		formatter: function (value, rec, index) {
              		return "<div class=\"checkbox\"><label><input class=\"checkbox\" type=\"checkbox\" name=\"show_"+rec.id+"\" id=\"show_" + rec.id +"\" /></label></div>";
            	}
         	},
         	{title: '操作权限', field: 'operate',width:'450px',
         		formatter: function (value, rec, index) {
         			var operateHtml="<div class=\"checkbox\">";
         			if(rec.operates!=null&&rec.operates!="null"&&rec.operates.length>0){
         				$.each(rec.operates, function (i, val) {
                  			operateHtml = operateHtml + "<label><input class=\"checkbox\" type=\"checkbox\" name=\"operate_"+rec.id+"_"+val.id+"\" id=\"operate_"+rec.id+"_" + val.id +"\" />"+val.name+"</label>&nbsp;";
                  			if((i+1)%4==0){
                  				operateHtml = operateHtml + "<br/>";
                  			}
                   		});
         			}
         			
         			operateHtml = operateHtml + "</div>";
         			/* var operateHtml="<div class=\"checkbox\">";
         			$.ajax({
                    	type: "post",
                 		url: '${ctx}/menuoperate/menu-operate!list.htm?menuOperateQuery.menuId=' + rec.id,
                    	dataType: "json",
                   		async: false,
        	        	success: function (data, textStatus) {
        	        		$.each(data.rows, function (i, val) {
                      			operateHtml = operateHtml + "<label><input class=\"checkbox\" type=\"checkbox\" name=\"operate_"+rec.id+"_"+val.id+"\" id=\"operate_"+rec.id+"_" + val.id +"\" />"+val.name+"</label>&nbsp;";
                       		});
                      	}
               		});
         			operateHtml = operateHtml + "</div>"; */
         			return operateHtml;
            	}
         	},
        	{title: '数据权限', field: 'data'}
        ]],
        onLoadSuccess:function(data){
			 $('#centertreegrid').treegrid('resize');
			 closeblockdiv();
		}
    });
});
function loadTree(){
	$("#clickRoleId").val("");
	$("#westtree").tree({
		url: '${ctx}/role/role!tree.htm',
    	method: 'get',
    	animate: true,
     	onClick: function (node) {
     		$("#clickRoleId").val(node.id);
      		$.ajax({
            	type: "post",
         		url: '${ctx}/rolepower/role-power!list.htm?rolePowerQuery.roleId=' + node.id,
            	dataType: "json",
           		async: false,
	        	success: function (data, textStatus) {
	           		$("input").each(function () {
               			$(this).prop('checked', false);
             		});
              		$.each(data.rows, function (i, val) {
              			if(val.code=="show"){
              				$("#" + val.code + "_" + val.menuId).prop('checked', true);
              			}else if(val.code=="operate"){
              				$("#" + val.code + "_" + val.menuId+"_"+val.authorityId).prop('checked', true);
              			}
               		});
              	}
       		});
     	}
  	});
  	
}
//授权
function authorize(){
	var row = $("#westtree").tree("getSelected");
	if (row) {
		var rolePowerArray=new Array();
   		$("input:checked").each(function (i, val) {
   			rolePowerArray.push(val.id);
    	});
   		
   		$.ajax({
        	type: "post",
     		url: '${ctx}/rolepower/role-power!save.htm?rolePower.roleId=' + row.id,
     		data:$.param({rolePowerArray:rolePowerArray},true),
        	dataType: "json",
       		async: false,
        	success: function (data, textStatus) {
        		$.messager.alert('提示', data.msg);
          	}
   		});
   		
	} else {
		$.messager.alert('提示', '请选择要授权的角色！');
	}
}
function add(){
	resetFrom();
	openDiv("inputDiv");
}
function submitForm(){
	var name = $("#name").val();
	if(name==null||name==""){
		alert('角色名称不能为空！');
		$("#name").focus();
		return;
	}
	var code = $("#code").val();
	if(code==null||code==""){
		alert('角色编码不能为空！');
		$("#code").focus();
		return;
	}
	var formParam = $('#modifyform').serialize();
	var url ="${ctx}/roleAdd/role-add!saveToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				$.messager.alert('提示', '操作成功！');
				loadTree();
				closeAddDiv();
			}else{
				alert(data.resultInfo[1]);
			}
			
		}
	});
}
function closeAddDiv(){
	closeDiv('inputDiv');
}
function resetFrom(){
	$("#roleId").val("");
	$("#name").val("");
	$("#code").val("");
	$("#keywords").val("");
	$("#pIdSelect").val("");
}
function edit(){
	resetFrom();
	var roleId=$("#clickRoleId").val();
	
	if(roleId==null||roleId==""){
		$.messager.alert('提示', '请先选择要修改的角色！');
		return;
	}
	var url = "${ctx}/roleAdd/role-add!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'roleId='+roleId,
		success : function(data) {
		data = $.parseJSON(data);
		var entity = data.entity;
			if(data.resultInfo[0]=='0')
			{
				$("#roleId").val(entity.id);
				$("#name").val(entity.name);
				$("#code").val(entity.code);
				$("#keywords").val(entity.keywords);
				$("#pIdSelect").val(entity.pId);
				openDiv("inputDiv");
			}
		}
	});
}
function del(){
	var roleId=$("#clickRoleId").val();
	if(roleId==null||roleId==""){
		$.messager.alert('提示', '请先选择要删除的角色！');
		return;
	}
	$.messager.confirm('提示', '是否删除此角色？', function(r){
		if(r){
			var url = "${ctx}/roleAdd/role-add!deleteToJson.htm";
			$.webAjax( {
				type : "post",
				url : url,
				data:'roleId='+roleId,
				success : function(data) {
				data = $.parseJSON(data);
					if(data.resultInfo[0]=='0')
					{
						$.messager.alert('提示', '删除成功！');
						loadTree();
					}else{
						$.messager.alert('提示', data.resultInfo[1]);
					}
				}
			});
		}else{
			api.close();
			W.reloadDatagrid();
		}
	});
	
}
</script>
</head>
<body id="bodymark">
   	<%@ include file="/sysresources/common/topmsg.jsp"%>
       <!--BEGIN BACK TO TOP-->
       <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
       <!--END BACK TO TOP-->
       <!--BEGIN TOPBAR-->
       <%@ include file="/sysresources/common/top.jsp"%>
       <!--END TOPBAR-->
       <div id="wrapper">
           <!--BEGIN SIDEBAR MENU-->
           <%@ include file="/sysresources/common/menu.jsp"%>
           <!--END SIDEBAR MENU-->
           <!--BEGIN PAGE WRAPPER-->
           <div id="page-wrapper">
               <!--BEGIN TITLE & BREADCRUMB PAGE-->
               <div class="tab-pane fade in active">
					<div id="leftDiv" 
						data-options="split:true,title: '角色列表',iconCls:'icon-list'"
						style="width: 220px;">
						<div id="westtoolbar" class="datagrid-toolbar">
							<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add()">新增</a>
							<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit()">修改</a>
							<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-delete',plain:true" onclick="del()">删除</a>
						</div>
						<ul id="westtree"></ul>
					</div>
					<div  id="rightDiv" style="overflow: auto;">
						<table id="centertreegrid" style="width:88%;"></table>
						<div id="toolbar" style="width:100%;">
							<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="authorize()">授权</a>
						</div>
					</div>
				</div>
               <!--END CONTENT-->
           </div>
           <!--BEGIN FOOTER-->
           <%@ include file="/sysresources/common/footer.jsp"%>
           <!--END FOOTER-->
           <!--END PAGE WRAPPER-->
       </div>
    <input id="clickRoleId" type="hidden"/>
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 350px;height: 200px;">
		<h2 syle="height:10%;">
			<b>菜单信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height:64%;overflow: auto;">
			<form action="" name="modifyform" id="modifyform" method="post">
				<input type="hidden" class="inputall" id="roleId" name="id"/>
                <table id="cont_1" cellspacing="0" cellpadding="0" border="0" class="nobdTB">
                    
                    <tr>
                        <td align="right" width="120">角色名称</td>
                        <td align="left">
                            <input type="text" class="input120" id="name" name="name" /><font color="red">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="120">角色编码</td>
                        <td align="left">
                            <input type="text" class="input120" id="code" name="code" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="120">keywords</td>
                        <td align="left">
                            <input type="text" class="input120" id="keywords" name="keywords" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="120">父级</td>
                        <td align="left">
                            <select id="pIdSelect" name="rolePid"  class="select120" ></select>
                        </td>
                    </tr>
                </table>
                
			</form>
		</div>
		<div style="width:100%;text-align: center;height:10%;border-top: 1px solid #ccc;padding-top:3px;">
			<input type="button" value="保存" class="btn btn-success btn-outlined" style="border-radius:5px!important;"  onclick="submitForm()"/> 
			<input type="button" value="重置" class="btn btn-success btn-outlined" style="border-radius:5px!important;" onclick="resetFrom()"/>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:5px!important;" onclick="closeDiv('inputDiv');">取消</button>
	    </div>
	</div>
</body>
</html>