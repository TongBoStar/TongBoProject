<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>${param.title }</title>
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
	loadyqk();
});
function loadyqk(){
	$.ajax({
		type: "post",
		url: "${ctx}/yqk/yqk!listToJson.htm",
		data:"yqkQuery.ftype=${param.ftype}&page.pageSize=100&page.orderBy=videoseq&page.order=asc",
		success: function (data) {
			data = $.parseJSON(data);
			var page = data.page;
			var html = "";
			if(data.resultInfo[0]=='0'){
				$.each(page.result,function(i,o){
					if(i%2==0){
						html += '<div style="padding:5px 10px;background: #FFFFFF;">';
						html += '	<div style="float: left;width:50%;">';
						html += '		<div style="vertical-align: middle;" onclick="toyouku(\''+o.videoId+'\');">';
						html += '			<img src="'+o.resIcon+'" style="vertical-align:middle;width: 140px;height:100px;"/>';
						html += '			<div style="font-size: 12px;margin-top: 5px;">'+o.fname+'</div>';
						html += '		</div>';
						html += '	</div>';
					}else{
						html += '	<div style="margin-left: 51%;" onclick="toyouku(\''+o.videoId+'\');">';
						html += '		<div style="vertical-align: middle;">';
						html += '			<img src="'+o.resIcon+'" style="vertical-align:middle;width: 140px;height:100px;"/>';
						html += '			<div style="font-size: 12px;margin-top: 5px;">'+o.fname+'</div>';
						html += '		</div>';
						html += '	</div>';
						html += '</div>';
					}
					if(i==page.result.length-1&&i%2==0){
						html += '	<div style="margin-left: 51%;display:none;">';
						html += '		<div style="vertical-align: middle;">';
						html += '			<img src="" style="vertical-align:middle;width: 140px;height:100px;"/>';
						html += '			<div style="font-size: 12px;margin-top: 5px;"></div>';
						html += '		</div>';
						html += '	</div>';
						html += '</div>';
					}
				});
				$('#content').html(html);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function toyouku(videoId){
	window.location.href = "http://player.youku.com/embed/"+videoId+"==";
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
	<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
		<div id="content"></div>
	</div>
</body>
</html>