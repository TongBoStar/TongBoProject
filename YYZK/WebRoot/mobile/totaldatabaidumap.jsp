<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>报表统计</title>
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=P848g3G8yYDSdpcmgNxSKHKOF5GEh0iW"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
<script type="text/javascript">
var myAuto ;
$(window).load(function() {
	
});
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div style="padding:5px 10px;background: #FFFFFF;">
		<div id="allmap" style="height:100%;"></div>
	</div>
</div>
<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
	<table class="zebra"></table>
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
	var url = "${ctx}/stcode/stcode!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"",
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