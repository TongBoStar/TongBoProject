<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文档搜索</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/backbone/backbone.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/bootstrap3/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/resources/plugins/bootstrap3/js/bootstrap.min.js"></script>
<!-- common -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/doc/css/style.css"/>
<!-- ztree -->
<script type="text/javascript" src="${ctx}/resources/plugins/ztree/jquery.ztree.core-3.5.min.js"></script>
<!-- lhgdialog -->
<script src="${ctx}/resources/plugins/lhgdialog/lhgdialog.min.js" type="text/javascript"></script>
<!-- validform -->
<script type="text/javascript" src="${ctx}/resources/plugins/validform/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/plugins/validform/Validform.css"/>
<!-- curdtools -->
<script type="text/javascript" src="${ctx}/resources/js/curdtools.js"></script>
<script>
//searchDoc
$(function(){
	
	
	$("#search-button").click(function(){
		//window.location.href="${ctx}/oa/doc/searchlist.htm?searchWords="+$("#input").val();
		$.ajax({
			type: "post",
			url: "${ctx}/doc/doc!searchDoc.htm",
			data:{"searchWords":$("#input").val()},
			dataType: "json",
			async: false,
			success: function (listData, textStatus) {
				var html='';
				$('ul#m-result li').remove();
				$.each(listData.rows,function(index,obj){
					html=html+'<li class="res-list">';
					html=html+'<h3 class="res-title ">';
					html=html+'	<a target="_blank" data-res="" href="http://www.duia.com/">'+obj.name+'</a>';
					html=html+'</h3>';
					html=html+'<p class="res-desc">对<em>啊</em>网Duia.com-国内领先的在线直播学习网站,强大在线直播技术,海量免费学习视频,优质互动直播课程,致力于打造最好的互动直播学习网站!<br></p>';
					html=html+'<p class="res-linkinfo"><cite>www.duia.com&nbsp;2015-06-09</cite></p>';
					html=html+'</li>';
				});
				$('#m-result').append(html);
			}
		});
	});
	
	if('${param.searchWords}'!=''){
		$("#input").val('${param.searchWords}');
		$('#search-button').trigger("click");
	}
});
</script>
<style>
#header {
    font-size: 12px;
    margin-bottom: 18px;
    position: relative;
    z-index: 3000;
}
#header .inner {
    background: #f8f8f8 none repeat scroll 0 0;
    border-bottom: 1px solid #ebebeb;
    height: 66px;
    min-width: 940px;
}
#head {
    padding: 7px 0 0 20px;
}

#search{
    background: #fff none repeat scroll 0 0;
    height: 44px;
    position: relative;
    width: 524px;
    z-index: 9;
    margin-left: 0px;
}
#suggest-align {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #fff;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    height: 34px;
    padding: 4px 6px 4px 12px;
    position: relative;
    vertical-align: top;
    border: 1px solid #bbb;
    box-shadow: none;
}


#input {
    background: #fff none repeat scroll 0 0;
    border: medium none;
    color: #333;
    float: left;
    font-size: 16px;
    height: 30px;
    margin-top: 3px;
    outline: medium none;
    width: 500px;
}

#search-button {
    background: #4873b9 none repeat scroll 0 0;
    border: 1px solid #4873b9;
    color: #fff;
    cursor: pointer;
    font-family: "Microsoft YaHei";
    font-size: 18px;
    height: 42px;
    left: 530px;
    outline: medium none;
    position: absolute;
    top: 0;
    vertical-align: top;
    width: 110px;
}


#warper {
    min-width: 940px;
}

#container {
    padding-left: 20px;
    position: relative;
}

#main {
    float: left;
    position: relative;
    width: 540px;
    z-index: 10;
}

.result .res-list, .result-d .res-d-list {
    font-size: 13px;
    line-height: 20px;
    margin-bottom: 21px;
}


.result .res-list {
    word-break: break-all;
}

.result .res-list h3, .result-d .res-d-list h3 {
    font-size: 16px;
    font-weight: 400;
    margin-bottom: 3px;
}

.result .res-list .res-title {
    white-space: normal;
    word-break: break-all;
}


a em {
    text-decoration: underline;
}
em {
    color: #c00;
}


.result .res-list p.res-desc, .result-d .res-d-list p.res-d-desc {
    text-align: left;
    word-break: break-all;
    word-wrap: break-word;
    z-index: 1;
}

.res-linkinfo {
    color: #666;
    font-size: 12px;
}
</style>
</head>
<body>
	<div id="header">
		<div class="inner">
			<div id="head">
				<div id="search">
					<div class="" id="suggest-align">
						<input type="text" autocomplete="off" suggestwidth="520px" id="input" class="placeholder" name="q">
						<cite id="suggest-tp"></cite>
					</div>
					<input id="search-button" type="submit" onmouseout="this.className=''" onmousedown="this.className='mousedown'" onmouseover="this.className='hover'" value="文档搜索">
				</div>
			</div>
		</div>
	</div>
	<div id="warper">
		<div id="container" class=" so-w1330">
			<div id="main">
				<ul id="m-result" class="result">
				    <!-- 
					<li class="res-list">
						<h3 class="res-title ">
							<a target="_blank" data-res="" href="http://www.duia.com/">对<em>啊</em>网,让学习触手可得!</a>
						</h3>
						<p class="res-desc">对<em>啊</em>网Duia.com-国内领先的在线直播学习网站,强大在线直播技术,海量免费学习视频,优质互动直播课程,致力于打造最好的互动直播学习网站!<br></p>
						<p class="res-linkinfo"><cite>www.duia.com&nbsp;2015-06-09</cite></p>
					</li>
					 -->
				</ul>
			</div>
		</div>
	</div>
</body>
</html>