<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>成长记录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script>
$(window).load(function() {
	/* $.webAjax({
		type : 'post',
		url : "/usermark/usermark!listToQuery.htm",
		data : 'usermarkQuery.serialNumber=${param.serialNumber}&usermarkQuery.sortColumns=id desc',
		success : function(data) {		
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				var fyear = 0;
				var fmonth = 0;
				var fday = 0;
				var html = '<h1 class="title">书童日志记录</h1>';
				$.each(data.usermarkList,function(i,o){
					if(i==0&&o.fyear!=fyear){
						html +='<div class="year">';
						html +='    <h2><a href="#">'+o.fyear+'年<i></i></a></h2>';
						html +='    <div class="list">';
						html +='      <ul>';
					}
					if(i!=0&&o.fyear!=fyear){
						html +='        </li>';
						html +='      </ul>';
						html +='    </div>';
						html +='  </div>';
					}
					if(i==0){
						html +='        <li class="cls">';
						html +='          <p class="date">'+o.fmonth+'月'+o.fday+'日</p>';
						if(o.operateType==1){
					 		html +='          <p class="intro">'+o.upTime+" 登录,"+o.markContent+'</p>';
					 	}else{
					 		html +='          <p class="intro">'+o.upTime+" 下线,"+o.markContent+'</p>';
					 	}
						html +='          <p class="version">&nbsp;</p>';
						html +='          <div class="more">';
					}
					if(o.fmonth == fmonth&&o.fday!=fday){
						html +='          </div>';
						html +='        <li class="cls">';
						html +='          <p class="date">'+o.fmonth+'月'+o.fday+'日</p>';
						if(o.operateType==1){
					 		html +='          <p class="intro">'+o.upTime+" 登录,"+o.markContent+'</p>';
					 	}else{
					 		html +='          <p class="intro">'+o.upTime+" 下线,"+o.markContent+'</p>';
					 	}
						html +='          <p class="version">&nbsp;</p>';
						html +='          <div class="more">';
					}
					if(o.fyear==fyear && o.fmonth == fmonth && o.fday == fday){
						if(o.operateType==1){
							html +='            <p>'+o.upTime+" 登录,"+o.markContent+'</p>';
						}else{
							html +='            <p>'+o.upTime+" 下线,"+o.markContent+'</p>';
						}
					}
					if(i==data.usermarkList.length-1){
						html +='          </div>';
						html +='        </li>';
						html +='      </ul>';
						html +='    </div>';
						html +='  </div>';
					}
					fyear = o.fyear;
					fmonth = o.fmonth;
					fday = o.fday;
				});
				$('#main').html(html);
				//开始调整样式
				$(".main .year .list").each(function (e, target) {
				    var $target=  $(target),
				        $ul = $target.find("ul");
				    $target.height($ul.outerHeight()), $ul.css("position", "absolute");
				}); 
				$(".main .year>h2>a").click(function (e) {
				    e.preventDefault();
				    $(this).parents(".year").toggleClass("close");
				});
			}
		}
	}); */
});
</script>
</head>
<body>
<div class="content">
  <div class="wrapper">
    <div class="light"><i></i></div>
    <hr class="line-left">
    <hr class="line-right">
    <div class="main" id="main"></div>
  </div>
</div>
</body>
</html>
