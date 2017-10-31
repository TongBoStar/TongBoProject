<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>我的收益</title>
<style type="text/css">
/* ul li以横排显示 */
/* 所有class为menu的div中的ul样式 */
div.menu ul{
    list-style:none; /* 去掉ul前面的符号 */
    margin: 0px; /* 与外界元素的距离为0 */
    padding: 0px; /* 与内部元素的距离为0 */
    width: auto; /* 宽度根据元素内容调整 */
}
/* 所有class为menu的div中的ul中的li样式 */
div.menu ul li{
    float:left; /* 向左漂移，将竖排变为横排 */
}
/* 所有class为menu的div中的ul中的a样式(包括尚未点击的和点击过的样式) */
div.menu ul li a, div.menu ul li a:visited{
    #background-color: #465c71; /* 背景色 */
    #border: 2px #4e667d solid; /* 边框 */
    #border: 2px #64c324 solid; /* 边框 */
    #color: #dde4ec; /* 文字颜色 */
    color: #000000; /* 文字颜色 */
    display: block; /* 此元素将显示为块级元素，此元素前后会带有换行符 */
    line-height: 1.35em; /* 行高 */
    padding: 2px 8px; /* 内部填充的距离 */
    text-decoration: none; /* 不显示超链接下划线 */
    white-space: nowrap; /* 对于文本内的空白处，不会换行，文本会在在同一行上继续，直到遇到 <br> 标签为止。 */
    text-align: center;
    font-size: 14px;
}
/* 所有class为menu的div中的ul中的a样式(鼠标移动到元素中的样式) */
div.menu ul li a:hover{
	#background-color: #bfcbd6; /* 背景色 */
    #background-color: #66FF00; /* 背景色 */
    color: #465c71; /* 文字颜色 */
    text-decoration: none; /* 不显示超链接下划线 */
}
/* 所有class为menu的div中的ul中的a样式(鼠标点击元素时的样式) */
div.menu ul li a:active{
    #background-color: #465c71; /* 背景色 */
    background-color: #FFFFFF; /* 背景色 */
    color: #cfdbe6; /* 文字颜色 */
    text-decoration: none; /* 不显示超链接下划线 */
}
</style>
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
	window.location.href = "${ctx}/mobile/tixianjilu.jsp?openid=${param.openid}";
}
function togdlr(){
	window.location.href = "${ctx}/mobile/shouyimingxi.jsp?openid=${param.openid}";
}
function tokhmy(){
	window.location.href = "${ctx}/mobile/kehumanyi.jsp?openid=${param.openid}";
}
function totjfh(fhtype){
	window.location.href = "${ctx}/mobile/tuijianfenhong.jsp?openid=${param.openid}&fhtype="+fhtype;
}
function tozxjf(){
	window.location.href = "${ctx}/mobile/zhixiaojifen.jsp?openid=${param.openid}";
}
function tofhjf(fhtype){
	window.location.href = "${ctx}/mobile/fenhongjifen.jsp?openid=${param.openid}&fhtype="+fhtype;
}
</script>
</head>
<body style="text-align: center;margin:0 auto; ">
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<div style="background: #64c324;padding:10px;">
			<div>我的收益</div>
		</div>
		<div style="padding:10px;background: #FFFFFF;">
			<div class="menu" style="height: 60px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">累计收益<br/><span id="ketixian2">0</span></a></li>
					<li style="width:30%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;">马上提现</a></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
			<div class="menu" style="height: 40px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">可提现<br/><span id="ketixian">0</span></a></li><li style="width:10%;height:90%;"></li>
					<li><a href="javascript:void(0);">待提现<br/><span id="daitixian">0</span></a></li><li style="width:10%;height:90%;"></li>
					<li><a href="javascript:void(0);">已提现<br/><span id="yitixian">0</span></a></li>
				</ul>
			</div>
		</div>
		<div style="width:100%;height:10px;background:#999999 ;"></div>
		<div style="padding:10px;background: #FFFFFF;">
			<div class="menu" style="height: 40px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">直销返利</a></li>
					<li style="width:2%;height:90%;"></li>
					<li><a href="javascript:void(0);">0</a></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
			<div class="menu" style="height: 40px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">固定利润<br/><span id="ketixian">0</span></a></li><li style="width:1%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;" onclick="togdlr();">查看</a></li><li style="width:2%;height:90%;"></li>
					<!-- <li><a href="javascript:void(0);">客户满意奖<br/><span id="yitixian">0</span></a></li><li style="width:1%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;" onclick="tokhmy();">查看</a></li> -->
				</ul>
			</div>
		</div>
		<div style="width:100%;height:10px;background:#999999 ;"></div>
		<div style="padding:10px;background: #FFFFFF;">
			<div class="menu" style="height: 40px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">推荐分红</a></li>
					<li style="width:2%;height:90%;"></li>
					<li><a href="javascript:void(0);">0</a></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
			<div class="menu" style="height: 40px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">一级分红<br/><span id="ketixian">0</span></a></li><li style="width:2%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;" onclick="totjfh(1);">查看</a></li><li style="width:2%;height:90%;"></li>
					<li><a href="javascript:void(0);">二级分红<br/><span id="yitixian">0</span></a></li><li style="width:2%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;" onclick="totjfh(2);">查看</a></li>
				</ul>
			</div>
		</div>
		<div style="width:100%;height:10px;background:#999999 ;"></div>
		<div style="padding:10px;background: #FFFFFF;">
			<div class="menu" style="height: 35px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">家族贡献分</a></li>
					<li style="width:2%;height:90%;"></li>
					<li><a href="javascript:void(0);">0分</a></li>
					<li style="width:2%;height:90%;"></li>
					<li><a href="javascript:void(0);">满100分提现</a></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
			<div class="menu" style="height: 50px;text-align: left;">
				<ul>
					<li style="width:24%;"><a href="javascript:void(0);">直销积分<br/><span id="ketixian">0</span></a></li><li style="width:2%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;border: 2px #64c324 solid;" onclick="tozxjf();">查看</a></li><li style="width:2%;height:90%;"></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
			<div class="menu" style="height: 40px;text-align: left;">
				<ul>
					<li><a href="javascript:void(0);">一级推荐分<br/><span id="ketixian">0</span></a></li><li style="width:1%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;" onclick="tofhjf(1);">查看</a></li><li style="width:1%;height:90%;"></li>
					<li><a href="javascript:void(0);">二级推荐分<br/><span id="yitixian">0</span></a></li><li style="width:1%;height:90%;"></li>
					<li style="margin-top: 5px;"><a href="javascript:void(0);" style="border-radius:50px;border: 2px #64c324 solid;" onclick="tofhjf(2);">查看</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>