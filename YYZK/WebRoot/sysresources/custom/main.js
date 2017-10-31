var sysmenus;
$(function () {
	$('#sidebar').css('overflow', "hidden");
	$('#contentmark0').css('height',window.innerHeight-50);
	$('#contentmark1').css('height',window.innerHeight-97);
	$('#contentmark2').css('height',window.innerHeight-117);
	$('#contentmark3').css('height',window.innerHeight-143);
	$('#contentmark4').css('height',window.innerHeight-145);
	$('#contentmark5').css('height',window.innerHeight-173);
	$('#contentmark6').css('height',window.innerHeight-50);
	if($('.pages')==undefined || $('.pages').length==0){
		$('#contentmark').css('height',window.innerHeight-85);
	}else{
		$('#contentmark').css('height',window.innerHeight-115);
	}
	if($('.designbomdiv')!=undefined && $('.designbomdiv')!=null){
		var dbdiv = $('.designbomdiv');
		for(var i=0;i<dbdiv.length;i++){
			$('.designbomdiv').eq(i).css('height',window.innerHeight-136);
		}
	}
	//alert($('.caption').height());
	$.ajax({
		type: "post",
		url: ctx+"/menu/menu!showList.htm",
		dataType: "json",
		async: false,
		success: function (listData, textStatus) {
			if(listData == false){
				window.location.href = ctx+'/login.jsp';
			}
			sysmenus = new Backbone.Collection(listData.rows);  
			var layers1 = sysmenus.where({layers: 1});
			var lis='';
			$.each(layers1,function(index,obj1){
				var layers2 = sysmenus.where({layers: 2,pId:obj1.attributes.id});
				var lis2 = '';
				$.each(layers2,function(index,obj2){
					var layers3 = sysmenus.where({layers: 3,pId:obj2.attributes.id});
					var lis3 = '';
					$.each(layers3,function(index,obj3){
						var targetUrl = obj3.attributes.url+"?menuId="+obj3.attributes.id;//<i class="fa fa-angle-double-right"></i>
						lis3 += '<li id="li'+obj3.attributes.id+'"><a href="#" onclick="tourl(\''+ctx+'/'+obj3.attributes.url+'\','+obj3.attributes.showPosition+','+obj3.attributes.id+');"><span class="submenu-title">'+obj3.attributes.name+'</span></a></li>';
					});
					if($.trim(lis3)!=''){
						lis2 = lis2 + //<li><a href="#"><i class="fa fa-angle-right"></i>
						'    <li><a href="#"><span class="submenu-title">'+obj2.attributes.name+'</span><span class="fa arrow"></span></a>'+
						'<ul class="nav nav-third-level">'+lis3+'</ul></li>';
					}else{
						lis2 = lis2 + 
						'    <li id="li'+obj2.attributes.id+'"><a href="#" onclick="tourl(\''+ctx+'/'+obj2.attributes.url+'\','+obj2.attributes.showPosition+','+obj2.attributes.id+');"><span class="submenu-title">'+obj2.attributes.name+'</span></a></li>'; 
					}
				});
				lis = lis + '<li><a href="#"><i class="'+obj1.attributes.iconCls+'"><div class="icon-bg bg-pink"></div></i>'+//</span><span class="label label-yellow">v3.0</span>
				'<span class="menu-title">'+obj1.attributes.name+'</span><span id="spanmenu'+obj1.attributes.id+'" class="fa arrow"></a><ul class="nav nav-second-level collapse">'+
            	lis2 +
            	'  </ul>' + 
            	'</li>';
			});
			$(".user-panel").after(lis);
			if(undefined!=menuMark&&null!=menuMark&&''!=menuMark){
				$('#li'+menuMark).parent().parent().parent().parent().addClass("active");
				$('#li'+menuMark).parent().parent().addClass("active");
				$('#li'+menuMark).find('a').css("color","red");
			}
			setInterval("loadMessages()",60000);
		}
	});
	
	$("#modifyPassword").click(function(){
		  openDiv("modifypwddiv");
	});
	$("#closeModifypwddiv").click(function(){
			closeDiv('modifypwddiv');
	});
	$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
	//回车键按下时执行查询方法
	$('body').bind('keypress',function(event){
        if(event.keyCode == "13")    
        {
        	$("#searchbtn").click();
            return false;
        }
    });
});
function tooltip_placement(context, source) {
	var $source = $(source);
	var $parent = $source.closest('table')
	var off1 = $parent.offset();
	var w1 = $parent.width();
	var off2 = $source.offset();
	var w2 = $source.width();
	if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
	return 'left';
}
function tourl(url,position,liid){
	$.webAjax( {
		type : 'post',
		url : ctx+"/menu/menu!markSession.htm",
		data : 'menuMark='+liid,
		success : function(data) {			
			if(0==position || null==position){
				window.open(url, "_self");
			}else{
				window.open(url);
			}
		}
	});
}
//检查新密码是否一致，初始密码是否正确
function checkpwd(){
	if(!$('#nowpwd').val()){alert("当前密码不能为空！");return false;}
	if(!$('#newpwd').val()){alert("新密码不能为空！");return false;}
	if(!$('#newpwd2').val()){alert("重复密码不能为空！");return false;}
	if($('#newpwd').val()!=$('#newpwd2').val()){alert("两次密码输入不一致！");return false;	}
	var url = ctx+"/usercenter/showpwd.htm";
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
	var url =ctx+"/usercenter/updatepwd.htm";
	$.webAjax( {
	type : 'post',
	url : url,
	data : 'password='+$('#newpwd').val(),
	success : function(data) {			
			if(data && data == 'success') {
				alert("密码修改成功！！");
				$('#nowpwd').attr("value","");
				$('#newpwd').attr("value","");
				$('#newpwd2').attr("value","");
				
			}else {
				errorInfo(data);
			}
		}
	});
}
/**
 * 加载消息列表
 
function loadMessages(){
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/message/message!listToJson.htm";
	if($('#home-data-body').html()!=undefined){
		$.webAjax( {
			type : "post",
			url : url,
			data:pageParam +'&'+formParam,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					var page = data.page;
					$.refreshPageToolbar(page,"messagepage",simpleTable);
					if(data.resultInfo[0]=='0'){
						var unhandles = 0;
						var html = "";
						$.each(page.result,function(i,o){
							html += '<tr>';
							html += '<td>'+(i+1)+'</td>';
							html += '<td>'+replaceNull(o.name)+'</td>';
							html += '<td>'+replaceNull(o.content)+'</td>';
							var createdate="";
							if(o.createdate!=null){
								createdate = formatDate('yyyy-MM-dd HH:mm:ss',o.createdate);
							}
							html += '<td>'+createdate+'</td>';
							var  status = "";
							if(o.status==1){
								status="未处理";
								unhandles += 1;
							}else if(o.status==2){
								status="已完成";
							}else{
								status = "";
							}
							html += '<td>'+status+'</td>';
							html += '<td><a href="#" onclick="toDetail(\''+o.url+'\')">查看</a></td>';
							html +='</tr>';
						});
						$('#home-data-body').html(html);
						if(unhandles>0&&$('#spaninfos').html()!=undefined){
							$('#spaninfos').html(unhandles);
						}
					}
				}
			}
		});
	}else{
		$.webAjax({
			type : "post",
			url : url,
			data:"messageQuery.status=1",
			success : function(data) {
				data = $.parseJSON(data);
				var count = data.page.totalCount;
				if(count>0){
					if($('#spaninfos').html()==undefined){
						$('#spanmenu1').after('<span id="spaninfos" class="badge badge-yellow">'+count+'</span>');
					}else{
						$('#spaninfos').html(count);
					}
				}
			}
		});
	}
}*/
function newAlert(bodycontent){
	$('#alertbody').html(bodycontent);
	openDiv('newAlert');
}
function newConfirm(bodycontent){
	$('#confirmbody').html(bodycontent);
	openblockdiv();
	$.openDiv('newConfirm');
	$('#newConfirm').css("zIndex","100000");
}
function isconfirmDiv(bo){
	closeblockdiv();
	$.closeDiv('newConfirm');
	alert(bo=='1');
	if(bo=='1'){
		return true;
	}else{
		return false;
	}
}
function logout(){
	var flag = window.confirm("确定注销吗？");
	if (flag) {
		window.location.href = ctx+"/j_spring_security_logout";
	}
}
function displayError(){
	document.getElementById("nowpwd_error").style.display="none";
}
/**
 * 选择检索的属性
 */
function selectoption(){
	var name = $('#selection').val();
	$('#optselect').attr("name",name);
}
function getRootPath_web() {
    var webroot=document.location.href;
    webroot=webroot.substring(webroot.indexOf('//')+2,webroot.length);
    webroot=webroot.substring(webroot.indexOf('/')+1,webroot.length);
    webroot=webroot.substring(0,webroot.indexOf('/'));
    var rootpath="/"+webroot;
    return rootpath;
}
function getWebRootPath() {
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht);
}
/**
 * 选择检索的属性
 */
function selectoption(){
	var name = $('#selection').val();
	$('#optselect').attr("name",name);
}
/**
 * 将null转换为空字符串
 * @param obj 要转换的对象
 * @returns 空字符串
 */
function replaceNull(obj){
	if(obj==null){
		obj = "";
	}
	return obj;
}
/**
 * 格式化时间(yyyy-MM-dd)
 * @param date 要格式化的日期
 * @returns 格式化后的结果
 */
function formatDate(formt,date){
	if(null!=date&&date!=""){
		if(formt=="yyyy-MM-dd"){
			return date.split(" ")[0];
		}else if(formt=="yyyy-MM-dd HH:mm:ss"){
			return date.substring(0,date.length-2);
		}
	}else{
		return "";
	}
}
function closeDiv(id){
	$.closeDiv(id);
	xval.remove();
}
function openDiv(id){
	openDiv(id,'');
}
function openDiv(id,text){
	block_viewport(text);
	$.openDiv(id);
	$('#'+id).css("zIndex","10000");
}
function openblockdiv(){
	$('#preloader').css("display","");
	$('.spinner.demo').show();
	$('.spinner.demo').css("zIndex","99999");
}
function closeblockdiv(){
	$('.spinner.demo').fadeOut('slow');
	$('#preloader').css("display","none");
}
/**
 * 创建遮罩层
 */
var xval, tval, bval, rval, lval;
function block_viewport(text) {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.5, text:text, style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}