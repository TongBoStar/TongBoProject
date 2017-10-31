<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>会员中心</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/abc.css">
<style type="text/css">
a{color:black}
a:hover{color:black}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script>
$(window).load(function() {
	$("#status").fadeOut();
	$("#preloader").delay(350).fadeOut("slow");
	$.webAjax({
		type : 'post',
		url : "${ctx}/admin/admin!checkAdminToJson.htm",
		data : 'adminQuery.wxCode=${param.openid}',
		success : function(data) {
			data = $.parseJSON(data);
			$('#adminName').html(data.model.adminName);
			$('#userheader').attr("src",'${ctx}/'+data.model.headerUrl);
		}
	});
	$(".login_out").click(function(){
		layer.confirm('您确定要退出吗？',  {skin: 'layui-layer-molv',offset: '30%'}, function(index){
			layer.close(index);
			layer.msg('拜拜！欢迎下次光临！', {shift: 6, time: 1500},function(){
				window.location='index.html';
			});
		});
	});
})
function orderall(){
	window.location.href="orderlist.html";
}
</script>
<script type="text/javascript">
$(document).ready(function(){
});
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
	<div class="user_top w">
    	<div class="user_logo"><div class="img"><img src="images/user_logo.jpg" id="userheader"></div></div>
        <div class="user_info">
        	<div class="user_name" id="adminName">艺人易家</div>
            <div class="user_dengji">会员等级：黄金会员</div>
        </div>
    </div>
    <div class="user_nav_list w">
    	<ul>
    		<li>
            	<a href="orderlist.html">
            		<div class="u_nav_icon dingdan"></div>
            		<div class="u_nav_name">我的订单</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>查看全部订单</i></div>
              </a>
            </li>
    		<li>
               	<div class="u_nav_order" style="width:17%;"><a href="javascript:void(0);">待付款</a></div>
                <div class="u_nav_order" style="width:17%;">已付款</div>
                <div class="u_nav_order" style="width:17%;">拼单中</div>
                <div class="u_nav_order" style="width:17%;">已完成</div>
                <div class="u_nav_order" style="width:17%;">待评价</div>
               	<div class="u_nav_order" style="width:15%;">售后</div>
            </li>
        </ul>
        <ul style="border-top: 1px solid #EBEBEB;border-top:none;">
            <li>
            	<a href="money.html">
                	<div class="u_nav_icon money"></div>
                    <div class="u_nav_name">服务报名</div>
                     <div class="nt_icon"></div>
                    <div class="u_money"><i>进入</i></div>
              </a>
            </li>
            <li>
            	<a href="huibi.html">
                	<div class="u_nav_icon huibi"></div>
                    <div class="u_nav_name">我的收藏</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>8个</i></div>
              </a>
            </li>
            <li>
            	<a href="money_tixian.html">
                	<div class="u_nav_icon tixian"></div>
                    <div class="u_nav_name">我的评价</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>5条</i></div>
              </a>
            </li>
            <!-- <li>
            	<a href="huibi_tixian.html">
                	<div class="u_nav_icon tixian"></div>
                    <div class="u_nav_name">常用地址</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>3个</i></div>
              </a>
            </li> -->
            <li>
            	<a href="order.html">
                	<div class="u_nav_icon dingdan"></div>
                    <div class="u_nav_name">我的团购</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>10笔</i></div>
              </a>
            </li>
            <!-- <li>
            	<a href="qiandao.html">
                	<div class="u_nav_icon qiandao"></div>
                    <div class="u_nav_name">我的签到</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>今天您未签到</i></div>
              </a>
            </li>
            <li>
            	<a href="mail.html">
                	<div class="u_nav_icon znx"></div>
                    <div class="u_nav_name">站内消息</div>
                    <div class="nt_icon"></div>
                    <div class="u_money"><i>3条</i></div>
              </a>
            </li>
            <li>
            	<a href="user_info.html">
                	<div class="u_nav_icon anquan"></div>
                    <div class="u_nav_name">蹂躏我吧</div>
                    <div class="nt_icon"></div>
              </a>
            </li> -->
        </ul>
    </div>
  <!-- <div class="login_out w"><a href="javascript:void(0);"><span><img src="images/iconfont-tuichu.png"></span><i>安全退出</i></a></div>
  <div class="footer w">
  	<a href="#"><div class="ico_img"><img src="images/178hui-app.png"></div><span style="color:#00bb9c">客户端</span></a>
    <a href="index.html"><div class="ico_img"><img src="images/178hui-shouji.png"></div><span style="color:#eb4f38">触摸版</span></a>
    <a href="#"><div class="ico_img"><img src="images/178hui-diannao.png"></div><span>电脑版</span></a>
  </div>
  <div class="copyright">Copyright © 2012-2015 艺人易家 版权所有</div> -->
</div>
<footer><ul class="footer">
    <li><a id="footer_home" class="nav-controller" style="width: 100%;" href="index.jsp?openid=${param.openid }"><i class="fb fb-home"></i>首页</a></li>
    <!-- <li><a id="footer_rank" class="nav-controller" style="width: 100%;" href="cat2.html"><i class="fb fb-rank"></i>分类</a></li> -->
    <li><a id="footer_oversea" class="nav-controller" style="width: 100%;" href="huodonglist.jsp?openid=${param.openid }"><i class="fb fb-oversea fb-badge"></i>活动</a></li>
    <li><a id="footer_personal" class="nav-controller active" style="width: 100%;" href="userinfo.jsp?openid=${param.openid }"><i class="fb fb-user"></i>我的</a></li>
</ul></footer>
</body>
</html>