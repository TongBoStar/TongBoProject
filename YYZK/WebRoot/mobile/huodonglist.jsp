<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>艺人易家服务平台</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/baoliao.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/abc.css">
<style type="text/css">
.img1{vertical-align: middle;width:30%;height:5%;border-radius:100px!important;}
.star1{vertical-align: middle;width:16%;height:4%;border-radius:100px!important;}
.star2{vertical-align: middle;width:10%;height:30%;border-radius:100px!important;}
.yryj td,tr,th { font-size:14px;text-align:left;padding:5px;}
#bottomToolbar a{ color:#FFF;}
.on{float:left;width:18px;height: 18px;cursor:pointer;text-indent:-9999px;
background:url(images/star.png) no-repeat;background-position:0 -28px;    background-size: 19px;}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
$(window).load(function() {
	$("#status").fadeOut();
	$("#preloader").delay(350).fadeOut("slow");
	var wi = document.body.offsetWidth;
	var hi = document.body.offsetHeight;
	var rate = wi/hi;
	if(rate>0.8){
		$('.img1').attr("width","25%");
		$('.img1').attr("height","6%");
	}else{
		$('.img1').attr("width","30%");
		$('.img1').attr("height","5%");
	}
})
</script>
<script type="text/javascript">
$(function(){
	$(".shaixuan").click(function(event){
		event.stopPropagation(); 
		$(".shaixuan_box").show();
		$(".shaixuan_box").animate({right:'100%'});
		$("body,html").css("overflow","hidden");
		$(".shaixuan_box").css("overflow","auto");
		$('body').bind("touchmove",function(e){    
                    e.preventDefault();    
            });
	});
	$(".shaixuan_mall a").click(function(event){
		 $("body,html").css("overflow","auto");
		$(".shaixuan_box").animate({right:'-100%'});
		$(".shaixuan_box").hide(5);	
		$("body").unbind("touchmove");  
	});
});
function tokaisuodetail(){
	window.location.href="huodongdetail.jsp?activityItemId=1";
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
    <div class="header"> <a class="new-a-back" href="index.html"> <span><img src="images/iconfont-fanhui.png"></span> </a>
      <h2>易家活动</h2>
      <div class="header_right shaixuan"><img src="images/iconfont-shaixuan.png"></div>
    </div>
  </header>
  <!--header 结束
	  <div class="search w">
        <form action="" method="get">
            <input name="" type="text" class="search_input" placeholder="请输入项目或手艺人信息">
            <input name="" type="button" class="search_submit" value="搜索">
        </form>
      </div>-->

  <div class="baoliao w">
      <div id="shouyirensort">
      <div class="baoliao_content" onclick="tokaisuodetail();" style="border:none;margin-top:5px;height:20%;">
       	<div style="width:100%;">
            <div style="width:40%;height:auto;float:left;margin:10px;"><img src="images1/huodong3.png" style="width:100%;height:90%;"/></div>
            <div class="bl_right" style="width:53%;height:auto;font-size: 14px;">
                <div class="bl_title" style="font-size: 16px;font-weight: bold;">
                	<div style="float:left;padding-top:5px;color:black;">2016夏季鸡尾酒大放送</div>
                	<div style="float:left;padding-top:5px;margin-left:10%;"></div>
                </div>
                <div class="bl_tag">
                    <div class="bl_oprice" style="font-size: 16px;text-decoration:none;color: red;margin-left:0px;">惊爆价：￥1</div>
                </div>
                <div class="bl_tag">
                    <div class="bl_price" style="color:black;font-size: 14px;">参与人数：1500</div>
                </div>
            </div>
           </div>
      </div>
      <div style="clear: both;"></div>
      <div class="baoliao_content" onclick="tokaisuodetail();" style="border:none;margin-top:5px;height:20%;">
       	<div style="width:100%;">
            <div style="width:40%;height:auto;float:left;margin:10px;"><img src="images1/huodong6.png" style="width:100%;height:100%;"/></div>
            <div class="bl_right" style="width:53%;height:auto;font-size: 14px;">
                <div class="bl_title" style="font-size: 16px;font-weight: bold;">
                	<div style="float:left;padding-top:5px;color:black;">2016夏季鸡尾酒大放送</div>
                	<div style="float:left;padding-top:5px;margin-left:10%;"></div>
                </div>
                <div class="bl_tag">
                    <div class="bl_oprice" style="font-size: 16px;text-decoration:none;color: red;margin-left:0px;">惊爆价：￥1</div>
                </div>
                <div class="bl_tag">
                    <div class="bl_price" style="color:black;font-size: 14px;">参与人数：1500</div>
                </div>
            </div>
           </div>
      </div>
      <div style="clear: both;"></div>
      <div class="baoliao_content" onclick="tokaisuodetail();" style="border:none;margin-top:5px;height:20%;">
       	<div style="width:100%;">
            <div style="width:40%;height:auto;float:left;margin:10px;"><img src="images1/huodong7.jpg" style="width:100%;height:100%;"/></div>
            <div class="bl_right" style="width:53%;height:auto;font-size: 14px;">
                <div class="bl_title" style="font-size: 16px;font-weight: bold;">
                	<div style="float:left;padding-top:5px;color:black;">2016夏季鸡尾酒大放送</div>
                	<div style="float:left;padding-top:5px;margin-left:10%;"></div>
                </div>
                <div class="bl_tag">
                    <div class="bl_oprice" style="font-size: 16px;text-decoration:none;color: red;margin-left:0px;">惊爆价：￥1</div>
                </div>
                <div class="bl_tag">
                    <div class="bl_price" style="color:black;font-size: 14px;">参与人数：1500</div>
                </div>
            </div>
           </div>
      </div>
      <div style="clear: both;"></div>
      <div class="baoliao_content" onclick="tokaisuodetail();" style="border:none;margin-top:5px;height:20%;">
       	<div style="width:100%;">
            <div style="width:40%;height:auto;float:left;margin:10px;"><img src="images1/huodong8.png" style="width:100%;height:100%;"/></div>
            <div class="bl_right" style="width:53%;height:auto;font-size: 14px;">
                <div class="bl_title" style="font-size: 16px;font-weight: bold;">
                	<div style="float:left;padding-top:5px;color:black;">2016夏季鸡尾酒大放送</div>
                	<div style="float:left;padding-top:5px;margin-left:10%;"></div>
                </div>
                <div class="bl_tag">
                    <div class="bl_oprice" style="font-size: 16px;text-decoration:none;color: red;margin-left:0px;">惊爆价：￥1</div>
                </div>
                <div class="bl_tag">
                    <div class="bl_price" style="color:black;font-size: 14px;">参与人数：1500</div>
                </div>
            </div>
           </div>
      </div>
    </div>
    <div class="bl_more"><a href="#">加载更多</a></div>
  </div>
  <!--筛选-->
  <footer><ul class="footer">
    <li><a id="footer_home" class="nav-controller" style="width: 100%;"><i class="fb fb-home"></i>首页</a></li>
    <li><a id="footer_rank" class="nav-controller" style="width: 100%;" href="cat2.html"><i class="fb fb-rank"></i>分类</a></li>
    <li><a id="footer_oversea" class="nav-controller active" style="width: 100%;"><i class="fb fb-oversea fb-badge"></i>精选</a></li>
    <li><a id="footer_personal" class="nav-controller" style="width: 100%;" href="user.html"><i class="fb fb-user"></i>我的</a></li>
</ul>
</footer>
  <div class="shaixuan_box">
	<div class="shaixuan_mall">
    	<h1>条件筛选</h1>
        <div class="shaixun_item">
        	<div style="height:40px;width:100%;">
        		<label style="font-size: 18px;">服务区域:</label>
        		<label><select style="width:30%;height:30px">
        			<option>泰山区</option>
        			<option>岱岳区</option>
        			<option>西城区</option>
        			<option>东城区</option>
        		</select></label>
        		<label><select style="width:30%;height:30px">
        			<option>泰山区</option>
        			<option>岱岳区</option>
        			<option>西城区</option>
        			<option>东城区</option>
        		</select></label>
        	</div>
            <div style="height:40px;width:100%;">
            	<label style="font-size: 18px;">服务价格:</label>
            	<label><select style="width:30%;height:30px">
            		<option>不限</option>
            		<option>100以下</option>
        			<option>100-200</option>
        			<option>200-300</option>
        			<option>300-400</option>
        			<option>400-500</option>
        			<option>500以上</option>
        			<option>100以下</option>
        			<option>100-200</option>
        			<option>200-300</option>
        			<option>300-400</option>
        			<option>400-500</option>
        			<option>500以上</option>
        		</select></label>
            </div>
            <div style="height:40px;width:100%;">
            	<label style="font-size: 18px;">服务时间:</label>
            	<label><select style="width:30%;height:30px">
            		<option>不限</option>
            		<option>100以下</option>
        			<option>100-200</option>
        			<option>200-300</option>
        			<option>300-400</option>
        			<option>400-500</option>
        			<option>500以上</option>
        		</select></label>
            </div>
    	</div>
        <p>
        <a href="#" class="shaixuan_colos" style="width:40%;margin-left:5%;margin-right:5%;">确定</a>
        <a href="#" class="shaixuan_colos" style="width:40%">关闭</a>
        </p>
    </div>
  </div>
</div>
</body>
</html>