$(document).ready(function() {
	search();
	search2();
	search3();
	search4();
	search5();
	closeblockdiv();
});
/**
 * 加载列表
 */
function search(){
	openblockdiv();
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
				html+='<tr align="center"><td colspan="2">日活跃</td><td>'+Math.ceil(o.takeTimeLong/o.stCode)+'</td><td>月活跃</td><td>'+o.parseTimeLong+'</td></tr>';//Math.ceil(o.serialNumber/o.stCode)
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
			createarrayonemonthzhu('onemonthzhudataList',arrx,arry);
			closeblockdiv();
		}
	});
}
function search2(){
	openblockdiv();
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
			closeblockdiv();
		}
	});
}
function search3(){
	openblockdiv();
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
			closeblockdiv();
		}
	});
}
function search4(){
	openblockdiv();
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
			closeblockdiv();
		}
	});
}
function search5(){
	openblockdiv();
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
			closeblockdiv();
		}
	});
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#gameName').val("");
	$('#gamePackage').val("");
	var gameTypeAll = $('input[name="gameType"]');
	for(var i = 0;i<gameTypeAll.length;i++){
		gameTypeAll[i].checked = false;
	}
	$('#isad').val("");
	$('#isrecommend').val("");
	$('#fmark').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	/*if($('#gameType').val().trim()==""){
		newAlert("必须选择类型!");
		return;
	}*/
	var gameTypes = $('[name="gameType"]:checked');
	var cnt = 0;
	$.each(gameTypes, function(i, o){			
		cnt++;
	});
	if(cnt == 0){
		alert("必须选择类型!");
		return;
	}
	if($('#gameName').val().trim()==""){
		alert("必须输入名称!");
		return;
	}
	if($('#gamePackage').val().trim()==""){
		alert("必须输入包名!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/gameinfo/gameinfo!saveToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					closeDiv('inputDiv');
					search();
				}else{
					alert(data.resultInfo[1]);
				}
				closeblockdiv();
			}
		});
	}
}
/**
 * 编辑
 * @param id
 */
function toEdit(){
	var gameTypeAll = $('input[name="gameType"]');
	for(var i = 0;i<gameTypeAll.length;i++){
		gameTypeAll[i].checked = false;
	}
	var editid = '';
	var delareas = $('[name="checkedIdList"]:checked');
	var cnt = 0;
	$.each(delareas, function(i, o){			
		editid = $(o).val();
		cnt++;
	});
	if(cnt>1){
		newAlert("每次只能编辑一条!");
		return;
	}
	if(cnt==0){
		newAlert("请选择一条编辑的记录!");
		return;
	}
	var url = ctx+"/gameinfo/gameinfo!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"gameinfoId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#gameName').val(replaceNull(data.model.gameName));
				$('#gamePackage').val(replaceNull(data.model.gamePackage));
				var gameTypeAll = $('input[name="gameType"]');
				var gameTypeBack = data.model.gameType.split(",");
				for(var n = 0;n<gameTypeBack.length;n++){
					for(var i = 0;i<gameTypeAll.length;i++){
						if(gameTypeAll[i].value == trimLeft(gameTypeBack[n]) ) {
							gameTypeAll[i].checked = true;
						}
					}
				}
				$('#isad').val(data.model.isad);
				$('#isrecommend').val(data.model.isrecommend);
				$('#fmark').val(data.model.fmark);
				openDiv('inputDiv');
			}
		}
	});
}
//去掉左边的空白  
function trimLeft(s){  
    if(s == null) {  
        return "";  
    }  
    var whitespace = new String(" \t\n\r");  
    var str = new String(s);  
    if (whitespace.indexOf(str.charAt(0)) != -1) {  
        var j=0, i = str.length;  
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){  
            j++;  
        }  
        str = str.substring(j, i);  
    }  
    return str;  
} 
/**
 * 删除
 * @param id
 */
function toDelete(id){
	var param = {};
	if(id) {
		param['checkedIdList[0]'] = id;
	} else {		
		var delareas = $('[name="checkedIdList"]:checked');
		var cnt = 0;
		$.each(delareas, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	if(!param['checkedIdList[0]']) {
		newAlert('请选择要删除的记录！');
		return;
	}
	var flag = window.confirm("确定删除吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/gameinfo/gameinfo!deleteToJson.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:param,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					newAlert("删除成功!");
					search();
				}
			}
		});
	}
}

function millisecondToDate(msd) {
	if(''==msd){
		return 0;
	}
    var time = parseFloat(msd) /1000/60/60;
    /*if (null!= time &&""!= time) {
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
    }*/
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
function mapbaidu(){
	$('#wrapper').css("display","none");
	$('#allmap').css("display","");
}