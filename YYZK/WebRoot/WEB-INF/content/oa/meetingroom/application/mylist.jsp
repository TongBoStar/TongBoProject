<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${ctx}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>会议室申请列表</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#centergrid').datagrid({
    	url:'${ctx}/meetingroomapplication/meetingroom-application!myPageList.htm?meetingroomApplicationQuery.meetingRoomState=${param.meetingRoomState}',
        title: '会议室申请列表',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: true,
        iconCls:'icon-list',
        pageSize: 20,
        rownumbers: true,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'id', title: 'ID'},
            { field: 'name', title: '主题' },
            { field: 'startTime', title: '开始时间' },
            { field: 'endTime', title: '结束时间' },
            { field: 'meetingroomInfoName', title: '会议地点',
            	formatter: function (value, rec, index) {
            		if(rec.meetingroomInfo==undefined){
            			return "";
            		}else{
            			return rec.meetingroomInfo.name;
            		}
            	}
            },
            { field: 'applicantEmpUserName', title: '申请人',
            	formatter: function (value, rec, index) {
            		if(rec.applicantEmp==undefined){
            			return "";
            		}else{
            			return rec.applicantEmp.userName;
            		}
            	}	
            }
		]]
    });	
});
</script>
<style>
.search_area {
  padding: 8px 0px;
  margin: 0 auto;
  text-align: center;
  margin-top: 0px;
  background-color: #f5f5f5;
  border-bottom: 1px solid #dddddd;
}
.data-wrap {
  padding: 8px 10px 2px 10px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" >
		<div class="search_area search_normal" id="search_normal_div" style="display: block;">
			<div class="form-search">
				<div class="input-append">
					<input type="text" id="search_para" class="span4 search-query" placeholder="请输入要查询的流水号或工作名称/文号">
					<button type="button" id="normalSearchBtn" class="btn btn-primary">查询</button>
				</div>
				&nbsp;&nbsp;
				<button type="button" id="toAdvSearch" class="btn">切换至高级查询</button>
			</div>
		</div>
	</div>
	<div data-options="region:'center',border:false" style="padding:3px;">
		<div class="easyui-layout" data-options="fit:true">
			<table id="centergrid"></table>
		</div>
	</div>
</body>
</html>