<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>云趣家族</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="webuploader/style.css" />
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script type="text/javascript" src="webuploader/webuploader.js"></script>
<script type="text/javascript" src="webuploader/upload.js?domain=${ctx}"></script>
<script src="layer/layer.js"></script>
<script>
$(window).load(function() {
	$("#status").fadeOut();
	$("#preloader").delay(350).fadeOut("slow");
});
function openlayer(){
	layer.open({
			type: 1,
			title: false,
			closeBtn: true,
			shadeClose: false,
			offset: '25%',
			content: "<div class='no_login_show'><h1>亲！我们正在拼命开发！</h1><a href='${ctx}/mobile/huodonglist.jsp?openid=${param.openid}'>有惊喜,去我们的福利活动逛逛吧!</a></div>"
		});
}
function saveAdmin(){
	openlayer();
	return;
	var filesJson='';
	var allFile=[];
	$("ul#isupload li img").each(function(){
		if(null==$(this).attr("id")||undefined==$(this).attr("id")||""==$(this).attr("id")){
			var aFile={
				"resPath":$(this).attr("data-respath"),
				"newName":$(this).attr("data-newname"),
				"oldName":$(this).attr("data-oldname")	
			};
			allFile.push(aFile);
		}
	});
	filesJson = JSON.stringify(allFile).replace(/%/g, "%25").replace(/\&/g, "%26").replace(/\+/g, "%2B");
	var formParam = $('#frm_admin').serialize();
	$.ajax({
		type: "post",
		url: "${ctx}/admin/admin!saveAdmin.htm",
		data:formParam+"&filesJson="+filesJson,
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.href = "${ctx}/mobile/register_ok.html";
			}
		}
	});
}
</script>
</head>

<body>
<div class="mobile">
	<!--页面加载 开始-->
  <div id="preloader">
    <div id="status">
      <p class="center-text"><span>拼命加载中···</span></p>
    </div>
  </div>
  <!--页面加载 结束--> 
  <!--header 开始-->
  <header>
    <div class="header"> <a class="new-a-back" href="javascript:history.back();"> <span><img src="images/iconfont-fanhui.png"></span> </a>
      <h2>加入云趣家族</h2>
      </div>
  </header>
  <!--header 结束-->
  <div class="w main">
  	<form id="frm_admin" method="post" action="">
  		<input type="hidden" name="wxCode" value="${param.openid }"/>
        <div class="item item-username">
          <input id="username" class="txt-input txt-username" type="text" placeholder="请输入用户名" value="" name="adminName">
          <b class="input-close" style="display: none;"></b></div>
        <!-- <div class="item item-password">
          <input id="password" class="txt-input txt-password ciphertext" type="password" placeholder="请输入密码" name="password" style="display: inline;">
          <input id="ptext" class="txt-input txt-password plaintext" type="text" placeholder="请输入密码" style="display: none;" name="ptext">
          <b class="tp-btn btn-off"></b> </div>
        <div class="item item-password">
          <input id="password_PwdTwo" class="txt-input txt-password_PwdTwo ciphertext_PwdTwo" type="password" placeholder="确认密码" name="password_PwdTwo" style="display: inline;">
          <input id="ptext_PwdTwo" class="txt-input txt-password_PwdTwo plaintext_PwdTwo" type="text" placeholder="确认密码" style="display: none;" name="ptext_PwdTwo">
          <b class="tp-btn_PwdTwo btn-off_PwdTwo"></b> </div> -->
        <div class="item item-username">
          <input id="username" class="txt-input txt-username" type="text" placeholder="身份证号" value="" name="idCard">
          <b class="input-close" style="display:none;"></b> </div>
        <div class="item item-username">
          <input id="username" class="txt-input txt-username" type="text" placeholder="请输入邮箱" value="" name="email">
          <b class="input-close" style="display:none;"></b> </div>
        <div class="item item-username">
          <input id="username" class="txt-input txt-username" type="text" placeholder="请输入手机号码" value="" name="telNumber">
          <b class="input-close" style="display:none;"></b> </div>
        <!-- <div class="item item-username">
          <input id="username" class="txt-input txt-username" type="text" placeholder="请输入QQ号码" value="">
          <b class="input-close" style="display:none;"></b> </div> -->
          <div id="uploader" class="uploader" style="min-height:240px;">
            <table class="my-table-form" style="width:100%;">
	        	<tr>
	      			<td colspan="6">
	      				<div class="uploader">
	      					<ul id="isupload" class="filelist"></ul>
	      				</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="6" style="background-color: #ffffff">
	        			 <div id="uploader" class="uploader">
			                <div class="queueList">
			                    <div id="dndArea" class="placeholder">
			                        <div id="filePicker"></div>
			                        <p>或将照片拖到这里，最多可选6张</p>
			                    </div>
			                </div>
			                <div class="statusBar" style="display:none;">
			                    <div class="progress">
			                        <span class="text">0%</span>
			                        <span class="percentage"></span>
			                    </div><div class="info"></div>
			                    <div class="btns">
			                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
			                    </div>
			                </div>
			            </div>
	        		</td>
	        	</tr>
			</table>
         </div>
        <div class="item item-captcha">
          <div class="err-tips">注册即视为同意 <a target="_blank" href="#" onclick="openlayer();">用户服务协议</a> </div>
        </div>
        <div class="ui-btn-wrap"> <a class="ui-btn-lg ui-btn-primary" href="javascript:void(0);" onclick="saveAdmin();">提交</a> </div>
      </form>
  </div>
</div>
</body>
</html>
<script type="text/javascript" >
    $(function() {
		$(".input-close").hide();
		displayPwd();
		displayPwd_PwdTwo();
		displayClearBtn();
		setTimeout(displayClearBtn, 200 ); //延迟显示,应对浏览器记住密码
	});	

	//是否显示清除按钮
	function displayClearBtn(){
		if(document.getElementById("username").value != ''){
			$("#username").siblings(".input-close").show();
		}
		if(document.getElementById("password").value != ''){
			$(".ciphertext").siblings(".input-close").show();
		}
		if(document.getElementById("password_PwdTwo").value != ''){
			$(".ciphertext_PwdTwo").siblings(".input-close").show();
		}
	}

	//清除input内容
    $('.input-close').click(function(e){  
		$(e.target).parent().find(":input").val("");
		$(e.target).hide();
		$($(e.target).parent().find(":input")).each(function(i){
			if(this.id=="ptext" || this.id=="password"){
				$("#password").val('');
				$("#ptext").val('');
			}
			if(this.id=="ptext_PwdTwo" || this.id=="password_PwdTwo"){
				$("#password_PwdTwo").val('');
				$("#ptext_PwdTwo").val('');
			}
         });
    });  
	
	//设置password字段的值	
	$('.txt-password').bind('input',function(){
		$('#password').val($(this).val());
	});
	$('.txt-password_PwdTwo').bind('input',function(){
		$('#password_PwdTwo').val($(this).val());
	});
	
	//显隐密码切换
	function displayPwd(){
    	$(".tp-btn").toggle(
          function(){
            $(this).addClass("btn-on");
			var textInput = $(this).siblings(".plaintext");
    		var pwdInput = $(this).siblings(".ciphertext");
			pwdInput.hide();
			textInput.val(pwdInput.val()).show().focusEnd();
          },
          function(){
		  	$(this).removeClass("btn-on");
		  	var textInput = $(this).siblings(".plaintext");
    		var pwdInput = $(this).siblings(".ciphertext");
            textInput.hide();
			pwdInput.val(textInput.val()).show().focusEnd();
          }
    	);
	}
	//显隐密码切换
	function displayPwd_PwdTwo(){
    	$(".tp-btn_PwdTwo").toggle(
          function(){
            $(this).addClass("btn-on_PwdTwo");
			var textInput = $(this).siblings(".plaintext_PwdTwo");
    		var pwdInput = $(this).siblings(".ciphertext_PwdTwo");
			pwdInput.hide();
			textInput.val(pwdInput.val()).show().focusEnd();
          },
          function(){
		  	$(this).removeClass("btn-on_PwdTwo");
		  	var textInput = $(this).siblings(".plaintext_PwdTwo");
    		var pwdInput = $(this).siblings(".ciphertext_PwdTwo");
            textInput.hide();
			pwdInput.val(textInput.val()).show().focusEnd();
          }
    	);
	}
	
	//监控用户输入
	$(":input").bind('input propertychange', function() {
		if($(this).val()!=""){
			$(this).siblings(".input-close").show();
		}else{
			$(this).siblings(".input-close").hide();
		}
    });
</script> 