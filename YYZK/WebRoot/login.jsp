<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>依云智酷管理系统</title>
<link rel="shortcut icon" href="${ctx}/images/favicon.ico"/>
<!-- Link JScript-->
<script type="text/javascript" src="${ctx }/login/js/zh_cn.js"></script>
<script type="text/javascript" src="${ctx }/login/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/login/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx }/login/js/jquery-jrumble.js"></script>
<script type="text/javascript" src="${ctx }/login/js/jquery.tipsy.js"></script>
<script type="text/javascript" src="${ctx }/login/js/iphone.check.js"></script>
<script type="text/javascript" src="${ctx }/login/js/login.js"></script>
<script type="text/javascript" src="${ctx }/login/lhgDialog/lhgdialog.min.js"></script>
<!--[if lt IE 9]>
   <script src="{ctx }/login/js/html5.js"></script>
  <![endif]-->
<!--[if lt IE 7]>
  <script src="{ctx }/login/js/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
	EvPNG.fix('div, ul, img, li, input'); //EvPNG.fix('包含透明PNG图片的标签'); 多个标签之间用英文逗号隔开。
</script>
  <![endif]-->
<link href="${ctx }/login/css/zice.style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/login/css/buttons.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/login/css/icon.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/login/css/tipsy.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
html {
	background-image: none;
}

label.iPhoneCheckLabelOn span {
	padding-left: 0px
}

#versionBar {
	background-color: #212121;
	position: fixed;
	width: 100%;
	height: 35px;
	bottom: 0;
	left: 0;
	text-align: center;
	line-height: 35px;
	z-index: 11;
	-webkit-box-shadow: black 0px 10px 10px -10px inset;
	-moz-box-shadow: black 0px 10px 10px -10px inset;
	box-shadow: black 0px 10px 10px -10px inset;
}

.copyright {
	text-align: center;
	font-size: 10px;
	color: #CCC;
}

.copyright a {
	color: #A31F1A;
	text-decoration: none
}

.on_off_checkbox {
	width: 0px;
}

#login .logo {
	width: 500px;
	height: 51px;
}
</style>
</head>
<body>
    <div id="alertMessage"></div>
    <div id="successLogin"></div>
    <input type="hidden" id="errorinput" value="${param.error }"/>
    <div class="text_success"><img src="${ctx }/login/images/loader_green.gif" alt="Please wait" /> <span><t:mutiLang langKey="common.login.success.wait"/></span></div>
    <div id="login">
        <div class="inner">
            <div class="logo"><font style="font-size: 20px;font-weight: bold;">依云智酷管理系统</font></div>
            <div class="formLogin">
                <form id="formLogin" name="formLogin" action="${ctx}/j_spring_security_check" method="post">
                    <div class="tip">
                        <input class="j_username" name="j_username" type="text" id="j_username" title="" iscookie="true" nullmsg="" placeholder="帐号"/>
                    </div>
                    <div class="tip">
                        <input class="j_password" name="j_password" type="password" id="j_password" title="" nullmsg=""  placeholder="密码"/>
                    </div>
                   <%-- <div>
                        <div style="float: right; margin-left:-150px; margin-right: 20px;">
                            <img id="validateCodeImg" src="${ctx }/common/validateCodeServlet" alt="校验码"  width="105" height="35" border="0" onclick="javascript:refreshValidateCode('${ctx}');"/>
                        </div>
                        <input class="randCode" name="randCode" type="text" id="randCode" title="" value="" nullmsg="" />
                    </div> --%>
                    <div class="loginButton">
                        <div style="float: left; margin-left: -9px;margin-top:10px;">
                            <input type="checkbox" id="on_off" name="remember" checked="ture" class="on_off_checkbox" value="0" />
                            <span class="f_help">是否记住用户名</span>
                        </div>                 
                        <div style="float: right; padding: 0px 0; margin-right: -12px;">
                           <div>
                                <ul class="uibutton-group">
                                    <li><a id="but_login" href="#" class="uibutton normal">登录</a></li>
                                    <li><a id="forgetpass" href="#" class="uibutton normal">重置</a></li>
                                </ul>
                            </div>
                            <br>                            
                            <t:dictSelect id="langCode" field="langCode" typeGroupCode="lang" hasLabel="false" defaultVal="zh-cn"></t:dictSelect>
                        </div>
                        <div class="clear"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
    <!--Login div-->
    <div class="clear"></div>
    <div id="versionBar">
        <div class="copyright"><t:mutiLang langKey="common.copyright"/><span class="tip">
			©依云智酷版权所有 (推荐谷歌浏览器,Google Chrome可以获得更快,更安全的页面响应速度,兼容：FireFox36+,IE9+,Opera,360急速内核,Edge等浏览器) 
		</span></div>
    </div>
</body>
</html>