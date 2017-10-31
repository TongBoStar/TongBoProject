<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>日志与报表</title>
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
	
});
function totab(seq){
	if(seq==1){
		window.location.href = "${ctx}/mobile/totaldatalog.jsp";
	}
	if(seq==2){
		window.location.href = "${ctx}/mobile/totaldatastlog.jsp";
	}
	if(seq==3){
		window.location.href = "${ctx}/mobile/totaldatatab.jsp";
	}
	if(seq==4){
		window.location.href = "${ctx}/mobile/totaldatasendinfo.jsp";
	}
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div style="padding:5px 10px;background: #FFFFFF;margin-top: 40%;">
		<div style="vertical-align: middle;">
			<button style="width:80px;height:80px;border-radius:50px;" onclick="totab(1);">登录日志</button>
			<button style="width:80px;height:80px;border-radius:50px;margin-left: 10px;" onclick="totab(2);">书童日志</button>
			<button style="width:80px;height:80px;border-radius:50px;margin-left: 10px;" onclick="totab(3);">报表统计</button>
		</div>
		<div style="vertical-align: middle;margin-top: 20px;">
			<button style="width:80px;height:80px;border-radius:50px;" onclick="totab(4);">发货信息</button>
		</div>
		<!-- <div style="vertical-align: middle;margin-top: 20px;">
			<button style="width:50px;height:50px;border-radius:30px" onclick="totab(4);">学习</button>
			<button style="width:50px;height:50px;border-radius:30px;margin-left: 10px;" onclick="totab(5);">音乐</button>
			<button style="width:50px;height:50px;border-radius:30px;margin-left: 10px;" onclick="totab(6);">聊天</button>
		</div> -->
	</div>
</div>
</body>
</html>