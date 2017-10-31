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
/* ul li以横排显示 */

/* 所有class为menu的div中的ul样式 */
div.menu ul{
    list-style:none; /* 去掉ul前面的符号 */
    margin: 0px; /* 与外界元素的距离为0 */
    padding: 0px; /* 与内部元素的距离为0 */
    width: auto; /* 宽度根据元素内容调整 */
}
/* 所有class为menu的div中的ul样式 */
div.menusub ul{
    list-style:none; /* 去掉ul前面的符号 */
    margin: 0px; /* 与外界元素的距离为0 */
    padding: 0px; /* 与内部元素的距离为0 */
    width: auto; /* 宽度根据元素内容调整 */
}
/* 所有class为menu的div中的ul中的li样式 */
div.menu ul li{
    float:left; /* 向左漂移，将竖排变为横排 */
    padding:10px 0px 5px 0px;
    font-size: 14px;
    background-color: #22f2f2;
    width:16.65%;
}
/* 所有class为menu的div中的ul中的li样式 */
div.menusub ul li{
    float:left; /* 向左漂移，将竖排变为横排 */
    padding:10px 0px;
    font-size: 12px;
    background-color: #f2f2f2;
    width:12.5%;
}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/highcharts4.0.3/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/highcharts4.0.3/highcharts-more.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/highcharts4.0.3/exporting.js"></script>
<script type="text/javascript" src="${ctx}/sysresources/custom/charts.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=P848g3G8yYDSdpcmgNxSKHKOF5GEh0iW"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
<script type="text/javascript">
var ctx ;
$(window).load(function() {
	ctx = '${ctx}';
	$('#baidumap-slider-tab').css("display","");
	$('#gaiyao').css("display","");
	search();
	search2();
	search3();
	search4();
	search5();
});
/**
 * 加载列表
 */
function search(){
	var html='';
	var url = ctx+"/stuselog/stuselog!listInfos.htm";
	$.webAjax({
		type : "post",
		url : url,
		data:"stuselogQuery.operateModuleMark=PlayerActivity&stuselogQuery.operateTypeMark=playvideo&stuselogQuery.donghuaItemType=1&stuselogQuery.isbelong=1&stuselogQuery.queryseq=1",
		success : function(data) {
			$.each(data.shutongshichang,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+o.stCode+'</td>';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDate(replaceNull(o.takeTimeLong))+'</td>';
				if(null!=o.sTime&&o.sTime>=1&&null!=o.parseTimeLong){
					html+='<td>'+(null==o.sTime?'':(o.parseTimeLong/o.sTime).toFixed(2))+'</td>';
				}else{
					html+='<td></td>';
				}
				if(null!=o.sTime&&o.sTime>=1&&null!=o.takeTimeLong){
					html+='<td>'+(null==o.sTime?'':(o.takeTimeLong/1000/60/60/parseInt(o.sTime)).toFixed(2))+'</td>';
				}else{
					html+='<td></td>';
				}
				html+='</tr>';
			});
			$('#shutongzongshichang').html(html);
			html = '';
			var array = new Array(24);
			$.each(data.shutongshiduan,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+o.takeTimeLong+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='</tr>';
				array[o.takeTimeLong] = o.parseTimeLong;
			});
			array[3] = 3;
			array[12] = 12;
			createarraypie('pieshiduan','各时段比例',array);
			$('#shutongshiduan').html(html);
			html = '';
			$.each(data.donghuashichang,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+o.operateModuleMark+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDateTime(o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#donghuashichang').html(html);
			html = '';
			var arrdonghuacishu = new Array(8);
			var arrdonghuashichang = new Array(8);
			$.each(data.donghuafenlei,function(i,o){
				var gameType = "";
				if(o.operateModuleMark.indexOf("GAMELANG")>=0){
					gameType = "语言学习";
					arrdonghuacishu[0] = o.parseTimeLong;
					arrdonghuashichang[0] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEDRAW")>=0){
					gameType = "绘画";
					arrdonghuacishu[1] = o.parseTimeLong;
					arrdonghuashichang[1] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEMUSIC")>=0){
					gameType = "音乐";
					arrdonghuacishu[2] = o.parseTimeLong;
					arrdonghuashichang[2] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMESPATIAL")>=0){
					gameType = "空间想象";
					arrdonghuacishu[3] = o.parseTimeLong;
					arrdonghuashichang[3] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMELOGICAL")>=0){
					gameType = "逻辑思维";
					arrdonghuacishu[4] = o.parseTimeLong;
					arrdonghuashichang[4] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMESPORT")>=0){
					gameType = "运动";
					arrdonghuacishu[5] = o.parseTimeLong;
					arrdonghuashichang[5] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEMATH")>=0){
					gameType = "数学";
					arrdonghuacishu[6] = o.parseTimeLong;
					arrdonghuashichang[6] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEEMOTION")>=0){
					gameType = "情感沟通";
					arrdonghuacishu[7] = o.parseTimeLong;
					arrdonghuashichang[7] = o.takeTimeLong;
				}
				html+='<tr align="center">';
				html+='<td>'+gameType+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='<td>'+millisecondToDateTime(replaceNull(o.takeTimeLong))+'</td>';
				html+='</tr>';
			});
			createdonghuapie('piedonghuacishu','动画次数比例',arrdonghuacishu);
			createdonghuapie('piedonhuashichang','动画时长比例',arrdonghuashichang);
			$('#donghuafenlei').html(html);
			html = '';
			$.each(data.donghuafenleishichangList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='<td>'+replaceNull(o.serialNumber)+'</td>';
				html+='<td>'+replaceNull(o.operateType)+'</td>';
				html+='<td>'+replaceNull(o.operateModule)+'</td>';
				html+='<td>'+replaceNull(o.operateContent)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.upLoadTime)+'</td>';
				html+='<td>'+replaceNull(o.operateTypeMark)+'</td>';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#shutongdonghualeixing').html(html);
			html = '';
			$.each(data.shiyongTimesList,function(i,o){
				html+='<tr align="center"><td colspan="5">活跃度</td></tr>';
				html+='<tr align="center"><td colspan="2">总次数</td><td>'+o.takeTimeLong+'</td><td>总时长</td><td>'+millisecondToDate(parseInt(o.takeTime))+'</td></tr>';
				html+='<tr align="center"><td colspan="2">日活跃</td><td>'+Math.ceil(o.takeTimeLong/o.stCode)+'</td><td>月活跃</td><td>'+o.parseTimeLong+'</td></tr>';
				html+='<tr align="center"><td colspan="2">人均次数</td><td>'+(parseFloat(o.takeTimeLong)/80/60).toFixed(2)+'次/天</td><td>人均时长</td><td>'+(parseFloat(o.takeTime)/1000/60/60*100/80/60/100).toFixed(2)+'小时/天</td></tr>';
			});
			$.each(data.shutongalltypesList,function(i,o){
				html+='<tr align="center"><td colspan="5">使用次数(单位:次)</td></tr>';
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.operateType)+'</td>';
				html+='<td>'+replaceNull(o.operateModule)+'</td>';
				html+='<td>'+replaceNull(o.operateContent)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='</tr>';
				html+='<tr align="center"><td colspan="5">使用时长(单位:小时)</td></tr>';
				html+='<tr align="center">';
				html+='<td>'+millisecondToDate(replaceNull(o.upLoadTime))+'</td>';
				html+='<td>'+millisecondToDate(replaceNull(o.operateTypeMark))+'</td>';
				html+='<td>'+millisecondToDate(replaceNull(o.operateModuleMark))+'</td>';
				html+='<td>'+millisecondToDate(replaceNull(o.parseTimeLong))+'</td>';
				html+='<td>'+millisecondToDate(replaceNull(o.sTime))+'</td>';
				html+='</tr>';
				createmodulepie('piealltypes','次数比重',o.operateType,o.operateModule,o.operateContent,o.takeTime,o.takeTimeLong);
				createmodulepie('piealltypesshichang','时长比重',millisecondToDate(replaceNull(o.upLoadTime)),
						millisecondToDate(replaceNull(o.operateTypeMark)),millisecondToDate(replaceNull(o.operateModuleMark)),
						millisecondToDate(replaceNull(o.parseTimeLong)),millisecondToDate(replaceNull(o.sTime)));
			});
			$('#shutongalltypes').html(html);
			html = '';
			$.each(data.shutongalldetypesList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='<td>'+replaceNull(o.serialNumber)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.operateTypeMark)+'</td>';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='</tr>';
			});
			$('#shutongalldetypes').html(html);
			var arrx = new Array(7);
			var arry = new Array(7);
			$.each(data.oneweekdataList,function(i,o){
				arrx[i] = o.operateType.replace("-",".");
				arry[i] = o.parseTimeLong+50;
			});
			createarrayoneweekline('oneweekdataList',arrx,arry);
			//createarrayonemonthzhu('onemonthzhudataList',arrx,arry);
		}
	});
}
function search2(){
	var html='';
	var url = ctx+"/stuselog/stuselog!listInfos.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stuselogQuery.operateModuleMark=PlayerActivity&stuselogQuery.operateTypeMark=playvideo&stuselogQuery.xuexiItemType=1&stuselogQuery.isbelong=1&stuselogQuery.queryseq=2",
		success : function(data) {
			html = '';
			$.each(data.xuexishichang,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+o.operateModuleMark+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDateTime(o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#xuexishichang').html(html);
			html = '';
			var arrxuexicishu = new Array(6);
			var arrxuexishichang = new Array(6);
			$.each(data.xuexifenlei,function(i,o){
				var gameType = "";
				if(o.operateModuleMark.indexOf("DOMAIN_CHUANGZAO")>=0){
					gameType = "创造";
					arrxuexicishu[0] = o.parseTimeLong;
					arrxuexishichang[0] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("DOMAIN_DONGZUO")>=0){
					gameType = "动作";
					arrxuexicishu[1] = o.parseTimeLong;
					arrxuexishichang[1] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("DOMAIN_SHEJIAO")>=0){
					gameType = "社交";
					arrxuexicishu[2] = o.parseTimeLong;
					arrxuexishichang[2] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("DOMAIN_TANSUO")>=0){
					gameType = "探索";
					arrxuexicishu[3] = o.parseTimeLong;
					arrxuexishichang[3] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("DOMAIN_XIGUAN")>=0){
					gameType = "习惯";
					arrxuexicishu[4] = o.parseTimeLong;
					arrxuexishichang[4] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("DOMAIN_YUYAN")>=0){
					gameType = "语言";
					arrxuexicishu[5] = o.parseTimeLong;
					arrxuexishichang[5] = o.takeTimeLong;
				}
				html+='<tr align="center">';
				html+='<td>'+gameType+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDateTime(o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			createxuexipie('piexuexicishu','次数比例',arrxuexicishu);
			createxuexipie('piexuexishichang','时长比例',arrxuexishichang);
			$('#xuexifenlei').html(html);
			html = '';
			$.each(data.xuexifenleishichangList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='<td>'+replaceNull(o.serialNumber)+'</td>';
				html+='<td>'+replaceNull(o.operateType)+'</td>';
				html+='<td>'+replaceNull(o.operateModule)+'</td>';
				html+='<td>'+replaceNull(o.operateContent)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.upLoadTime)+'</td>';
				html+='</tr>';
			});
			$('#shutongxuexileixing').html(html);
			
		}
	});
}
function search3(){
	var html='';
	var url = ctx+"/stuselog/stuselog!listInfos.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stuselogQuery.operateModuleMark=YiQiWanActivity&stuselogQuery.operateTypeMark=playgame&stuselogQuery.queryseq=3",
		success : function(data) {
			html = '';
			$.each(data.gamenameList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='<td>'+o.operateTypeMark+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDateTime(null==o.takeTimeLong?0:o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#youxishichang').html(html);
			html = '';
			var arryouxicishu = new Array(8);
			var arryouxishichang = new Array(8);
			$.each(data.gamenametypeList,function(i,o){
				var gameType = "";
				if(o.operateModuleMark.indexOf("GAMELANG")>=0){
					gameType = "语言学习";
					arryouxicishu[0] = o.parseTimeLong;
					arryouxishichang[0] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEDRAW")>=0){
					gameType = "绘画";
					arryouxicishu[1] = o.parseTimeLong;
					arryouxishichang[1] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEMUSIC")>=0){
					gameType = "音乐";
					arryouxicishu[2] = o.parseTimeLong;
					arryouxishichang[2] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMESPATIAL")>=0){
					gameType = "空间想象";
					arryouxicishu[3] = o.parseTimeLong;
					arryouxishichang[3] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMELOGICAL")>=0){
					gameType = "逻辑思维";
					arryouxicishu[4] = o.parseTimeLong;
					arryouxishichang[4] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMESPORT")>=0){
					gameType = "运动";
					arryouxicishu[5] = o.parseTimeLong;
					arryouxishichang[5] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEMATH")>=0){
					gameType = "数学";
					arryouxicishu[6] = o.parseTimeLong;
					arryouxishichang[6] = o.takeTimeLong;
				}
				if(o.operateModuleMark.indexOf("GAMEEMOTION")>=0){
					gameType = "情感沟通";
					arryouxicishu[7] = o.parseTimeLong;
					arryouxishichang[7] = o.takeTimeLong;
				}
				html+='<tr align="center">';
				html+='<td>'+gameType+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='<td>'+millisecondToDateTime(replaceNull(o.takeTimeLong))+'</td>';
				html+='</tr>';
			});
			createdonghuapie('pieyouxicishu','游戏次数比例',arryouxicishu);
			createdonghuapie('pieyouxishichang','游戏时长比例',arryouxishichang);
			$('#youxifenlei').html(html);
			html = '';
			$.each(data.youxifenleishichangList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='<td>'+replaceNull(o.serialNumber)+'</td>';
				html+='<td>'+replaceNull(o.operateType)+'</td>';
				html+='<td>'+replaceNull(o.operateModule)+'</td>';
				html+='<td>'+replaceNull(o.operateContent)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.upLoadTime)+'</td>';
				html+='<td>'+replaceNull(o.operateTypeMark)+'</td>';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#shutongyouxileixing').html(html);
			
		}
	});
}
function search4(){
	var html='';
	var url = ctx+"/stuselog/stuselog!listInfos.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stuselogQuery.operateModuleMark=YiQiTingActivity&stuselogQuery.operateTypeMark=ymusic&stuselogQuery.queryseq=4",
		success : function(data) {
			html = '';
			$.each(data.yqtmusicnameList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+o.operateModuleMark+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDateTime(o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#yinyueshichang').html(html);
			html = '';
			var arryinyuecishu = new Array(5);
			var arryinyueshichang = new Array(5);
			$.each(data.yqtmusictypeList,function(i,o){
				var gameType = "";
				if(o.operateModuleMark=='0'){
					gameType = "其他";
					arryinyuecishu[4] = o.parseTimeLong;
					arryinyueshichang[4] = o.takeTimeLong;
				}
				if(o.operateModuleMark=='1'){
					gameType = "故事";
					arryinyuecishu[0] = o.parseTimeLong;
					arryinyueshichang[0] = o.takeTimeLong;
				}
				if(o.operateModuleMark=='2'){
					gameType = "儿歌";
					arryinyuecishu[1] = o.parseTimeLong;
					arryinyueshichang[1] = o.takeTimeLong;
				}
				if(o.operateModuleMark=='3'){
					gameType = "童话";
					arryinyuecishu[2] = o.parseTimeLong;
					arryinyueshichang[2] = o.takeTimeLong;
				}
				if(o.operateModuleMark=='4'){
					gameType = "国学";
					arryinyuecishu[3] = o.parseTimeLong;
					arryinyueshichang[3] = o.takeTimeLong;
				}
				html+='<tr align="center">';
				html+='<td>'+gameType+'</td>';
				html+='<td>'+o.parseTimeLong+'</td>';
				html+='<td>'+millisecondToDateTime(o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			createmusicpie('pieyinyuecishu','音乐次数比例',arryinyuecishu);
			createmusicpie('pieyinyueshichang','音乐时长比例',arryinyueshichang);
			$('#yinyuefenlei').html(html);
			html = '';
			$.each(data.yinyuefenleishichangList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='<td>'+replaceNull(o.serialNumber)+'</td>';
				html+='<td>'+replaceNull(o.operateType)+'</td>';
				html+='<td>'+replaceNull(o.operateModule)+'</td>';
				html+='<td>'+replaceNull(o.operateContent)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='</tr>';
			});
			$('#shutongyinyueleixing').html(html);
			
		}
	});
}
function search5(){
	var html='';
	var url = ctx+"/stuselog/stuselog!listInfos.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"stuselogQuery.queryseq=5",
		success : function(data) {
			html = '';
			var arryvoice = new Array(5);
			$.each(data.voiceallList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.operateTypeMark)+'</td>';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='</tr>';
				arryvoice[0] = parseInt(o.stCode);
				arryvoice[1] = parseInt(o.operateTypeMark);
				arryvoice[2] = parseInt(o.operateModuleMark);
				arryvoice[3] = parseInt(o.sTime);
				arryvoice[4] = 0;
			});
			createvoicepie('pievoicebasic','语音模块使用比例',arryvoice);
			$('#voiceall').html(html);
			html = '';
			$.each(data.voiceshutongallList,function(i,o){
				html+='<tr align="center">';
				html+='<td>'+replaceNull(o.stCode)+'</td>';
				html+='<td>'+replaceNull(o.takeTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.parseTimeLong)+'</td>';
				html+='<td>'+replaceNull(o.takeTime)+'</td>';
				html+='<td>'+replaceNull(o.serialNumber)+'</td>';
				html+='<td>'+replaceNull(o.operateTypeMark)+'</td>';
				html+='<td>'+replaceNull(o.operateModuleMark)+'</td>';
				html+='<td>'+replaceNull(o.sTime)+'</td>';
				html+='</tr>';
			});
			$('#voiceshutongall').html(html);
			
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
/**
 * 格式化时间(yyyy-MM-dd)
 * @param date 要格式化的日期
 * @returns 格式化后的结果
 */
function formatDate(formt,date){
	if(null!=date&&date!=""){
		if(formt=="yyyy-MM-dd"){
			return date.split(" ")[0];
		}else if(formt=="yyyy-MM-dd HH:mm:ss"){
			return date.substring(0,date.length-2);
		}
	}else{
		return "";
	}
}

function millisecondToDate(msd) {
	if(''==msd){
		return 0;
	}
    var time = parseFloat(msd) /1000/60/60;
    return time.toFixed(0);
}
function millisecondToDateTime(msd) {
	if(''==msd){
		return 0;
	}
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
function selecttab(seq){
	if(seq==1){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","none");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","none");
	}else if(seq==2){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","none");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","none");
	}else if(seq==3){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","none");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","none");
	}else if(seq==4){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","");
		$('#all-video').css("display","none");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","none");
	}else if(seq==5){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","none");
	}else if(seq==6){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","none");
		$('#all-music').css("display","");
		$('#all-xuexi').css("display","none");
	}else if(seq==7){
		$('#baidumap-slider-tab').css("display","none");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","none");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","");
	}else if(seq==8){
		$('#gaiyao').css("display","");
		$('#bracket-slider-tab').css("display","none");
		$('#bait-slider-tab').css("display","none");
		$('#assweld-slider-tab').css("display","none");
		$('#assemble-slider-tab').css("display","none");
		$('#delivery-slider-tab').css("display","none");
	}else if(seq==9){
		$('#gaiyao').css("display","none");
		$('#bracket-slider-tab').css("display","");
		$('#bait-slider-tab').css("display","none");
		$('#assweld-slider-tab').css("display","none");
		$('#assemble-slider-tab').css("display","none");
		$('#delivery-slider-tab').css("display","none");
	}else if(seq==10){
		$('#gaiyao').css("display","none");
		$('#bracket-slider-tab').css("display","none");
		$('#bait-slider-tab').css("display","");
		$('#assweld-slider-tab').css("display","none");
		$('#assemble-slider-tab').css("display","none");
		$('#delivery-slider-tab').css("display","none");
	}else if(seq==11){
		$('#gaiyao').css("display","none");
		$('#bracket-slider-tab').css("display","none");
		$('#bait-slider-tab').css("display","none");
		$('#assweld-slider-tab').css("display","");
		$('#assemble-slider-tab').css("display","none");
		$('#delivery-slider-tab').css("display","none");
	}else if(seq==12){
		$('#gaiyao').css("display","none");
		$('#bracket-slider-tab').css("display","none");
		$('#bait-slider-tab').css("display","none");
		$('#assweld-slider-tab').css("display","none");
		$('#assemble-slider-tab').css("display","");
		$('#delivery-slider-tab').css("display","none");
	}else if(seq==13){
		$('#gaiyao').css("display","none");
		$('#bracket-slider-tab').css("display","none");
		$('#bait-slider-tab').css("display","none");
		$('#assweld-slider-tab').css("display","none");
		$('#assemble-slider-tab').css("display","none");
		$('#delivery-slider-tab').css("display","");
	}else if(seq==14){
		$('#baidumap-slider-tab').css("display","");
		$('#all-timesandcounts').css("display","none");
		$('#all-shutong').css("display","none");
		$('#all-shiduan').css("display","none");
		$('#all-youxi').css("display","none");
		$('#all-video').css("display","none");
		$('#all-music').css("display","none");
		$('#all-xuexi').css("display","none");
	}else{
		
	}
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div>
	<div class="menu" id="totaldaohang">
		<ul><li onclick="selecttab(8);">汇总</li><li onclick="selecttab(9);">动画</li><li onclick="selecttab(10);">游戏</li>
		<li onclick="selecttab(11);">学习</li><li onclick="selecttab(12);">音乐</li><li onclick="selecttab(13);">聊天</li></ul>
	</div>
	<div style="clear: both;"></div>
	<div id="gaiyao">
		<div class="menusub" id="totaldaohang">
			<ul><li onclick="selecttab(14);">地图</li><li onclick="selecttab(1);">概要</li><li onclick="selecttab(2);">设备</li><li onclick="selecttab(3);">时段</li>
			<li onclick="selecttab(4);">游戏</li><li onclick="selecttab(5);">视频</li><li onclick="selecttab(6);">音乐</li><li onclick="selecttab(7);">学习</li></ul>
		</div>
		<div style="clear: both;"></div>
		<div id="baidumap-slider-tab" class="tab-pane fade">
	       <div id="allmap" style="height:90%;width:100%;"></div>
	    </div>
		<div id="all-timesandcounts" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display:none">
	   		<div>
	    		<table class="zebra" style="width:100%;">
	    			<thead><tr><th>看动画</th><th>学习</th><th>玩游戏</th><th>听音乐</th><th>语音对话</th></tr></thead>
	    			<tbody id="shutongalltypes"></tbody>
	    		</table>
	   		</div>
	   		<div>
	   			<div id="piealltypes" style="height:250px;"></div>
	   			<div id="piealltypesshichang" style="height:250px;"></div>
	   		</div>
	   		<div style="clear: both;"></div>
	   		<div id="oneweekdataList" style="height:250px;"></div>
	   		<!-- <div style="clear: both;"></div>
	   		<div id="onemonthzhudataList" style="height:360px;"></div> -->
	   		<div style="clear: both;"></div>
	   		<table class="zebra" style="width:100%;">
	   			<thead><tr><th colspan="7" style="background: #D3D3D3;">单台使用时长</th></tr></thead>
	   			<thead><tr><th>序号</th><th>地域</th><th>天数</th><th>次数</th><th>时长</th><th>活跃次数</th><th>活跃小时</th></tr></thead>
	   			<tbody id="shutongzongshichang"></tbody>
	   		</table>
	   	</div>
	   	<div id="all-shutong" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display: none;">
	   		<div>
	    		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	    			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>看动画</th><th>学习</th><th>玩游戏</th><th>听音乐</th><th>语音对话</th></tr></thead>
	    			<tbody id="shutongalldetypes"></tbody>
	    		</table>
	   		</div>
	   	</div>
	   	<div id="all-shiduan" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display: none;">
	   		<div>
	    		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	    			<thead><tr><th width="30%">时段</th><th width="70%">次数</th></tr></thead>
	    			<tbody id="shutongshiduan"></tbody>
	    		</table>
	   		</div>
	   		<div>
	   			<div id="pieshiduan" style="height:400px;margin-top:20px;"></div>
	   		</div>
	   	</div>
	   	<div id="all-youxi" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display: none;">
	   		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	   			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>语言学习</th><th>绘画</th><th>音乐</th><th>空间想象</th><th>逻辑思维</th><th>运动</th><th>数学</th><th>情感沟通</th><th>其他</th></tr></thead>
	   			<tbody id="shutongyouxileixing"></tbody>
	   		</table>
	   	</div>
	   	<div id="all-video" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display: none;">
	   		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	   			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>语言学习</th><th>绘画</th><th>音乐</th><th>空间想象</th><th>逻辑思维</th><th>运动</th><th>数学</th><th>情感沟通</th><th>其他</th></tr></thead>
	   			<tbody id="shutongdonghualeixing"></tbody>
	   		</table>
	   	</div>
	   	<div id="all-music" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display: none;">
	   		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	   			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>故事</th><th>儿歌</th><th>童话</th><th>国学</th><th>其他</th></tr></thead>
	   			<tbody id="shutongyinyueleixing"></tbody>
	   		</table>
	   	</div>
	   	<div id="all-xuexi" class="tab-pane fade" style="overflow:auto; width:auto;height:auto;display: none;">
	   		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	   			<thead><tr><th>编号</th><th>姓名</th><th>地址</th><th>创造</th><th>动作</th><th>社交</th><th>探索</th><th>习惯</th><th>语言</th></tr></thead>
	   			<tbody id="shutongxuexileixing"></tbody>
	   		</table>
	   	</div>
   	</div>
   	
   	<div id="bracket-slider-tab" class="tab-pane fade" style="overflow:auto;display:none;">
       	<div style="overflow:auto; width:auto;">
     		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
     			<thead><tr><th>动画名称</th><th>次数</th><th>时长</th></tr></thead>
     			<tbody id="donghuashichang"></tbody>
     		</table>
     	</div>
     	<div style="overflow:auto; width:auto;">
     		<div>
	      		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	      			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	      			<tbody id="donghuafenlei"></tbody>
	      		</table>
     		</div>
     		<div>
     			<div id="piedonghuacishu" style="height:250px;"></div>
     			<div id="piedonhuashichang" style="height:250px;"></div>
     		</div>
     	</div>
     </div>
     <div id="bait-slider-tab" class="tab-pane fade" style="overflow:auto;display:none;">
        <div style="overflow:auto; width:auto;">
     		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
     			<thead><tr><th>游戏名称</th><th>游戏包名</th><th>次数</th><th>时长</th></tr></thead>
     			<tbody id="youxishichang"></tbody>
     		</table>
     	</div>
     	<div style="overflow:auto; width:auto;height:280px;">
     		<div>
	      		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	      			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	      			<tbody id="youxifenlei"></tbody>
	      		</table>
     		</div>
     		<div>
     			<div id="pieyouxicishu" style="height:250px;"></div>
     			<div id="pieyouxishichang" style="height:250px;"></div>
     		</div>
     	</div>
     </div>
     <div id="assweld-slider-tab" class="tab-pane fade" style="overflow:auto;display:none;">
         <div style="overflow:auto; width:auto;">
     		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
     			<thead><tr><th>课程名称</th><th>次数</th><th>时长</th></tr></thead>
     			<tbody id="xuexishichang"></tbody>
     		</table>
     	</div>
     	<div style="overflow:auto; width:auto;">
     		<div>
	      		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	      			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	      			<tbody id="xuexifenlei"></tbody>
	      		</table>
     		</div>
     		<div>
     			<div id="piexuexicishu" style="height:250px;"></div>
     			<div id="piexuexishichang" style="height:250px;"></div>
     		</div>
     	</div>
     </div>
     <div id="assemble-slider-tab" class="tab-pane fade" style="overflow:auto;display:none;">
         <div style="overflow:auto; width:auto;">
     		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
     			<thead><tr><th>音乐名称</th><th>次数</th><th>时长</th></tr></thead>
     			<tbody id="yinyueshichang"></tbody>
     		</table>
     	</div>
     	<div style="overflow:auto; width:auto;">
     		<div>
	      		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	      			<thead><tr><th>分类</th><th>次数</th><th>时长</th></tr></thead>
	      			<tbody id="yinyuefenlei"></tbody>
	      		</table>
     		</div>
     		<div>
     			<div id="pieyinyuecishu" style="height:250px;"></div>
     			<div id="pieyinyueshichang" style="height:250px;"></div>
     		</div>
     	</div>
     </div>
     <div id="delivery-slider-tab" class="tab-pane fade" style="overflow:auto;display:none;">
     	<div style="overflow:auto; width:100%;">
     		<div>
	      		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
	      			<thead><tr><th>问答</th><th>提问</th><th>回答</th><th>文本类</th><th>链接类</th><th>诗词类</th><th>歌曲类</th></tr></thead>
	      			<tbody id="voiceall"></tbody>
	      		</table>
     		</div>
     		<div>
     			<div id="pievoicebasic" style="height:250px"></div>
     		</div>
     	</div>
     	<div style="overflow:auto; width:auto;">
     		<table class="table table-hover table-striped table-bordered table-advanced tablesorter" style="width:100%;">
     			<thead><tr><th>书童编号</th><th>问答</th><th>提问</th><th>回答</th><th>文本类</th><th>链接类</th><th>诗词类</th><th>歌曲类</th></tr></thead>
     			<tbody id="voiceshutongall"></tbody>
     		</table>
     	</div>
     </div>
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