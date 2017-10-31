<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用车申请</title>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- date -->
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- ztree -->
<script src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ztree/zTreeStyle.css"/>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- easyui -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- slide -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ck_slide/css/slide.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/ck_slide/js/slide.js"></script>
<script>
var myform;
$(function () {
	var meetingroominfos;
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
		
		var equipmentDictNames="";
		(new Backbone.Collection(meetingroominfo.attributes.equipmentDictList)).each(function(equipmentDict){  
			equipmentDictNames = equipmentDictNames + equipmentDict.get('name')+"  ";
		});  
		
		$("#meetingroominfoequipmentNames").val(equipmentDictNames);
		
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
		$('.ck-slide').ckSlide({});
	});
	
	myform=$(".my-form").Validform({
		btnSubmit:"#btnSave", 
		btnReset:"#btnReset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/meetingroomapplication/meetingroom-application!save.htm",
				data:$('#form').serialize(),
				dataType: "json",
				async: false,
				success: function (data, textStatus) {
					$.messager.confirm('提示', data.msg, function(r){
						if(data.success=="true"){
							myform.resetForm();
						}
					});
				}
			});
			return false;
		}
	});
	$('.ck-slide').ckSlide({});
});

function selUsers(){
	var demo = $.dialog({
		content: 'url:${ctx}/core/emp/selemp.htm',
		lock: true,
		title:'人员选择',
		width: 750,
	    height: 430,
	    ok: function(){
	    	var selids="",selnames="";
	    	$.each(demo.content.$("#selusers").find("option"),function(i,value){
				selids = selids + value.value+",";
				selnames = selnames + value.text+",";
			});
	    	alert(selids+"==="+selnames);
	    	if(selids!="0,"){
	    		$("#userIds").val(selids);
	    	}
	    	$("#userNames").val(selnames);
	        //return false;
	    },
	    cancelVal: '关闭',
	    cancel: true 
	});
}
</script>
</head>
<body>
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
          			<s:textarea id="userNames" name="meetingroomApplication.userNames"  theme="simple"  style="width:500px;height:60px;"></s:textarea>
        			<s:hidden name="meetingroomApplication.userIds" id="userIds" datatype="*" nullmsg="请选择与会人员！"></s:hidden><a href="javascript:void(0)" onclick="selUsers()">选择</a>
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
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定">
	<input class="my-btn" id="btnReset" type="button" value="重置">
</form>
</body>
</html>