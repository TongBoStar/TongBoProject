<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>发货信息编辑</title>
<style type="text/css">
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
    font-size: 12px;
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
$(window).load(function() {
	search();
});
function search(){
	var html='';
	var url = "${ctx}/stcode/stcode!showToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"stcodeId=${param.stcodeId}",
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#stCode').text(replaceNull(data.model.stCode));
				$('#serialNumber').text(replaceNull(data.model.serialNumber));
				$('#username').val(replaceNull(data.model.username));
				$('#agentName').val(replaceNull(data.model.agentName));
				$('#telNumber').val(replaceNull(data.model.telNumber));
				$('#faddress').val(replaceNull(data.model.faddress));
				$('#fmark').val(replaceNull(data.model.fmark));
				$('#fcolor').val(replaceNull(data.model.fcolor));
				$('#fqty').val(replaceNull(data.model.fqty));
				$('#isinvoice').val(replaceNull(data.model.isinvoice));
				$('#invoiceHead').val(replaceNull(data.model.invoiceHead));
				$('#tracknumber').val(replaceNull(data.model.tracknumber));
				$('#famount').val(replaceNull(data.model.famount));
				$('#trackamount').val(replaceNull(data.model.trackamount));
				$('#giveaway').val(replaceNull(data.model.giveaway));
				$('#feedback').val(replaceNull(data.model.feedback));
				$('#flowup').val(replaceNull(data.model.flowup));
				$('#customerservice').val(replaceNull(data.model.customerservice));
				$('#fadressdetail').val(replaceNull(data.model.fadressdetail));
				$('#quality').val(replaceNull(data.model.quality));
				$('#sendTime').val(replaceNull(data.model.sendTime));
			}
		}
	});
}
function saveinfo(){
	var formParam = $('#inputForm').serialize();
	var url = "${ctx}/stcode/stcode!saveToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:formParam,
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
	window.location.href = "${ctx}/mobile/totaldatasendinfo.jsp?stcodequery=${param.stcodequery}";
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
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<form id="inputForm" method="post">
			<input name="id" type="hidden" value="${param.stcodeId }"/>
			<table class="zebra">
				<thead>
					<tr><th colspan="2" style="font-size: 16px;">书童信息</th></tr>
				</thead>
				<tbody>
					<tr><td>依云序列号：</td><td id="stCode"></td></tr>
					<tr><td>出厂序列号：</td><td id="serialNumber"></td></tr>
					<tr>
						<td>颜色：</td>
						<td><select name="fcolor" id="fcolor" style="width:80%;height:25px;"><option value=""></option><option value="1">甜心粉</option><option value="2">梦幻蓝</option></select></td>
					</tr>
					<tr>
						<td>品质：</td>
						<td><select name="quality" id="quality" style="width:80%;height:25px;"><option value=""></option><option value="A">A</option><option value="B">B</option><option value="C">C</option></select></td>
					</tr>
					<tr>
						<td>状态：</td>
						<td><select name="fqty" id="fqty" style="width:80%;height:25px;"><option value=""></option><option value="0">未发货</option><option value="1">已发货</option></select></td>
					</tr>
					<tr>
					    <td>使用人：</td>
					    <td><input name="username" id="username" style="width:80%;"/></td>
					<tr>
					    <td>手机号：</td>
					    <td><input name="telNumber" id="telNumber" style="width:80%;"/></td>
					</tr>
				    <tr>
				        <td>省市：</td>
				        <td><input name="faddress" id="faddress" style="width:80%;"/></td>
				    </tr>
				    <tr>
				        <td>详细地址：</td>
				        <td><input name="fadressdetail" id="fadressdetail" style="width:80%;"/></td>
				    </tr>
				    <tr>
				       <td>赠品：</td>
				       <td>
				       	   <select style="width:80%;height: 25px;" name="giveaway" id="giveaway">
				        		<option value="7">学习卡+三脚架+优盘+幕布</option>
				        		<option value="1">学习卡+三脚架+优盘</option>
				        		<option value="12">幕布+三脚架+优盘</option>
				        		<option value="13">学习卡+三脚架+幕布</option>
				        		<option value="2">学习卡+三脚架</option>
				        		<option value="9">三脚架+幕布</option>
				        		<option value="3">学习卡+优盘</option>
				        		<option value="10">学习卡+幕布</option>
				        		<option value="8">优盘+幕布</option>
				        		<option value="4">学习卡</option>
				        		<option value="5">优盘</option>
				        		<option value="6">幕布</option>
				        		<option value="11">无</option>
				        	</select>
				        </td>
				    </tr>
				    <tr>
				        <td>备注：</td>
				        <td><input name="fmark" id="fmark" class="input160" style="width:80%;"/></td>
				    </tr>
				    <tr>
				        <td>是否开票：</td>
				        <td><select class="select120" style="width:80%;" name="isinvoice" id="isinvoice"><option value="0">否</option><option value="1">是</option></select></td>
				    </tr>
				    <tr>
				        <td>发票抬头：</td>
				        <td><input name="invoiceHead" id="invoiceHead" class="input160" style="width:80%;"/></td>
				    </tr>
				    <tr>
				        <td>金额：</td>
				        <td><input name="famount" id="famount" class="input160" style="width:80%;"/></td>
				    </tr>
				    <tr>
				        <td>快递单号：</td>
				        <td><input name="tracknumber" id="tracknumber" style="width:80%;"/></td>
				   	</tr>
				    <tr>
				        <td>快递费用：</td>
				        <td><input name="trackamount" id="trackamount" class="input160" style="width:80%;"/></td>
				    </tr>
				    <tr>
					    <td>代理商：</td>
					    <td><input name="agentName" id="agentName" style="width:80%;"/></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="margin-bottom: 10px;">
			<Button style="width:50px;height:25px;" onclick="saveinfo();">提交</Button>
			<Button style="width:50px;height:25px;margin-left:20%;" onclick="cancel();">取消</Button>
		</div>
	</div>
</div>
</body>
</html>