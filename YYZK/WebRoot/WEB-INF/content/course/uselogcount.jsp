<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>统计分析</title>
<%@ include file="/sysresources/common/include.jsp"%>
<%-- <script type="text/javascript" src="${ctx}/sysresources/highcharts4.0.3/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/highcharts4.0.3/highcharts-more.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/highcharts4.0.3/exporting.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/custom/charts.js"></script> --%>
<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
<script src="https://img.hcharts.cn/highcharts/highcharts-3d.js"></script>
<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/custom/charts.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/custom/applicationjs/course/uselogcount.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=P848g3G8yYDSdpcmgNxSKHKOF5GEh0iW"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
.uploadify-queue {
    display:none;
}
</style>
</head>
<body id="bodymark">
    <div style="height:100%;">
    	<%@ include file="/sysresources/common/topmsg.jsp"%>
        <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        <!--BEGIN TOPBAR-->
        <%@ include file="/sysresources/common/top.jsp"%>
        <!--END TOPBAR-->
        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <%@ include file="/sysresources/common/menu.jsp"%>
            <!--END SIDEBAR MENU-->
            <!--BEGIN PAGE WRAPPER-->
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
	                <!--END TITLE & BREADCRUMB PAGE-->
	                <!--BEGIN CONTENT-->
	                <div id="table-sorter-tab" class="tab-pane fade in active" >
                         <ul id="sliderTab" class="nav nav-tabs ul-edit">
                             <li class="active"><a href="#upload-slider-tab" data-toggle="tab">汇总</a></li>
                             <li class=""><a href="#bracket-slider-tab" data-toggle="tab">动画</a></li>
                             <li class=""><a href="#bait-slider-tab" data-toggle="tab">游戏</a></li>
                             <li class=""><a href="#assweld-slider-tab" data-toggle="tab">学习</a></li>
                             <li class=""><a href="#assemble-slider-tab" data-toggle="tab">音乐</a></li>
                             <li class=""><a href="#delivery-slider-tab" data-toggle="tab">聊天</a></li>
                         </ul>
                         <div id="sliderTabContent" class="tab-content pan" style="border-bottom: none;">
                             <div id="upload-slider-tab" class="tab-pane fade active in" style="overflow:auto;min-height: 580px;height:580px;">
                             	<ul id="sliderTab" class="nav nav-tabs ul-edit">
                             		 <li class="active"><a href="#baidumap-slider-tab" data-toggle="tab">地图概况</a></li>
		                             <li class=""><a href="#all-timesandcounts" data-toggle="tab">总体概况</a></li>
		                             <li class=""><a href="#all-shiduan" data-toggle="tab">时段概况</a></li>
		                             <li class=""><a href="#all-shutong" data-toggle="tab">各设备概况</a></li>
		                             <li class=""><a href="#all-youxi" data-toggle="tab">游戏概况</a></li>
		                             <li class=""><a href="#all-xuexi" data-toggle="tab">学习概况</a></li>
		                             <li class=""><a href="#all-video" data-toggle="tab">视频概况</a></li>
		                             <li class=""><a href="#all-music" data-toggle="tab">音乐概况</a></li>
		                        </ul>
		                        <div class="tab-content pan" style="border-bottom: none;">
		                        <div id="baidumap-slider-tab" class="tab-pane fade active in" style="overflow:auto;min-height: 580px;height:580px;">
	                             	<div id="allmap"></div>
	                             </div>
                             	<div id="all-timesandcounts" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<div style="width:40%;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>看动画</th><th>学习</th><th>玩游戏</th><th>听音乐</th><th>语音对话</th></tr></thead>
	                             			<tbody id="shutongalltypes"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:60%;margin-left: 40%;">
                             			<div id="piealltypes" style="min-width:320px;height:250px;float:left;"></div>
                             			<div id="piealltypesshichang" style="min-width:320px;height:250px;margin-left: 320px;"></div>
                             		</div>
                             		<div style="clear: both;"></div>
                             		<div id="oneweekdataList" style="min-width:1100px;height:250px;"></div>
                             		<div style="clear: both;"></div>
                             		<div id="onemonthzhudataList" style="min-width:1100px;height:360px;"></div>
                             		<div style="clear: both;"></div>
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th colspan="7" style="background: #D3D3D3;">单台使用时长</th></tr></thead>
                             			<thead><tr><th>依云序列号</th><th>地域</th><th>天数</th><th>次数</th><th>时长(单位:小时)</th><th>活跃度(次/天)</th><th>活跃度(小时/天)</th></tr></thead>
                             			<tbody id="shutongzongshichang"></tbody>
                             		</table>
                             		
                             	</div>
                             	<div id="all-shutong" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<div>
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>看动画</th><th>学习</th><th>玩游戏</th><th>听音乐</th><th>语音对话</th></tr></thead>
	                             			<tbody id="shutongalldetypes"></tbody>
	                             		</table>
                             		</div>
                             	</div>
                             	<div id="all-shiduan" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<div style="width:40%;overflow:auto;height:500px;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th width="30%">时段</th><th width="70%">次数</th></tr></thead>
	                             			<tbody id="shutongshiduan"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:60%;margin-left:40%;">
                             			<div id="pieshiduan" style="min-width:500px;height:400px;float:left;margin-left:50px;margin-top:20px;"></div>
                             		</div>
                             	</div>
                             	<div id="all-youxi" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>语言学习</th><th>绘画</th><th>音乐</th><th>空间想象</th><th>逻辑思维</th><th>运动</th><th>数学</th><th>情感沟通</th><th>其他</th></tr></thead>
                             			<tbody id="shutongyouxileixing"></tbody>
                             		</table>
                             	</div>
                             	<div id="all-video" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>语言学习</th><th>绘画</th><th>音乐</th><th>空间想象</th><th>逻辑思维</th><th>运动</th><th>数学</th><th>情感沟通</th><th>其他</th></tr></thead>
                             			<tbody id="shutongdonghualeixing"></tbody>
                             		</table>
                             	</div>
                             	<div id="all-music" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>故事</th><th>儿歌</th><th>童话</th><th>国学</th><th>其他</th></tr></thead>
                             			<tbody id="shutongyinyueleixing"></tbody>
                             		</table>
                             	</div>
                             	<div id="all-xuexi" class="tab-pane fade" style="overflow:auto; width:auto;height:520px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>创造</th><th>动作</th><th>社交</th><th>探索</th><th>习惯</th><th>语言</th></tr></thead>
                             			<tbody id="shutongxuexileixing"></tbody>
                             		</table>
                             	</div>
                             	</div>
                             </div>
                             <div id="bracket-slider-tab" class="tab-pane fade" style="overflow:auto;min-height: 580px;height:580px;">
                               	<div style="overflow:auto; width:auto;height:300px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>动画名称</th><th>次数</th><th>时长</th></tr></thead>
                             			<tbody id="donghuashichang"></tbody>
                             		</table>
                             	</div>
                             	<div style="overflow:auto; width:auto;height:280px;">
                             		<div style="width:30%;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	                             			<tbody id="donghuafenlei"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:70%;margin-left: 30%;">
                             			<div id="piedonghuacishu" style="min-width:400px;height:250px;float:left;"></div>
                             			<div id="piedonhuashichang" style="min-width:400px;height:250px;margin-left: 400px;"></div>
                             		</div>
                             	</div>
                             </div>
                             <div id="bait-slider-tab" class="tab-pane fade" style="overflow:auto;min-height: 580px;height:620px;">
                                <div style="overflow:auto; width:auto;height:320px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>游戏名称</th><th>游戏包名</th><th>次数</th><th>时长</th></tr></thead>
                             			<tbody id="youxishichang"></tbody>
                             		</table>
                             	</div>
                             	<div style="overflow:auto; width:auto;height:280px;">
                             		<div style="width:30%;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	                             			<tbody id="youxifenlei"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:70%;margin-left: 30%;">
                             			<div id="pieyouxicishu" style="min-width:400px;height:250px;float:left;"></div>
                             			<div id="pieyouxishichang" style="min-width:400px;height:250px;margin-left: 400px;"></div>
                             		</div>
                             	</div>
                             </div>
                             <div id="assweld-slider-tab" class="tab-pane fade" style="overflow:auto;min-height: 580px;height:620px;">
                                 <div style="overflow:auto; width:auto;height:340px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>课程名称</th><th>次数</th><th>时长</th></tr></thead>
                             			<tbody id="xuexishichang"></tbody>
                             		</table>
                             	</div>
                             	<div style="overflow:auto; width:auto;height:280px;">
                             		<div style="width:30%;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	                             			<tbody id="xuexifenlei"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:70%;margin-left: 30%;">
                             			<div id="piexuexicishu" style="min-width:400px;height:250px;float:left;"></div>
                             			<div id="piexuexishichang" style="min-width:400px;height:250px;margin-left: 400px;"></div>
                             		</div>
                             	</div>
                             </div>
                             <div id="assemble-slider-tab" class="tab-pane fade" style="overflow:auto;min-height: 580px;height:620px;">
                                 <div style="overflow:auto; width:auto;height:340px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>音乐名称</th><th>次数</th><th>时长</th></tr></thead>
                             			<tbody id="yinyueshichang"></tbody>
                             		</table>
                             	</div>
                             	<div style="overflow:auto; width:auto;height:280px;">
                             		<div style="width:30%;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	                             			<tbody id="yinyuefenlei"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:70%;margin-left: 30%;">
                             			<div id="pieyinyuecishu" style="min-width:400px;height:250px;float:left;"></div>
                             			<div id="pieyinyueshichang" style="min-width:400px;height:250px;margin-left: 400px;"></div>
                             		</div>
                             	</div>
                             </div>
                             <div id="delivery-slider-tab" class="tab-pane fade" style="overflow:auto;min-height: 580px;height:580px;">
                             	<div style="overflow:auto; width:auto;height:250px;">
                             		<div style="width:50%;float:left;">
	                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	                             			<thead><tr><th>问答</th><th>提问</th><th>回答</th><th>文本类</th><th>链接类</th><th>诗词类</th><th>歌曲类</th></tr></thead>
	                             			<tbody id="voiceall"></tbody>
	                             		</table>
                             		</div>
                             		<div style="width:50%;margin-left: 50%;">
                             			<div id="pievoicebasic" style="min-width:550px;height:250px"></div>
                             		</div>
                             	</div>
                             	<div style="overflow:auto; width:auto;height:300px;">
                             		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
                             			<thead><tr><th>书童编号</th><th>问答</th><th>提问</th><th>回答</th><th>文本类</th><th>链接类</th><th>诗词类</th><th>歌曲类</th></tr></thead>
                             			<tbody id="voiceshutongall"></tbody>
                             		</table>
                             	</div>
                             </div>
                         </div>
					</div>
				
                <!--END CONTENT-->
            </div>
            <!--BEGIN FOOTER-->
            <%@ include file="/sysresources/common/footer.jsp"%>
            <!--END FOOTER-->
            <!--END PAGE WRAPPER-->
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.404, 39.915);
	map.centerAndZoom(point, 5);
	
	var markers = [];
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "中华小书童" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	  message:"依云智酷(北京)科技有限公司"
	}
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	
	/* function showInfo(e){
		alert(e.point.lng + ", " + e.point.lat);
	}
	map.addEventListener("click", showInfo); */
	
	var myIcon = new BMap.Icon("http://www.yiyunzk.com/images/wawasmall.png", new BMap.Size(100,50));
	// 向地图添加标注
	var url = ctx+"/stcode/stcode!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stcodeQuery.fqty=1",
		success : function(data) {
			data = $.parseJSON(data);
			$.each(data.stcodeList,function(i,o){
				if(null!=o.lng){
					var marker = new BMap.Marker(new BMap.Point(o.lng,o.lat),{icon:myIcon});  // 创建标注 自定义图标
					var content = "编号:"+o.stCode+"<br/>"+"地址:"+o.fupaddress;
					map.addOverlay(marker);// 将标注添加到地图中
					addClickHandler(content,marker);
					markers.push(marker);
				}
			});
			//最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
			var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
		}
	});
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
</script>