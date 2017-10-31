<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用车申请</title>
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/my97/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/easyui/themes/icon.css" />
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/ck_slide/css/slide.css"/>
<script type="text/javascript" src="${ctx}/resources/plugins/ck_slide/js/slide.js"></script>
<script>
$(function () {
	var carinfos,picJson;
	
	$("div.content-right table.my-table-form input").attr("disabled","disabled");
	
	$.ajax({
		type: "post",
		url: "${ctx}/carinfo/car-info!list.htm",
		data:{"carInfoQuery.isDel":0},
		dataType: "json",
		async: false,
		success: function (listData, textStatus) {
			carinfos = new Backbone.Collection(listData.rows);  
			var output = [];
			output.push('<option value=""></option>');
			$.each(listData.rows, function(index, obj)
			{
				output.push('<option value="'+ obj.id +'">'+ obj.number +'</option>');
			});
			$('#carId').html(output.join(''));
		}
	});
	
	$("#carId").change(function(){
		var selid = $(this).find('option:selected').val();
		var carinfo = carinfos.findWhere({id:parseInt(selid)});
		$("#carinfonumber").val(carinfo.attributes.number);
		$("#carinfoname").val(carinfo.attributes.name);
		$("#carinfodriver").val(carinfo.attributes.driver);
		$("#carinfocarType").val(carinfo.attributes.carTypeDict.name);
		$("#carinfobuyTime").val(carinfo.attributes.buyTime);
		$("#carinforemark").val(carinfo.attributes.remark);
		
		$("ul.ck-slide-wrapper li").remove();
		i=1;
		$.each(carinfo.attributes.carInfoResList,function(index,obj){
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
	
	
	var myform=$(".my-form").Validform({
		btnSubmit:"#btnSave", 
		btnReset:"#btnReset",
		tiptype:3,
		callback:function(){
			$.ajax({
				type: "post",
				url: "${ctx}/carapplication/car-application!save.htm",
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
	
	 $('.ck-slide').ckSlide({
        // autoPlay:true
     });
});
</script>
</head>
<body>
<form class="my-form" id="form" method="post">
	<div class="content-right">
		<table class="my-table-form">
			<tr><th>车牌号</th></tr>
			<tr><td><input type="text" style="width: 100%;" name="carinfonumber" id="carinfonumber"></td></tr>
			<tr><th>车辆名称</th></tr>
			<tr><td><input type="text" style="width: 100%;" name="carinfoname" id="carinfoname"></td></tr>
			<tr><th>驾驶员</th></tr>
			<tr><td><input type="text" style="width: 100%;" name="carinfodriver" id="carinfodriver"></td></tr>
			<tr><th>车辆类型</th></tr>
			<tr><td><input type="text" style="width: 100%;" name="carinfocarType" id="carinfocarType"></td></tr>
			<tr><th>购买时间</th></tr>
			<tr><td><input type="text" style="width: 100%;" name="carinfobuyTime" id="carinfobuyTime"></td></tr>
			<tr><th>备注</th></tr>
			<tr><td><input type="text" style="width: 100%;" name="carinforemark" id="carinforemark"></td></tr>
			<tr><th>图片</th></tr>
			<tr>
				<td>
				<style>
			        .ck-slide {
			            width:280px;
			            height:373px;
			        }
			        .ck-slide ul.ck-slide-wrapper {
			            height:373px;
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
		<div class="title-header">用车申请</div>
		<table class="my-table-form">
			<tr>
   				<th class="my-w80">车牌号码</th>
      			<td>
        			<select id="carId" name="carApplication.carId"></select>
        			<s:hidden name="carApplication.id" id="id"></s:hidden>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">司机</th>
      			<td>
          			<s:textfield name="carApplication.driver" id="driver" theme="simple" style="width: 300px;"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">用车人<span class="star">*</span></th>
      			<td>
          			<s:textfield name="carApplication.userOf" id="userOf" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写用车人！"></s:textfield>
        			<span class="Validform_checktip"></span>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">用车人数<span class="star">*</span></th>
      			<td>
          			<s:textfield name="carApplication.userNumber"  id="userNumber" theme="simple" style="width: 300px;" datatype="*" nullmsg="请填写用车人数！"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">联系电话</th>
      			<td>
          			<s:textfield name="carApplication.userMobilePhone"  id="userMobilePhone" theme="simple"></s:textfield>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">开始时间<span class="star">*</span></th>
      			<td>
          			<input type="text" id="startTime" name="carApplication.startTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00'})" value="<s:date name="officeCarApplication.startTime" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;" datatype="*" nullmsg="请填写开始时间！"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">结束时间<span class="star">*</span></th>
      			<td>
          			<input type="text" id="endTime" name="carApplication.endTime"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate:'#F{$dp.$D(\'startTime\')}'})" value="<s:date name="officeCarApplication.endTime" format="yyyy-MM-dd HH:mm:ss"/>" style="width: 300px;" datatype="*" nullmsg="请填写结束时间！"/>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">行车路线<span class="star">*</span></th>
      			<td>
          			<s:textarea id="cargoRoute" name="carApplication.cargoRoute"  theme="simple"  style="width:500px;height:60px;" datatype="*" nullmsg="请填写行车路线！"></s:textarea>
        		</td>
        	</tr>
        	<tr>
   				<th class="my-w80">用途<span class="star">*</span></th>
      			<td>
          			<s:textarea id="remark" name="carApplication.remark"  theme="simple"  style="width:500px;height:60px;" datatype="*" nullmsg="请填写用途！"></s:textarea>
        		</td>
        	</tr>
		</table>
	</div>
	<input class="my-btn my-btn-primary" id="btnSave" type="button" value="确定">
	<input class="my-btn" id="btnReset" type="button" value="重置">
</form>
</body>
</html>