<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="currentUserId"><%= com.terrence.crm.dol.utils.SpringSecurityUtils.getCurrentUserId()%></c:set>
<c:set var="realName"><%= com.terrence.crm.dol.utils.SpringSecurityUtils.getCurrentRealName()%></c:set>
<c:set var="menuMark"><%= (String)session.getAttribute("menuMark")%></c:set>
<link rel="shortcut icon" href="${ctx}/images/favicon.ico"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="Thu, 19 Nov 1900 08:52:00 GMT">
<link rel="shortcut icon" href="${ctx }/sysresources/images/icons/favicon.ico">
<link rel="apple-touch-icon" href="${ctx }/sysresources/images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72" href="${ctx }/sysresources/images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="${ctx }/sysresources/images/icons/favicon-114x114.png">
<!--Loading bootstrap css
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/css/fonts.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/css/googlecss.css">-->
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/jquery-ui-1.10.4.custom/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/font-awesome/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/bootstrap/css/bootstrap.min.css">
<!--LOADING STYLESHEET FOR PAGE-->
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/select2/select2-madmin.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/bootstrap-select/bootstrap-select.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/multi-select/css/multi-select-madmin.css">
<!--LOADING STYLESHEET FOR PAGE-->
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/pageloader/pageloader.css">
<!--Loading style vendors-->
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/animate.css/animate.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/jquery-pace/pace.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/iCheck/skins/all.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/jquery-notific8/jquery.notific8.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/vendors/bootstrap-daterangepicker/daterangepicker-bs3.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/simpletable/simpletable.css">
<!--Loading style-->
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/css/themes/style1/orange-blue.css" class="default-style">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/css/themes/style1/orange-blue.css" id="theme-change" class="style-change color-change">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/css/style-responsive.css">
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/uploadify/uploadify.css"/>
<link type="text/css" rel="stylesheet" href="${ctx }/sysresources/custom/custom.css">
<script src="${ctx }/sysresources/js/jquery-1.10.2.min.js"></script>
<script src="${ctx }/sysresources/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx }/sysresources/js/jquery-ui.js"></script>
<!--loading bootstrap js-->
<script src="${ctx }/sysresources/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx }/sysresources/vendors/bootstrap-hover-dropdown/bootstrap-hover-dropdown.js"></script>
<script src="${ctx }/sysresources/js/html5shiv.js"></script>
<script src="${ctx }/sysresources/js/respond.min.js"></script>
<script src="${ctx }/sysresources/vendors/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx }/sysresources/vendors/slimScroll/jquery.slimscroll.js"></script>
<script src="${ctx }/sysresources/vendors/jquery-cookie/jquery.cookie.js"></script>
<script src="${ctx }/sysresources/vendors/jquery-notific8/jquery.notific8.min.js"></script>
<%-- <script src="${ctx }/sysresources/vendors/jquery-highcharts/highcharts.js"></script> --%>
<script src="${ctx }/sysresources/js/jquery.menu.js"></script>
<%-- <script src="${ctx }/sysresources/vendors/jquery-pace/pace.min.js"></script>
<script src="${ctx }/sysresources/vendors/holder/holder.js"></script> --%>
<script src="${ctx }/sysresources/vendors/responsive-tabs/responsive-tabs.js"></script>
<script src="${ctx }/sysresources/vendors/jquery-news-ticker/jquery.newsTicker.min.js"></script>
<script src="${ctx }/sysresources/vendors/moment/moment.js"></script>
<script src="${ctx }/sysresources/vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${ctx }/sysresources/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${ctx }/sysresources/simpletable/simpletable.js"></script>
<script src="${ctx }/sysresources/backbone/backbone.min.js"></script>
<script src="${ctx }/sysresources/js/ui-notific8.js"></script>
<script src="${ctx }/sysresources/custom/cvi_busy_lib.js"></script>
<script src="${ctx }/sysresources/custom/main.js"></script>
<!--CORE JAVASCRIPT-->
<%-- <script src="${ctx }/sysresources/vendors/sco.message/sco.message.js"></script> --%>
<script src="${ctx }/sysresources/vendors/intro.js/intro.js"></script>
<script src="${ctx }/sysresources/vendors/calendar/zabuto_calendar.min.js"></script>
<script src="${ctx }/sysresources/vendors/select2/select2.min.js"></script>
<script src="${ctx }/sysresources/vendors/bootstrap-select/bootstrap-select.min.js"></script>
<script src="${ctx }/sysresources/vendors/multi-select/js/jquery.multi-select.js"></script>
<script src="${ctx }/sysresources/js/ui-dropdown-select.js"></script>
<!--LOADING SCRIPTS FOR PAGE-->
<!-- 兼容之前版本的js开始 -->
<script src="${ctx}/sysresources/js/jquery.utils.js" type="text/javascript"></script>
<script src="${ctx }/sysresources/js/jquery.tab.js" type="text/javascript"></script>
<script src="${ctx}/sysresources/ui/jquery.ui.widget.js" type="text/javascript"></script>
<script src="${ctx}/sysresources/ui/jquery.ui.mouse.js" type="text/javascript"></script>
<script src="${ctx}/sysresources/ui/jquery.ui.draggable.js" type="text/javascript"></script>
<script src="${ctx}/sysresources/uploadify/jquery.uploadify.js" type="text/javascript"></script>
<script src="${ctx}/sysresources/js/jquery.form.js" type="text/javascript"></script>
<script src="${ctx }/sysresources/flexpaper/flexpaper_flash.js" type="text/javascript" ></script>  
<script src="${ctx }/sysresources/flexpaper/flexpaper_flash_debug.js" type="text/javascript"></script>
<script src="${ctx}/sysresources/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<!-- 兼容之前版本的js结束 -->
<script src="${ctx }/sysresources/js/animation.js" type="text/javascript"></script>
<script src="${ctx }/sysresources/js/index.js" type="text/javascript"></script>
<script src="${ctx }/sysresources/js/main.js" type="text/javascript"></script>
<script type="text/javascript">
var ctx = '${ctx}';
var realId = '${currentUserId}';
var realName = '${realName}';
var menuMark = '${menuMark}';
</script>
<div id="preloader" class="row">
<div class="col-lg-6 mtm">
		<div id="pageloader3">
			<div class="spinner demo" style="opacity:0.6;">
				<div class="loader">
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="circle"></div>
					<div class="clear"></div>
					<div style="margin:50px 0px 0px -20px;font-size: 16px;opacity:1;color: white;width:200px;">
					<strong id="loadingcontent"></strong></div>
				</div>
			</div>
		</div>
	</div>
</div>