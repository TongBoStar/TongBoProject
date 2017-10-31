<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>发货信息表</title>
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
	var url = "${ctx}/stcode/stcode!listToJson.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"page.pageNo=1&page.pageSize=1000&stcodeQuery.sortColumns=t_stcode.id desc&stcodeQuery.stCodeQuery="+$('#yystcode').val(),
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			if(data.resultInfo[0]=='0'){
				var fcolor = "";
				var isfqty = "";
				$.each(page.result,function(i,o){
					if(o.fcolor==1){
						fcolor = "甜心粉";
					}else if(o.fcolor==2){
						fcolor = "梦幻蓝";
					}else{
						fcolor = "";
					}
					if(o.fqty==1){
						isfqty = "已发";
					}else if(o.fqty==0){
						isfqty = "未发";
					}else{
						isfqty = "";
					}
					html+='<tr align="center">';
					html+='<td onclick="toeditall('+o.id+');">'+replaceNull(o.stCode)+'</td>';
					html+='<td onclick="toedit('+o.id+');">'+replaceNull(o.serialNumber)+'</td>';
					html+='<td>'+replaceNull(o.quality)+'</td>';
					html+='<td>'+isfqty+'</td>';
					html+='<td>'+replaceNull(fcolor)+'</td>';
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
var isdb;
function toedit(id){
    /* isdb=false;
    setTimeout(cc, 500);
    function cc(){
       	if(isdb!=false)return;
	   	window.location.href = "${ctx}/mobile/totaldatasendedit.jsp?stcodeId="+id+"&stcodequery="+$('#yystcode').val();
    } */
    window.location.href = "${ctx}/mobile/totaldatasendedit.jsp?stcodeId="+id+"&stcodequery="+$('#yystcode').val();
}
function toeditall(id){
	//isdb=true;
	window.location.href = "${ctx}/mobile/totaldatasendeditall.jsp?stcodeId="+id+"&stcodequery="+$('#yystcode').val();
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<div style="padding:5px;text-align: left;">
			依云序列号：<input type="text" id="yystcode" value="${param.stcodequery }" style="height:20px;width:100px;"/>
			<button style="width:50px;height:20px;font-size: 10px;" onclick="search();">查询</button>
		</div>
		<table class="zebra">
			<thead><tr><th width="25%">依云序列号</th><th width="20%">出厂序列号</th><th width="15%">品质</th><th width="20%">状态</th><th width="20%">颜色</th></tr></thead>
			<tbody id="sendtbody"></tbody>
		</table>
	</div>
</div>
</body>
</html>