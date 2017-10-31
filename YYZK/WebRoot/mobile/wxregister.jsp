<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>云趣家</title>
<link rel="stylesheet" type="text/css" href="webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="webuploader/style.css" />
<!-- CSS -->
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
<script type="text/javascript" src="webuploader/webuploader.js"></script>
<script type="text/javascript" src="webuploader/upload.js?domain=${ctx}"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
$(window).load(function() {
	loadwxuser();
});
var loadType = 0;
function loadwxuser(){
	$.ajax({
		type: "post",
		url: "${ctx}/admin/admin!loadAdminByWxCode.htm",
		data:"adminQuery.wxCode=${param.openid}",
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if(null!=data.model.adminId&&undefined!=data.model.adminId){
					loadType = 1;
					$('#firstpassword').css("display","none");
					$('#confirmpassword').css("display","none");
				}else{
					loadType = 0;
					$('#firstpassword').css("display","");
					$('#confirmpassword').css("display","");
				}
				$('#hiddenAdminId').val(data.model.adminId);
				$('#adminName').val(data.model.adminName);
				$('#loginName').val(data.model.loginName);
				$('#telNumber').val(data.model.telNumber);
				$('#idCard').val(data.model.idCard);
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function tologin(){
	window.location.href = "${ctx}/mobile/wxlogin.jsp?openid=${param.openid}";
}
function openlayer1(){
		$(".shaixuan_box").show();
		$(".shaixuan_box").animate({right:'100%'});
		$(".shaixuan_box").css("overflow","scroll");
}
function openlayer2(){
	$(".shaixuan_box").hide();	
	$("html").css("overflow","auto");
}
function openlayer(content){
	layer.open({
		type: 1,
		title: false,
		closeBtn: true,
		shadeClose: false,
		offset: '25%',
		content: "<div class='no_login_show'><h1>错误提示！</h1><a href='javascript:void(0);' style='font-size:16px;'>"+content+"!"
		+"</a></div>"
	});
}
function saveAdmin(){
	if(!isCardNo($('#idCard').val())){
		alert("身份证不合法");
		$('#idCard').focus();
		return;
	}else if(!isTel($('#telNumber').val())){
		alert("手机号不合法");
		$('#telNumber').focus();
		return;
	}else if($("#loginName").val().length > 20){
		alert("用户名称不能超过20个字符");
		$('#loginName').focus();
		return;
	}else if($("#loginName").val().length <2){
		alert("用户名称不能少于2个字符");
		$('#loginName').focus();
		return;
	}else if($("#adminName").val().length > 6){
		alert("姓名不能超过6个字符");
		$('#adminName').focus();
		return;
	}else if($("#adminName").val().length <2){
		alert("姓名不能少于2个字符");
		$('#adminName').focus();
		return;
	}else if(loadType==0&&$("#firstpassword").val().length <6){
		alert("密码不能少于6位");
		$('#firstpassword').focus();
		return;
	}else if(loadType==0&&$("#firstpassword").val().length >16){
		alert("密码不能大于16位");
		$('#firstpassword').focus();
		return;
	}else if(loadType==0&&$("#firstpassword").val()!=$("#confirmpassword").val()){
		alert("两次输入的密码不同");
		$('#firstpassword').focus();
		return;
	}else{
	
	}
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
	if(allFile.length<2){
		alert("上传文件数量不小于2");
		return;
	}
	var flag = window.confirm("确定提交吗？");
	if (!flag) {
		return;
	}
	filesJson = JSON.stringify(allFile).replace(/%/g, "%25").replace(/\&/g, "%26").replace(/\+/g, "%2B");
	var formParam = $('#frm_register').serialize();
	var tourl = "${ctx}/admin/admin!saveAdmin.htm";
	if(loadType==1){
		tourl = "${ctx}/admin/admin!updateAdminByWxcode.htm";
	}
	$.ajax({
		type: "post",
		url: tourl,
		data:formParam+"&filesJson="+filesJson,
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.href = "${ctx}/mobile/waitexamine.jsp?openid=${param.openid}";
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
function isCardNo(card){  
   // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
   var reg2 = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
   var reg = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/;
   if(reg.test(card))  {  
       return  true;  
   } else{
   		return false;
   } 
}  
function isEmail(email){
	var reg = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,3}$/;
    if(reg.test(email)){  
        return true;
    }else{  
        return false;
    }  
}
function isTel(telNumber){
    var reg = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;  
    if(reg.test(telNumber)){  
        return true;
    }else{  
        return false;
    }  
}
</script>
</head>
<body>
<div class="mobile">
  <!--页面加载 结束--> 
  <div class="w main">
  	<form id="frm_register" method="post" action="">
        <div class="page-container">
            <h1 style="color: green;">加入云趣家</h1>
            <input type="hidden" id="hiddenAdminId" name="adminId"/>
            <input type="hidden" value="${param.openid }" name="wxCode"/>
            <input type="hidden" value="1" name="idType"/>
            <input type="hidden" value="0" name="status"/>
            <input type="hidden" value="2" name="type"/>
			<input type="text" id="loginName" name="loginName" class="username" placeholder="用户名称">
			<input type="text" id="adminName" name="adminName" class="username" placeholder="真实姓名">
			<input type="text" id="telNumber" name="telNumber" class="username" placeholder="手机号">
            <input type="text" id="idCard" name="idCard" class="username" placeholder="身份证号">
			<input type="password" id="firstpassword" name="password" class="password" placeholder="请输入密码">
			<input type="password" id="confirmpassword" class="password" placeholder="请再次输入密码">
        </div>
      </form>
      <div id="uploader" class="uploader" style="min-height:240px;margin-top: 20px;">
            <table class="my-table-form" style="width:100%;">
	        	<tr>
	      			<td colspan="6">
	      				<div class="uploader">
	      					<ul id="isupload" class="filelist"></ul>
	      				</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="6" style="background-color: rgba(255, 255, 255, 0.03);">
	        			 <div id="uploader" class="uploader">
			                <div class="queueList">
			                    <div id="dndArea" class="placeholder">
			                        <div id="filePicker"></div>
			                        <p>上传身份证正反面照片</p>
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
        <div class="item item-captcha" style="margin-top:5px;">
          <div class="err-tips">注册即视为同意 <a href="javascript:void(0);" onclick="openlayer1();">云趣家成员营业守则</a> </div>
        </div>
        <div class="ui-btn-wrap"><button type="button" onclick="saveAdmin();">提交</button> </div>
        <div class="ui-btn-wrap"><button type="button" onclick="tologin();">已有账号,去登录</button> </div>
  </div>
  </div>
</div>
 <div class="shaixuan_box">
	<div class="shaixuan_mall">
    	<h1>家族成员基本守则</h1>
        <div class="shaixun_item">
<!-- <div style="width:100%;text-align: center;font-size: 16px;font-weight: bold;padding:5px 0px;">家族成员基本守则</div> -->
<div style="text-align: left;">
第一章 名词定义<br/>
1.1 公司：如未特殊说明，本守则中的公司是指依云智酷（北京）科技有限公司。<br/>
1.2 公司产品：由公司提供的所有产品和辅销资料。<br/>
1.3 家族成员：云趣新芽家族成员，与公司签订经销协议，经销公司产品、按照公司的需求为公司提供营销推广服务的个人。<br/>
1.4客户：使用公司产品与服务的商户或个人。<br/>
1.5 辅销资料/器具：与公司有关的印刷品（宣传手册、海报等）、影音资料（音频、视频等）以及辅销器具等。<br/>
1.6 《经销协议》：家族成员注册账号时与公司经协商一致达成的设立、变更、终止民事权利义务关系的合同。<br/>
1.7 基本守则：家族成员开展业务活动时应遵循的原则；家族成员的权利、义务及责任。<br/>

第二章 引言<br/>
2.1 基本守则规定了：<br/>
2.1.1 云趣新芽家族成员开展业务活动时应遵循的原则；<br/>
2.1.2 云趣新芽家族成员的权利、义务及责任<br/>
2.2 本守则主要适用于依云智酷（北京）科技有限公司与家族成员之间的关系，同时亦适用于家族成员与普通客户、其他家族成员之间的关系。其目的在于：<br/>
2.2.1通过家族成员符合商德的、负责任的行为，确保家族成员享有公平公正的机会；<br/>
2.2.2保护和营造能给家族成员带来长期效益的有利环境；<br/>
2.3 公司可按市场情况及需要和国家政策的要求修订有关家族成员的各项纪律及公司业务政策，有关修订将通过官方微信公众号、官网等途径公布或其他方式通知家族成员，家族成员不同意调整的，应当书面向公司公司提出异议，并与公司公司协商，协商不成的，任何一方均有权终止合作。<br/>
2.4 本守则作为《经销协议》的有效组成部分，依云智酷（北京）科技有限公司对本守则在法律范围内不时进行修改。<br/>
第三章  成为家族成员<br/>
3.1 公司保留接受或拒绝任何人士申请成为家族成员的权利，家族成员独立经营，独立承担责任和风险。<br/>
3.2 家族成员申请者须：<br/>
3.2.1  不得为：无民事行为能力或者限制民事行为能力人员、有刑事犯罪记录人员，及中国政府禁止的任何邪教或非法组织之成员；<br/>
3.2.2  满18—60周岁，具有初中及以上中文学历；<br/>
3.2.3  对公司产品和品牌有一定认识，理解并愿意遵守公司相关政策规定；<br/>
3.2.4  持有符合公司公司要求的，真实、合法、有效的所需证照，有意向并有能力经销推广产品；<br/>
3.2.5  按照《家族成员基本守则》中的有关规定办妥申请手续，并通过公司审核且须亲自签署《经销协议》。<br/>
3.2.6  符合公司对家族成员的其他要求。<br/>
3.3 申请人所提交的资料必须真实、有效；不得借用、冒用他人名义或使用其他不正当方法成为家族成员；如申请人提供不真实或不符合公司要求的资料或用不正当方法而成为家族成员，公司保留一经发现即对其做出处理(包括立即终止《经销协议》)的权利。<br/>
3.4 家族成员资格的生效时间和有效期限以《经销协议》上的约定为准，公司有权决定是否与家族成员续约。<br/>
3.5 公司家族成员账号管理<br/>
3.5.1未经公司批准，任何人员不得在公司电脑数据库中登记多于一个的家族成员账号，如有违反，则后申请的公司家族成员账号将被注销。<br/>
3.5.2公司家族成员账号使用人及相关人员需遵守公司颁布及更新的其他各类有关公司家族成员账号的业务政策规定。<br/>
3.5.3任何以提供虚假资料/不实身份等不正当方式或违反上述规定取得之公司家族成员账号，一经发现将被注销。<br/>
第四章  职责和义务<br/>
4.1 恪守法律法规，尊重社会公德，遵循自愿、公平、诚实、信用的原则开展业务活动；不得以任何不正当竞争的方式侵犯公司或家族成员的合法权益。<br/>
4.2 遵守公司颁布的关于家族成员的各项公司业务政策及公司在合同期内所作之修正、变更、补充的规定。<br/>
4.3 家族成员和公司之间的关系以法律规定、《经销协议》、公司业务政策等文件的描述为准。家族成员不得对其与公司之间的关系进行曲解。<br/>
4.3.1  不得以任何方式宣称自己或其他的家族成员为公司或其相关机构的雇员；或使人误解家族成员与公司存在雇佣关系；<br/>
4.3.2  不得以任何方式宣称自己为公司的代表。<br/>
4.4 共同维护良好的营运秩序<br/>
4.4.1  不得以任何方式诽谤、诋毁公司、公司员工及家族成员的声誉；<br/>
4.4.2  不得威胁、恐吓或侵害公司、公司员工及家族成员的人身及财产安全；<br/>
4.4.3  不得以任何形式扰乱公司办公室、服务网点或其他与公司相关的活动场所的公共秩序，不得干扰公司、公司员工及家族成员之正常业务活动的开展；<br/>
4.4.4  不得以任何性质的诱导方式，恶意挖取已注册家族成员，恶意切换其他家族成员拓展的商户；<br/>
4.4.5  不得利用他人从事上述行为。<br/>
4.5 认真履行合同规定的责任与义务，按公司的规范要求切实完成合同约定的各项工作，其工作内容包括但不限于：开展产品、品牌推广活动；为顾客提供信息咨询、了解产品价格、提供售后服务咨询等服务。<br/>
4.6 严格按照国家的税务政策和公司的相关安排履行税务责任。<br/>
4.7 不得利用他人开展违规活动以规避本基本守则、公司业务政策的约束。<br/>
4.8 家族成员地址，电话或经营者/法定代表人姓名等相关信息变更的，应及时在公司公司更新，否则自行承担信息不准确而导致的后果。<br/>
4.9 不可重新包装公司产品或调换产品内容；不可破坏、更改、涂销公司产品包装或各种标志。<br/>
4.10 以殷勤礼貌的服务态度，迅速处理客户对产品、服务的申请或投诉。对于客户反映在使用产品过程中的问题，家族成员无法解决的应及时将有关情况转达公司，协助公司妥善处理。<br/>
4.11 不得利用家族成员的经营场所以及与公司业务相关之场合、资源或关系进行融资、集资、募捐等活动。<br/>
4.12 不得利用公司资源销售或推广非公司提供的产品、活动或服务，也不可从事与公司存在竞争关系、利益冲突或有悖于商德法规的其他产品或服务的营销活动。<br/>
4.13  未经公司批准，不得就与公司产品或业务有关的话题擅自接受新闻、网站等媒介、出版单位或个人作者的采访。<br/>
4.14 不得散布/透露任何未经公司核准的、与公司业务营运相关的各类政策信息，不得对公司发布的各类信息作失实的传播或宣导。<br/>
4.15 倘若家族成员拖欠公司债务，包括但不限于订购公司产品的货款，公司有权从该家族成员的应收款中扣除所欠的款项，直至该欠款完全清还。<br/>
4.16 家族成员有责任配合公司对于基本守则案件的调查工作，不得提供虚假不实之资料、陈述，误导公司的调查工作。<br/>
4.17 在履行经销协议的过程中，家族成员如有严重违反协议规定或违背基本守则及其他规章的行为，公司保留即时终止相关协议的权利。<br/>
4.18 家族成员及合作伙伴的雇员之活动如有违反公司的基本守则或其他各项纪律及公司业务政策，该家族成员须承担责任，并接受公司之相应处分。对任何以合法形式规避《基本守则》等管理规定的行为，包括利用他人开展违规活动的，一旦查实，公司有权做相应处罚。<br/>
4.19 家族成员如违反守则，其有义务采取补救措施。<br/>
第五章 经销产品和市场推广<br/>
5.1 严格按照公司提供的产品资料介绍和推广产品。不得：<br/>
5.1.1  对产品的用途、性能、价格、规格等做夸大、失实的宣传；<br/>
5.1.2  宣称公司产品实际并不拥有的专利、证书、荣誉、赞助、功能或好处；<br/>
5.1.3  欺骗、误导客户。<br/>
5.2 经销产品时，不可：<br/>
5.2.1 要求顾客购买非公司的产品，包装或资料；<br/>
5.2.2 不尊重客户的自由选择，强行销售产品；<br/>
5.2.3 误导、诱导他人购买其所不需要的产品或诱导他人借贷经营公司生意；<br/>
5.2.4未经同意，进入他人住所或办公场所强行销售产品，滋扰他人生活工作；<br/>
5.2.5抢夺他人客源，进行不正当竞争。<br/>
5.3 认真学习、掌握公司的有关资料，推广业务时，家族成员不得：<br/>
5.3.1 以任何名义向他人收取费用作为其免费申请家族成员账号的条件<br/>
5.3.2 夸大财富收入/公司实力；<br/>
5.3.3 宣扬无需经销产品，仅通过举荐家族成员就可以获得公司事业的成功；<br/>
5.3.4 鼓吹公司业务为快速致富的机会，或宣称只需花少许甚至无需花费任何努力和时间，即可在公司事业上取得成功；<br/>
5.3.5在开展业务过程中涉及政治、宗教、迷信、传销及其他不正当或不道德的言行；<br/>
5.3.6贬抑、诋毁、攻击其他职业、行业、公司、品牌、商品及其从业者的声誉；<br/>
5.3.7有其他不当行为。<br/>
5.4 不得宣称有专营区域，即宣称某地区/区域仅某家族成员可经销/推销公司产品或提供相关服务。<br/>
第六章  公司名称、商标及著作权<br/>
6.1 未经公司公司书面许可，任何人不得进行以下行为：<br/>
6.1.1将与公司公司及其关联公司/机构的商标、商号、企业名称、企业标志、活动名称相同或近似的文字、图案作为其他任何机构、组织、活动的标识、商标、商号、企业名称的全部或部分进行使用；<br/>
6.1.2 擅自申请、注册或持有含有与公司公司及其关联公司/机构的商标、商号、企业名称、企业标志、活动名称相同或近似的文字、拼音、图案等的商标、域名、网站名称、网店名称、通用网址、无线网址、电脑应用软件、手机应用软件、网络用户名等；<br/>
6.1.3 生产、获取、使用、销售任何非公司提供的带有与公司及其关联公司商标、商号、企业名称、企业标志、活动名称、产品包装相同或近似的标志、包装装潢的产品；<br/>
6.1.4 以任何方式使用以公司及其关联公司/机构名义制作、出版的文字、美术、摄影图片、动画、音乐、录像等资料，使用方式包括但不限于复制、转载、发布、传播、在网络上设置链接等。<br/>
第七章 监督与处分<br/>
7.1 公司有权对家族成员的活动进行调查，家族成员应当配合。<br/>
7.2 家族成员或其雇员违反本守则，或其行为所导致的后果对公司产品声誉、市场和谐及企业形象造成损害的，公司将根据情节轻重、按照公司基本守则《七类处罚制度》决定对相关责任人的处分方式，其措施包括但不限于口头或书面告诫；暂停履行合同；罚款；缓发或扣发其部分、全部收益和奖励；追扣其已经获得的不当的收益；暂缓或取消其相关荣誉奖项及表扬；不与其续签或立即终止其《经销协议》等。<br/>
7.3 家族成员权益受到侵害时，须以书面形式向公司提出投诉及维权要求。自侵权行为发生之日起计十二个月之内未向公司提出的，公司保留不予受理的权利。<br/>
7.4 若家族成员涉嫌严重违反本守则，公司有权在调查期间采取先期冻结其业务权的措施，并将视最终的调查结果对其做出处理。<br/>
7.5家族成员在接到公司的处分通知后，如有意申请复查，须自处分函签具之日期起计的30天内，以书面形式向公司申请复查，逾期公司保留不予受理的权利。<br/>
7.6.1申请复查人须以书面形式提出申请，并应公司之要求提供相关证据材料；<br/>
7.6.2 复查结果包括维持、修正原有之处分决定，或重新展开调查；<br/>
7.6.3 复查期间，原处分决定依然有效。<br/>
7.7在开展业务的过程中，如家族成员因违反相关国家法律、法规及公司制定的各项守则、公司业务政策而危害公司利益的，公司依法保留追究和索赔的权利。<br/>
7.8 家族成员因自身或第三方原因，或任何其他不可归责于公司的原因，导致人身伤害或财产损失的，家族成员应自行承担责任或要求相关责任方赔偿，公司不承担任何责任。因家族成员无理要求影响公司经营或导致公司损失的，公司有权终止与家族成员的合同并保留追究其法律责任的权利。<br/>
7.9 家族成员或其雇员存在违规行为的，公司当时未能追究的责任或未能追究其全部责任的，公司保留再予追究的权利。<br/>

家族成员基本守则之七类处罚制度<br/>
为维护公平、有序的市场秩序，促进家族成员之间的和谐共荣，使家族成员的正当权益和发展空间得到充分保障，公司制订了相关的基本守则来规范家族成员的展业行为，并对违规人员按违规情节的轻重及影响的大小订立了七类处罚制度。具体内容如下：
第一类  口头或书面警告<br/>
第二类  处以收取不低于500 元违约金<br/>
第三类  处以收取不低于1000元违约金<br/>
第四类  处以收取不低于2000元违约金<br/>
第五类  暂停家族成员账号，恢复账号权限时间视情况而定，并处收取不低于3000元违约金<br/>
第六类  暂停家族成员账号，恢复账号权限时间视情况而定，并处收取不低于5000元违约金第七类  关闭家族成员账号，终止经销商合同，不再享有任何收益并赔偿公司损失、偿清所有债务<br/>
第七类  关闭家族成员账号，终止经销商合同，不再享有任何收益并赔偿公司损失、偿清所有债务<br/>
相关说明：<br/>
●  如违规家族成员未按公司要求及时缴纳罚款，公司将从其月度收入中扣除，扣满为止。<br/>
●  本制度条款的最终解释权归依云智酷（北京）科技有限公司所有，制度中未涵盖的其他违规类型视情节而定，处罚类别以公司最终研究结果为准。<br/>
此外，本着基本守则执行工作公正透明的原则，公司藉此向市场公示“违规类型与处罚类别”的对照表——<br/>
序号	违规类型	处罚类别<br/>
1	违反国家法律法规	七类<br/>
2	向被推荐人收取费用作为注册家族成员条件或者其他违反“免费开通账号”原则的行为	七类<br/>
3	私自结网，自行为他人许诺、计算并发放报酬	七类<br/>
4	拓展风险商户并出现严重风险事故	七类<br/>
5	本人家族成员账号注销未满6个月擅自以不实资料/非本人身份注册取得家族成员账号	七类<br/>
6	将家族成员上商户、家族成员资料信息提供给第三方谋取利益	七类<br/>
7	利用公司的资源或业务关系进行融资、集资、募捐等行为	七类<br/>
8	违反公司规定限价销售产品或以不正当价格竞争方式销售产品/服务	六类<br/>
9	以不实资料/非本人身份注册取得家族成员账号，一人操作多账号	六类<br/>
10	以欺诈、胁迫等不正当手段拓展商户、引荐家族成员	六类<br/>
11	利用公司业务关系从事非公司业务或非公司产品，特别是竞品业务或有悖商德法规之产品或服务的推广	六类<br/>
12	实施不当竞争、恶意挖取已注册家族成员，恶意抢夺/切换商户资源（含已入网商户），或冒用公司人员名义进行相关展业	六类<br/>
13	虚假宣传，违规宣传，夸大产品，向商户、家族成员进行不实许诺	五类<br/>
14	调配操纵业绩，牟取不当利益；诱导、伙同他人向公司套利	五类<br/>
15	干扰公司、员工或其他家族成员的正常经营活动	五类<br/>
16	在开展业务过程中涉及政治、宗教、迷信及其它不当/不道德的言行	五类<br/>
17	以故意曲解公司公司制度政策等不正当方式进行业务推广	五类<br/>
18	故意遮挡公司支付硬件上刻印的品牌名称、LOGO、售后电话等	四类<br/>
19	提供不实资料或证词，误导公司对守则案件的调查工作，或未按公司要求完成协助性调查工作	四类<br/>
20	散布未经公司认可的信息或对公司公布的信息作失实宣导	四类<br/>
21	对顾客的产品投诉和其他售后服务需求不予理睬或处理不当	三类<br/>
22	擅自使用公司名称、商标及其他知识产权	三类<br/>
23	攻击、轻视、诋毁其他职业、行业、公司、品牌及其从业人员的声誉	二类<br/>
</div>
	<div style="width:100%;text-align: right;font-size: 12px;font-weight: bold;padding-top:5px;">依云智酷（北京）科技有限公司</div>
	<div style="width:100%;text-align: right;font-size: 12px;font-weight: bold;padding-top:5px;">二零一七年四月一日</div>
        <p>
        <div class="ui-btn-wrap"><button type="button" onclick="openlayer2();">确定</button> </div>
        </p>
    </div>
  </div>
</body>
</html>