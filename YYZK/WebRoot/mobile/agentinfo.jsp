<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>代理商书童信息表</title>
<style type="text/css">
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
    font-size: 9px;
}
/*----------------------*/
.zebra td, .zebra th {
    padding: 10px 5px;
    border-bottom: 1px solid #f2f2f2;  
    text-align: center;   
}

.zebra tbody tr:nth-child(even) {
    background: #f5f5f5;
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
}

.zebra th {
    text-align: center;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
    border-bottom: 1px solid #ccc;
    background-color: #eee;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));
    background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
    background-image:    -moz-linear-gradient(top, #f5f5f5, #eee);
    background-image:     -ms-linear-gradient(top, #f5f5f5, #eee);
    background-image:      -o-linear-gradient(top, #f5f5f5, #eee); 
    background-image:         linear-gradient(top, #f5f5f5, #eee);
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
    border-top: 1px solid #fff;
    background-color: #f1f1f1;  
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
	var url = "${ctx}/stcode/stcode!listAgent.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"stcodeQuery.stCodeQuery="+$('#yystcode').val()+"&stcodeQuery.username="+
			$('#username').val()+"&stcodeQuery.agentName=oI5hev_rC3-o8ks9CIJlwrH1kYfE",//${param.openid}
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$.each(data.stcodeList,function(i,o){
					html+='<tr align="center">';
					html+='<td><input type="checkbox" name="stcodeid" value="'+o.id+'"/></td>';
					html+='<td>'+replaceNull(o.stCode)+'</td>';
					html+='<td>'+replaceNull(o.username)+'</td>';
					html+='<td>'+formatDate(replaceNull(o.feedback))+'</td>';
					html+='<td>'+formatDate(replaceNull(o.serialNumber))+'</td>';
					html+='<td>'+replaceNull(o.faddress)+'</td>';
				});
				$('#sendtbody').html(html);
			}
		}
	});
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
function toedit(){
	var cnt = 0;
	var editid = '';
	var checks = $('[name="stcodeid"]:checked');
	$.each(checks, function(i, o){			
		editid += $(o).val()+",";
		cnt++;
	});
	if(cnt==0){
		alert("请选择一条编辑的记录!");
		return;
	}//${param.openid}
	window.location.href = "${ctx}/mobile/agentinfoedit.jsp?openid=oI5hev_rC3-o8ks9CIJlwrH1kYfE&stcodeIds="+editid.substring(0,editid.length-1);
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
		<div style="height:30px;padding:5px;text-align: left;font-size: 12px;">
			<input type="text" id="yystcode" style="height:22px;width:100px;" placeholder="书童编号"/>
			<input type="text" id="username" style="height:22px;width:70px;margin-left:5px;" placeholder="使用人"/>
			<button style="width:40px;height:22px;font-size: 8px;" onclick="search();">查询</button>
			<button style="width:40px;height:22px;font-size: 8px;" onclick="toedit();">编辑</button>
		</div>
		<table class="zebra">
			<thead><tr><th width="10%">选择</th><th width="20%">书童编号</th><th width="15%">使用人</th><th width="20%">激活时间</th><th width="20%">最近登录</th><th width="15%">使用次数</th></tr></thead>
			<tbody id="sendtbody"></tbody>
		</table>
	</div>
</div>
</body>
</html>