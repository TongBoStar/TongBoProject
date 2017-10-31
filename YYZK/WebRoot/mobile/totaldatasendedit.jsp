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
				$('#stCode').html(data.model.stCode);
				$('#serialNumber').html(data.model.serialNumber);
				$('#fcolor').val(data.model.fcolor);
				$('#fqty').val(data.model.fqty);
				$('#quality').val(data.model.quality);
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
					<tr><td>依云序列号</td><td id="stCode"></td></tr>
					<tr><td>出厂序列号</td><td id="serialNumber"></td></tr>
					<tr>
						<td>颜色</td>
						<td><select name="fcolor" id="fcolor" style="width:100px;height:25px;"><option value=""></option><option value="1">甜心粉</option><option value="2">梦幻蓝</option></select></td>
					</tr>
					<tr>
						<td>品质</td>
						<td><select name="quality" id="quality" style="width:100px;height:25px;"><option value=""></option><option value="A">A</option><option value="B">B</option><option value="C">C</option></select></td>
					</tr>
					<tr>
						<td>状态</td>
						<td><select name="fqty" id="fqty" style="width:100px;height:25px;"><option value=""></option><option value="0">未发货</option><option value="1">已发货</option></select></td>
					</tr>
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