<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
<title>用户添加</title>
<%@ include file="/sysresources/common/include.jsp"%>
<script type="text/javascript" src="${ctx}/sysresources/js/jquery.ztree.all-3.1.min.js"></script>
<link href="${ctx}/sysresources/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;font-size:14px;background:#E7EFF1;}
.nobdTB tr td{padding:0 5px 7px; font-size:12px; vertical-align:middle;}
.nobdTB{background:#fff;}
</style>
<script type="text/javascript" src="${ctx }/sysresources/custom/applicationjs/adminjs/adminadd.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	loadAdmin();
});
function loadAdmin(){
	if('${param.adminId}'!='null'&&'${param.adminId}'!=''){
		$.webAjax({
			type : 'post',
			url : ctx+"/system/showAdmin.htm",
			data :'adminId=${param.adminId}',
			success : function(data) {
				data = $.parseJSON(data);
				$('#adminIdHidden').val(data.model.adminId);
				$('#loginName').val(data.model.loginName);
				$('#adminName').val(data.model.adminName);
				$('#telNumber').val(data.model.telNumber);
				$('#idCard').val(data.model.idCard);
				$('#wxCode').val(data.model.wxCode);
				$('#email').val(data.model.email);
				$('#zfbCode').val(data.model.zfbCode);
				$('#ylCard').val(data.model.ylCard);
				$('#ylCardType').val(data.model.ylCardType);
				$('#wxCard').val(data.model.wxCard);
				$('#adminCode').val(data.model.adminCode);
				$('#status').val(data.model.status);
				$('#type').val(data.model.type);
				$('#examineTime').val(null==data.model.examineTime?"":data.model.examineTime);
				$('#erweimaImg').attr("src","/qrcode/"+data.model.adminCode+".jpg");
				if(data.model.status==1&&data.model.type==2){
					$('#statusexamineshow').val("审核不通过");
					$('#fremarkexamineshow').val(data.model.fremark);
				}
				if(data.model.status==0&&data.model.type==2){
					$('#statusexamineshow').val("待审核");
					$('#examineBtn').css("display","");
				}
				if(data.model.status==3&&data.model.type==2){
					$('#fremarkexamineshow').val("材料符合");
					$('#statusexamineshow').val("审核通过");
				}
				loadImages(data.model.adminId);
			}
		});
	}
}
function loadImages(adminId){
	$.webAjax({
			type : 'post',
			url : ctx+"/adminImages/admin-images!listToQuery.htm",
			data :'adminImagesQuery.adminId=${param.adminId}',
			success : function(data) {
				data = $.parseJSON(data);
				var html = "";
				$.each(data.adminImagesList, function(i, o){
					if(i%2==0){
						html += '<div style="float:left;"><img src="\\'+o.imgPath+'" style="width:280px;height:180px;"/></div>';
					}else{
						html += '<div style="margin:10px 0px 0px 310px;"><img src="\\'+o.imgPath+'" style="width:280px;height:180px;"/></div>';
					}
				});
				$('#idCardDiv').html(html);
			}
		});
}
function getWebRootPath() {
    var webroot=document.location.href;
    webroot=webroot.substring(webroot.indexOf('//')+2,webroot.length);
    webroot=webroot.substring(webroot.indexOf('/')+1,webroot.length);
    webroot=webroot.substring(0,webroot.indexOf('/'));
    var rootpath="/"+webroot;
    return rootpath;
}
function toadminlist(){
	window.location.href= ctx+"/admin/admin-list.htm";
}
function submitForm(){
	var paramForm = $('#inputform').serialize();
	$.webAjax({
		type : 'post',
		url : ctx+"/admin/admin!saveToJson.htm",
		data :paramForm,
		success : function(data) {
			if(data=="success"){
				alert("保存成功!");
			}
		}
	});
}
function examineAdmin(){
	var statusexamine = $('input[name="statusexamine"]:checked').val();
	var fremarkexamine = $('#fremarkexamine').val();
	if(statusexamine==1&&fremarkexamine==''){
		alert("必须填写驳回原因");
		return;
	}
	if(!confirm('确定审核？')) {
		return;
	}
	var url = ctx + '/admin/admin!examineYunQuUser.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : "entity.adminId=${param.adminId}&entity.status="+statusexamine+"&entity.fremark="+fremarkexamine,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				alert("审核成功");
				closeDiv('examineDiv');
				loadAdmin();
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function toexamine(){
	openDiv('examineDiv');
}
</script>
</head>
<body>
    <div style="height:100%;">
    	<%@ include file="/sysresources/common/topmsg.jsp"%>
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <%@ include file="/sysresources/common/top.jsp"%>
        <div id="wrapper">
            <%@ include file="/sysresources/common/menu.jsp"%>
            <div id="page-wrapper">
            	<div id="contentmark1" style="overflow:auto;width:auto;margin-bottom:3px;">
            	<form action="" name="inputform" id="inputform" method="post">
            		<input type="hidden" name="adminId" value="${param.adminId }" id="adminIdHidden"/>
					<div id="table-sorter-tab" class="tab-pane fade in active" >
                      <ul id="sliderTab" class="nav nav-tabs ul-edit">
                          <li class="active"><a href="#ui-slider-tab" data-toggle="tab">用户资料信息</a></li>
                          <li class="active"><button type="button" class="btn btn-info" style="height:36px;" onclick="submitForm();">保存</button></li>
                          <li class="active"><button type="button" id="examineBtn" class="btn btn-info" style="height:36px;margin-left: 20px;display: none;" onclick="toexamine();">审核</button></li>
                          <li class="active"><button type="button" class="btn btn-warning" style="height:36px;margin-left:20px;" onclick="toadminlist();">取消</button></li>
                      </ul>
                         <div id="ui-slider-tab" class="tab-pane fade active in" style="margin:5px 0px 0px 10px;text-align: center;float:left;">
                         	<div>
                          	<table id="cont_1" cellspacing="0" cellpadding="0" border="0" class="nobdTB">
		                    <tr style="display:;">
		                        <td class="fs11 fcRed" style="text-align: left;font-weight: bold;font-size: 14px;">基本信息</td><td></td>
		                    </tr>
		                    <tr>
		                        <td align="right">用户名称</td>
		                        <td align="left"><input type="text" class="input160" id="loginName" name="loginName" /></td>
		                        <td align="right">真实姓名</td>
		                        <td align="left"><input type="text" class="input160" id="adminName" name="adminName"/></td>
		                    </tr>
		                    <tr>
		                        <td align="right">微信号</td>
		                        <td align="left"><input type="text" class="input160" id="wxCode" name="wxCode" /></td>
		                        <td align="right">邮箱地址</td>
		                        <td align="left"><input type="text" class="input160" id="email" name="email" /></td>
		                    </tr>
		                    <tr>
		                        <td align="right">用户类型</td>
		                        <td align="left">
		                        	<select id="type" name="type" class="select120" style="width:160px;">
		                        		<option value="1">系统用户</option>
		                        		<option value="2">云趣用户</option>
		                        	</select>
		                        </td>
		                        <td align="right">手机号</td>
		                        <td align="left"><input type="text" class="input160" id="telNumber" name="telNumber" /></td>
		                    </tr>
		                    <tr>
		                        <td align="right">证件名称</td>
		                        <td align="left">
		                            <select id="idType" name="idType" class="select120" style="width:160px;">
		                        		<option value="1">身份证</option>
		                        		<option value="2">驾驶证</option>
		                        		<option value="3">社保证</option>
		                        	</select>
		                        </td>
		                        <td align="right">证件号码</td>
		                        <td align="left"><input type="text" class="input160" id="idCard" name="idCard" /></td>
		                    </tr>
		                    <tr>
		                        <td align="right">机构</td>
		                        <td align="left"><select id="orgId" name="orgId" class="select120" style="width:160px;"><option value="">请选择</option></select></td>
		                        <td align="right">状态</td>
		                        <td align="left">
		                        	<select id="status" name="status" class="select120" style="width:160px;">
		                        		<option value="0">待审核</option>
		                        		<option value="1">审核失败</option>
		                        		<option value="2">锁定</option>
		                        		<option value="3">正常</option>
		                        	</select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td align="right">用户编号</td>
		                        <td align="left"><input type="text" class="input160" id="adminCode" name="adminCode" /></td>
		                        <td align="right">审核时间</td>
		                        <td align="left"><input type="text" class="input160" id="examineTime" readonly="readonly"/></td>
		                    </tr>
		                    <tr>
		                        <td align="right">审核状态</td>
		                        <td align="left"><input type="text" class="input160" id="statusexamineshow" readonly="readonly" /></td>
		                        <td align="right">审核备注</td>
		                        <td align="left"><input type="text" class="input160" id="fremarkexamineshow" readonly="readonly"/></td>
		                    </tr>
		                    <tr>
		                        <td align="left" colspan="4" style="font-size: 14px;font-weight: bold;text-align: left;">提现账号</td>
		                    </tr>
		                    <tr>
		                        <td align="right">支付宝账号</td>
		                        <td align="left"><input type="text" class="input160" id="zfbCode" name="zfbCode" /></td>
		                        <td align="right">微信账号</td>
		                        <td align="left"><input type="text" class="input160" id="wxCard" name="wxCard" /></td>
		                    </tr>
		                    <tr>
		                        <td align="right">银行卡号</td>
		                        <td align="left"><input type="text" class="input160" id="ylCard" name="ylCard" /></td>
		                        <td align="right">所属银行</td>
		                        <td align="left"><input type="text" class="input160" id="ylCardType" name="ylCardType" /></td>
		                    </tr>
		                </table>
		                <table id="cont_2" cellspacing="0" cellpadding="0" border="0">
		                    <tr>
		                    <td class="fs11 fcRed" style="text-align: left;font-weight: bold;font-size: 14px;">角色信息</td>
		                    </tr>
		                    <tr>
		                        <td align="left" id="rolesTree" class="ztree"></td>
		                    </tr>
		                </table>
	                </div>
                   </div>
                   	<div style="margin-left:45%;width:50%;height:250px;">
	                 	<div style="font-size: 14px;font-weight: bold;">证件信息</div>
	                 	<div id="idCardDiv"></div>
	                </div>
	                <div style="margin-left:45%;width:50%;">
	                 	<div style="font-size: 14px;font-weight: bold;">二维码信息</div>
	                 	<div id="erweimaDiv"><img id="erweimaImg" style="width:200px;height:200px;"/></div>
	                </div>
                 </div>
				<input type="hidden" id="hiddenid" name="id"/>
			</form>
			</div>
        	</div>
        <%@ include file="/sysresources/common/footer.jsp"%>
    	</div>
    </div>
    <div id="examineDiv" class="affirmlayer" style="display: none; width: 300px;height: 200px;">
		<h2 style="font-family: 微软雅黑;">
			<b>审核</b>
			<a href="#" onclick="closeDiv('examineDiv');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<div>审核结果：<input type="radio" name="statusexamine" value="3"/>通过 <input type="radio" name="statusexamine" value="1"/>驳回 </div>
			<div><textarea name="fremark" id="fremarkexamine" cols="5" rows="5" style="width: 100%;"></textarea></div>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="examineAdmin();">确定</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:2px!important;" onclick="closeDiv('examineDiv');">取消</button>
	    </div>
	</div>
</body>
</html>