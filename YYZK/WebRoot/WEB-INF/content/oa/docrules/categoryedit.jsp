<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script>
var api = frameElement.api, W = api.opener;
var uploader;
$(function(){
    var myform=$("#form").Validform({
		btnSubmit:"#btn_sub",
		btnReset:"#btn_reset",
		tiptype:3,
		callback:function(){
        	$.ajax({
    			type: "post",
    			url: "${ctx}/docrules/doc-rules!saveCategory.htm",
    			data:$('#form').serialize(),
    			dataType: "json",
    			async: false,
    			success:function(data,textStatus){
    		    	api.close();
    		    	W.reloadGridTree();
    			}
    		});
			
			return false;
		}
	});
});

function selCategory(){
	var categoryDlg = W.$.dialog({
		content: 'url:${ctx}/oa/docrules/selcategory.htm',
		lock: true,
		title:'分类选择',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	        $("#parentId").val(categoryDlg.content.$("#hidTreeId").val());
	        $("#parentName").val(categoryDlg.content.$("#hidTreeName").val());
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}
</script>
<style type="text/css">
#thelist{
height: 65px !important;
}
</style>
</head>
<body>
<form class="my-form" id="form" method="post">
	<input type="hidden" id="btn_sub" class="btn_sub"/>
	<div class="content-left">
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">所属文件夹</th>
      			<td>
      				<s:textfield name="docRulesCategory.parentDocRulesCategory.name"  id="parentName" theme="simple" style="width: 395px;"></s:textfield>&nbsp;<a  href="javascript:void(0)" onclick="selCategory()">选择</a>
        			<s:hidden name="docRulesCategory.parentId" id="parentId"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">类型</th>
      			<td>
      				<s:select name="docRulesCategory.type" id="type" theme="simple"  list="#{'1':'企业外部分类','2':'企业标准体系'}" headerValue="请选择是否有效" value="%{docRulesCategory.type}"></s:select>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">名称</th>
      			<td>
      				<s:textfield name="docRulesCategory.name"  id="name" theme="simple" style="width: 395px;" datatype="*" nullmsg="请填写名称！"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
	<s:hidden name="docRulesCategory.id"></s:hidden>
</form>

</body>
</html>