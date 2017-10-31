<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>云趣家</title>
<link rel="stylesheet" type="text/css" href="webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="webuploader/style.css" />
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/reglogin.css">
<link href="css/baoliao.css" rel="stylesheet" type="text/css">
<style type="text/css">
.no_login_show {
	text-align: center;
	float: left;
	width: 300px;
	overflow: hidden;
}
.no_login_show h1 {
	font-size: 16px;
	color: #666666;
	margin: 0px;
	line-height: 50px;
	border-bottom-width: 1px;
	border-bottom-style: dotted;
	border-bottom-color: #E7E7E7;
	background-color: #F9F9F9;
}
.no_login_show a {
	width: 100%;
	line-height: 50px;
	text-decoration: none;
	color: #ff6063;
	float: left;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #EEEEEE;
}
</style>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/reglogin.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
//检查新密码是否一致，初始密码是否正确
function checkpwd(){
	if(!$('#nowpwd').val()){alert("当前密码不能为空！");return false;}
	if(!$('#newpwd').val()){alert("新密码不能为空！");return false;}
	if(!$('#newpwd2').val()){alert("重复密码不能为空！");return false;}
	if($('#newpwd').val()!=$('#newpwd2').val()){alert("两次密码输入不一致！");return false;	}
	if($('#nowpwd').val()==$('#newpwd').val()){
		alert("当前密码与新密码重复！");
		return false;
	}
	var url = "${ctx}/usercenter/showpwd.htm";
	$.webAjax( {
		type : 'post',
		url : url,
		data : 'password='+$('#nowpwd').val(),
		success : function(data) {			
			if(data[0]==1){//当前密码正确
				update();					
			}else{
				document.getElementById("nowpwd").value="";
				document.getElementById("nowpwd_error").style.display="";
			}
		}
	});
}
//更新密码
function update(){
	if(!$('#nowpwd').val()){alert("当前密码不能为空！");return false;}
	if(!$('#newpwd').val()){alert("新密码不能为空！");return false;}
	if(!$('#newpwd2').val()){alert("重复密码不能为空！");return false;}
	if($('#newpwd').val()!=$('#newpwd2').val()){alert("两次密码输入不一致！");return false;	}
	if($('#nowpwd').val()==$('#newpwd').val()){
		alert("当前密码与新密码重复！");
		return false;
	}
	var url ="${ctx}/usercenter/updatepwdwx.htm";
	$.webAjax( {
	type : 'post',
	url : url,
	data : 'password='+$('#newpwd').val()+"&adminId=${param.adminId}",
	success : function(data) {			
			if(data && data == 'success') {
				alert("密码修改成功！！");
				$('#nowpwd').attr("value","");
				$('#newpwd').attr("value","");
				$('#newpwd2').attr("value","");
				window.location.href = '${ctx}/mobile/wxlogin.jsp?openid=${param.openid}';
			}else {
				errorInfo(data);
			}
		}
	});
}
</script>
</head>
<body>
<div class="mobile">
  <!--页面加载 结束--> 
  <div class="w main">
  	<form id="frm_register" method="post" action="">
        <div class="page-container">
            <h1 style="color: green;">修改密码</h1>
            <input type="hidden" id="hiddenAdminId" name="adminId"/>
			<input type="password" id="nowpwd" name="nowpwd" class="username" placeholder="原密码">
			<input type="password" id="newpwd" name="newpwd" class="username" placeholder="新密码">
			<input type="password" id="newpwd2" name="newpwd2" class="username" placeholder="再次输入新密码">
        </div>
      </form>
      <div class="ui-btn-wrap"><button type="button" onclick="update();">保存</button> </div>
  </div>
</div>
</body>
</html>