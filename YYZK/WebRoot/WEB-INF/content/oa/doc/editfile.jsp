<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- date -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- upload -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/webuploader/style.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/webuploader/webuploader.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<script>
var api = frameElement.api, W = api.opener;
$(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/doc/doc!saveFile.htm",
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
});

function selUsers(){
	var demo = W.$.dialog({
		content: 'url:${ctx}/core/emp/selemp.htm',
		lock: true,
		title:'人员选择',
		width: 750,
	    height: 410,
	    parent:api,
	    ok: function(){
	    	var selids="",selnames="";
	    	$.each(demo.content.$("#selusers").find("option"),function(i,value){
				selids = selids + value.value+",";
				selnames = selnames + value.text+",";
			});
	    	//alert(selids+selnames);
	    	$("#userIds").val(delLastChar(selids,","));
	    	$("#userNames").val(delLastChar(selnames,","));
	        //return false;
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
   				<th class="my-w80">所属文件夹</th>
      			<td>
      				<label id="folderName"><s:property value="doc.parentDoc.name"/></label>
      				<s:hidden name="doc.pId" id="pId"></s:hidden>
      				<s:hidden name="doc.pCode" id="pCode"></s:hidden>
      				<s:hidden name="doc.id" id="id"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">文件名</th>
      			<td>
      				<s:textfield name="doc.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写文件名！"></s:textfield>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80">发放范围</th>
      			<td>
      				<s:textarea id="userNames" name="doc.userNames"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
      				<s:hidden name="doc.userIds" id="userIds"></s:hidden>
      				&nbsp;<a  href="javascript:void(0)" onclick="selUsers()">选择</a>
        		</td>
        	</tr>
        </table>
	</div>
</form>

</body>
</html>