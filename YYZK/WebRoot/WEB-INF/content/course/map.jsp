<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<title>分布图</title>
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=P848g3G8yYDSdpcmgNxSKHKOF5GEh0iW"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.404, 39.915);
	map.centerAndZoom(point, 15);
	
	var markers = [];
	var pt = null;
	var i = 0;
	// 编写自定义函数,创建标注
	function addMarker(point){
	  var myIcon = new BMap.Icon("http://www.yiyunzk.com/images/wawasmall.png", new BMap.Size(300,157));
	  var marker = new BMap.Marker(point,{icon:myIcon});//,{icon:myIcon}
	  map.addOverlay(marker);
	  markers.push(marker);
	  var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "中华小书童" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	  message:"依云智酷(北京)科技有限公司"
	}
	var infoWindow = new BMap.InfoWindow("编号:ST17A208 <br/>地址:北京市东城区", opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	});
	}
	// 随机向地图添加25个标注
	var bounds = map.getBounds();
	var sw = bounds.getSouthWest();
	var ne = bounds.getNorthEast();
	var lngSpan = Math.abs(sw.lng - ne.lng);
	var latSpan = Math.abs(ne.lat - sw.lat);
	for (var i = 0; i < 5; i ++) {
		var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
		addMarker(point);
	}
	
	//最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
	var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});

	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	
	
	function showInfo(e){
		alert(e.point.lng + ", " + e.point.lat);
	}
	map.addEventListener("click", showInfo);
</script>
