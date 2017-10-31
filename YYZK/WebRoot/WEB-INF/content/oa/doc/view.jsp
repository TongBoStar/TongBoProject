<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/><!DOCTYPE html>
<html>
<head>
<title>文件管理</title>
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
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- curdtools -->
<script type="text/javascript" src="${ctx}/resources/js/curdtools.js"></script>
<!-- swftool -->
<script type="text/javascript" src="${ctx}/resources/plugins/flexpaper/flexpaper.js"></script>  
<script type="text/javascript" src="${ctx}/resources/plugins/flexpaper/flexpaper_handlers.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/flexpaper/flexpaper_flat.css"/>
<script type="text/javascript">
$(function(){
    var startDocument = "Paper";
    
    jQuery.get('${ctx}/oa/doc/toolbar.htm',
  		function(toolbarData) {
    	
    	}
    );
    
    $('#documentViewer').FlexPaperViewer(
            { config : {
                SWFFile : '${ctx}/<c:out value="${filePath}"/>',
                Scale : 1,
                ZoomTransition : 'easeOut',
                ZoomTime : 0.5,
                ZoomInterval : 0.2,//滑块间隔
                FitPageOnLoad : false,
                //FitWidthOnLoad : true,
                FullScreenAsMaxWindow : false,
                ProgressiveLoading : false,
                MinZoomSize : 0.2,
                MaxZoomSize : 5,
                SearchMatchAll : true,
               // Toolbar : toolbarData,
                InitViewMode : 'TwoPage',
                RenderingOrder : 'flash',
                StartAtPage : '',
                EnableWebGL : true,
                ViewModeToolsVisible : true,
                ZoomToolsVisible : true,
                NavToolsVisible : true,
                CursorToolsVisible : true,
                SearchToolsVisible : true,
                WMode : 'window',
                localeChain: 'zh_CN'
            }}
    );
});

</script> 
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding:3px 6px 3px 3px;">
<div class="easyui-layout" data-options="fit:true">
	<div id="documentViewer" class="flexpaper_viewer"></div>
</div>
</div>
</body>
</html>