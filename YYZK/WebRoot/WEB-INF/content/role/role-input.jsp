<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="/common/childrenHeader.jsp"%>
<script type="text/javascript">
<!--
$(document).ready(function() {
	
	//console.log('role id:' + roleId);
	getRole();
});

function getRole() {
	var roleId = '${param.roleId}';
	
	var url = ctx + '/role/role!input.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : 'roleId=' + roleId,
		success : function(data) {			
			if(data && data instanceof Object) {
				$('#roleId').val(data.roleId);
				$('#roleName').val(data.roleName);
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
								//idKey: "roleId",
								pIdKey: "pId",
								rootPId: 0
							}
						}
					};
				$.fn.zTree.init($('#authorityTree'), setting, data.authorityTreeList);
				$('#roleName').focus();
			}
		}
	});
}

function verifyForm() {
	var param = {};
	var roleId = $('#roleId').val();
	param['entity.roleId'] = roleId;
	
	var roleName = $.trim($('#roleName').val());
	if(roleName == '') {
		errorInfo('角色名称不能为空！');
		$('#roleName').focus();
		return null;
	} 
	param['entity.roleName'] = roleName;
	
	var treeObj = $.fn.zTree.getZTreeObj('authorityTree');
	var nodes = treeObj.getCheckedNodes(true);
	var cnt = 0;
	$.each(nodes, function(i, o){
		//console.log('node id: ' + o.id);
		if(o.id != 0) {
			param['entity.authorityIdList[' + cnt + ']'] = o.id;
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

	//console.log('param:' + $.toJSON(param));
	var url = ctx + '/role/role!save.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {			
			if(data && data == 'success') {
				gotoList();
			} else {
				errorInfo(data);
			}
		}
	});
}

function resetFrom() {
	getRole();
}


function errorInfo(info) {
	$('#error_info').html(info);
}

function gotoList() {
	window.location.href = ctx + '/role/role-list.htm';
}
-->
</script>
<form id="form">
            <div class="mr-control">
                <div class="mrc-left"></div>
                <div class="mrc-right"><input type="button" value="角色列表" class="btnred" onclick="gotoList()"/></div>
            </div>
            <div class="mr-content">
            	<div class="mb20 bb1b60005solid">
                    <ul class="tabs">
                        <li class="tabs-bar-cap">角色信息</li>
                    </ul>
                </div>
                <input type="hidden" class="inputall" id="roleId" name="roleId" />
                <table id="cont_1" cellspacing="0" cellpadding="0" border="0" class="nobdTB">
                    <tr style="display:;">
                        <td>&nbsp;</td>
                        <td id="error_info" class="fs11 fcRed"></td>
                    </tr>
                    <tr>
                        <td align="right" width="120">角色名称</td>
                        <td align="left">
                            <input type="text" class="inputall" id="roleName" name="roleName" />
                        </td>
                    </tr>                    
                    
                </table>
                <table id="cont_2" cellspacing="0" cellpadding="0" border="0" class="nobdTB" style="display:;">
                    <tr style="display:;">
                        <td class="fs11 fcRed" colspan="2">权限</td>
                    </tr>
                    <tr >
                        <td align="left">
                        	<ul id="authorityTree" class="ztree"></ul>
                        </td>
                    </tr>
                </table>
                
            </div>
            <div class="mr-control" style="position:absolute; bottom:0; left:0; text-align:center;">
                <input type="button" value="保存" class="btnall" onclick="submitForm()"/> <input type="button" value="重置" class="btnall" onclick="resetFrom()"/>
            </div>
   </form> 
 <%@ include file="/common/childrenFooter.jsp"%>