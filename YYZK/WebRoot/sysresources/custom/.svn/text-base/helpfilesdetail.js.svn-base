$(function(){
	search();
});
//加载列表
function search(){
	openblockdiv();
	var id = $("#hiddenId").val();
	var url = ctx + '/helpFiles/help-files!listToJsonQuery.htm';
	var html = '';
	$.webAjax({
		type : 'post',
		url : url,
		data :'helpFilesQuery.menuId='+id,
		success : function(data) {
			data = $.parseJSON(data);
			var helpFilesList = data.helpFilesList;
			var filePath = "";
			$.each(helpFilesList, function(i, o){
				filePath = o.filePath;
			});
			if(filePath!=""){
				showFile(filePath);
			}
			closeblockdiv();
		}
	});
}
//在线预览文件
function showFile(path){
	var usepath = path.substring(0,path.lastIndexOf("."));
	new FlexPaperViewer(	
			ctx+'/FlexPaperViewer',
			 //'/FlexPaperViewer',
			 'viewerPlaceHolder', 
			 { 
				 config : {
					 SwfFile : escape(usepath+'.swf'),
					 //SwfFile : escape('D:\\1.swf'),
					 Scale : 0.6, 
					 ZoomTransition : 'easeOut',
					 ZoomTime : 0.5,
					 ZoomInterval : 0.2,
					 FitPageOnLoad : true,
					 FitWidthOnLoad : true,
					 FullScreenAsMaxWindow : false,
					 ProgressiveLoading : false,
					 MinZoomSize : 0.2,
					 MaxZoomSize : 5,
					 SearchMatchAll : false,
					 InitViewMode : 'SinglePage',//SinglePage Portrait
					 
					 ViewModeToolsVisible : true,
					 ZoomToolsVisible : true,
					 NavToolsVisible : true,
					 CursorToolsVisible : true,
					 SearchToolsVisible : true,
							
					localeChain: 'en_US'
				 }
			});
}
