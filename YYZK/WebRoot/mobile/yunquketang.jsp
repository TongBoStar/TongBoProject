<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>云趣资源</title>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
$(window).load(function() {
});
function todetail(type){
	if(type==1){
		window.location.href = "${ctx}/mobile/yiqiting.jsp?ftype=2";
	}else if(type==2){
		window.location.href = "${ctx}/mobile/yiqikanzhuanji.jsp";
	}else{
		
	}
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<div style="padding:5px 10px;background: #FFFFFF;margin-top: 30%;">
			<div style="float: left;width:50%;">
				<div style="vertical-align: middle;" onclick="todetail(1);">
					<img src="images1/yiqiting.png" style="vertical-align:middle;width: 100px;height:100px;"/>
					<!-- <div style="font-size: 14px;margin-top: 5px;font-size: 16px;font-weight: bold;">一起听</div> -->
				</div>
			</div>
			<div style="margin-left: 51%;">
				<div style="vertical-align: middle;" onclick="todetail(2);">
					<img src="images1/yiqikan.png" style="vertical-align:middle;width: 100px;height:100px;"/>
					<!-- <div style="font-size: 14px;margin-top: 5px;font-size: 16px;font-weight: bold;">一起看</div> -->
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 100px;font-size: 16px;font-weight: bold;">用中华小书童播放会获得更好的无广告体验</div>
</body>
</html>