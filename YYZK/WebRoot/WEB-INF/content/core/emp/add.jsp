<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>用户信息添加</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- otherjs -->
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<script src="${ctx}/resources/plugins/other/jQuery.Hz2Py-min.js" type="text/javascript"></script>
<script>
var api = frameElement.api, W = api.opener;
$(function(){
	$("#userName").on("keyup keydown change blur",function (){
        $("#loginName").val(($(this).toPinyin().toLocaleLowerCase()).replace(/\ +/g,""));
    });
	
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/emp/emp!save.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success=="true"){
						if(data.type=="add"){
							$.messager.defaults = { ok: "继续添加", cancel: "返回列表" };
							$.messager.confirm('提示', '新增用户成功！是否继续添加？', function(r){
								if(r){
									myform.resetForm();
								}else{
									api.close();
									W.reloadDatagrid();
								}
							});
						}else{
							$.messager.confirm('提示', "修改联系人成功！", function(r){
								api.close();
								W.reloadDatagrid();
							});
						}
					}else{
						
					}
				}
			});
			return false;
		}
	});	
});

function selDept(){
	var dept = W.$.dialog({
		content: 'url:${ctx}/core/dept/seldept.htm',
		lock: true,
		title:'部门选择',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	    	$("#deptNames").val(dept.content.$("#hidTreeName").val());
	    	$("#deptIds").val(dept.content.$("#hidTreeId").val());
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});	
}

function selRole(){
	var role = W.$.dialog({
		content: 'url:${ctx}/core/role/selrole.htm',
		lock: true,
		title:'部门角色',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	    	$("#roleNames").val(role.content.$("#hidTreeName").val());
	    	$("#roleIds").val(role.content.$("#hidTreeId").val());
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});	
}
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80"><span class="star">用户名</span></th>
      			<td>
        			<s:textfield name="emp.userName"  id="userName" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写用户名称！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80"><span class="star">登录名</span></th>
      			<td>
          			<s:textfield name="emp.loginName"  id="loginName" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写用户登录名称！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80"><span class="star">密码</span></th>
      			<td>
      				<s:textfield name="emp.password"  id="password" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写登录密码！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">邮箱</th>
      			<td>
      				<s:textfield name="emp.email"  id="email" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80"><span class="star">部门</span></th>
      			<td>
      				<s:textfield name="emp.deptNames"  id="deptNames" theme="simple" style="width: 300px;" ></s:textfield>&nbsp;<a href="javascript:void(0);" onclick="selDept();">选择</a>
      				<s:hidden name="emp.deptIds" id="deptIds" datatype="*" nullmsg="请选择部门！"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80"><span class="star">角色</span></th>
      			<td>
      				<s:textfield name="emp.roleNames"  id="roleNames" theme="simple" style="width: 300px;" ></s:textfield>&nbsp;<a href="javascript:void(0);" onclick="selRole();">选择</a>
      				<s:hidden name="emp.roleIds" id="roleIds" datatype="*" nullmsg="请选择角色！"></s:hidden>
        		</td>
        	</tr>
		</table>
	</div>
	<s:hidden name="emp.id" id="id"></s:hidden>
</form>
</body>
</html>