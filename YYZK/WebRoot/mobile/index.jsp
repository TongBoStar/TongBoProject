<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no,width=device-width">
<title>艺人易家服务平台</title>
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/abc.css">
<style type="text/css">
#bottomToolbar{
	width:100%; height:40px; line-height:40px;
	background:#101010; border-top:2px solid #409F89;
	position:fixed; bottom:0; left:0;
	_position:absolute; _top:expression(documentElement.scrollTop+documentElement.clientHeight-this.offsetHeight);
	/*
		document.body.scrollTop 网页滚动的距离
		document.body.clientHeight 网页可见区域高
		this.offsetHeight 当前元素的高度
	*/
}
a{color:black}
a:hover{color:black}
.img1{
            width: 30px;
            height: 30px;
            border-radius:100px!important;
            padding: 5px;
        }
        .yryj td,tr,th { font-size:34px;text-align:left;}
#bottomToolbar a{ color:#FFF;}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="js/owl.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
var nonstr = '';
var sigre = '';
$(window).load(function() {
//alert('${param.openid}');//获取到用户的微信号
$.webAjax({
		type : 'post',
		url : "${ctx}/moduleImg/module-img!listToQuery.htm",
		data : 'moduleImgQuery.moduleId=0',
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.moduleImgList,function(i,o){
					html += '<a href="javascript:void(0);" class="item"><img src="${ctx}/'+o.imgPath+'" width="100%" height="120px;"></a>';
				});
				$('#owl').html(html);
				$('#owl').owlCarousel({
				    items: true,
				    autoPlay: true
				});
			}
		}
	});
$.webAjax({
	type : 'post',
	url : "${ctx}/admin/admin!checkAdminToJson.htm",
	data : 'adminQuery.wxCode=${param.openid}',
	success : function(data) {
		
	}
});
$.webAjax({
	type : 'post',
	url : "${ctx}/module/module!listToQuery.htm",
	data : 'moduleQuery.moduleLevel=1',
	success : function(data) {
		data = $.parseJSON(data);
		if(data.resultInfo[0]=='0'){
			var html = '';
			$.each(data.moduleList,function(i,o){
				html += '<a href="${ctx}/mobile/'+o.linkUrl+'?moduleParentId='+o.id+'&moduleCode='+o.moduleCode+'&openid=${param.openid}"><img src="${ctx}/'+o.moduleIcon+'"><span>'+o.moduleName+'</span></a>';
			});
			$('#modules').html(html);
		}
	}
});
$.webAjax({
	type : 'post',
	url : "${ctx}/item/item!listToJson.htm",
	data : 'page.pageNo=1&page.pageSize=3&itemQuery.moduleCode=MODULE_BEAUNAIL',
	success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		if(data.resultInfo[0]=='0'){
			var html = '';
			$.each(page.result,function(i,o){
				html += '<div class="baoliao_content" style="width:29%;margin-right:1%;margin-left:2%;">';
		       	html += '	<div style="padding:3%;">';
		        html += '		<div class="bl_img" style="width:100%;height:auto;"><img src="${ctx}/'+o.indexImg+'" style="width:100%;height:16%;"/></div>';
		        html += '		<div class="bl_right" style="width:100%;height:auto;font-size: 14px;">';
		        html += '			<div class="bl_title">';
		        html += '				<div style="float:left;padding-top:5px;">'+o.itemName+'</div>';
		        html += '			</div>';
		        html += '			<div class="bl_tag">';
		        html += '				<div class="bl_price">￥'+o.itemPriceAux+'</div>';
		        html += '				<div class="bl_price" style="float:right;font-size: 12px;color:gray;">';
		        html += '					<img src="images/love.png" style="vertical-align: middle;with:2%;height:2%;"/><span>1800</span>';
		        html += '				</div>';
		        html += '			</div>';
		        html += '		</div>';
		        html += '	</div>';
		        html += '</div>';
			});
			$('#meijianewup').html(html);
		}
	}
});
$.webAjax({
	type : 'post',
	url : "${ctx}/item/item!listToJson.htm",
	data : 'page.pageNo=1&page.pageSize=3&itemQuery.moduleCode=MODULE_JIAJIAO',
	success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		if(data.resultInfo[0]=='0'){
			var html = '';
			$.each(page.result,function(i,o){
				html += '<div class="baoliao_content" style="width:29%;margin-right:1%;margin-left:2%;">';
		       	html += '	<div style="padding:3%;">';
		        html += '		<div class="bl_img" style="width:100%;height:auto;"><img src="${ctx}/'+o.indexImg+'" style="width:100%;height:16%;"/></div>';
		        html += '		<div class="bl_right" style="width:100%;height:auto;font-size: 14px;">';
		        html += '			<div class="bl_title">';
		        html += '				<div style="float:left;padding-top:5px;">'+o.itemName+'</div>';
		        html += '			</div>';
		        html += '			<div class="bl_tag">';
		        html += '				<div class="bl_price">￥'+o.itemPriceAux+'</div>';
		        html += '				<div class="bl_price" style="float:right;font-size: 12px;color:gray;">';
		        html += '					<img src="images/love.png" style="vertical-align: middle;with:2%;height:2%;"/><span>1800</span>';
		        html += '				</div>';
		        html += '			</div>';
		        html += '		</div>';
		        html += '	</div>';
		        html += '</div>';
			});
			$('#jiajiaonewup').html(html);
		}
	}
});		
$.webAjax({
	type : 'post',
	url : "${ctx}/item/item!listToJson.htm",
	data : 'page.pageNo=1&page.pageSize=5',
	success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		if(data.resultInfo[0]=='0'){
			var html = '';
			var mleft = '';
			$.each(page.result,function(i,o){
				if(i==0){
					mleft = '10px';
				}else{
					mleft = '0px';
				}
				html += '<li style="width: 110px; height: 110px; margin: 0px 10px 0px '+mleft+';">';
				html += '	<div class="quick-entrance-cube" data-index="0">';
				html += '		<img src="${ctx}/'+o.indexImg+'" width="100%" height="90%">';
				html += '		<div class="new-tip">';
				html += '			<img src="images1/activity_new_tip.png">';
				html += '		</div>';
				html += '		<div class="cube-text">';
				html += '			<span>'+o.itemName+'</span>';
				html += '		</div>';
				html += '	</div>';
				html += '</li>';
			});
			$('#firstnewup').html(html);
		}
	}
});	



$.webAjax( {
		type : 'post',
		url : "${ctx}/wxinfo/wxinfo!sigre.htm",
		data : 'wxinfoQuery.appId='+window.location.href,
		success : function(data) {			
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				/*
				* 注意：    
				* 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。    
				* 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。    
				* 3. 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html    
				*    
				* 如有问题请通过以下渠道反馈：    
				* 邮箱地址：weixin-open@qq.com    
				* 邮件主题：【微信JS-SDK反馈】具体问题    
				* 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。    
				*/    
				//alert(window.location.href+"=="+data.wxinfoQuery.signature+"=="+data.wxinfoQuery.noncestr+"=="+data.wxinfoQuery.token_expireTime+"=="+data.wxinfoQuery.appId);
				wx.config({
					debug: false,    
					appId: data.wxinfoQuery.appId,    
					timestamp: data.wxinfoQuery.token_expireTime,    
					nonceStr: data.wxinfoQuery.noncestr,    
					signature: data.wxinfoQuery.signature,    
					jsApiList: [    
						'checkJsApi',    
						'onMenuShareTimeline',    
						'onMenuShareAppMessage',    
						'onMenuShareQQ'  
					]    
				});
				wx.ready(function () {
				    wx.checkJsApi({
				      jsApiList: [
				        'getNetworkType',
				        'previewImage'
				      ],
				      success: function (res) {
				        //alert(JSON.stringify(res));
				      }
				    }); 
				     wx.onMenuShareTimeline({
				      title: '艺人易家服务平台',
				      desc: '突然间,我发现,它真的是在为我们着想!',
				      link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx5c6e790a0d54fc31&redirect_uri=http://www.gas366.com/user/userinfo&response_type=code&scope=snsapi_base&state=1#wechat_redirect',
				      imgUrl: 'http://www.gas366.com/mobile/images/slider4.jpg',
				      trigger: function (res) {
				        alert('用户点击分享到朋友圈');
				      },
				      success: function (res) {
				        alert('已分享');
				      },
				      cancel: function (res) {
				        alert('已取消');
				      },
				      fail: function (res) {
				        alert(JSON.stringify(res));
				      }
				    });
				    wx.onMenuShareAppMessage({
					    title: '艺人易家商城', // 分享标题
					    desc: '给大家分享个非常好的商城', // 分享描述
					    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx5c6e790a0d54fc31&redirect_uri=http://www.gas366.com/user/userinfo&response_type=code&scope=snsapi_base&state=1#wechat_redirect', // 分享链接
					    imgUrl: 'http://www.gas366.com/mobile/images/slider4.jpg', // 分享图标
					    type: 'link', // 分享类型,music、video或link，不填默认为link
					    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
					    trigger: function (res) {
					        alert('用户点击发送给朋友');
					      },
					    success: function () { 
					        // 用户确认分享后执行的回调函数
					        alert('已发送');
					    },
					    cancel: function () { 
					        // 用户取消分享后执行的回调函数
					        alert('取消发送');
					    }
					});
				});
			}
		}
	});
	$("#status").fadeOut();
	$("#preloader").delay(300).fadeOut("slow");
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(".mall_list a").click(function(){
		var index = layer.open({
			type: 1,
			title: false,
			closeBtn: false,
			shadeClose: false,
			offset: '25%',
			content: "<div class='no_login_show'><h1>亲！您还没登录一起惠哦！</h1><a href='login.html'>马上登录</a><a href='register.html'>免费注册</a><a href='#'>先购物，再返利</a><a href='javascript:layer.closeAll();'>取消</a></div>"
		});
	});
	$("#msg_bijia").click(function(){
		layer.tips('请耐心等待一下，我们正在拼命开发中···','#msg_bijia');
	});
	$(window).scroll(function () {
		var scrollHeight = $(document).height();
		var scrollTop = $(window).scrollTop();
		var $windowHeight = $(window).innerHeight();
		scrollTop > 75 ? $(".gotop").fadeIn(200).css("display","block") : $(".gotop").fadeOut(200).css({"background-image":"url(images/iconfont-fanhuidingbu.png)"});
	});
	$('.backtop').click(function (e) {
		$(".gotop").css({"background-image":"url(images/iconfont-fanhuidingbu_up.png)"});
		e.preventDefault();
		$('html,body').animate({ scrollTop:0});
	});
});
</script>
</head>

<body>
<div class="mobile">
	<div id="preloader">
	    <div id="status">
	      <p class="center-text"><span>拼命加载中···</span></p>
	    </div>
  	</div>
	<div class="top w">
		<div style="background-color:transparent;width: 100%;height:37px;">
	   		<select style="width:25%;;height:37px;text-size:20px;text-align:center;font-weight:bold;float:left;padding:0 auto;border:1px solid #009999;border-right: none;-webkit-appearance: none;border-radius: 0;background-color:white;">
       			<option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;泰安</option>
       		</select>
	   		<input type="text" class="search_input" placeholder="项目或手艺人" style="border:1px solid #009999;width:60%;-webkit-appearance: none;border-radius: 0;outline:none;">
	   		<input name="" type="button" class="search_submit" value="搜索" style="width:15%;-webkit-appearance: none;border-radius: 0;">
	    </div>
	   	<div class="m_banner" id="owl"></div>
		<div class="m_nav" id="modules"></div>
	</div>
  	
	  	<div class="m_mall w">
		  	<div class="mall_title"><span>最新上线</span><em><a href="#">更多</a></em></div>
		  	<div id="quick-entrance-new" class="index-slider-jianju" data-reactid="3"><ul data-reactroot="" class="qe-wrapper" id="firstnewup"></ul></div>
		</div>
	  <div class="m_baoliao w">
	    <div class="baoliao_title"><span>热门美甲</span><em><a href="#">更多</a></em></div>
	    <div class="baoliao_list" style="margin-bottom:10px;" id="meijianewup"></div>
	    <div class="baoliao_title"><span>热门家教</span><em><a href="#">更多</a></em></div>
	    <div class="baoliao_list" style="margin-bottom:10px;" id="jiajiaonewup"></div>
	    <div class="bl_more"><a href="#">加载更多</a></div>
	  </div>
</div>
<div class="gotop backtop" style="display:none;"></div>
<footer><ul class="footer">
    <li><a id="footer_home" class="nav-controller active" style="width: 100%;"><i class="fb fb-home"></i>首页</a></li>
    <!-- <li><a id="footer_rank" class="nav-controller" style="width: 100%;" href="cat2.html"><i class="fb fb-rank"></i>分类</a></li> -->
    <li><a id="footer_oversea" class="nav-controller" style="width: 100%;" href="huodonglist.jsp?openid=${param.openid }"><i class="fb fb-oversea fb-badge"></i>活动</a></li>
    <li><a id="footer_personal" class="nav-controller" style="width: 100%;" href="userinfo.jsp?openid=${param.openid }"><i class="fb fb-user"></i>我的</a></li>
</ul></footer>
</body>
</html>