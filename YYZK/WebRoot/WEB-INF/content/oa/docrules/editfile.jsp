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
			//验证文件是否同名
        	$.ajax({
    			type: "post",
    			url: "${ctx}/docrules/doc-rules!saveItem.htm",
    			data:$('#form').serialize()+"&docRulesItem.parentId1="+$("#parentId1").val()+"&docRulesItem.parentId2="+$("#parentId2").val(),
    			dataType: "json",
    			async: false,
    			success:function(data,textStatus){
    				if(${param.type}==1){
    		    		//选中企业分类
    		    		node = W.zTree.getNodeByParam("id", $("#parentId1").val(), null);
    		    	}else{
    		    		//2 选中标准体系分类
    		    		node = W.zTree.getNodeByParam("id", $("#parentId2").val(), null);
    		    	}
    		    	api.close();
    		    	W.reloadTree(node);
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
	    	$("#userIds").val(delLastChar(selids,","));
	    	$("#userNames").val(delLastChar(selnames,","));
	        //return false;
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}

function selCategory(type){
	var category = W.$.dialog({
		content: 'url:${ctx}/oa/docrules/selcategory.htm?type='+type,
		lock: true,
		title:'分类选择',
		width: 240,
	    height: 390,
	    parent:api,
	    ok: function(){
	        $("#parentName"+type).val(category.content.$("#hidTreeName").val());
	        $("#parentId"+type).val(category.content.$("#hidTreeId").val());
	        $("#parentCode"+type).val(category.content.$("#hidTreeCode").val());
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
   				<th class="my-w80">标准体系</th>
      			<td colspan="3">
      				<s:textfield name="docRulesItem.docRulesRelation2.docRulesCategory.name"  id="parentName2" theme="simple" style="width: 195px;" datatype="*" nullmsg="请选择标准体系！"></s:textfield>&nbsp;<a  href="javascript:void(0)" onclick="selCategory(2)">选择</a>
      				<s:hidden name="docRulesItem.docRulesRelation2.docRulesCategory.id" id="parentId2"></s:hidden>
      				<s:hidden name="docRulesItem.docRulesRelation2.docRulesCategory.code" id="parentCode2"></s:hidden>
      				<s:hidden name="docRulesItem.docRulesRelation2.docRulesCategory.type" id="type2"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">外部分类</th>
      			<td colspan="3">
      				<s:textfield name="docRulesItem.docRulesRelation1.docRulesCategory.name"  id="parentName1" theme="simple" style="width: 195px;" datatype="*" nullmsg="请选择标准体系！"></s:textfield>&nbsp;<a  href="javascript:void(0)" onclick="selCategory(1)">选择</a>
      				<s:hidden name="docRulesItem.docRulesRelation1.docRulesCategory.id" id="parentId1"></s:hidden>
      				<s:hidden name="docRulesItem.docRulesRelation1.docRulesCategory.code" id="parentCode1"></s:hidden>
      				<s:hidden name="docRulesItem.docRulesRelation1.docRulesCategory.type" id="type1"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">文件名</th>
      			<td colspan="3">
      				<s:textfield name="docRulesItem.oldName"  id="oldName" theme="simple" style="width: 395px;" datatype="*" nullmsg="请填写文件名称！"></s:textfield>
        		</td>
        	</tr>
			<tr>
   				<th class="my-w80">发放范围</th>
      			<td colspan="3">
      				<s:textarea id="userNames" name="docRulesItem.userNames"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
      				<s:hidden name="docRulesItem.userIds" id="userIds"></s:hidden>
      				&nbsp;<a  href="javascript:void(0)" onclick="selUsers()">选择</a>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80"><span class="star">文件编号</span></th>
      			<td>
          			<s:textfield name="docRulesItem.number"  id="number" theme="simple" style="width: 195px;" datatype="*" nullmsg="请填写文件编号！"></s:textfield>
        		</td>
        		<th class="my-w80"><span class="star">版次</span></th>
      			<td>
          			<s:textfield name="docRulesItem.revision"  id="revision" theme="simple" style="width: 195px;" datatype="/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]+$/" nullmsg="请填写版次！" errormsg="不能包含特殊字符！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">生效日期</th>
      			<td>
          			<s:textfield name="docRulesItem.effectiveDate"  id="effectiveDate" theme="simple" style="width: 195px;"></s:textfield>
        		</td>
        		<th class="my-w80">采用标准</th>
      			<td>
          			<s:textfield name="docRulesItem.adoptStandard"  id="adoptStandard" theme="simple" style="width: 195px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">是否有效</th>
      			<td>
          			<s:select name="docRulesItem.isEffective" id="isEffective" theme="simple"  list="#{'true':'有效','false':'无效'}" headerValue="请选择是否有效" value="%{docRulesItem.isEffective}"></s:select>
        		</td>
        		<th class="my-w80">&nbsp;</th>
      			<td>
          			&nbsp;
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">备注</th>
      			<td colspan="3">
          			<s:textfield name="docRulesItem.remark"  id="remark" theme="simple" style="width:500px;"></s:textfield>
        		</td>
        	</tr>
        </table>
	</div>
	<s:hidden name="docRulesItem.id"></s:hidden>
</form>

</body>
</html>