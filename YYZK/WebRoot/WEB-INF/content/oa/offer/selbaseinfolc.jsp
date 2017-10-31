<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>基础数据列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<style type="text/css">
        .c-label{
            display:inline-block;
            width:100px;
            font-weight:bold;
        }
    </style>
<script type="text/javascript">
var ddv;

var cardview = $.extend({}, $.fn.datagrid.defaults.view, {
    renderRow: function(target, fields, frozen, rowIndex, rowData){
        var cc = [];
        cc.push('<td colspan=' + fields.length + ' style="padding:10px 5px;border:0;">');
        if (!frozen && rowData.lcId){
            var aa = rowData.url;
            var img = aa;
            
            cc.push('<img src="${ctx}/upload/lc/' + img + '" style="width:150px;float:left">');
            cc.push('<div style="float:left;margin-left:20px;">');
            for(var i=0; i<fields.length; i++){
                var copts = $(target).datagrid('getColumnOption', fields[i]);
                cc.push('<p><span class="c-label">' + copts.title + ':</span> ' + rowData[fields[i]] + '</p>');
            }
            cc.push('</div>');
        }
        cc.push('</td>');
        return cc.join('');
    }
});

$(function () {
	$('#centerdatagrid').datagrid({
		url:'${ctx}/offer/offer!LcPage.htm',
		view: cardview,
        //title: '流程图列表',
        iconCls:'iconfont icon-iconlist',
        toolbar: '#toolbar',
        border: false,
        fit: true,
        singleSelect: true,
        striped : true,
        toolbar: '#toolbar',
        pagination: true,
        pageSize: 20,
        //rownumbers: true,
        fitColumns: false,
        columns: [
		[	
		 	{field: 'name', title: '名称',width:'300px'},
		 	//{field: 'url', title: '操作',width:'300px'}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){}
    });
});



function reloadGrid(){
	$('#centerdatagrid').datagrid('reload');
}

function closeWin(){
	$("#w").window('close');
}

function GetQueryString(name)
{
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return  unescape(r[2]); return null;
}

function add(){
	//window.parent.$("#filePickerlc").parent();
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		//$("<img src='${ctx}/upload/lc/"+row.url+"' width='110' height='160'>").insertBefore(window.parent.$("#filePickerlc"));
		//window.parent.$("#lcimg").attr('src','${ctx}/upload/lc/'+row.url);
		
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!projectUpdateLcImg.htm?offerProject.projectId="+GetQueryString("projectId")+"&offerProjectQuery.lcImg="+row.url,
			dataType: "json",
			async: false,
			beforeSend:function(){},
			success: function (data, textStatus) {
				if(data.success){
					window.parent.$("#lcimg").attr('src','${ctx}/upload/lc/'+row.url);
					window.parent.$("#w").window('close');
				}
			}
		});
	}
	
}

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<table id="centerdatagrid"></table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="add()">确定</a>
			</div>
		</div>
		<div id="w"></div>
	</div>
</div>
</body>
</html>