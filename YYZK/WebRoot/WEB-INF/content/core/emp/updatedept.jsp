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
				url: "${ctx}/emp/emp!updateDept.htm",
				data:{"empDept.deptId":$("#deptId").val(),"empDept.empIds":W.getIds()},
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

function selDept(){
	var dept = W.$.dialog({
		content: 'url:${ctx}/core/dept/seldept.htm',
		lock: true,
		title:'部门选择',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	    	$("#deptName").val(dept.content.$("#hidTreeName").val());
	    	$("#deptId").val(dept.content.$("#hidTreeId").val());
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
   				<th class="my-w80"><span class="star">部门</span></th>
      			<td>
      				<s:textfield name="deptName"  id="deptName" theme="simple" style="width: 300px;" ></s:textfield>&nbsp;<a href="javascript:void(0);" onclick="selDept();">选择</a>
      				<s:hidden name="deptId" id="deptId" datatype="*" nullmsg="请选择部门！"></s:hidden>
      				<s:hidden name="empIds" id="empIds"/>
        		</td>
        	</tr>
		</table>
	</div>
</form>
</body>
</html>