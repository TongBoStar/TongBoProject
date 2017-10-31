<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>云趣家</title>
<!-- CSS -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/reglogin.css">
        
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/reglogin.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
function toregister(){
	window.location.href = "${ctx}/mobile/wxregister.jsp?openid=${param.openid}";
}
function wxlogin(){
	if($("#loginName").val()==""){
		alert("用户名不能为空");
		$('#loginName').focus();
		return;
	}else if($("#passwork").val()==""){
		alert("密码不能为空");
		$('#passwork').focus();
		return;
	}
	var formParam = $('#frm_login').serialize();
	$.ajax({
		type: "post",
		url: "${ctx}/admin/admin!wxlogin.htm",
		data:formParam,
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.href = "${ctx}/mobile/wxindex.jsp?openid=${param.openid}";
			}else{
				alert(data.resultInfo[1]);
				if(data.resultInfo[1]=="审核未通过,请重新提交资料!"){
					toregister();
				}else if(data.resultInfo[1]=="进入销售协议"){
					window.location.href = "${ctx}/mobile/saleagreement.jsp?openid=${param.openid}";
				}
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
  	<form id="frm_login" method="post" action="">
  		<input type="hidden" name="wxCode" value="${param.openid }"/>
        <div class="page-container">
            <h1 style="color: green;">云趣家登录</h1>
			<input type="text" id="loginName" name="adminQuery.loginName" class="username" placeholder="请输入用户名称">
			<input type="password" id="passwork" name="adminQuery.password" class="password" placeholder="请输入密码">
        </div>
        <div class="ui-btn-wrap"><button type="button" onclick="wxlogin();">登录</button> </div>
        <div class="ui-btn-wrap"><button type="button" onclick="toregister();">没有账号,现在注册</button> </div>
      </form>
	</div>
</body>
</html>