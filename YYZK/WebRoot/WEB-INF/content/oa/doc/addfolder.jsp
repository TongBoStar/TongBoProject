<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>新增文件夹</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
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
				url: "${ctx}/doc/doc!saveFolder.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success=="true"){
						//公司简介素材
						$.ajax({
							type: "post",
							url: '${ctx}/doc/doc!list.htm?docQuery.pCode='+data.code,
							dataType: "json",
							async: false,
							success:function(listData,listTextStatus){
								W.$.dialog.alert('新建文件夹成功！',function(){
									//默认列表形式展开
									api.close();
									W.reloadTree();
									files = new Backbone.Collection(listData.rows);
									W.setFiles(listData.rows);
									W.setListType('list',files);
								});
							}
						});
					}else{
						W.$.dialog.alert(data.msg,function(){},api);
					}
				}
			});
			return false;
		}
	});
	$("#folderName").html(W.zTree.getSelectedNodes(true)[0].name);
	$("#pId").val(W.zTree.getSelectedNodes(true)[0].id);
	$("#pCode").val(W.zTree.getSelectedNodes(true)[0].code);
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
      				<s:label name="folderName" id="folderName" theme="simple" value="<s:property value='doc.parentDoc.name'/>"/>
      				<s:hidden name="doc.pId" id="pId"></s:hidden>
      				<s:hidden name="doc.pCode" id="pCode"></s:hidden>
      				<s:hidden name="doc.id" id="id"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">名称</span></th>
      			<td>
      				<s:textfield name="doc.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写文件夹名称！"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
</form>
</body>
</html>