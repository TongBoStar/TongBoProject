<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- date -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- ztree -->
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>通讯录管理</title>
<script type="text/javascript">
var api = frameElement.api, W = api.opener;
$(function(){
	var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/addressbook/address-book!save.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.type=="add"){
						$.messager.defaults = { ok: "继续添加", cancel: "返回列表" };
						$.messager.confirm('提示', '新增联系人成功！是否继续添加？', function(r){
							if(r){
								myform.resetForm();
							}else{
								api.close();
								W.reloadDatagrid($("#treeId").val());
							}
						});
					}else{
						$.messager.confirm('提示', "修改联系人成功！", function(r){
							api.close();
							W.reloadDatagrid($("#treeId").val());
						});
					}
				}
			});
			return false;
		}
	});
});

function selTree(){
	var demo = W.$.dialog({
		content: 'url:${ctx}/oa/addressbook/seltree.htm',
		lock: true,
		width: 260,
	    height: 410,
	    parent:api,
	    ok: function(){
	    	$("#treeName").val(demo.content.$("#hidTreeName").val());
	    	$("#treeId").val(demo.content.$("#hidTreeId").val());
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
   				<th class="my-w80"><span class="star">分组</span></th>
      			<td>
      				<input type="text" style="width: 300px;" name="treeName"  id="treeName" value="<s:property value='addressBookItem.addressBookTree.name'/>">&nbsp;<a href="javascript:void(0);" onclick="selTree();">选择</a>
        			<s:hidden name="addressBookItem.treeId" id="treeId"  datatype="*" nullmsg="请选择分组！"></s:hidden>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80"><span class="star">姓名</span></th>
      			<td>
        			<s:textfield name="addressBookItem.name"  id="name" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写联系人姓名！"></s:textfield>
        			<s:hidden name="addressBookItem.id" id="id"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">电话区号</th>
      			<td>
        			<s:textfield name="addressBookItem.telQuHao"  id="telQuHao" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">电话号码</th>
      			<td>
        			<s:textfield name="addressBookItem.telHaoMa"  id="telHaoMa" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">电话分机</th>
      			<td>
        			<s:textfield name="addressBookItem.telFenJi"  id="telFenJi" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">电话内线</th>
      			<td>
        			<s:textfield name="addressBookItem.telNeiXian"  id="telNeiXian" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">手机号码</th>
      			<td>
        			<s:textfield name="addressBookItem.mobileHaoMa"  id="mobileHaoMa" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">手机短号</th>
      			<td>
        			<s:textfield name="addressBookItem.mobileDuanHao"  id="mobileDuanHao" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">传真区号</th>
      			<td>
        			<s:textfield name="addressBookItem.faxQuHao"  id="faxQuHao" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">传真号码</th>
      			<td>
        			<s:textfield name="addressBookItem.faxHaoMa"  id="faxHaoMa" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">邮箱</th>
      			<td>
        			<s:textfield name="addressBookItem.email"  id="email" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">通信地址</th>
      			<td>
        			<s:textfield name="addressBookItem.address"  id="address" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">邮编</th>
      			<td>
        			<s:textfield name="addressBookItem.zipcode"  id="zipcode" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">备注</th>
      			<td>
        			<s:textfield name="addressBookItem.remark"  id="remark" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
</form>
</body>
</html>