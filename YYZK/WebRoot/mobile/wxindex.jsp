<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>个人主页</title>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
$(window).load(function() {
	loadwxuser();
});
var adminCode = "";
function loadwxuser(){
	$.ajax({
		type: "post",
		url: "${ctx}/admin/admin!loadAdminByWxCode.htm",
		data:"adminQuery.wxCode=${param.openid}",
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				adminCode = data.model.adminCode;
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function toweitixian(){
	window.location.href = "${ctx}/mobile/mymoney.jsp?openid=${param.openid}";
}
function totakerecords(){
	window.location.href = "${ctx}/mobile/tixianjilu.jsp?openid=${param.openid}";
}
function touserinfo(){
	window.location.href = "${ctx}/mobile/wxuser.jsp?openid=${param.openid}";
}
function toyunquma(){
	window.location.href = "${ctx}/mobile/usererweima.jsp?openid=${param.openid}&adminCode="+adminCode;
}
function totuijian(){
	window.location.href = "${ctx}/mobile/wodetuijian.jsp?openid=${param.openid}";
}
function toshouyi(){
	window.location.href = "${ctx}/mobile/mymoney.jsp?openid=${param.openid}";
}
</script>
</head>
<body style="text-align: center;margin:0 auto; ">
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<div style="background:#5d65cc;padding:30px 10px;">
			<div style="font-size: 18px;">累计收益</div>
			<div style="padding:2px;">￥<span style="font-size: 25px;font-weight: bold;">0</span></div>
		</div>
		<div style="padding:10px;background: #FFFFFF;">
			<div style="float: left;border-right: 1px solid #CCCC99;width:50%;">
				<div><span>已提现</span></div>
				<div style="padding:5px;">
					￥<span>0</span>
					<a href="javascript:void(0);" onclick="totakerecords();" style="border-radius:50px;width:30px;height:30px;margin-left: 20px;border: 1px solid #000000;padding:3px 10px;font-size: 12px;text-decoration:none;">查看</a>
				</div>
			</div>
			<div>
				<div>未提现</div>
				<div style="padding:5px;" onclick="toweitixian();">
				￥<span>0</span>
				<a href="javascript:void(0);" style="border-radius:50px;width:30px;height:30px;margin-left: 20px;border: 1px solid #000000;padding:3px 10px;font-size: 12px;text-decoration:none;">查看</a>
				</div>
			</div>
		</div>
		<div style="width:100%;height:10px;background:#999999 ;"></div>
		<div style="padding:15px 10px;background: #FFFFFF;">
			<div style="float: left;border-right: 1px solid #CCCC99;width:50%;">
				<div style="vertical-align: middle;" onclick="touserinfo();">
					<img src="images1/userinfo.png" style="vertical-align:middle;width: 30px;height:30px;"/>
					<span>个人信息</span>
				</div>
			</div>
			<div>
				<div style="vertical-align: middle;" onclick="toyunquma();">
					<img src="images1/zhengshu.png" style="vertical-align:middle;width: 30px;height:30px;"/>
					<span>我的云趣码</span>
				</div>
			</div>
		</div>
		<div style="padding:15px 10px;background: #FFFFFF;;">
			<div style="float: left;border-right: 1px solid #CCCC99;width:50%;">
				<div style="vertical-align: middle;" onclick="totuijian();">
					<img src="images1/friends.png" style="vertical-align:middle;width: 30px;height:30px;"/>
					<span>我的推荐</span>
				</div>
			</div>
			<div>
				<div style="vertical-align: middle;" onclick="toshouyi();">
					<img src="images1/shouyi.png" style="vertical-align:middle;width: 30px;height:30px;"/>
					<span>我的收益</span>
				</div>
			</div>
		</div>
		<div style="width:100%;height:95px;background:#FFFFFF;"></div>
		<div style="background: #FFFFFF;">
			<div style="width:96%;padding:5px 0px;font-size: 12px;text-align: left;padding-left:5px;"><img src="images1/notice.png" style="vertical-align:middle;width: 30px;height:30px;"/>&nbsp;云趣通知</div>
			<div style="text-align: left;padding:5px;border-bottom:1px dashed black;font-size: 14px;">
				<span>云趣家族系统正式上线啦,小伙伴们加油吧!</span>
			</div>
		</div>
	</div>
</body>
</html>