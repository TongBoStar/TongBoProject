<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>书童日志</title>
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
<script type="text/javascript">
$(window).load(function() {
	search();
});
function search(){
	$.webAjax( {
		type : "post",
		url : "${ctx}/stuselog/stuselog!listToJson.htm",
		data:"page.pageNo=1&page.pageSize=500&stuselogQuery.sortColumns=stuselog.takeTimeLong desc&stuselogQuery.stCode="+$('#stCode').val(),
		success : function(data) {
			data = $.parseJSON(data);
			var page = data.page;
			if(data.resultInfo[0]=='0'){
				var html = '';
				var operateModuleMark = "";
				var operateTypeMark = "";
				var operateContent = "";
				var taketimetmp = '';
				$.each(page.result,function(i,o){
					if(o.operateModuleMark=="IndexActivity"){
						operateModuleMark = "主界面";
					}else if(o.operateModuleMark=="voice"){
						operateModuleMark = "语音对话";
					}else if(o.operateModuleMark=="PlayerActivity"){
						operateModuleMark = "视频播放";
					}else if(o.operateModuleMark=="YiYunQiMengActivity"){
						operateModuleMark = "依云启蒙";
					}else if(o.operateModuleMark=="CourseDetailActivity"){
						operateModuleMark = "学习课程";
					}else if(o.operateModuleMark=="YiQiTingActivity"){
						operateModuleMark = "一起听";
					}else if(o.operateModuleMark=="YiQiKanActivity"){
						operateModuleMark = "一起看";
					}else if(o.operateModuleMark=="YiQiWanActivity"){
						operateModuleMark = "一起玩";
					}else if(o.operateModuleMark=="GameDragActivity"){
						operateModuleMark = "依云互动";
					}else if(o.operateModuleMark=="GameRightOrWrongActivity"){
						operateModuleMark = "依云互动";
					}else if(o.operateModuleMark=="Login"){
						operateModuleMark = "上线";
					}else if(o.operateModuleMark=="Logout"){
						operateModuleMark = "下线";
					}else if(o.operateModuleMark=="ApkInfo"){
						operateModuleMark = "软件安卸";
					}else if(o.operateModuleMark=="JiankangmoshiActivity"){
						operateModuleMark = "健康模式";
					}else if(o.operateModuleMark=="AppListActivity"){
						operateModuleMark = "应用管理";
					}else {
						operateModuleMark = "";
					}
					operateContent = replaceNull(o.operateContent);
					taketimetmp = replaceNull(o.takeTime);
					if(o.operateTypeMark=="stayTime"){
						operateTypeMark = "页面停留";
						operateContent = millisecondToDate(operateContent);
					}else if(o.operateTypeMark=="Add"){
						operateTypeMark = "软件安装";
					}else if(o.operateTypeMark=="Unstall"){
						operateTypeMark = "软件卸载";
					}else if(o.operateTypeMark=="Replace"){
						operateTypeMark = "软件替换";
					}else if(o.operateTypeMark=="Change"){
						operateTypeMark = "软件改变";
					}else if(o.operateTypeMark=="Restart"){
						operateTypeMark = "软件重启";
					}else if(o.operateTypeMark=="ask"){
						operateTypeMark = "问题";
					}else if(o.operateTypeMark=="answer"){
						operateTypeMark = "回答";
					}else if(o.operateTypeMark=="study"){
						operateTypeMark = "学习";
					}else if(o.operateTypeMark=="playgame"){
						operateTypeMark = "玩游戏";
					}else if(o.operateTypeMark=="music"){
						operateTypeMark = "播放音乐";
					}else if(o.operateTypeMark=="playvideo"){
						operateTypeMark = "播放视频";
					}else if(o.operateTypeMark=="loginTime"){
						operateTypeMark = "上线";
						operateContent = "版本号:"+o.operateContent;
					}else if(o.operateTypeMark=="logoutTime"){
						operateTypeMark = "下线";
						operateContent = "版本号:"+o.operateContent;
					}else if(o.operateTypeMark=="LimitTime"){
						operateTypeMark = "时间限制";
					}else if(o.operateTypeMark=="QCTime"){
						operateTypeMark = "起床时间";
					}else if(o.operateTypeMark=="XiuXiTime"){
						operateTypeMark = "休息时间";
					}else if(o.operateTypeMark=="ToAddGame"){
						operateTypeMark = "添加游戏";
					}else if(o.operateTypeMark=="playGameTime"){
						operateTypeMark = "游戏时长";
						operateContent = millisecondToDate(operateContent);
					}else if(o.operateTypeMark=="AddAppInfo"){
						operateTypeMark = "添加应用";
					}else if(o.operateTypeMark=="DelAppInfo"){
						operateTypeMark = "删除应用";
					}else if(o.operateTypeMark=="sendWX"){
						operateTypeMark = "发送消息";
					}else if(o.operateTypeMark=="receiveWX"){
						operateTypeMark = "接收消息";
					}else if(o.operateTypeMark=="vmusic"){
						operateTypeMark = "点播歌曲";
					}else if(o.operateTypeMark=="ymusic"){
						operateTypeMark = "播放歌曲";
					}else {
						operateTypeMark = "";
						operateContent = "";
					}
					html+='<tr align="center">';
					//html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					//html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.stCode)+'</td>';
					html+='<td>'+operateModuleMark+'</td>';
					html+='<td>'+operateTypeMark+'</td>';
					html+='<td>'+(operateContent.length>15?operateContent.substring(0,15):operateContent)+'</td>';
					html+='<td>'+(o.sTime==null?"":millisecondToDate(o.sTime))+'</td>';
					html+='<td>'+(taketimetmp.length>10?taketimetmp.substring(5,16):taketimetmp)+'</td>';
					/*html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.upLoadTime)+'</td>';*/
				});
				$('#logtbody').html(html);
			}
		}
	});
}
/**
 * 将null转换为空字符串
 * @param obj 要转换的对象
 * @returns 空字符串
 */
function replaceNull(obj){
	if(obj==null){
		obj = "";
	}
	return obj;
}
function millisecondToDate(msd) {
    var time = parseFloat(msd) /1000;
    if (null!= time &&""!= time) {
        if (time >60&& time <60*60) {
            time = parseInt(time /60.0) +"分钟"+ parseInt((parseFloat(time /60.0) -
            parseInt(time /60.0)) *60) +"秒";
        }else if (time >=60*60&& time <60*60*24) {
            time = parseInt(time /3600.0) +"小时"+ parseInt((parseFloat(time /3600.0) -
            parseInt(time /3600.0)) *60) +"分钟"+
            parseInt((parseFloat((parseFloat(time /3600.0) - parseInt(time /3600.0)) *60) -
            parseInt((parseFloat(time /3600.0) - parseInt(time /3600.0)) *60)) *60) +"秒";
        }else {
            time = parseInt(time) +"秒";
        }
    }else{
        time = "0 时 0 分0 秒";
    }
    return time;
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<div style="padding:5px;text-align: left;">
			<input type="text" id="stCode" value="${param.stCode }" style="height:20px;width:100px;" placeholder="依云序列号"/>
			<button style="width:50px;height:20px;font-size: 10px;" onclick="search();">查询</button>
		</div>
		<table class="zebra">
			<thead><tr><th width="10%">序列号</th><th width="20%">模块</th><th width="20%">类型</th><th width="15%">内容</th><th width="15%">时长</th><th width="15%">时间</th></tr></thead>
			<tbody id="logtbody"></tbody>
		</table>
	</div>
</div>
</body>
</html>