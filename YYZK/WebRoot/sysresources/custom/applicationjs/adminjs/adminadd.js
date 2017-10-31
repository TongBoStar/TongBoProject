$(document).ready(function() {
	loadOrgs();
	getAdmin();
});
function loadOrgs(){
	var url = ctx+"/organization/organization!listToQuery.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:'',
		success : function(data) {
			data = $.parseJSON(data);
			var html = "";
			$.each(data.organizationList,function(i,o){
				html+='<option value="'+o.id+'">'+replaceNull(o.orgName)+'</option>';
			});
			$('#orgId').html(html);
			closeblockdiv();
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
function submitForm() {
	var param = {};
	var adminName = $.trim($('#adminName').val());
	if(adminName == '') {
		alert('用户名称不能为空！');
		$('#adminName').focus();
		return null;
	} 
	var loginName = $.trim($('#loginName').val());
	if(loginName == '') {
		alert('登录名不能为空！');
		$('#loginName').focus();
		return null;
	} 

	var email= $.trim($('#email').val());
	if(email==null || email==""){
		alert("请填写邮箱地址");
		return null;
	}
	var status = $('#status').val();
	if(!status) {
		alert('状态不能为空！');
		return null;
	} 
	var treeObj = $.fn.zTree.getZTreeObj('rolesTree');
	var nodes = treeObj.getCheckedNodes(true);
	var cnt = 0;
	$.each(nodes, function(i, o){
		if(o.id != 0) {
			param['entity.roleIdList[' + cnt + ']'] = o.id;
			cnt++;
		}
	});
	param['entity.loginName'] = $('#loginName').val();
	param['entity.adminName'] = $('#adminName').val();
	param['entity.wxCode'] = $('#wxCode').val();
	param['entity.email'] = $('#email').val();
	param['entity.type'] = $('#type').val();
	param['entity.telNumber'] = $('#telNumber').val();
	param['entity.idType'] = $('#idType').val();
	param['entity.idCard'] = $('#idCard').val();
	param['entity.orgId'] = $('#orgId').val();
	param['entity.status'] = $('#status').val();
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
				alert("保存成功!");
				loadadmin();
			} else {
				alert("保存失败!");
			}
		}
	});
}

function resetFrom() {
	clearAddDiv();
}