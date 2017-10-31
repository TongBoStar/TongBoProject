<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>报价清单打印排序</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	var indicator = $('<div class="indicator">>></div>').appendTo('body');
    $('.drag-item').draggable({
        revert:true,
        deltaX:0,
        deltaY:0
    }).droppable({
        onDragOver:function(e,source){
            indicator.css({
                display:'block',
                left:$(this).offset().left-10,
                top:$(this).offset().top+$(this).outerHeight()-5
            });
        },
        onDragLeave:function(e,source){
            indicator.hide();
        },
        onDrop:function(e,source){
            $(source).insertAfter(this);
            indicator.hide();
        }
    });
});

function printbiding(){
	var sort = '';
	$("#bidingsort").find("li").each(function(){
		//alert($(this).attr("att-value"));
		sort = sort + $(this).attr("att-value") + ',';
	});
	
	
	var rows = window.parent.$("#centerdatagrid").datagrid('getSelections');
	var printlist="";
	if(rows.length > 0){
		$.each(rows,function(i,val){
			if((i+1)==rows.length){
				printlist = printlist + val.itemId;
			}else{
				printlist = printlist + val.itemId+",";
			}
		});
		window.open("${ctx}/oa/offer/bidingprint.htm?printlist="+printlist+"&sort="+sort);
	}
}


</script>
<style type="text/css">
.drag-item{list-style-type:none;display:block;padding:5px;border:1px solid #ccc;margin:2px;width:300px;background:#fafafa;color:#444;}
.indicator{position:absolute;font-size:9px;width:10px;height:10px;display:none;color:red;}
</style>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',border:false">
			<div id="toolbar" class="datagrid-toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconsave',plain:true" onclick="printbiding()">确定</a>
			</div>
		</div>
		<div data-options="region:'center',border:false">
			<ul style="margin:0;padding:0;margin-left:10px;" id="bidingsort">
		        <li class="drag-item" att-value="1">流程图</li>
		        <li class="drag-item" att-value="2">外形图</li>
		        <li class="drag-item" att-value="3">基础图</li>
		        <li class="drag-item" att-value="4">清单</li>
		    </ul>
		</div>
	</div>
</div>
</body>
</html>