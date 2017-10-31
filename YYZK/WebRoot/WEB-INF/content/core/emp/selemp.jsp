<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<style type="text/css">
ul.ztree {border: 1px solid #617775;width:220px;height:360px;overflow-y:scroll;overflow-x:auto;}
</style>
<script type="text/javascript">
$(function () {
	$.ajax({
		type: "post",
		url: '${ctx}/system/listteam.htm',
		async: false,
		success: function (data, textStatus) {
			data = $.parseJSON(data);
			var setting = {	
				data: {
					key:{
						name: "teamname"
					},
					simpleData: {
						enable: true,
						idKey: "teamid"
					}
				},
				callback:{
					onClick:function(event, treeId, treeNode) {
						//alert(treeNode.teamid);
						$.ajax({
							type: "post",
							url:'${ctx}/system/adminList.htm',
							//url: '${ctx}/emp/emp!noPageList.htm',
							data:{'adminQuery.teamid':treeNode.teamid},
							//dataType: "json",
							async: false,
							success: function (data, textStatus) {
								//data = $.parseJSON(data);
								$("#unselusers").empty();
								$.each(data,function(i,value){
									 $("#unselusers").append("<option value='"+value.adminId+"'>"+value.adminName+"</option>")
								});
							}
						});	
					}
				}
			};
			var zNodes =data.departmentList;
			$.fn.zTree.init($("#treedept"), setting, zNodes);
		}
	});
	
	/*
	$.ajax({
		type: "post",
		url: '${ctx}/dept/dept!list.htm',
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			var setting = {	
				data: {
					simpleData: {
						enable: true,
						pIdKey:"pId"
					}
				},
				callback:{
					onClick:function(event, treeId, treeNode) {
						$.ajax({
							type: "post",
							url: '${ctx}/emp/emp!noPageList.htm',
							data:{'empQuery.deptId':treeNode.id},
							dataType: "json",
							async: false,
							success: function (data, textStatus) {
								$("#unselusers").empty();
								$.each(data.rows,function(i,value){
									 $("#unselusers").append("<option value='"+value.id+"'>"+value.userName+"</option>")
								});
							}
						});	
					}
				}
			};
			var zNodes =data.rows;
			$.fn.zTree.init($("#treedept"), setting, zNodes);
		}
	});
	*/
	
	$("#btnSel").click(function(){
		$.each($("#unselusers").find("option:selected"),function(i,value){
			$("#selusers option[value='0']").remove();
			$("#selusers").append(value);
		});
	});
	
	$("#unselusers").dblclick(function(){
		$.each($("#unselusers").find("option:selected"),function(i,value){
			$("#selusers option[value='0']").remove();
			$("#selusers").append(value);
		});
	});
	
	$("#btnRemove").click(function(){
		$.each($("#selusers").find("option:selected"),function(i,value){
			$("#selusers option[value='"+value.value+"']").remove();
		});
	});
	
	$("#seach").click(function(){
		$.ajax({
			type: "post",
			url:'${ctx}/system/adminList.htm',
			//url: '${ctx}/emp/emp!noPageList.htm',
			data:{'adminQuery.adminName':$("#userName").val()},
			//dataType: "json",
			async: false,
			success: function (data, textStatus) {
				//data = $.parseJSON(data);
				$("#unselusers").empty();
				$.each(data,function(i,value){
					 $("#unselusers").append("<option value='"+value.adminId+"'>"+value.adminName+"</option>")
				});
			}
		});	
	});
});
</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="3">
				用户名：<input type="text" id="userName" name="userName">&nbsp;&nbsp;<input type="button" id="seach" value="搜索" name="seach">
			</td>
		</tr>
		<tr>
			<td valign="top">
				<ul id="treedept" class="ztree"></ul>
			</td>
			<td valign="top">
				<select multiple="multiple" id="unselusers" style="height:372px;width:220px;border: 1px solid #617775;">
					<option value="0">请选择用户部门</option>
				</select>
				
			</td>
			<td align="center">
				<input type="button" value="选择" id="btnSel"/><br/><br/>
				<input type="button" value="移除" id="btnRemove"/><br/>
			</td>
			<td valign="top">
				<select multiple="multiple" id="selusers" style="height:372px;width:220px;border: 1px solid #617775;">
					<option value="0">请选择用户</option>
				</select>
			</td>
		</tr>
	</table>
</body>
</html>