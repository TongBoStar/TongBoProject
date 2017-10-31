<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
<jsp:include page="/public/head.jsp" ></jsp:include>
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap-year-calendar/js/bootstrap-year-calendar.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap-year-calendar/js/languages/bootstrap-year-calendar.zh.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap-year-calendar/css/bootstrap-year-calendar.css" />
<style>
#fullcalendar{overflow: hidden;font-size: 10px;font-family: "Microsoft YaHei";}
.fullcalendar .month-container {height:200px;}
.col-xs-1,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9,.col-xs-10,.col-xs-11 {position:relative;min-height:1px;padding-right:15px;padding-left:15px}
.col-xs-1,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9,.col-xs-10,.col-xs-11{float:left}
.col-xs-12 {width:100%}
.col-xs-11 {width:91.66666667%}
.col-xs-10 {width:83.33333333%}
.col-xs-9 {width:75%}
.col-xs-8 {width:66.66666667%}
.col-xs-7 {width:58.33333333%}
.col-xs-6 {width:50%}
.col-xs-5 {width:41.66666667%}
.col-xs-4 {width:33.33333333%}
.col-xs-3 {width:25%}
.col-xs-2 {width:16.66666667%}
.col-xs-1 {width:8.33333333%}
</style>
<script type="text/javascript">
var selDate,selTreeId,selEvent;
$(function () {
	$("#westtree").tree({
		url:'${ctx}/admin/hr/rosteringtree/hr-rostering-tree!tree.htm',
    	method: 'post',
    	animate: true,
     	onClick: function (node) {
     		//$("#centerdatagrid").datagrid("reload",{"hrRosteringTreeQuery.likeCode":node.code});
     		//$('#fullcalendar').data('calendar').setDataSource();
     		selTreeId = node.id;
     		
     		$.ajax({
     			type: "post",
     			url:'${ctx}/admin/hr/rosteringitem/hr-rostering-item!list.htm',
     			data:{"hrRosteringItemQuery.treeId":selTreeId},
     			dataType: "json",
     			async: false,
     			success: function (data, textStatus) {
					//datas = new Array();
					var datas = [];
					$.each(data,function(i,o){
						var item = {};
						item["startDate"] = new Date(Date.parse(o.restDay.replace(/-/g, "/")));
						item["endDate"] = new Date(Date.parse(o.restDay.replace(/-/g, "/")));
						//item["style"] = 'background';
						datas.push(item);
					});
					
					/*
     				datas =  [
     					//	{
     					//		startDate: '2016-06-07',
     					//		endDate: '2016-06-07'
     					//	},
     						{
     							startDate: new Date(new Date().getFullYear(), 3, 5),
     							endDate: new Date(new Date().getFullYear(), 3, 5)
     						}
     					];
*/
     						$('#fullcalendar').data('calendar').setDataSource(datas);
				//	alert("----");
     			}
     		});
     	},
     	onLoadSuccess :function(node, data){  
     	}
  	});
	
	/*
	var currentYear = new Date().getFullYear();
    var redDateTime = new Date(currentYear, 2, 13).getTime();
    var circleDateTime = new Date(currentYear, 1, 20).getTime();
    var borderDateTime = new Date(currentYear, 0, 12).getTime();
    */
	$('#fullcalendar').fullcalendar({ 
		
		customDayRenderer: function(element, date) {
			if(date.getDay()==0 || date.getDay()==6){
				$(element).css('color', '#65A4F3');
			}
			/*
			if(date.toLocaleDateString()==(new Date()).toLocaleDateString()){
				$(element).css('background-color', 'red');
				$(element).css('color', 'white');
				$(element).css('border-radius', '16px');
			}
			*/
		},
		
		style:'background',
		dayContextMenu:function(event){
			e = window.event;
			e.preventDefault();
			selEvent = event;
			selDate = event.date.Format("yyyy-MM-dd");
			$('#mm').menu('show',{
				left: e.pageX,
				top: e.pageY,
				onHide:function(){
					//event.element.css("background","");
					//event.element.css("border-radius","0");
					if(event.element.css("background-color")!="rgb(245, 187, 0)"){
						event.element.css("background","");
						event.element.css("border-radius","0");
					}
				},
				onShow:function(){
					if(event.element.css("background-color")!="rgb(245, 187, 0)"){
						event.element.css("background","rgba(0, 0, 0, 0.2)");
					}
					
					//event.element.css("border-radius","4px");
				}
			});
		}
    });
	//$('#calendar').calendar();
	$('#fullcalendar').data('calendar').setMinDate(new Date('2015-12-31'));
	//$('#fullcalendar').data('calendar').setMaxDate(new Date('2016-12-31'));
	$('#fullcalendar').data('calendar').setLanguage('zh');
});

function updateRest(isRest){
	//alert(selDate+"--"+selTreeId);
	$.ajax({
		type: "post",
		url:'${ctx}/admin/hr/rosteringitem/hr-rostering-item!updateRest.htm',
		data:{"hrRosteringItem.restDay":selDate,"isRest":isRest,"hrRosteringItem.treeId":selTreeId,"hrRosteringItemQuery.treeId":selTreeId,"hrRosteringItemQuery.restDay":selDate},
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			if(isRest==1){
				selEvent.element.css("background","");
			}else{
				selEvent.element.css("background","#F5BB00");
			}
		}
	});
}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false" style="padding: 3px;">
		<div class="easyui-layout" data-options="fit:true">
			<div id="roletree" data-options="region:'west',split:true,title: '分组',iconCls:'myicon-tree'" style="width: 220px;">
				<ul id="westtree"></ul>
			</div>
			<div data-options="region:'center',title: '年度排班'">
				<div id="fullcalendar"></div>
				<div id="mm" class="easyui-menu" style="width:120px;">
			        <div onclick="updateRest(1)">工作日</div>
			        <div onclick="updateRest(-1)">休息日</div>
			    </div>
			</div>
		</div>
	</div>
</body>
</html>