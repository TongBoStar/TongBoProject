<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>一起听</title>
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
var myAuto ;
$(window).load(function() {
	loadyqt(${param.ftype});
	myAuto = document.getElementById('myaudio');
});
function loadyqt(ftype){
	for(var i=1;i<5;i++){
		if(i==ftype){
			$('#th'+i).css("background-image","");
			$('#th'+i).css("background-color","#6699FF");
		}else{
			$('#th'+i).css("background-color","#eee");
		}
	}
	$.ajax({
		type: "post",
		url: "${ctx}/yqt/yqt!listToJson.htm",
		data:"yqtQuery.ftype="+ftype+"&page.pageSize=100",
		success: function (data) {
			data = $.parseJSON(data);
			var page = data.page;
			var html = "";
			if(data.resultInfo[0]=='0'){
				var ftypename = "";
				$.each(page.result,function(i,o){
					html += "<tr id='tri"+o.id+"' onclick='play(\""+o.resourceUrl+"\","+o.id+")');'>";
					html += "<td>"+(i+1)+"</td>";
					html += "<td>"+o.fname+"</td>";
					html += "<td>"+(Math.floor(o.times/60)+"分"+(o.times-Math.floor(o.times/60)*60))+"秒</td>";
					if(1==o.ftype){
						ftypename = "故事";
					}else if(2==o.ftype){
						ftypename = "儿歌";
					}else if(3==o.ftype){
						ftypename = "童话";
					}else{
						ftypename = "国学";
					}
					html += "<td>"+ftypename+"</td>";
					html += "<tr>";
				});
				$('#tbody').html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function play(filepath,trid){
	$('#myaudio').attr("src","http://www.yiyunzk.com/"+filepath);
	myAuto.play();
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
<table class="zebra">
	<thead>
    <tr>
        <th id="th1" style="text-align: center;" onclick="loadyqt(1);">故事</th>        
        <th id="th2" style="text-align: center;" onclick="loadyqt(2);">儿歌</th>
        <th id="th3" style="text-align: center;" onclick="loadyqt(3);">童话</th>
        <th id="th4" style="text-align: center;" onclick="loadyqt(4);">国学</th>
    </tr>
    </thead>
    <tbody>
	    <tr>
	        <td style="text-align: center;">序号</td>        
	        <td style="text-align: center;">歌曲名称</td>
	        <td style="text-align: center;">歌曲时长</td>
	        <td style="text-align: center;">歌曲分类</td>
	    </tr>
    </tbody>
	<tbody id="tbody"></tbody>
</table>
<audio id="myaudio" src="http://www.yiyunzk.com/upload/e8ba81ec-8bdd-4d5d-a6d6-c4d2a3499413.mp3" controls="controls" loop="false" hidden="true" >
</audio>
</div>
</body>
</html>