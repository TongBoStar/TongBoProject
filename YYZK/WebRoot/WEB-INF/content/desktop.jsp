<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/desktop.css"/>
<title>首页</title>
</head>
<body>
	<div id="control"> 
		<table align="center">
			<tbody>
                <tr>
                    <td class="control-l"></td>
                    <td class="control-c">
                        <a href="javascript:void(0)" hidefocus="hidefocus" class="btn active"></a>
                        <a href="javascript:void(0)" hidefocus="hidefocus" class="btn"></a>
                    </td>
                    <td class="control-r">
                        <a class="cfg" href="javascript: void(0)" title="打开应用盒子" id="openAppBox"></a>
                    </td>
                </tr>
      		</tbody>
 		</table>
	</div>
	<div id="container">
		<div class="screen">
        	<ul class="ui-sortable">
            	<li class="block" id="block_182" title="车辆申请" index="182" onclick="window.top.createTab(14,'用车申请','','')" style="margin-left: 31px; margin-right: 31px;">
                	<div class="img">
                    	<p><img src="${ctx}/resources/images/admin/app_icons/office_car_common.png"></p>
                        <!--<div class="count count10" id="count_182"></div>  -->
                   	</div>
                    <a href="javascript: void(0)" class="icon-text"><span>车辆申请</span></a>
                </li>
                <li class="block" id="block_182" title="会议室申请" index="182" onclick="window.top.createTab(18,'会议室申请','','');" style="margin-left: 31px; margin-right: 31px;">
                	<div class="img">
                    	<p><img src="${ctx}/resources/images/admin/app_icons/office_meetingroom_common.png"></p>
                        <!-- <div class="count count10" id="count_182"></div>  -->
                   	</div>
                    <a href="javascript: void(0)" class="icon-text"><span>会议室申请</span></a>
                </li>
			</ul>
        </div>
	</div>
</body>
</html>