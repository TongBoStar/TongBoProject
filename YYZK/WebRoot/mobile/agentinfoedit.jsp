<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>代理信息编辑</title>
<style type="text/css">
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
    font-size: 9px;
}
/*----------------------*/
.zebra td, .zebra th {
    padding: 15px 5px;
    border-bottom: 1px solid #f2f2f2;  
    text-align: center;   
}
.zebra th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;  
}

.zebra th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.zebra th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.zebra tfoot td {
    border-bottom: 0;
}

.zebra tfoot td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

.zebra tfoot td:only-child{
    -moz-border-radius: 0 0 6px 6px;
    -webkit-border-radius: 0 0 6px 6px
    border-radius: 0 0 6px 6px
}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
var stcodeids = "${param.stcodeIds}";
$(window).load(function() {
	if(stcodeids.indexOf(',')<0){
		$('#batchtable').css("display","none");
		searchsingle();
	}else{
		$('#singletable').css("display","none");
	}
});
function searchsingle(){
	var html='';
	var url = "${ctx}/stcode/stcode!listAgent.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"stcodeQuery.id=${param.stcodeId}&stcodeQuery.agentName=${param.openid}",
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.stcodeList,function(i,o){
					$('#stCode').text(replaceNull(o.stCode));
					$('#username').val(replaceNull(o.username));
					$('#activiteTime').text(formatDate(replaceNull(o.feedback)));
					$('#lastTime').text(formatDate(replaceNull(o.serialNumber)));
					$('#ftimes').text(replaceNull(o.faddress));
				});
				$('#sendtbody').html(html);
			}
		}
	});
}
function saveinfo(){
	var formParam = $('#inputForm').serialize();
	var datap = '';
	
	if(stcodeids.indexOf(',')<0){
		datap = "stCode=${param.stcodeIds}&username="+$('#username').val();
		if($('#username').val()==''){
			alert("请输入使用人名称");
			return;
		}
	}else{
		datap = "stCode=${param.stcodeIds}&username="+$('#usernamebatch').val();
		if($('#usernamebatch').val()==''){
			alert("请输入使用人名称");
			return;
		}
	}
	var url = "${ctx}/stcode/stcode!updateByAgentIds.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:datap,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				cancel();
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function cancel(){
	window.location.href = "${ctx}/mobile/agentinfo.jsp?openid=${param.openid}";
}
/**
 * 将null转换为空字符串
 * @param obj 要转换的对象
 * @returns 空字符串
 */
function replaceNull(obj){
	if(obj==null){
		obj = "";
	}
	return obj;
}
/**
 * 格式化时间(yyyy-MM-dd)
 * @param date 要格式化的日期
 * @returns 格式化后的结果
 */
function formatDate(date){
	if(null!=date&&date!=""){
		return date.split(" ")[0];
	}else{
		return "";
	}
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<form id="inputForm" method="post">
			<table class="zebra" id="singletable">
				<thead>
					<tr><th colspan="2" style="font-size: 16px;">书童信息</th></tr>
				</thead>
				<tbody>
					<tr><td>书童编号</td><td id="stCode"></td></tr>
					<tr><td>使用人</td><td><input id="username" style="width:150px;"/></td></tr>
					<tr><td>激活时间</td><td id="activiteTime"></td></tr>
					<tr><td>最近登录</td><td id="lastTime"></td></tr>
					<tr><td>使用次数</td><td id="ftimes"></td></tr>
				</tbody>
			</table>
			<table class="zebra" id="batchtable">
				<thead>
					<tr><th colspan="2" style="font-size: 16px;">请输入要批量分配的使用人名称</th></tr>
				</thead>
				<tbody>
					<tr><td>使用人</td><td><input id="usernamebatch" style="width:150px;"/></td></tr>
				</tbody>
			</table>
		</form>
		<div>
			<Button style="width:50px;height:25px;" onclick="saveinfo();">提交</Button>
			<Button style="width:50px;height:25px;margin-left:20%;" onclick="cancel();">取消</Button>
		</div>
	</div>
</div>
</body>
</html>