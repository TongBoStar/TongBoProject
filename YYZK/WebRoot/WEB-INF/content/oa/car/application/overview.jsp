<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.terrence.activiti.dol.core.ProcessEnumUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="realId"><%= com.terrence.crm.dol.utils.SpringSecurityUtils.getCurrentLoginId()%></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用车总览</title>
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${ctx}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<script src="${ctx}/resources/plugins/daypilot/daypilot-all.min.js" type="text/javascript"></script>
<script src="${ctx}/resources/plugins/my97/WdatePicker.js" type="text/javascript" ></script>
<script src="${ctx}/resources/plugins/moment/moment.min.js" type="text/javascript" ></script>
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<script type="text/javascript">
var dp,showday = 7,beginDate,endDate;
$(function () {
	beginDate = moment().format("YYYY-MM-DD");
	endDate = moment().add('days',6).format('YYYY-MM-DD');
	
	dp = new DayPilot.Scheduler("dp");
	WdatePicker({eCont:'nav',
		onpicked:function(wdp){
			nowDate = wdp.cal.getDateStr();
			beginDate = moment(nowDate).format('YYYY-MM-DD');
			endDate = moment(nowDate).add('days',6).format('YYYY-MM-DD');
			
			console.log("beginDate:"+beginDate+"===endDate:"+endDate);
			
			$.ajax({
		    	type: "post",
		    	url: "${ctx}/carapplication/car-application!overviewList.htm",
				data:{'carApplicationQuery.startTime':beginDate+" 00:00:00",'carApplicationQuery.endTime':endDate+" 23:59:59",'carApplicationQuery.isBetweenTime':true,'carApplicationQuery.carState':1},
				dataType: "json",
		      	async: false,
		    	success: function (listData, textStatus) {
		    		console.log(listData);
		       		if(listData.total>0){
		            	var varEvents = [];
            			$.each(listData.rows,function(index,obj){
            				var varEvent = {
  	            				start: obj.startTime,
  	          					end: obj.endTime,
  	            				id: obj.id,
  	            				resource: obj.carId,
  	            				text: obj.remark,
  	            				carstate:obj.carState,
  	            				applystate:obj.applyState,
  	            				applicantId:obj.applicantId
  	            			}
            				varEvents.push(varEvent);
            			});
            			dp.events.list=varEvents;
            			dp.startDate = nowDate;
                    	dp.update();
		      		}else{
		            	dp.startDate = nowDate;
                   		dp.update();
		        	}
				},
				error:function (XMLHttpRequest, textStatus, errorThrown) {
					// 通常情况下textStatus和errorThown只有其中一个有值 
					this; // the options for this ajax request
				}
			});
		}
	});
	
	//取车辆列表
	$.ajax({
		type: "post",
  		url: "${ctx}/carinfo/car-info!list.htm",
  		data:{"carInfoQuery.isDel":0},
		dataType: "json",
		async: false,
  		success: function (data, textStatus) {
  			dp.cellDuration = 30;
			dp.cellGroupBy = "Day";
			dp.days = showday;//注 下面日期要加7
			dp.moveBy = 'Full';
			dp.locale = "zh-cn";
			dp.timeHeaders = [{"groupBy":"Day","format":"yyyy-MM-dd"},{"groupBy":"Hour"},{"groupBy":"Cell"}];
			dp.scale = "CellDuration";
			dp.cellWidth = 20;
			dp.eventHeight = 35;
	       		
  	       	var varResources = [];
			$.each(data.rows,function(index,obj){
				var varResource = {
					id: obj.id,
					name:obj.name+"["+obj.number+"]",
					number:obj.number
				}
				varResources.push(varResource);
			});
       		dp.resources = varResources;
	       	dp.businessBeginsHour="8.5"
	       	dp.businessEndsHour="18"
	      	dp.useEventBoxes = "Never";
	     	dp.locale="zh-cn";
	     	dp.eventClickHandling="Select"//选中
			dp.eventMovingStartEndEnabled = true;
	      	dp.eventMovingStartEndFormat = "yyyy-MM-dd HH:mm";
	      	dp.eventResizingStartEndEnabled = true;
			dp.eventResizingStartEndFormat = "yyyy-MM-dd HH:mm";
	  		dp.timeRangeSelectingStartEndEnabled = true;
	  		dp.timeRangeSelectingStartEndFormat = "yyyy-MM-dd HH:mm";
	  		dp.separators = [{color:"Red", location:moment().format("YYYY-MM-DD HH:mm:ss"), layer: "AboveEvents"}];	//当前时间线

	  		//取当车辆申请列表
			$.ajax({
				type: "post",
				url: "${ctx}/carapplication/car-application!overviewList.htm",
				data:{'carApplicationQuery.startTime':beginDate+" 00:00:00",'carApplicationQuery.endTime':endDate+" 23:59:59",'carApplicationQuery.isBetweenTime':true,'carApplicationQuery.carState':1},
				dataType: "json",
				async: false,
				success: function (listData, textStatus) {
						var varEvents = [];
		         		$.each(listData.rows,function(index,obj){
			            	var varEvent = {
			            		start: obj.startTime,
			          			end: obj.endTime,
			            		id: obj.id,
			            		resource: obj.carId,
			            		text: obj.remark,
			            		carstate:obj.carState,
			            		applystate:obj.applyState,
			            		applicantId:obj.applicantId
			            	}
			            	varEvents.push(varEvent);
		     			});
			      		dp.events.list=varEvents;
	 			}
			});
	  		
			dp.onBeforeEventRender = function(args) {
				//console.log(args.e.carstate);
				
				if(args.e.carstate==<%= ProcessEnumUtil.CAR_APPLY_STATUS.PASS.value %>){
  	      			//通过
  	      			//通过了的颜色还得另行判断
      	        	var nowDateTime = moment().format("YYYY-MM-DD HH:mm:ss");
  	      			//console.log("now:"+nowDateTime+"  end:"+args.e.end+"  start:"+args.e.start);
      	        	if(nowDateTime>args.e.end){
      	        		//console.log("结束");
      	        		args.e.barColor = "<%= ProcessEnumUtil.CAR_STATUS.OVERDUE.barColor %>";
	      	      	}else if(nowDateTime<args.e.start){
	      	      		//console.log("已预订");
	      	      		args.e.barColor = "<%= ProcessEnumUtil.CAR_STATUS.BOOKING.barColor %>";
	      	      	}else if(nowDateTime<args.e.end && nowDateTime>args.e.start){
	      	      		//console.log("使用中");
	      	      		args.e.barColor = "<%= ProcessEnumUtil.CAR_STATUS.INUSE.barColor %>";
	      	      	}
  	      		}
				if(args.e.applicantId=="${realId}"){
      	        	args.e.backColor = "<%= ProcessEnumUtil.CAR_STATUS.MY.backColor %>";
      	        }
      	    };  	
	  		
      	  	dp.contextMenu = new DayPilot.Menu({items: [
      	  		{text:"查看", onclick: function() { show(this.source); } },
  			]});
      	    
	   		dp.eventMoveHandling = "disable";
			dp.eventResizeHandling = "disable";
	  		dp.init();
  		}
	});
});

function show(source){
	$.dialog({
		content: 'url:${ctx}/carapplication/showIndex.htm?id='+source.id(),
		lock: true,
		width:'1000px',
		height:'800px'
	});
}
</script>
</head>
<body>
<div style="padding:3px;">
	<div style="float:left; width: 190px;">
		<div id="nav"></div>
	</div>
	<div style="margin-left: 190px;">
		<div style="padding:3px;">
			<table>
				<tr>
					<td style="background-color: <%=ProcessEnumUtil.CAR_STATUS.DRAFT.barColor %>;width:30px;"></td><td>&nbsp;<%=ProcessEnumUtil.CAR_STATUS.DRAFT.valueName %>&nbsp;</td>
					<td style="background-color: <%=ProcessEnumUtil.CAR_STATUS.WAITPASS.barColor %>;width:30px;"></td><td>&nbsp;<%=ProcessEnumUtil.CAR_STATUS.WAITPASS.valueName %>&nbsp;</td>
					<td style="background-color: <%=ProcessEnumUtil.CAR_STATUS.BOOKING.barColor %>;width:30px;"></td><td>&nbsp;<%=ProcessEnumUtil.CAR_STATUS.BOOKING.valueName %>&nbsp;</td>
					<td style="background-color: <%=ProcessEnumUtil.CAR_STATUS.INUSE.barColor %>;width:30px;"></td><td>&nbsp;<%=ProcessEnumUtil.CAR_STATUS.INUSE.valueName %>&nbsp;</td>
					<td style="background-color: <%=ProcessEnumUtil.CAR_STATUS.OVERDUE.barColor %>;width:30px;"></td><td>&nbsp;<%=ProcessEnumUtil.CAR_STATUS.OVERDUE.valueName %>&nbsp;</td>
					<td style="background-color: <%=ProcessEnumUtil.CAR_STATUS.RETURN.barColor %>;width:30px;"></td><td>&nbsp;<%=ProcessEnumUtil.CAR_STATUS.RETURN.valueName %>&nbsp;</td>
					<td>注：背景色为</td>
					<td style="background-color:<%=ProcessEnumUtil.CAR_STATUS.MY.backColor %> ;width:30px;"></td>
					<td>是<%=ProcessEnumUtil.CAR_STATUS.MY.valueName %></td>
				</tr>
			</table>
		</div>
		<div id="dp"></div>
	</div>
</div>
</body>
</html>