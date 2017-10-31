<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/common/childrenHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>部门管理列表</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	
	<link rel="stylesheet" type="text/css" href="/css/common.css"/>
	<style type="text/css">
.affirmlayer{position:absolute;top:10;left:10;width:500px;border:3px solid #d7d7d7;background:#fff;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:0 10px;font-size:14px;margin:0 20px;color:#666}
.affirmlayer h2 b{float:left;display:inline;line-height:30px;vertical-align:middle;color:#5CA422;}
.affirmlayer h2 .butnOrange{float:right;display:inline;margin:0px 0 0}
	</style>
<script type="text/javascript">
$(document).ready(function(){
	window.simpleTable =$(document).SimpleTable({
		id:'departmentpage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '10',
		order: 'asc',
		orderBy: 't_department.teamid',
		submitForm : submitForm//分页回调函数
		});	
	loaddepartment();
});
function submitForm()
{
	loaddepartment();
}
function loaddepartment()
{
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = "${ctx}/department/department!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"departmentpage",simpleTable);
			if(data.resultInfo[0]=='0')
			{
				$.each(page.result,function(i,o){
					html+='<tr align="center" >';
					html += '<td style="border-left:1px solid #ccc;"><input type="checkbox" id="checkedarea" name="checkedarea" value="' + o.teamid + '"/></td>';
					html+='<td>'+(o.admin==null?"":o.admin.adminName)+'</td>';
					html+='<td>'+o.teamname+'</td>';
					html+='<td>'+(o.superiorname==null?"":o.superiorname)+'</td>';
					html+='<td><a href="javascript:getdepartment('+o.teamid+');"><img src="${ctx}/images/icon01.gif"/></a>|<a href="javascript:del('+o.teamid+');"><img src="${ctx}/images/delete_small.gif"/></a></td>';
					html+='</tr>';
				});
				$('#plantable').html(html);
			}
		}
	});
}

function del(teamid)
{
	var param = {};
	if(teamid) {
		param['checkedIdList[0]'] = teamid;
	} else {		
		var delareas = $('[name="checkedarea"]:checked');
		var cnt = 0;
		$.each(delareas, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的！');
		return;
	}
	
	if(!confirm('确定删除吗？')) {
		return;
	}
	var url = ctx + '/department/department!deleteToJson.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				loaddepartment();
			} else {
				alert(data.resultInfo[1]);
			}
		}
	});
}

function adddepartment()
{
	$.openDiv("inputDiv");
}

function closeAddDiv()
{
		$('#adminId').attr("value","");
		$('#adminid').attr("value","");
		$('#teamname').attr("value","");
		$('#teamsuperior').attr("value","");
		$('#teamsuperiorID').attr("value","");
		$('#teamlevel').attr("value","");
		$("#teamid").attr("value","");
	$.closeDiv("inputDiv");
}
function search()
{
	loaddepartment();
}
function save()
{
	var teamid = $("#teamid").val();
	var adminId = $("#adminid").val();
	var teamname = $("#teamname").val();
	var teamsuperior = $("#teamsuperiorID").val();
	var superiorname=$("#teamsuperior").val();
	var teamlevel = $("#teamlevel").val();
	var sup = $("#teamsuperior").val();
	if(sup == null || sup == ""){ teamsuperior = -1; }
	if(teamsuperior==null || teamsuperior==""){
		teamsuperior=0;
	}
	if(teamlevel==null || teamlevel==""){
		teamlevel=0;
	}
	
	var formParam = $('#inputForm').serialize();
	var url = "${ctx}/department/department!saveToJson.htm";
	var data='teamid='+teamid+'&adminId='+adminId+'&teamname='+teamname+'&teamsuperior='+teamsuperior+'&teamlevel='+teamlevel+'&superiorname='+superiorname;
	
	$.webAjax( {
		type : "post",
		url : url,
		data:data,
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				$('#adminId').attr("value","");
				$('#teamname').attr("value","");
				$('#teamsuperiorID').attr("value","");
				$('#teamlevel').attr("value","");
			
				closeAddDiv();
				alert("操作成功");
				loaddepartment();
			}
		}
	});
}
function getdepartment(teamid)
{
	var url = "${ctx}/department/department!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:'departmentId='+teamid,
		success : function(data) {
			data = $.parseJSON(data);
			var model=data.model;
			$('#teamid').attr("value",model.teamid);
			$('#adminId').attr("value",(model.admin==null?"":model.admin.adminName));
			$('#adminid').attr("value",(model.adminId==null?"":model.adminId));
			$('#teamname').attr("value",model.teamname);
			$('#teamsuperior').attr("value",(model.superiorname==null?"":model.superiorname));
			$('#teamsuperiorID').attr("value",model.teamsuperior);
			$('#teamlevel').attr("value",model.teamlevel);
		
		}
	});	
	$.openDiv('inputDiv');
}

function cancel(){
				$('#adminId').attr("value","");
				$('#adminid').attr("value","");
				$('#teamname').attr("value","");
				$('#teamsuperior').attr("value","");
				$('#teamsuperiorID').attr("value","");
				$('#teamlevel').attr("value","");
			
}

function change(){
	document.getElementById("itemcodeDiv1").style.display="";
	
	var adminName = document.getElementById("adminId").value;
	
	var html='<td><select id="selectCode" onchange="changeCode();" style="width: 180px; height: 150px;background-color: gray"; multiple="true">';
	var url = "${ctx}/admin/admin!findAdminId.htm";
	 	$.webAjax({
					type : "post",
					url : url,
					data:'adminQuery.adminName='+adminName,
					success : function(data) {
									$.each(data,function(i,o){
										html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
									});
							html+='</select></td>';
							$('#selectsbody1').html(html);
					}
		});	
}

function changeCode(){
		var sel=document.getElementById("selectCode");
			for(var n=0;n<sel.options.length;n++){
				if(sel.options[n].selected){
				document.getElementById("adminId").value=sel.options[n].text;
				document.getElementById("adminid").value=sel.options[n].value;
				}
			}
			document.getElementById("itemcodeDiv1").style.display="none";
			
}

function enterCheck(){
	change();
}

//------------------------------------------------------------------------
var level = new Array();
function change2(){
	document.getElementById("itemcodeDiv2").style.display="";
	
	var teamname = document.getElementById("teamsuperior").value;
	
	var html='<td><select id="selectCode2" onchange="changeCode2();" style="width: 180px; height: 150px;background-color: gray"; multiple="true">';
	var url = "${ctx}/department/department!depNameList.htm";
	 	$.webAjax({
					type : "post",
					url : url,
					data:'departmentQuery.teamname='+teamname,
					success : function(data) {
									$.each(data,function(i,o){
										html+='<option value="'+o.teamid+'" >'+o.teamname+'</option>';
										level.push(o.teamlevel);
									});
							html+='</select></td>';
							$('#selectsbody2').html(html);
					}
		});	
}

function changeCode2(){
		var sel=document.getElementById("selectCode2");
			for(var n=0;n<sel.options.length;n++){
				if(sel.options[n].selected){
				document.getElementById("teamsuperior").value=sel.options[n].text;
				document.getElementById("teamsuperiorID").value=sel.options[n].value;
				document.getElementById("teamlevel").value=level[n]+1;
				level = new Array();
				}
			}
			document.getElementById("itemcodeDiv2").style.display="none";
			
}

function enterCheck2(){
	change2();
}

/**添加遮罩层*/
var xval, tval, bval, rval, lval;
function block_viewport() {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.1, text:'请稍等...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}

function erpDepData(){
	block_viewport();
	var url = "${ctx}/department/depTongERP.htm";
	$.webAjax( {
		type : "post",
		url : url,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0')
			{
				xval.remove();
			alert(data.resultInfo[1]);
			}else{
			xval.remove();
			alert(data.resultInfo[1]);
			}
		}
	});	
}

</script>
</head>
<body>
<div class="mr-content">
<form action="" name="queryForm" id="queryForm" method="post">
    <table cellspacing="0" cellpadding="0" border="0" class="datalist gridBody">
     <thead class="data-head">
<tr><th colspan="5">部门信息列表</th></tr>
<tr><th colspan="5">部门名称<input name="departmentQuery.teamname" class="inputall"/>
<input type="button" value="搜索" class="btnall" onclick="search()"/>
<input type="button" value="同步ERP数据" class="btnall" onclick="erpDepData()"/>
</th></tr>
<tr><th align="left" width="20"><input type="checkbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedarea')"/></th><th>负责人</th><th sortColumn="t_department.teamid">部门名称</th><th>上级部门</th><th>操作</th></tr>
</thead>
<tbody id="plantable" class="datalist">
</tbody>

</table>
</form>
</div>
<div><input type="button" value="添加" class="btnall" onclick="adddepartment()"/>
<input type="button" value="删除" class="btnall" onclick="del()"/></div>
<div class="mr-control" style="position:absolute; bottom:0; left:0; text-align:center;">
   <div class="pages">            		
   	<div class="ps-right">            	
   	<simpletable:pageToolbar page="${page}" id="departmentpage">
   	</simpletable:pageToolbar>            
   </div>
 </div>   
</div>
<div id="inputDiv" class="affirmlayer" style="display:none;top:150px;left:150px;">

<h2><b>部门管理</b><a class="butnOrange" onclick="closeAddDiv()"><span>关闭</span></a></h2>
<div style="height:auto;">

	<form id="inputForm" name="inputForm">
    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#FFFFFF">
      <tr>
        <td align="right">负责人：</td>
        <td><input  name="adminId" id="adminId" value="" onclick="change();" onkeyup="enterCheck();" onblur="changeCode();" class="inputall"/><input name="adminId" id="adminid" type="hidden" value="" /> <div id="itemcodeDiv1" style="position:absolute;width: 182px;height: 150px;background: #ccc;display: none; "><table><tbody id="selectsbody1"></tbody></table></div></td>
      </tr>
      <tr>
        <td align="right">部门名称：</td>
        <td><input  name="teamname" id="teamname" value="" class="inputall"/></td>
      </tr>
      <tr>
        <td align="right">上级部门：</td>
        <td><input  name="teamsuperior" id="teamsuperior" value="" onclick="change2();" onkeyup="enterCheck2();" onblur="changeCode2();" class="inputall"/><input name="teamsuperior" id="teamsuperiorID" type="hidden" value="" /> <div id="itemcodeDiv2" style="position:absolute;width: 182px;height: 150px;background: #ccc;display: none; "><table><tbody id="selectsbody2"></tbody></table></div></td>
      </tr>
      <tr>
        <td><input  name="teamlevel" id="teamlevel" type="hidden" value="" class="inputall"/></td>
      </tr>
    
      <tr><td><input type="hidden" name="" id="teamid" value="" /></td><td>&nbsp;</td></tr>
      <tr>
        <td align="center"><input class="btnall" type="button" name="button" id="button" value="确定" onclick="save()"/></td>
        <td align="center"><input class="btnall" type="button" name="button2" id="cancelbutton" value="重置"  onclick="cancel()"/></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
   	</form>
   
</div>

</div>


</body>
</html>
