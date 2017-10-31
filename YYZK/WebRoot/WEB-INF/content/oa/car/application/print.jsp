<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script>
$(function () {
	
});
</script>
<title>打印</title>

<style type="text/css">
body{
	font-family:"微软雅黑";
	margin: 0;
	padding: 0;
}
h1{
    display: block;
    font-size: 2em;
    -webkit-margin-before: 0.5em;
    -webkit-margin-after: 0.5em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    font-weight: bold;
}
table.gridtable {
	font-size:14px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}

table td.tdstrong{
font-weight: bold;
}
</style>
</head>
<body>
<table align="center" >
	<tr heigth="50%">
		<td>
			<s:property value="strTable" escape="false"/>
		</td>
	</tr>
	<tr heigth="50%">
		<td>
			<s:property value="strTable" escape="false"/>
		</td>
	</tr>
</table>
</body>
</html>