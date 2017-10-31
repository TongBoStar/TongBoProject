<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>批量更新部门</title>
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
$(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/emp/emp!updateRole.htm",
				data:{"empRole.roleId":$("#roleId").val(),"empRole.empIds":W.getIds()},
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					api.close();
					W.reloadDatagrid();
				}
			});
			return false;
		}
	});	
});

function selRole(){
	var role = W.$.dialog({
		content: 'url:${ctx}/core/role/selrole.htm',
		lock: true,
		title:'角色角色',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	    	$("#roleName").val(delLastChar(role.content.$("#hidTreeName").val(),","));
	    	$("#roleId").val(delLastChar(role.content.$("#hidTreeId").val(),","));
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
   				<th class="my-w80"><span class="star">角色</span></th>
      			<td>
      				<s:textfield name="roleName"  id="roleName" theme="simple" style="width: 300px;" ></s:textfield>&nbsp;<a href="javascript:void(0);" onclick="selRole();">选择</a>
      				<s:hidden name="roleId" id="roleId" datatype="*" nullmsg="请选择角色！"></s:hidden>
      				<s:hidden name="empIds" id="empIds"/>
        		</td>
        	</tr>
		</table>
	</div>
</form>
</body>
</html>