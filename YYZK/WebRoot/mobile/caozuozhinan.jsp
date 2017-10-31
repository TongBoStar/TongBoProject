<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>产品操作指南</title>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	search();
});
/**
 * 加载列表
 */
function search(){
	var html='';
	var url = "${ctx}/helpvideo/helpvideo!listToQuery.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"helpvideoQuery.sortColumns=t_helpvideo.fseq asc",
		success : function(data) {
		data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var seq = 0;
				$.each(data.helpvideoList,function(i,o){
					html+='<div style="width:100%;height:50px;line-height: 60px;text-align:left;padding-left:20px;font-size: 16px;"><a href="javascript:void(0);" style="text-decoration:none;" onclick="todetail(\''+o.videoUrl+'\');">'+o.fseq+'.'+o.videoName+'</a></div>';
					if(null!=o.videoDetail&&""!=o.videoDetail){
						html+= '<div style="text-align:left;padding-left:35px;font-size: 14px;">'+o.videoDetail+'</div>';
					}
					seq = o.fseq;
				});
				html+='<div style="width:100%;height:50px;line-height: 60px;text-align:left;padding-left:20px;font-size: 16px;">'+(seq+1)+'.版本更新信息查看</div>';
				html+= '<div style="text-align:left;padding-left:35px;font-size: 14px;">版本:';
				html+= '<a style="margin-right:20px;margin-left:10px;" href="javascript:void(0);" onclick="tovision(5);">V1.5</a>';
				html+= '<a style="margin-right:20px;" href="javascript:void(0);" onclick="tovision(4);">V1.4</a>';
				html+= '<a style="margin-right:20px;" href="javascript:void(0);" onclick="tovision(3);">V1.3</a>';
				html+= '<a style="margin-right:20px;" href="javascript:void(0);" onclick="tovision(2);">V1.2</a>';
				html+= '<a style="margin-right:20px;" href="javascript:void(0);" onclick="tovision(1);">V1.1</a>';
				html+= '</div>';
				$('#mobilediv').html(html);
			}
		}
	});
}
function tovision(version){
	window.location.href = "${ctx}/mobile/versions.jsp?version="+version;
}
function todetail(videoId){
	if(videoId=='wx'){
		window.location.href = "http://v.qq.com/x/page/b0396mg5s1e.html";
	}else{
		window.location.href = "http://v.youku.com/v_show/id_"+videoId+"==.html";
		//window.location.href = "${ctx}/mobile/caozuozhinanview.jsp?vid="+videoId+"&title="+title;
	}
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
	<div class="mobile" id="mobilediv" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<!-- <div style="padding:5px 10px;background: #FFFFFF;margin-top: 5%;">
			<div style="width:100%;">
				<div style="vertical-align: middle;" onclick="todetail('XMjg2NzQyMzE3Mg');">
					<img src="http://g1.ykimg.com/05430608595B296B00000103D30C4B6B" style="vertical-align:middle;width: 250px;height:200px;"/>
					<div style="font-size: 14px;margin-top: 5px;font-size: 16px;font-weight: bold;">触控失灵的解决办法</div>
				</div>
			</div>
		</div>
		<div style="padding:5px 10px;background: #FFFFFF;margin-top: 5%;">
			<div style="width:100%;">
				<div style="vertical-align: middle;" onclick="todetail('XMjg2NzQxOTYzMg');">
					<img src="http://g4.ykimg.com/05430508595B29B100000110510A925B" style="vertical-align:middle;width: 250px;height:200px;"/>
					<div style="font-size: 14px;margin-top: 5px;font-size: 16px;font-weight: bold;">触控不准的解决办法</div>
				</div>
			</div>
		</div>
		<div style="padding:5px 10px;background: #FFFFFF;margin-top: 5%;">
			<div style="width:100%;">
				<div style="vertical-align: middle;" onclick="todetail('XMjg2NzQyNDk0MA');">
					<img src="http://g3.ykimg.com/05430808595B29CF00000170CF092DF7" style="vertical-align:middle;width: 250px;height:200px;"/>
					<div style="font-size: 14px;margin-top: 5px;font-size: 16px;font-weight: bold;">墙面触控模式使用方法</div>
				</div>
			</div>
		</div> -->
		<!-- <div style="width:100%;height:80px;line-height: 100px;text-align:left; font-size: 16px; "><a href="javascript:void(0);" onclick="todetail('XMjkwNzk0NzI2NA','中华小书童快速操作指南');">中华小书童快速操作指南</a></div>
		<div style="padding-left:20px;">adadafasdfasdfads</div>
		<div style="width:100%;height:80px;line-height: 100px; font-size: 16px;"><a href="javascript:void(0);" onclick="todetail('XMjk3NzExNjQ1Mg','触控不准或失灵的解决办法');">触控不准或失灵的解决办法</a></div>
		<div style="width:100%;height:80px;line-height: 100px; font-size: 16px; "><a href="javascript:void(0);" onclick="todetail('XMjg2NzQyNDk0MA','墙面触控模式使用方法');">墙面触控模式使用方法</a></div>
		<div style="width:100%;height:80px;line-height: 100px; font-size: 16px; "><a href="javascript:void(0);" onclick="todetail('XMjk3NzExNTU4MA','小书童常用快捷操作');">小书童常用快捷操作</a></div>
		<div style="width:100%;height:80px;line-height: 100px; font-size: 16px; "><a href="javascript:void(0);" onclick="todetail('XMjk3NzExMzgyMA','小书童应用下载方法');">小书童应用下载方法</a></div> -->
	</div>
</body>
</html>