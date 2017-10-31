<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>表信息添加</title>
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
<script>
var api = frameElement.api, W = api.opener;
$(function () {
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/table/table!infoSave.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success=="true"){
						api.close();
						W.reloadDatagrid();
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
   				<th class="my-w80"><span class="star">表名</span></th>
      			<td>
      				<s:textfield name="tableInfo.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写表名！"></s:textfield>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">包名</span></th>
      			<td>
        			<s:textfield name="tableInfo.packageName"  id="packageName" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写包名！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">首字母大写</th>
      			<td>
        			<s:textfield name="tableInfo.upperName"  id="upperName" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">首字母小写</th>
      			<td>
        			<s:textfield name="tableInfo.lowerName"  id="lowerName" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
</form>
</body>
</html>