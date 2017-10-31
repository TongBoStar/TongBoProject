<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>部门选择</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<style type="text/css">
ul.ztree {border: 1px solid #617775;width:220px;height:360px;overflow-y:scroll;overflow-x:auto;}
</style>
<script type="text/javascript">
var zTree;
$(function(){
	$.ajax({
		type: "post",
		url: '${ctx}/docrules/doc-rules!treeGridCategory.htm?docRulesCategoryQuery.type=${param.type}',
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			var setting = {	
				data: {
					key:{
						name:"name"
					},
					simpleData:{
						enable:true,
						idKey:"id",
						pIdKey:"parentId",
						rootPId: 0
					}
				},
				callback:{
					onClick:function(event, treeId, treeNode) {
						$("#hidTreeId").val(treeNode.id);
						$("#hidTreeName").val(treeNode.name);
						$("#hidTreeCode").val(treeNode.code);
						$("#hidTreeType").val(treeNode.type);
					}
				}
			};
			zTree = $.fn.zTree.init($("#treedept"), setting, data);
		}
	});
});
</script>
</head>
<body>
	<table>
		<tr>
			<td valign="top">
				<ul id="treedept" class="ztree"></ul>
			</td>
		</tr>
		<input style="display:none" id="hidTreeId" />
		<input style="display:none" id="hidTreeName" />
		<input style="display:none" id="hidTreeCode" />
		<input style="display:none" id="hidTreeType" />
	</table>
</body>
</html>