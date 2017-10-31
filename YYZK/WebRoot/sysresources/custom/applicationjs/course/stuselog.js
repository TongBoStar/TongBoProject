$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'stuseloglistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'desc',
		orderBy: 't_stuselog.takeTimeLong',
		submitForm : submitForm//分页回调函数
	});	
	search();
});
function submitForm(){
	search();
}
/**
 * 加载列表
 */
function search(){
	openblockdiv();
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/stuselog/stuselog!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"stuseloglistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				var operateModuleMark = "";
				var operateTypeMark = "";
				var operateContent = "";
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
					}else if(o.operateModuleMark=="UnityPlayerActivity"){
						operateModuleMark = "3D互动";
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
					if(o.operateTypeMark=="stayTime"){
						if(o.operateModuleMark=="UnityPlayerActivity"){
							operateTypeMark = "使用时长";
							operateContent = "3D互动学习英语";
						}else{
							operateTypeMark = "页面停留";
							operateContent = millisecondToDate(operateContent);
						}
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
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.stCode)+'</td>';
					html+='<td>'+replaceNull(o.serialNumber)+'</td>';
					html+='<td>'+operateModuleMark+'</td>';
					html+='<td>'+operateTypeMark+'</td>';
					html+='<td>'+operateContent+'</td>';
					html+='<td>'+(o.sTime==null?"":millisecondToDate(o.sTime))+'</td>';
					html+='<td>'+replaceNull(o.takeTime)+'</td>';
					/*html+='<td>'+formatDate("yyyy-MM-dd HH:mm:ss",o.upLoadTime)+'</td>';*/
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 加载列表
 */
function parseUserLog(){
	var flag = window.confirm("确定解析吗？");
	if(flag){
		openblockdiv();
		var html='';
		var url = ctx+"/stuselog/stuselog!parseUserLog.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:"stuselogQuery.takeTime="+$('#takeTimeQUery').val(),
			success : function(data) {
				alert("解析完成");
				closeblockdiv();
				search();
			}
		});
	}
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