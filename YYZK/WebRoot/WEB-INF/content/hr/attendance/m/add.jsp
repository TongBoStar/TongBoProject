<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>WeUI</title>
    <link rel="stylesheet" href="${ctx}/resources/mobile/style/weui.min.css"/>
</head>
<body>
<div class="weui_cells_title">表单</div>
<div class="weui_cells weui_cells_form">
	<div class="weui_cell">
		<div class="weui_cell_hd"><label class="weui_label">qq</label></div>
		<div class="weui_cell_bd weui_cell_primary">
			<input class="weui_input" type="number" pattern="[0-9]*" placeholder="请输入qq号"/>
		</div>
	</div>
</div>
</body>
</html>