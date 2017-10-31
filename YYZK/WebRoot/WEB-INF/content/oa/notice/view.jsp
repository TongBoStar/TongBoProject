<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/defaultform.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- otherjs -->
<script type="text/javascript" src="${ctx}/resources/js/util.js"></script>
<script src="${ctx}/resources/plugins/other/jQuery.Hz2Py-min.js" type="text/javascript"></script>
<!--  -->
<script type="text/javascript" src="${ctx}/resources/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
h1.post-title{
background: none repeat scroll 0 0 #F9F9F9;
    border: 1px dashed #CCCCCC;
    padding: 5px;
    color: #ff6100;
    font-size: 16px;
    height: 33px;
    line-height: 33px;
    overflow: hidden;
    font-weight: bold;
    margin-bottom: 20px;
}
div.post-meta{
}

div.post-content {
    color: #454545;
    font-size: 14px;
    line-height: 20px;
}

div.post-content p {
    color: #666;
    font-size: 14px;
    line-height: 25px;
    margin-bottom: 15px;
    word-wrap: break-word;
}
</style>
</head>
<body>
<h1 class="post-title" style="text-align:center"><s:property value='notice.title'/></h1>

<div class="post-content">
<s:property value='notice.contents' escape="false"/>
</div>

</body>
</html>