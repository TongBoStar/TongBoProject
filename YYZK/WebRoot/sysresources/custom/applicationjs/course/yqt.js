$(document).ready(function() {
	window.simpleTable =$(document).SimpleTable({
		id:'yqtlistpage',
		formId: 'pageForm',
		pageNo: '1',
		pageSize : '20',
		order: 'asc',
		orderBy: 't_yqt.id',
		submitForm : submitForm//分页回调函数
	});	
	audio = document.getElementById('audio');
	progress = document.getElementById('progress');
	playpause = document.getElementById("play");
	replay = document.getElementById("replay");
	volume = document.getElementById("volume");
	time=document.getElementById('musictimes');
	canvas = document.getElementById('progress');
    if(canvas.getContext){
		ctx2=canvas.getContext("2d");
		ctx2.beginPath();
		ctx2.strokeStyle='darkgreen';
		ctx2.lineCap='round';
		ctx2.lineWidth=6;
		ctx2.arc(160,160,150,0,Math.PI,false);
		ctx2.stroke();
    }
    audio.controls = false;
    audio.autoplay=true;
    audio.addEventListener('timeupdate', function() {
    	updateProgress();
    	var	aTime =parseInt(audio.currentTime);
    	var aLength =parseInt(audio.duration) ; 
    	if(aTime<10){
 	  		time.innerHTML='00:0'+aTime+'/00:'+aLength;
    	}else{
 	  	 	time.innerHTML='00:'+aTime+'/00:'+aLength;
    	}
 	}, false);
	search();
	$('#resIcon').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif',// 文件过滤器
		'fileTypeDesc' : 'xlsx,xls文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'file',
		'uploadLimit' : 5,
		'height':25,
        'width':40,
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			$('#fileshow').val(data.oldName);
			$('#filepath').val(data.resPath);
		}
	});
	$('#resourceUrl').uploadify({
		'swf' : ctx+'/sysresources/uploadify/uploadify.swf',
		'uploader' : ctx+'/fileupload/uploadMenuIcon.htm',// 处理Action
		'folder' : '/uploads',// 服务端默认保存路径
		// 'scriptData':{'methed':'uploadFile','arg1':'value1'},//向后台传递参数,methed,arg1为参数名,uploadFile,value1为对应的参数值,服务端通过request.getP
		'buttonText' : '浏览',// 按钮显示文字,不支持中文,解决方案见下
		// 'buttonImg':'图片路径',//通过设置背景图片解决中文问题,就是把背景图做成按钮的样子
		'multi' : 'true',// 多文件上传开关
		'fileTypeExts' : '*.jpg;*.jpeg;*.png;*.ico;*.gif;*.mp3',// 文件过滤器
		'fileTypeDesc' : 'xlsx,xls文件',// 文件过滤器 详解见文档
		'hideButton' : true,
		'fileObjName' : 'file',
		'uploadLimit' : 5,
		'height':25,
        'width':40,
		'onUploadComplete' : function(file) {
			// response为服务器端返回的字符串值
		},
		'onUploadError' : function(file, errorCode, errorMsg) {
			alert(errorMsg);
		},
		'onUploadSuccess' : function(file, data, response) {
			data = $.parseJSON(data);
			$('#fileshowres').val(data.oldName);
			$('#filepathres').val(data.resPath);
		}
	});
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
	var url = ctx+"/yqt/yqt!listToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"yqtlistpage",simpleTable);
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					var ftype = "";
					if(1==o.ftype){
						ftype = "故事";
					}else if(2==o.ftype){
						ftype = "儿歌";
					}else if(3==o.ftype){
						ftype = "童话";
					}else{
						ftype = "国学";
					}
					html+='<tr align="center">';
					html+='<td><input type="checkbox" id="checkedIdList" style="width:15px;height:15px;" name="checkedIdList" value="' + o.id + '"/></td>';
					html+='<td>'+(i+1)+'</td>';
					html+='<td>'+replaceNull(o.fname)+'</td>';
					html+='<td>'+ftype+'</td>';
					html+='<td><a href="javascript:void(0);" onclick="testmusic(\''+replaceNull(o.resourceUrl)+'\',\''+replaceNull(o.fname)+'\');">试听</a></td>';
					html+='<td>'+replaceNull(o.times)+'</td>';
					html+='<td>'+replaceNull(o.resIcon)+'</td>';
					html+='<td>'+replaceNull(o.fdesc)+'</td>';
				});
				$('#data-body').html(html);
			}
			closeblockdiv();
		}
	});
}
/**
 * 查看详情
 * @param id
 */
function toDetail(id){
	window.location.href=ctx+"/designassist/designlistdetail.htm?did="+id;
}
function testmusic(resurl,musicname){
	$('#musicname').html(musicname);
	//$('#audio').html("<source src='"+getWebRootPath()+"/"+resurl+"' type='audio/mpeg' codecs='mp3'></source>");
	audio.src = getWebRootPath()+"/"+resurl;
	playpause.title = "Pause";
    playpause.innerHTML = '<i>&#xe603;</i>';
	openDiv('cdiconDiv');
}
/**
 * 点击添加按钮进行添加
 */
function toAdd(){
	$('#hiddenId').val("");
	$('#fname').val("");
	$('#times').val("");
	$('#resIcon').val("");
	$('#ftype').val("");
	$('#resourceUrl').val("");
	$('#fesc').val("");
	$('#fileshowres').val("");
	$('#filepathres').val("");
	$('#fileshow').val("");
	$('#filepath').val("");
	openDiv('inputDiv');
}
/**
 * 保存
 */
function save(){
	var hid = $('#hiddenId').val();
	if($('#fname').val().trim()==""){
		newAlert("必须输入名称!");
		return;
	}
	var flag = window.confirm("确定保存吗？");
	if (flag) {
		openblockdiv();
		var formParam = $('#inputForm').serialize();
		var url = ctx+"/yqt/yqt!saveToJson.htm";
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
	var url = ctx+"/yqt/yqt!showToJson.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:"yqtId="+editid,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				$('#hiddenId').val(data.model.id);
				$('#fname').val(replaceNull(data.model.fname));
				$('#ftype').val(replaceNull(data.model.ftype));
				$('#fdesc').val(data.model.fdesc);
				$('#times').val(data.model.times);
				$('#resIcon').val(data.model.resIcon);
				$('#resourceUrl').val(data.model.resourceUrl);
				openDiv('inputDiv');
			}
		}
	});
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
		var url = ctx+"/yqt/yqt!deleteToJson.htm";
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
function closeThisDiv(id){
	audio.pause();
	resetPlayer();
	closeDiv(id);
}

var audio;
var progress;
var playpause;
var replay;
var volume;
var time;
var canvas;
var ctx2;
function togglePlay() {
   if (audio.paused || audio.ended) {

      playpause.title = "Pause";
      playpause.innerHTML = '<i>&#xe603;</i>';
      audio.play();
   } else {
      playpause.title = "Play";
      playpause.innerHTML = '<i>&#xe600;</i>';
      audio.pause();
   }
}

function replayAudio(){
	audio.currentTime = 0; 
	ctx2.clearRect(0,0,canvas.width,canvas.height);
}


function setVolume() {
   audio.volume = volume.value;
}

function updateProgress() {
	var percent = Math.floor((100 / audio.duration) * audio.currentTime);
	progress.value = percent;		
	var centerX = canvas.width / 2;
	var centerY = canvas.height / 2;
	var radius = 150;	
	var circ = Math.PI;
	var quart = Math.PI / 4;
	var cpercent = percent / 100; /* current percent */
	ctx2.beginPath();
	ctx2.lineCap='round';
	ctx2.arc(centerX, centerY, radius,0, ((circ) * cpercent), false);
	ctx2.lineWidth =5;
	ctx2.strokeStyle = 'yellow';
	ctx2.stroke();
	if(audio.ended){
		resetPlayer();
	}
}

function resetPlayer() {
	audio.currentTime = 0; 
	ctx2.clearRect(0,0,canvas.width,canvas.height);
	playpause.title = "Play";
    playpause.innerHTML = '<i>&#xe600;</i>';

 	  /*playpause.title = "Play";
	  playpause.innerHTML = '<i class="fa fa-play fa-3x"></i>';*/
}

function toExport(){
	var elemIF = document.createElement("iframe");
	elemIF.src = ctx+ "/yqt/yqt!exportAllExcel2007.htm";
	elemIF.style.display = "none";
	document.body.appendChild(elemIF);
}
