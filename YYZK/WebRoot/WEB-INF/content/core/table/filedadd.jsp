<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>表字段信息列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
$(function (){
	$('#tableName').val('${param.tableName}');
	
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/table/table!fieldSave.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success=="true"){
						api.close();
						//W.zindex();
						//W.reloadDatagrid();
						//api.get('CLHG1976D').zindex();
						api.get('CLHG1976D').reloadDatagrid();
						api.get('CLHG1976D').focus();
					}else{
						W.$.dialog.alert(data.msg,function(){},api);
					}
				}
			});
			return false;
		}
	});
});
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">字段名<span class="star">*</span></th>
      			<td>
        			<s:textfield name="tableField.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写字段名！"></s:textfield>
        			<s:hidden name="tableField.id" id="id"></s:hidden>
        			<s:hidden name="tableField.tableName" id="tableName"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">字段类型<span class="star">*</span></th>
      			<td>
        			<s:select name="tableField.dataType" id="dataType" theme="simple"  list="#{'int':'int','datetime':'datetime','bigint':'bigint','nvarchar':'nvarchar','varchar':'varchar','bit':'bit'}" headerValue="请选择字段类型" value="%{tableField.dataType}"></s:select>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">字段长度<span class="star">*</span></th>
      			<td>
        			<s:textfield name="tableField.length"  id="length" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">是否主键<span class="star">*</span></th>
      			<td>
      				<s:radio list="#{'1':'是','0':'否'}" theme="simple" name="tableField.isPrimaryKey" id="isPrimaryKey" value="%{tableField.isPrimaryKey}"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">描述<span class="star">*</span></th>
      			<td>
        			<s:textfield name="tableField.description"  id="description" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">顺序<span class="star">*</span></th>
      			<td>
        			<s:textfield name="tableField.sort"  id="sort" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">标题<span class="star">*</span></th>
      			<td>
        			<s:textfield name="tableField.title"  id="title" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">表单显示<span class="star">*</span></th>
      			<td>
      				<s:radio list="#{'1':'是','0':'否'}" theme="simple" name="tableField.isForm" id="isForm" value="%{tableField.isForm}"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">列表显示<span class="star">*</span></th>
      			<td>
        			<s:radio list="#{'1':'是','0':'否'}" theme="simple" name="tableField.isList" id="isList" value="%{tableField.isList}"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">bean显示<span class="star">*</span></th>
      			<td>
        			<s:radio list="#{'1':'是','0':'否'}" theme="simple" name="tableField.isBean" id="isBean" value="%{tableField.isBean}"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">验证规则<span class="star">*</span></th>
      			<td>
        			<s:textfield name="tableField.validform"  id="validform" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">输入类型<span class="star">*</span></th>
      			<td>
        			<s:select name="tableField.inputType" id="inputType" theme="simple"  list="#{'textarea':'textarea','text':'text'}" headerValue="请选择输入类型" value="%{tableField.inputType}"></s:select>
        		</td>
        	</tr>
		</table>
	</div>
</form>
</body>
</html>