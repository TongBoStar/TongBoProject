<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文档搜索</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/doc/css/style.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- curdtools -->
<script type="text/javascript" src="${ctx}/resources/js/curdtools.js"></script>
<script>
$(function(){
	$("#search-button").click(function(){
		window.location.href="${ctx}/oa/doc/searchlist.htm?searchWords="+$("#input").val();
	});
});
</script>
<style>
body {
  text-align: center;
}
#main {
    clear: both;
    margin: auto;
    padding-bottom: 75px;
    padding-top: 63px;
    width: 880px;
}

#search{
    background: #fff none repeat scroll 0 0;
    height: 44px;
    position: relative;
    width: 524px;
    z-index: 9;
    margin-left: 115px;
}
#suggest-align {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #fff;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    height: 34px;
    padding: 4px 6px 4px 12px;
    position: relative;
    vertical-align: top;
    border: 1px solid #bbb;
    box-shadow: none;
}


#input {
    background: #fff none repeat scroll 0 0;
    border: medium none;
    color: #333;
    float: left;
    font-size: 16px;
    height: 30px;
    margin-top: 3px;
    outline: medium none;
    width: 500px;
}

#search-button {
    background: #4873b9 none repeat scroll 0 0;
    border: 1px solid #4873b9;
    color: #fff;
    cursor: pointer;
    font-family: "Microsoft YaHei";
    font-size: 18px;
    height: 42px;
    left: 530px;
    outline: medium none;
    position: absolute;
    top: 0;
    vertical-align: top;
    width: 110px;
}
</style>
</head>
<body>
<div id="main">
	<p id="lg" class="s-p-top"><img id="s_lg_img" src="${ctx}/resources/doc/images/logo.png" width="203" height="72"> </p>
	<div id="search">
		<div class="" id="suggest-align">
			<input type="text" autocomplete="off" suggestwidth="520px" id="input" class="placeholder" name="q">
			<cite id="suggest-tp"></cite>
		</div>
		<input id="search-button" type="submit" onmouseout="this.className=''" onmousedown="this.className='mousedown'" onmouseover="this.className='hover'" value="文档搜索">
	</div>
</div>
</body>
</html>