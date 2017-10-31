<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>登陆日志</title>
<style type="text/css">
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
    font-size: 9px;
}
/*----------------------*/
.zebra td, .zebra th {
    padding: 10px;
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
    text-align: left;
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
	$.webAjax( {
		type : "post",
		url : "${ctx}/usermark/usermark!findByGroup.htm",
		data:"page.pageNo=1&page.pageSize=1000&usermarkQuery.sortColumns=t_usermark.takeTime desc&usermarkQuery.stCode="+$('#stCode').val()+
				"&usermarkQuery.username="+$('#username').val()+"&usermarkQuery.agentName="+$('#agentName').val() ,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(page.result,function(i,o){
					html+='<tr align="center">';
					//html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td><a href="${ctx}/mobile/totaldatastlog.jsp?stCode='+o.stCode+'">'+replaceNull(o.stCode)+'</a></td>';
					html+='<td>'+replaceNull(o.operateType==1?"上线":"下线")+'</td>';
					html+='<td>'+replaceNull(o.markContent)+'</td>';
					html+='<td>'+replaceNull(o.fversion)+'</td>';
					html+='<td>'+replaceNull(o.username)+'</td>';
					html+='<td>'+replaceNull(o.upTime)+'</td>';
				});
				$('#logtbody').html(html);
			}
			closeblockdiv();
		}
	});
}
function totab(seq){
	window.location.href = "${ctx}/mobile/totaldatalog.jsp";
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
		<div style="padding:5px;text-align: left;">
			<input type="text" id="stCode" value="${param.stCode }" style="height:20px;width:100px;" placeholder="依云序列号"/>
			<%-- <input type="text" id="serialNumber" value="${param.serialNumber }" style="height:20px;width:60px;" placeholder="出厂序列号"/> --%>
			<input type="text" id="username" value="${param.username }" style="height:20px;width:60px;" placeholder="使用人"/>
			<input type="text" id="agentName" value="${param.agentName }" style="height:20px;width:60px;" placeholder="代理商"/>
			<button style="width:50px;height:20px;font-size: 10px;" onclick="search();">查询</button>
		</div>
		<table class="zebra">
			<thead><tr><th>序号</th><th>序列号</th><th>类型</th><th>内容</th><th>版本</th><th>使用人</th><th>时间</th></tr></thead>
			<tbody id="logtbody"></tbody>
		</table>
	</div>
</div>
</body>
</html>