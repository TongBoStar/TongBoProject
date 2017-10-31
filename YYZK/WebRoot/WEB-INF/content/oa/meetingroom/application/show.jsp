<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>

<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ck_slide/css/slide.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/ck_slide/js/slide.js"></script>
<title>办理任务</title>
<style>
.my-tab{
	height: auto;
    margin-bottom: 10px;
    overflow: hidden;
    position: relative;
}
.my-tab ul.my-tab-menu {
    border-bottom: 2px solid #3071a9;
    height: 28px;
    overflow: hidden;
}
.my-tab ul.my-tab-menu li {
    background: none repeat scroll 0 0 #ffffff;
    border: 1px solid #f3f3f3;
    cursor: pointer;
    float: left;
    height: 28px;
    line-height: 1.8em;
    margin-right: 5px;
    padding: 0 10px;
}
.my-tab ul.my-tab-menu li.active {
    background: none repeat scroll 0 0 #3071a9;
}
.my-tab ul.my-tab-menu li a {
    color: #555;
    font-size: 12px;
    text-decoration: none;
}

.my-tab ul.my-tab-menu li.active a {
    color: #ffffff;
}

.data-wrap {
  padding: 8px 10px 2px 10px;
}
ul, ol {
    margin: 0 !important;
    padding: 0;
}

.my-tab-content {
    height: 100%;
    overflow: auto;
}

</style>
<script>
var carinfos;
var taskName;
var myform;
$(function () {
	$(".my-tab-menu li").click(function(){
		$(".my-tab-menu li").removeClass('active');
        $(this).addClass('active');
        $(".my-tab-area").hide();
        $(".my-tab-area").eq($(this).index()).show();
	});
	
	$(".my-tab-content").height($(window).height()-56);
	
	
	$.ajax({
		type: "post",
		url: "${ctx}/meetingroominfo/meetingroom-info!list.htm",
		data:{"meetingroomInfoQuery.isDel":0},
		dataType: "json",
		async: false,
		success: function (listData, textStatus) {
			meetingroominfos = new Backbone.Collection(listData.rows);  
			var output = [];
			output.push('<option value=""></option>');
			$.each(listData.rows, function(index, obj)
			{
				output.push('<option value="'+ obj.id +'">'+ obj.name +'</option>');
			});
			$('#meetingroomInfoId').html(output.join(''));
		}
	});
	
	$("#meetingroomInfoId").change(function(){
		var selid = $(this).find('option:selected').val();
		var meetingroominfo = meetingroominfos.findWhere({id:parseInt(selid)});
		$("#meetingroominfoname").val(meetingroominfo.attributes.name);
		$("#meetingroominfonumber").val(meetingroominfo.attributes.number);
		$("#meetingroominfodescription").val(meetingroominfo.attributes.description);
		$("#meetingroominfoaddress").val(meetingroominfo.attributes.address);
		$("#meetingroominfoequipmentNames").val(meetingroominfo.attributes.equipmentNames);
		
		
		$("ul.ck-slide-wrapper li").remove();
		i=1;
		$.each(meetingroominfo.attributes.meetingroomInfoResList,function(index,obj){
			var img = "${ctx}/"+obj.resPath;
			var li="";
			if(i==1){
				li=	'<li>'+
        		'<a href="javascript:;"><img src="'+img+'" alt="" style="width:280px;"></a>'+
    			'</li>';
			}else{
				li=	'<li style="display:none">'+
        		'<a href="javascript:;"><img src="'+img+'" alt="" style="width:280px;"></a>'+
    			'</li>';
			}
			$("ul.ck-slide-wrapper").append(li);
			i++;
		});
		if(i==1){
			var li=	'<li style="display:none">'+
    		'<a href="javascript:;"><img src="${ctx}/resources/images/admin/noimg.jpg" alt="" style="width:280px;"></a>'+
			'</li>';
			$("ul.ck-slide-wrapper").append(li);
		}
		$('.ck-slide').ckSlide({
	         //autoPlay:true
	     });
		
	});
	
	if('<s:property value="meetingroomApplication.meetingroomInfoId"/>'!=""){
		$("#meetingroomInfoId").val('<s:property value="meetingroomApplication.meetingroomInfoId"/>');
		$("#meetingroomInfoId").trigger("change");
	}
	
	
	taskName = '<s:property value="taskName" escape="false"/>';
	$("table.my-table-form select").not(":hidden").attr("disabled","disabled");
	$("table.my-table-form input").not(":hidden").attr("disabled","disabled");
	$("table.my-table-form textarea").not(":hidden").attr("disabled","disabled");
	$("#comment").removeAttr("disabled");
	
	myform = $("#form").Validform({
		btnSubmit:".my-btn-primary",
		tiptype:3
		//callback:function(form){
		//	alert("============");
		//}
	});
	
	if(taskName=='部门领导审核'){
		
	}else if(taskName=="人事审核" || taskName=="等待会议结束"){
		$("#carId").removeAttr("disabled");
		$("#driver").removeAttr("disabled");
		$("#startTime").removeAttr("disabled");
		$("#endTime").removeAttr("disabled");
		
		myform.addRule([{
			ele:"#carId",
	        datatype:"*",
	        nullmsg:"请选择车辆！"
		},{
			ele:"#driver",
	        datatype:"*",
	        nullmsg:"请填写司机姓名！"
		}]);
	}else if(taskName=="重新调整"){
		$("table.my-table-form select").removeAttr("disabled");
		$("table.my-table-form input").removeAttr("disabled");
		$("table.my-table-form textarea").removeAttr("disabled");
	}
	
	$('.ck-slide').ckSlide({
        //autoPlay:true
    });
});

function doprocess(ispass){
	myform.eq(0).config({callback:function(form){
		$.ajax({
			type: "post",
			url: "${ctx}/meetingroomapplication/doProcess.htm?isPass="+ispass,
			data:$('#form').serialize(),
			dataType: "json",
			async: false,
			success: function (data, textStatus) {
				if(data.success=="true"){
					alert(data.msg);
					window.location.href="${ctx}/admin/sys/process/my/tasktodolist.htm";
					return false;
				}else{
					alert(data.msg);
					return false;
				}
			}
		});
		return false;
	}});
	
	//myform.eq(1).submitForm(false);
	/*
	$.ajax({
		type: "post",
		url: "${ctx}/carapplication/doProcess.htm?isPass="+ispass,
		data:$('#form').serialize(),
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			if(data.success=="true"){
				$.messager.alert('提示',data.msg);
				window.parent.$('#centergrid').datagrid('reload');
				window.parent.$("#modalwindow").window('close');
			}else{
				$.messager.alert('提示',data.msg);
			}
		}
	});
	*/
}
</script>
</head>
<body>
<div class="data-wrap">
	<form class="my-form" id="form" method="post">
				<div class="content-right">
					<table class="my-table-form">
						<tr><th>名称</th></tr>
						<tr><td><input type="text" style="width: 100%;" name="meetingroominfoname" id="meetingroominfoname"></td></tr>
						<tr><th>可容纳人数</th></tr>
						<tr><td><input type="text" style="width: 100%;" name="meetingroominfonumber" id="meetingroominfonumber"></td></tr>
						<tr><th>描述</th></tr>
						<tr><td><input type="text" style="width: 100%;" name="meetingroominfodescription" id="meetingroominfodescription"></td></tr>
						<tr><th>地址</th></tr>
						<tr><td><input type="text" style="width: 100%;" name="meetingroominfoaddress" id="meetingroominfoaddress"></td></tr>
						<tr><th>设备</th></tr>
						<tr><td><input type="text" style="width: 100%;" name="meetingroominfoequipmentNames" id="meetingroominfoequipmentNames"></td></tr>
						<tr><th>图片</th></tr>
			<tr>
				<td>
				<style>
			        .ck-slide {
			            width:280px;
			            height:173px;
			        }
			        .ck-slide ul.ck-slide-wrapper {
			            height:173px;
			        }
    			</style>
				<div class="ck-slide">
			        <ul class="ck-slide-wrapper">
			            <li>
			                <a href="javascript:;"><img src="${ctx}/resources/images/admin/noimg.jpg" alt="" style="width:280px;"></a>
			            </li>
			        </ul>
			        <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a>
			        <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
   		 		</div>
				
				</td>
			</tr>
					
					</table>
				</div>
				<div class="content-left">
					<div class="title-header">会议申请</div>
					<table class="my-table-form">
						<tr>
			   				<th class="my-w80">会议室</th>
			      			<td>
			        			<select id="meetingroomInfoId" name="meetingroomApplication.meetingroomInfoId" datatype="*" nullmsg="请选择会议室！"></select>
			        			<s:hidden name="meetingroomApplication.id" id="id"></s:hidden>
			        			<s:hidden name="taskId" id="taskId"></s:hidden>
			        		</td>
			        	</tr>
			        	<tr>
			   				<th class="my-w80">开始时间<span class="star">*</span></th>
			      			<td>
			          			<input type="text" id="startTime" name="meetingroomApplication.startTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<s:date name="meetingroomApplication.startTime" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;" datatype="*" nullmsg="请填写开始时间！"/>
			        		</td>
			        	</tr>
			        	<tr>
			   				<th class="my-w80">结束时间<span class="star">*</span></th>
			      			<td>
			          			<input type="text" id="endTime" name="meetingroomApplication.endTime"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate:'#F{$dp.$D(\'startTime\')}'})" value="<s:date name="meetingroomApplication.endTime" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;" datatype="*" nullmsg="请填写结束时间！"/>
			        		</td>
			        	</tr>
			        	<tr>
			   				<th class="my-w80">会议主题<span class="star">*</span></th>
			      			<td>
			      				<s:textfield name="meetingroomApplication.name" id="name" theme="simple" style="width:300px;" datatype="*" nullmsg="请填写会议主题！"></s:textfield>
			        		</td>
			        	</tr>
			        	<tr>
			   				<th class="my-w80">与会人员<span class="star">*</span></th>
			      			<td>
			          			<s:textarea id="userNames" name="meetingroomApplication.userNames"  theme="simple"  style="width:500px;height:60px;" datatype="*" nullmsg="请选择与会人员！"></s:textarea>
			        			<s:hidden name="meetingroomApplication.userIds" id="userIds" value="4,5,6"></s:hidden>
			        		</td>
			        	</tr>
			        	<tr>
			   				<th class="my-w80">备注</th>
			      			<td>
			          			<s:textarea id="remark" name="meetingroomApplication.remark"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
			        		</td>
			        	</tr>
					</table>
				</div>
				<s:property value="buttons" escape="false"/>
			</form>
</div>
</body>
</html>