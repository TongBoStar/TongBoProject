<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>设备解绑</title>
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
	load('${param.openid}');
});
function load(wxcode){
	$.ajax({
		type: "post",
		url: "${ctx}/stWx/st-wx!listToQuery.htm",
		data:"stWxQuery.wxcode="+wxcode,
		success: function (data) {
			data = $.parseJSON(data);
			if(null!=data&&data.stWxList.length>0){
				$('#titleshow').html("您绑定了以下设备");
				$('#showfmark').html("请点击编号解绑");
			}else{
				$('#titleshow').html("您还没有绑定的设备<br/>扫描您的二维码绑定吧");
				$('#showfmark').html("");
			}
			var html = "";
			if(data.resultInfo[0]=='0'){
				$.each(data.stWxList,function(i,o){
					html += '<div style="font-size:18px;padding:20px 5px;"><a href="javascript:void(0);" onclick="subdel(\''+o.stCode+'\')">'+o.stCode+'</a></div>';
				});
				$('#devices').html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function subdel(stCode){
	var flag = window.confirm("确定删除"+stCode+"吗？");
	if (flag) {
		$.ajax({
			type: "post",
			url: "${ctx}/stWx/st-wx!deleteByWxCode.htm",
			data:"stWxQuery.wxcode=${param.openid}&stWxQuery.stCode="+stCode,
			success: function (data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					load('${param.openid}');
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
	<div style="height:80px;margin-top: 10px;"><img src="images/wawa.png" width="70px" height="80px;"/></div>
	<div id="titleshow" style="margin-top: 10px;font-size:20px;"></div>
	<div id="devices"></div>
	<div id="showfmark" style="margin-top: 10px;font-size:20px;"></div>
</div>
</body>
</html>