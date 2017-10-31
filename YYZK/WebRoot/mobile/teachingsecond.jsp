<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="m.178hui.com" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>艺人易家</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="frozenui/css/frozen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/abc.css">
<link href="css/index.css" rel="stylesheet" type="text/css" />

<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="js/owl.js"></script>
<script>
$(window).load(function() {
	$("#status").fadeOut();
	$("#preloader").delay(350).fadeOut("slow");
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(".shaixuan").click(function(event){
		event.stopPropagation(); 
		$(".shaixuan_box").show();
		$(".shaixuan_box").animate({right:'100%'});
		$("html,body").css("overflow","hidden");
	});
	$(document).click(function(event){
		$(".shaixuan_box").animate({right:'-100%'});
		$(".shaixuan_box").hide(5);
		$("html,body").css("overflow","");
	});    
});
function toorder(){
	window.location.href="toorder.html";
}
</script>
</head>

<body>
<div class="mobile">
	<!--页面加载 开始-->
  <div id="preloader">
    <div id="status">
      <p class="center-text"><span>拼命加载中···</span></p>
    </div>
  </div>
  <!--页面加载 结束--> 
  <!--header 开始-->
  <header>
    <div class="header"> <a class="new-a-back" href="baoliao.html"> <span><img src="images/iconfont-fanhui.png"></span> </a>
      <h2>便民服务</h2>
      <div class="head_right" style="top:8px;">
      <a href="index.html"">
      	<img src="images/indexhome.png" width="30px" height="30px;">
      </a>
      </div>
    </div>
  </header>
  <!--header 结束-->
  <div class="view w">
  	<div class="m_banner" id="owl">
			<a href="javascript:void(0);" class="item"><img src="images1/pijiu3.jpg" width="100%" height="120px;"></a>
	   		<a href="javascript:void(0);" class="item"><img src="images1/huodong7.jpg" width="100%" height="120px;"></a>
	        <a href="javascript:void(0);" class="item"><img src="images1/huodong8.png" width="100%" height="120px;"></a>
			<a href="javascript:void(0);" class="item"><img src="images1/huodong3.png" width="100%" height="120px;"></a>
	    </div>
    <div class="top w">
    	<div class="m_nav">
	    	<a href="bianminlist.html"><img src="images/kaihuansuo.png"><span>开换锁</span></a>
	        <a href="http://m.178hui.com/baoliao/index.html"><img src="images/banjia.png"><span>个人搬家</span></a>
	        <a href="http://m.178hui.com/taobao/index.html"><img src="images/gongsibanjia.png"><span>公司搬家</span></a>
	        <a href="http://m.178hui.com/article/index.html"><img src="images/xiashuidao.png"><span>通下水道</span></a>
	    </div>
	    <div class="m_nav">
	    	<a href="http://m.178hui.com/mall/index.html"><img src="images/bingxiang.png"><span>冰箱维修</span></a>
	        <a href="http://m.178hui.com/baoliao/index.html"><img src="images/kongtiao.png"><span>空调维修</span></a>
	        <a href="http://m.178hui.com/taobao/index.html"><img src="images/dianshi.png"><span>电视维修</span></a>
	        <a href="http://m.178hui.com/article/index.html"><img src="images/shouji.png"><span>手机维修</span></a>
	    </div>
	    <div class="m_nav">
	    	<a href="http://m.178hui.com/mall/index.html"><img src="images/fangwuloushui.png"><span>房屋漏水</span></a>
	        <a href="http://m.178hui.com/baoliao/index.html"><img src="images/jiatingbaojie.png"><span>家庭保洁</span></a>
	        <a href="http://m.178hui.com/taobao/index.html"><img src="images/dengjudianlu.png"><span>灯具电路</span></a>
	        <a href="http://m.178hui.com/article/index.html"><img src="images/menchuangjiaju.png"><span>门窗家具</span></a>
	    </div>
    </div>
  </div>
</div>
</body>
</html>