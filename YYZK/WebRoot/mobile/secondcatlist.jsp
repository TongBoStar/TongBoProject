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
	$.webAjax({
		type : 'post',
		url : "${ctx}/module/module!showToJson.htm",
		data : 'moduleId=${param.moduleParentId}',
		success : function(data) {
			data = $.parseJSON(data);
			$('#h2title').html(data.model.moduleName);
		}
	});
	$.webAjax({
		type : 'post',
		url : "${ctx}/moduleImg/module-img!listToQuery.htm",
		data : 'moduleImgQuery.moduleId=${param.moduleParentId}',
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
		url : "${ctx}/module/module!listToQuery.htm",
		data : 'moduleQuery.moduleParentId=${param.moduleParentId}',
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var html = '';
				$.each(data.moduleList,function(i,o){
					if(i%4==0){
						html += '<div class="m_nav">';
					}
					html += '<a href="${ctx}/mobile/'+o.linkUrl+'?moduleCode='+o.moduleCode+'&moduleParentId='+o.id+'"><img src="${ctx}/'+o.moduleIcon+'"><span>'+o.moduleName+'</span></a>';
					if((i+1)%4==0){
						html += '</div>';
					}
				});
				$('#secondlistmenu').html(html);
			}
		}
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
    <div class="header"> <a class="new-a-back" href="index.jsp?openid=${param.openid }"> <span><img src="images/iconfont-fanhui.png"></span> </a>
      <h2 id="h2title"></h2>
      <%-- <div class="head_right" style="top:8px;">
      <a href="index.jsp?openid=${param.openid }">
      	<img src="images/indexhome.png" width="30px" height="30px;">
      </a>
      </div> --%>
    </div>
  </header>
  <!--header 结束-->
  <div class="view w">
  	<div class="m_banner" id="owl"></div>
    <div class="top w">
    	<div class="m_nav" id="secondlistmenu"></div>
    </div>
  </div>
</div>
</body>
</html>