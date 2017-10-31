<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>新增文件夹</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script>
var api = frameElement.api, W = api.opener;
$(document).ready(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/docrules/doc-rules!saveFolder.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success=="true"){
						api.close();
				    	W.reloadTree(W.zTree.getSelectedNodes(true)[0]);
					}else{
						W.$.dialog.alert(data.msg,function(){},api);
					}
				}
			});
			return false;
		}
	});
	$("#folderName").html(W.zTree.getSelectedNodes(true)[0].name);
	$("#parentId").val(W.zTree.getSelectedNodes(true)[0].id);
	$("#parentCode").val(W.zTree.getSelectedNodes(true)[0].code);
});
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">所属文件夹</th>
      			<td>
      				<s:label name="folderName" id="folderName" theme="simple" value="<s:property value='docRules.parentDocRules.name'/>"/>
      				<s:hidden name="docRules.parentId" id="parentId"></s:hidden>
      				<s:hidden name="docRules.parentCode" id="parentCode"></s:hidden>
      				<s:hidden name="docRules.id" id="id"></s:hidden>
      				<s:hidden name="docRules.code" id="code"></s:hidden>
      				<s:hidden name="docRules.isChildren" id="isChildren"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">名称</span></th>
      			<td>
      				<s:textfield name="docRules.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写文件夹名称！"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
</form>
</body>
</html>