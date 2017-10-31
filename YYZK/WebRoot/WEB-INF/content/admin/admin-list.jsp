<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>用户信息列表</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.all-3.1.min.js"></script>
<link href="${ctx}/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;font-size:14px;background:#E7EFF1;}
.titleh2{height:30px;border-bottom:1px solid #ccc;padding:0 10px;font-size:14px;margin:0 0px;color:#666;width:100%;}
.nobdTB{background:#fff;}
.nobdTB tr td{padding:0 5px 7px; font-size:12px; vertical-align:middle;}
input.inputall{border:1px #ccc solid; width:174px; height:20px;}
</style>
<script language="JavaScript" type="text/JavaScript"> 
$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'adminpage',
		formId: 'queryForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_admin.adminId',
		submitForm : submitadminForm//分页回调函数
	});
	loadadmin();
});

function submitadminForm(simpleTable, param){
	loadadmin();
}

/**
 * 查询管理员
 */
var m=0; 
function loadadmin() {
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx + '/admin/admin!listToJson.htm';
	var teamid="";
	var html = '';
	$.webAjax( {
		type : 'post',
		url : url,
		data :pageParam +'&'+formParam+'&'+teamid,
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
				$.refreshPageToolbar(page,"adminpage",simpleTable);
				$.each(page.result, function(i, o){
					html += '<tr>';
					html += '<td><input type="checkbox" id="checkedAdmin" name="checkedAdmin" value="' + o.adminId + '"/></td>';
					html += '<td>' + (o.adminCode!=null?o.adminCode:"") + '</td>';
					html += '<td>' + o.adminName + '</td>';
					html += '<td>'+(o.loginName!=null?o.loginName:"")+'</td>';
					html += '<td>'+(o.type==3?"系统用户":"云趣用户")+'</td>';
					html += '<td>'+(o.organization==null?"":o.organization.orgName)+'</td>';
					html += '<td>'+(o.telNumber!=null?o.telNumber:"")+'</td>';
					html += '<td><a href="javascript:void(0);" alt="+(o.wxCode!=null?o.wxCode:"")+">'+(o.wxCode!=null?o.wxCode.substring(0,10):"")+'</a></td>';
					html += '<td>'+(o.upUserName!=null?o.upUserName:"")+'</td>';
					html += '<td>' + formatDate("yyyy-MM-dd HH:mm:ss",o.lastLoginTime) + '</td>';	
					html += '<td>'+(o.issaleagree==1?"已签":"未签")+'</td>';				
					var status = '未知';
					if(o.status == 0) {
						status = '待审核';
					} else if(o.status == 1) {
						status = '审核失败';
					} else if(o.status == 2) {
						status = '锁定';
					} else if(o.status == 3) {
						status = '正常';
					}
					html += '	<td>' + status +'</td>';
					html += '</tr>';
				});
				$('#data-body').html(html);
				closeblockdiv();
		}
	});
}

/**
 * 添加管理员
 */
function addAdmin() {
	window.location.href=ctx+"/admin/admin-add.htm";
}

/**
 * 修改管理员
 */
function editAdmin(adminId) {
	var param = {};
	var editAdmins = $('[name="checkedAdmin"]:checked');
	var cnt = 0;
	var adminIdp;
	$.each(editAdmins, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		adminIdp = $(o).val();
		cnt++;
	});
	if(cnt>1){
		alert("一次只能编辑一个用户");
		return;
	}
	window.location.href=ctx+"/admin/admin-add.htm?adminId="+adminIdp;
}

/**
 * 删除管理员
 */
function delAdmin(adminId) {
	var param = {};
	if(adminId) {
		param['checkedIdList[0]'] = adminId;
	} else {		
		var delAdmins = $('[name="checkedAdmin"]:checked');
		var cnt = 0;
		$.each(delAdmins, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的用户！');
		return;
	}
	
	if(!confirm('确定删除用户？')) {
		return;
	}
	var url = ctx + '/admin/admin!delete.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			if(data && data == 'success') {
				loadadmin();
			} else {
				alert('删除用户失败！');
			}
		}
	});
}
function examineAdmin(){
	var adminId;
	var delAdmins = $('[name="checkedAdmin"]:checked');
	var cnt = 0;
	$.each(delAdmins, function(i, o){			
		adminId = $(o).val();
		cnt++;
	});
	if(!confirm('确定审核？')) {
		return;
	}
	var url = ctx + '/admin/admin!examineYunQuUser.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : "entity.adminId="+adminId,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("审核成功");
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
//用户新增
function getAdmin() {
	var url = ctx + '/admin/admin!addAdmin.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : '' ,
		success : function(data) {			
			if(data && data instanceof Object) {
				$('input[name="status"][value="' + data.status + '"]').attr("checked",true);
				var setting = {
						check: {
							enable: true,
							chkStyle: "checkbox",
							chkboxType: { "Y": "ps", "N": "s" }
						},
						data: {
							key:{
								name:'name'
							},
							simpleData: {
								enable: true,
								idKey: "roleId",
								pIdKey: "pId",
								rootPId: 0
							}
						}
					};
				$.fn.zTree.init($('#rolesTree'), setting, data.rolesTreeList);
				$('#adminName').focus();
			} else {
				alert(data);
			}
		}
	});
}
function clearAddDiv(){
	$('#error_info').html("");
	$('#adminName').val("");
	$('#loginName').val("");
	$('#password').val("");
	$('#confirmPassword').val("");
	$('#empcode').val("");
	$('#email').val("");
	$('input[name="status"]').removeAttr("checked");
}
function verifyForm() {
	var param = {};
	var adminName = $.trim($('#adminName').val());
	if(adminName == '') {
		alert('用户名称不能为空！');
		$('#adminName').focus();
		return null;
	} 
	param['entity.adminName'] = adminName;
	
	var loginName = $.trim($('#loginName').val());
	if(loginName == '') {
		alert('登录名不能为空！');
		$('#loginName').focus();
		return null;
	} 
	param['entity.loginName'] = loginName;

	if(!$('#tr_password').is(":hidden")) {
		var password =$.trim($('#password').val());
		if(password == '') {
			alert('密码不能为空！');
			$('#password').focus();
			return null;
		}
		var confirmPassword =$.trim($('#confirmPassword').val());
		if(confirmPassword == '') {
			alert('确认密码不能为空！');
			$('#confirmPassword').focus();
			return null;
		}
		if(confirmPassword != password) {
			alert('两次密码不一样！');
			$('#confirmPassword').focus();
			return null;
		}
		param['entity.password'] = password;
	}
	
	var empcode = $.trim($('#empcode').val());
	param['entity.empcode'] = empcode;
	var email= $.trim($('#email').val());
	if(email==null || email==""){
		alert("请填写邮箱地址");
		return null;
	}
	
	param['entity.email'] = email;
	var teamid=$('#teamid').val();
	param['entity.teamid']=teamid;
	if(teamid=='')
	{
		alert('请选择部门！');
		return null;
	}
	var status = $('input[name="status"]:checked').val();
	if(!status) {
		alert('状态不能为空！');
		$('input[name="status"][value="0"]').focus();
		return null;
	} 
	param['entity.status'] = status;
	
	var teamid=$('#form select[id="teamid"] option:selected').val();
	param['entity.teamid']=teamid;
	var treeObj = $.fn.zTree.getZTreeObj('rolesTree');
	var nodes = treeObj.getCheckedNodes(true);
	var cnt = 0;
	$.each(nodes, function(i, o){
		if(o.id != 0) {
			param['entity.roleIdList[' + cnt + ']'] = o.id;
			cnt++;
		}
		
	});
	return param;
}

function submitForm() {
	var param = verifyForm();
	if(!param) {
		return;
	}
	var url = ctx + '/admin/admin!save.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {			
			if(data && data == 'success') {
				closeDiv("inputDiv");
				loadadmin();
			} else {
				errorInfo(data);
			}
		}
	});
}

function resetFrom() {
	clearAddDiv();
}

function changePassword() {
	var condition = $('[id="switchingPassword"]:checked').val();
	if(condition) {
		$('#tr_password').show();
		$('#tr_confirmpassword').show();
	} else {
		$('#tr_password').hide();
		$('#tr_confirmpassword').hide();
	}
}
function initpwd(){
	var param = {};
	var delAdmins = $('[name="checkedAdmin"]:checked');
	var cnt = 0;
	$.each(delAdmins, function(i, o){			
		param['checkedIdList[' + cnt + ']'] = $(o).val();
		cnt++;
	});
	if(!param['checkedIdList[0]']) {
		alert('请选择要重置的用户！');
		return;
	}
	if(!confirm('确定重置密码?')) {
		return;
	}
	var url =ctx+"/usercenter/resetpwd.htm";
	$.webAjax( {
	type : 'post',
	url : url,
	data :param,
	success : function(data) {			
			if(data && data == 'success') {
				alert("密码重置成功！！");
			}else {
				errorInfo(data);
			}
		}
	});
}
</script>
</head>
<body style="height:600px;">
    <div style="height:100%;">
    	<%@ include file="/sysresources/common/topmsg.jsp"%>
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <%@ include file="/sysresources/common/top.jsp"%>
        <div id="wrapper">
            <%@ include file="/sysresources/common/menu.jsp"%>
            <div id="page-wrapper">
                <form action="" name="queryForm" id="queryForm" method="post">
				<div class="portlet box portlet-grey">
					<div class="portlet-header">
						<div class="caption">
							用户名称:<input type="text" class="input160"  name="adminQuery.adminName" />&nbsp;
							登录名:<input type="text" class="input160"  name="adminQuery.loginName" />&nbsp;
							状态:
							<select id="status" name="adminQuery.status" class="select80">
								<option value="">所有</option>
								<option value="0">待审核</option>
								<option value="1">被驳回</option>
								<option value="2">锁定</option>
								<option value="3">正常</option>
							</select> 
							<button id="searchbtn" type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-3px;" onclick="loadadmin();">搜索</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-3px;" onclick="addAdmin();">添加</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-3px;" onclick="editAdmin();">编辑</button>
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-3px;" onclick="delAdmin();">删除</button>
							<!-- <button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-3px;" onclick="examineAdmin();">审核</button> -->
							<button type="button" class="btn btn-info" style="border-radius:2px!important;margin-top:-3px;" onclick="initpwd();">初始化密码</button>
						</div>
						<div class="tools"><i class="fa fa-chevron-up"></i></i><i class="fa fa-times"></i></div>
					</div>
				</div>
                <div id="table-sorter-tab" class="tab-pane fade in active" style="overflow:auto; height:545px;width:100%px;margin-bottom:3px;">
					<div>
						<div class="col-lg-12">
							<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="min-width:1000px;width:100%;">
								<thead>
									<tr>
										<th align="left" width="20"><input type="checkbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedAdmin')" /></th>
										<th align="left" width="80">编号</th>
										<th align="left" width="80">姓名</th>
										<th align="left" width="100">登录名</th>
										<th align="left" width="60">用户类型</th>
										<th align="left" width="60">机构</th>
										<th align="left" width="80">手机号</th>
										<th align="left" width="80">微信号</th>
										<th align="left" width="60">上级</th>
										<th align="left" width="110">登录时间</th>
										<th align="left" width="50">是否协议</th>
										<th align="left" width="60">用户状态</th>
									</tr>
								</thead>
								<tbody id="data-body"></tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
			<div class="pages">            		
			   	<div class="ps-right">            	
				   	<simpletable:pageToolbar page="${page}" id="adminpage">
				   	</simpletable:pageToolbar>            
			   </div>
			</div>
        </div>
        <%@ include file="/sysresources/common/footer.jsp"%>
    </div>
    </div>
    <div id="inputDiv" class="affirmlayer" style="display: none; width: 580px;height: 620px;">
		<h2 syle="height:10%;">
			<b>用户信息</b>
			<a href="#" onclick="closeDiv('inputDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height:87%;overflow: auto;">
			<form action="" name="form" id="form" method="post">
				<div id="table-sorter-tab" class="tab-pane fade in active" >
                        <ul id="sliderTab" class="nav nav-tabs ul-edit">
                            <li class="active"><a href="#ui-slider-tab" data-toggle="tab">用户信息</a></li>
                            <li class=""><a href="#noui-slider-tab" data-toggle="tab">角色选择</a></li>
                        </ul>
                        <div id="sliderTabContent" class="tab-content pan">
                            <div id="ui-slider-tab" class="tab-pane fade active in">
                            	<table id="cont_1" cellspacing="0" cellpadding="0" border="0" class="nobdTB">
				                    <tr style="display:;">
				                        <td>&nbsp;</td>
				                        <td id="error_info" class="fs11 fcRed"></td>
				                    </tr>
				                    <tr>
				                        <td align="right" width="120">用户名称</td>
				                        <td align="left">
				                            <input type="text" class="inputall" id="adminName" name="adminName" /><font color="red">*</font>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td align="right">登录名</td>
				                        <td align="left"><input type="text" class="inputall" id="loginName" name="loginName" /><font color="red">*</font></td>
				                    </tr>
				                   
				                    <tr id="tr_password">
				                        <td align="right">密码</td>
				                        <td align="left"><input type="password" class="inputall" id="password" name="password"/><font color="red">*</font></td>
				                    </tr>
				                    <tr id="tr_confirmpassword">
				                        <td align="right">确认密码</td>
				                        <td align="left"><input type="password" class="inputall" id="confirmPassword" name="confirmPassword"/><font color="red">*</font></td>
				                    </tr>
				                    <tr>
				                    	<td align="right" width="120">用户编号</td>
				                        <td align="left">
				                            <input type="text" class="inputall" id="empcode" name="empcode" />
				                        </td>
				                    </tr>
				                    <tr>
				                    	<td align="right" width="120">邮箱</td>
				                        <td align="left">
				                            <input type="text" class="inputall" id="email" name="email" /><font color="red">*</font>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td align="right">部门</td>
				                        <td align="left"><select name="teamid" id="teamid" onchange="showparent();" class="selectall"><option value="">----</option></select></td>
				                    </tr>
				                    <tr>
				                        <td align="right">状态</td>
				                        <td align="left"><input type="radio" name="status" value="0" checked="checked" />正常<input type="radio" name="status" value="1"/>锁定<label id="status-error"></label></td>
				                    </tr>
				                </table>
                            </div>
                            <div id="noui-slider-tab" class="tab-pane fade">
                            	<table id="cont_2" cellspacing="0" cellpadding="0" border="0" class="nobdTB" style="display:;">
			                    <tr style="display:;">
			                        <td class="fs11 fcRed" colspan="2">角色</td>
			                    </tr>
			                    <tr >
			                        <td align="left" id="rolesTree" class="ztree"></td>
			                    </tr>
			                </table>
                            </div>
                        </div>
                 </div>
				<input type="hidden" id="hiddenid" name="id"/>
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