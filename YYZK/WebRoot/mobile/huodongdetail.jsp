<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="m.178hui.com" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>活动详情</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="frozenui/css/frozen.css" rel="stylesheet" type="text/css">
<link href="css/baoliao.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/abc.css">
<link href="css/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/commes.css" />
<link rel="stylesheet" href="css/photoswipe.css"> 
<style type="text/css">
.datatbody{min-width:420px;width:100%;}
.datatbody td{border:none;padding:5px;text-align: left;border-collapse:collapse; border-spacing: 0px;font-size: 12px;width:100px;}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="js/owl.js"></script>
<script src="js/photoswipe.min.js"></script> 
<script src="js/photoswipe-ui-default.min.js"></script> 
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
var nonstr = '';
var sigre = '';
$(window).load(function() {
//alert('${param.openid}');//获取到用户的微信号
$.webAjax({
		type : 'post',
		url : "/wxinfo/wxinfo!sigre.htm",
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
	
	$.webAjax({
		type : 'post',
		url : "/activityItem/activity-item!showToJson.htm",
		data : 'activityItemId=${param.activityItemId}',
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#activityItemName').html(data.model.activityItemName);
				$('#pricePlan').html(data.model.pricePlan);
				$('#priceAux').html(data.model.priceAux);
				$('#orgName').html(data.model.orgName);
				$('#activityDesc').html(data.model.activityDesc);
				$('#activityType').html(data.model.activityType);
				$('#orgName').html(data.model.organization.orgName);
			}
		}
	});
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
      <h2>活动详情</h2>
      <div class="head_right" style="top:8px;"><a href="index.html"">
      	<img src="images/indexhome.png" width="30px" height="30px;">
      </a></div>
    </div>
  </header>
  <!--header 结束-->
  <div class="view w">
  	<div class="m_banner" id="owl">
		<a href="javascript:void(0);" class="item"><img src="images1/meijia3.jpeg" width="100%" height="250px;"></a>
   		<!-- <a href="javascript:void(0);" class="item"><img src="images1/meijia5.jpg" width="100%" height="250px;"></a>
        <a href="javascript:void(0);" class="item"><img src="images1/meijia1.jpg" width="100%" height="250px;"></a> -->
    </div>
    <div class="bl_view_title" style="font-size: 18px;"><strong id="activityItemName">清凉一夏,鸡尾酒活动火热进行中</strong></div>
    <div class="bl_view_tag">
   		<div class="bl_view_price" style="font-size: 18px;font-weight: bold;" id="priceAux">￥1.00</div>
        <div class="bl_view_oprice" style="font-size: 15px;"  id="pricePlan">￥9.9</div> 
        <div class="bl_view_mall"><span class="bl_type" id="activityType">抽奖</span></div>
    </div>
    <div class="bl_view_tag" style="height:auto;">
    	<div style="padding:2px 5px;height:40px;font-size: 14px;">
    		<div style="float:left;"><span>商铺：</span><span id="orgName">泰安鸡尾酒第二运营分公司</span></div>
    	</div>
    </div>
    <div class="bl_view_tag" style="height:auto;">
    	<div style="padding:2px 5px;line-height: 22px;font-size: 14px;"><span>简介：</span><span id="activityDesc">泰安鸡尾酒第二运营分公司</span></div>
    </div>
    <div style="clear: both;float: none;"></div>
    <div class="bl_view_title" style="padding: 5px;float: none;clear: both;padding:2px 5px;">
    	<img src="images/n1.png" style="vertical-align: middle;margin-right:2px;"/><span class="bl_type">白菜价</span>
    	<img src="images/n2.png" style="vertical-align: middle;margin-right:2px;"/><span class="bl_type" style="background-color:#53bf1e;">不中退款</span>
    </div>
    <div style="clear: both;float: none;"></div>
    <div class="bl_view_tag" style="height:auto;font-size: 14px;">
    	<div class="bl_view_user" style="font-size: 16px;font-weight: bold;" >活动说明</div>
        <div style="float: none;clear: both;padding:2px 5px;line-height: 22px;">
        	<div style="overflow: auto;margin-bottom:5px;">
        		<font style="font-weight: bold;">活动时间：</font>2016-07-28至2016-08-28
        	</div>
        	<div style="overflow: auto;margin-bottom:5px;">
        		<font style="font-weight: bold;">活动内容：</font><br/>1.其他待审出入库添加时加入了制令号<br/> 2.采购订单添加了选择性打印功能(火狐浏览器需要更新flash插件) <br/> 
        		3.采购申请单和采购订单的规格型号调到前边<br/>  4.在有待审核的单据时在首页会有提醒<br/>  5.可以单个或者多个向ERP同步物料<br/>  6.系统说明文档还未完成,请等待
        	</div>
        	<div style="overflow: auto;margin-bottom:3px;">
        		<font style="font-weight: bold;">活动规则：</font><br/>1.其他待审出入库添加时加入了制令号<br/> 2.采购订单添加了选择性打印功能(火狐浏览器需要更新flash插件) <br/> 
        		3.采购申请单和采购订单的规格型号调到前边<br/>  4.在有待审核的单据时在首页会有提醒<br/>  5.可以单个或者多个向ERP同步物料<br/>  6.系统说明文档还未完成,请等待
        	</div>
        </div>
    </div>
  </div>
  
  <div class="bl_view_content w">
  	<div style="height:230px;margin-bottom:3px;margin-top:5px;text-align: center;"><img src="images/614.jpg" width="96%" height="230px"/></div>
  	<div style="height:230px;margin-bottom:3px;margin-top:5px;text-align: center;"><img src="images/614.jpg" width="96%" height="230px"/></div>
  	<div style="height:230px;margin-bottom:3px;margin-top:5px;text-align: center;"><img src="images/614.jpg" width="96%" height="230px"/></div>
  </div>
  <!--<div class="no_login w">您需要登录才能发表牛评哦！<a href="#">马上登录</a><a href="#">免费注册</a></div>-->
  <div class="bl_comment w" style="margin-bottom:50px;">
  	<h1>评论(20)</h1>
    <div class="comment_list">
    	<ul>
        	<li>
       	  	  <div class="pl_user_img"><img src="http://baoliao.178hui.com/upload/avatar/0000/0015/24_avatar_middle.jpg" /></div>
              <div class="pl_user_top">
                  <div class="pl_user_name">xxx198**</div>
                  <div class="pl_user_time">2016-07-15</div>
              </div>
              <div class="pl_user_comment">可以一个号多撸，不限次数，大家悠着点，别整黑号了。可以一个号多撸，不限次数，大家悠着点，别整黑号了。</div>
              <div class="my-gallery">
                    <figure>
                        <a href="images1/meijia1.jpg" data-size="800x1142">
                            <img src="images1/meijia1.jpg" width="90px" height="80px;">
                        </a>
                    </figure>
                    <figure>
                        <a href="images1/meijia4.jpg" data-size="800x1142">
                            <img src="images1/meijia4.jpg" width="90px" height="80px">
                        </a>
                    </figure>
                    <figure>
                        <a href="images1/meijia5.jpg" data-size="800x1142">
                            <img src="images1/meijia5.jpg" width="90px" height="80px">
                        </a>
                    </figure>
                </div>
                <!--显示的位置-->
                <div class="fx_address">泰安市泰山区</div>
            </li>
            <li>
       	  	  <div class="pl_user_img"><img src="http://baoliao.178hui.com/upload/avatar/0000/0015/24_avatar_middle.jpg" /></div>
              <div class="pl_user_top">
                  <div class="pl_user_name">xxx198**</div>
                  <div class="pl_user_time">2016-07-15</div>
              </div>
              <div class="pl_user_comment">可以一个号多撸，不限次数，大家悠着点，别整黑号了。可以一个号多撸，不限次数，大家悠着点，别整黑号了。</div>
              <div class="fx_address">泰安市泰山区</div>
            </li>
            <li>
       	  	  <div class="pl_user_img"><img src="http://baoliao.178hui.com/upload/avatar/0000/0015/24_avatar_middle.jpg" /></div>
              <div class="pl_user_top">
                  <div class="pl_user_name">xxx198**</div>
                  <div class="pl_user_time">2016-07-15</div>
              </div>
              <div class="pl_user_comment">可以一个号多撸，不限次数，大家悠着点，别7788整黑号了。</div>
            	<!--用户名and发布时间-->
                <div class="my-gallery">
                   <figure>
                        <a href="images1/meijia4.jpg" data-size="800x1142">
                            <img src="images1/meijia4.jpg" width="90px" height="80px">
                        </a>
                    </figure>
                    <figure>
                        <a href="images/11975511.jpg" data-size="800x1142">
                            <img src="images1/meijia5.jpg" width="90px" height="80px">
                        </a>
                    </figure>
                </div>
                <!--显示的位置-->
                <div class="fx_address">泰安市泰山区</div>
            </li>
        </ul>
    </div>
  </div>
<!--以下内容不要管-->
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="pswp__bg"></div>
	<div class="pswp__scroll-wrap">
		<div class="pswp__container">
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
		</div>
		<div class="pswp__ui pswp__ui--hidden">
			<div class="pswp__top-bar" style="font-size:20px;font-weight: bold;">
				<div class="pswp__counter"></div>
				<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
				<div class="pswp__preloader">
					<div class="pswp__preloader__icn">
						<div class="pswp__preloader__cut">
   							<div class="pswp__preloader__donut"></div>
                        </div>
                    </div>
                </div>
             </div>
             <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
             	<div class="pswp__share-tooltip"></div> 
           	 </div>
             <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
             <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
             <div class="pswp__caption">
             	<div class="pswp__caption__center"></div>
			 </div>
		</div>
	</div>
</div>
<script type="text/javascript">
            var initPhotoSwipeFromDOM = function(gallerySelector) {

                // parse slide data (url, title, size ...) from DOM elements 
                // (children of gallerySelector)
                var parseThumbnailElements = function(el) {
                    var thumbElements = el.childNodes,
                            numNodes = thumbElements.length,
                            items = [], figureEl, linkEl, size, item;
                    for (var i = 0; i < numNodes; i++) {
                        figureEl = thumbElements[i]; // <figure> element
                        // include only element nodes 
                        if (figureEl.nodeType !== 1) {
                            continue;
                        }
                        linkEl = figureEl.children[0]; // <a> element
                        size = linkEl.getAttribute('data-size').split('x');
                        // create slide object
                        item = {
                            src: linkEl.getAttribute('href'),
                            w: parseInt(400, 10),//size[0]
                            h: parseInt(400, 10)//size[1]
                        };
                        if (figureEl.children.length > 1) {
                            // <figcaption> content
                            item.title = figureEl.children[1].innerHTML;
                        }
                        if (linkEl.children.length > 0) {
                            // <img> thumbnail element, retrieving thumbnail url
                            item.msrc = linkEl.children[0].getAttribute('src');
                        }
                        item.el = figureEl; // save link to element for getThumbBoundsFn
                        items.push(item);
                    }
                    return items;
                };
                // find nearest parent element
                var closest = function closest(el, fn) {
                    return el && (fn(el) ? el : closest(el.parentNode, fn));
                };
                // triggers when user clicks on thumbnail
                var onThumbnailsClick = function(e) {
                    e = e || window.event;
                    e.preventDefault ? e.preventDefault() : e.returnValue = false;
                    var eTarget = e.target || e.srcElement;
                    // find root element of slide
                    var clickedListItem = closest(eTarget, function(el) {
                        return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
                    });
                    if (!clickedListItem) {
                        return;
                    }
                    // find index of clicked item by looping through all child nodes
                    // alternatively, you may define index via data- attribute
                    var clickedGallery = clickedListItem.parentNode,
                            childNodes = clickedListItem.parentNode.childNodes,
                            numChildNodes = childNodes.length, nodeIndex = 0, index;
                    for (var i = 0; i < numChildNodes; i++) {
                        if (childNodes[i].nodeType !== 1) {
                            continue;
                        }
                        if (childNodes[i] === clickedListItem) {
                            index = nodeIndex;
                            break;
                        }
                        nodeIndex++;
                    }
                    if (index >= 0) {
                        // open PhotoSwipe if valid index found
                        openPhotoSwipe(index, clickedGallery);
                    }
                    return false;
                };
                // parse picture index and gallery index from URL (#&pid=1&gid=2)
                var photoswipeParseHash = function() {
                    var hash = window.location.hash.substring(1),
                            params = {};
                    if (hash.length < 5) {
                        return params;
                    }
                    var vars = hash.split('&');
                    for (var i = 0; i < vars.length; i++) {
                        if (!vars[i]) {
                            continue;
                        }
                        var pair = vars[i].split('=');
                        if (pair.length < 2) {
                            continue;
                        }
                        params[pair[0]] = pair[1];
                    }
                    if (params.gid) {
                        params.gid = parseInt(params.gid, 10);
                    }
                    return params;
                };
                var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
                    var pswpElement = document.querySelectorAll('.pswp')[0], gallery, options, items;
                    items = parseThumbnailElements(galleryElement);
                    // define options (if needed)
                    options = {
                        // define gallery index (for URL)
                        galleryUID: galleryElement.getAttribute('data-pswp-uid'),
                        getThumbBoundsFn: function(index) {
                            // See Options -> getThumbBoundsFn section of documentation for more info
                            var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                                    rect = thumbnail.getBoundingClientRect();
                            return {x: rect.left, y: rect.top + pageYScroll, w: rect.width};
                        }
                    };
                    // PhotoSwipe opened from URL
                    if (fromURL) {
                        if (options.galleryPIDs) {
                            // parse real index when custom PIDs are used 
                            // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                            for (var j = 0; j < items.length; j++) {
                                if (items[j].pid == index) {
                                    options.index = j;
                                    break;
                                }
                            }
                        } else {
                            // in URL indexes start from 1
                            options.index = parseInt(index, 10) - 1;
                        }
                    } else {
                        options.index = parseInt(index, 10);
                    }
                    // exit if index not found
                    if (isNaN(options.index)) {
                        return;
                    }
                    if (disableAnimation) {
                        options.showAnimationDuration = 0;
                    }
                    // Pass data to PhotoSwipe and initialize it
                    gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
                    gallery.init();
                };
                // loop through all gallery elements and bind events
                var galleryElements = document.querySelectorAll(gallerySelector);
                for (var i = 0, l = galleryElements.length; i < l; i++) {
                    galleryElements[i].setAttribute('data-pswp-uid', i + 1);
                    galleryElements[i].onclick = onThumbnailsClick;
                }
                // Parse URL and open gallery if it contains #&pid=3&gid=1
                var hashData = photoswipeParseHash();
                if (hashData.pid && hashData.gid) {
                    openPhotoSwipe(hashData.pid, galleryElements[ hashData.gid - 1 ], true, true);
                }
            };
        // execute above function
            initPhotoSwipeFromDOM('.my-gallery');
        </script>
  <footer><ul class="footer">
    <li style="width: 25%;"><a id="footer_home" class="nav-controller active" style="width: 100%;"><i class="fb fb-home"></i>收藏</a></li>
    <li style="width: 25%;"><a id="footer_rank" class="nav-controller" style="width: 100%;" href="cat2.html"><i class="fb fb-rank"></i>店铺</a></li>
    <li style="width: 50%;"><input name="" type="button" class="pinlun_submit" value="参团" style="width:100%;height: 45px;background-color: #00bb9c;font-weight: bold;font-size: 16px;-webkit-appearance: none;border-radius: 0;" onclick="toorder();"></li>
</ul>
</footer>
</div>
</body>
</html>