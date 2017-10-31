<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>云趣家销售协议</title>
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
var year;
var month;
var day;
$(window).load(function() {
	loadwxuser();
});
function loadwxuser(){
	$.ajax({
		type: "post",
		url: "${ctx}/admin/admin!loadAdminByWxCode.htm",
		data:"adminQuery.wxCode=${param.openid}",
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				if('${param.nowTime}'!=''&&'${param.nowTime}'!='null'&&'${param.nowTime}'!='undefined'){
					var sjdat=new Date(${param.nowTime});
					year=sjdat.getFullYear();
					month=sjdat.getMonth()+1;
					day=sjdat.getDate();
				} else{
					if(null!=data.model.saleagreeTime){
						year=data.model.saleagreeTime.substring(0,4);
						month=data.model.saleagreeTime.substring(5,7);
						day=data.model.saleagreeTime.substring(8,10);
					}else{
						year="";
						month="";
						day="";
					}
					
				}
				$('#yifang1').text(data.model.adminName);
				$('#yifang2').text(data.model.adminName);
				$('#year1').text(year);
				$('#year2').text(year);
				$('#month1').text(month);
				$('#month2').text(month);
				$('#day1').text(day);
				$('#day2').text(day);
				if(data.model.issaleagree==1){
					$('#diva1').css("display","none");
					$('#diva2').css("display","none");
				}
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
	function agreesale(){
		if(!$('#issaleagree').is(':checked')){
			alert("必须同意云趣家销售协议才可以登录");
			return;
		}
		$.ajax({
			type: "post",
			url: "${ctx}/admin/admin!updateAgreeByWxcode.htm",
			data:"adminQuery.wxCode=${param.openid}&adminQuery.issaleagree=1",
			success: function (data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					window.location.href = "${ctx}/mobile/wxindex.jsp?openid=${param.openid}";
				}else{
					alert("系统错误,请微信联系云趣家管理员:"+data.resultInfo[1]);
				}
			}
		});
	}
	function changesaleagree(){
		if($('#issaleagree').is(':checked')){
			$('#agreesaleBtn').removeAttr("disabled","disabled");
		}else{
			$('#agreesaleBtn').addAttr("disabled","disabled");
		}
	}
</script>
</head>
<body style="text-align: left;margin:0 auto; background: white;">
<div class="mobile" style="max-width:400px;min-width:300px;text-align: left;margin:0px auto;padding:10px 0px;background: #FFFFFF;color: #000000;">
<div style="width:100%;text-align: center;font-size: 16px;font-weight: bold;padding:0px 0px 5px 0px;">中华小书童智趣乐教机器人直销协议</div>
<div style="font-size: 12px;padding:2px;">
<div>甲方：<a href="javascript:void(0);" style="text-decoration:underline;color:#000000;">依云智酷（北京）科技有限公司</a></div>
<div style="padding-top:10px;">乙方：<a href="javascript:void(0);" style="text-decoration:underline;color:#000000;font-size: 16px;" id="yifang1"></a></div>
<div style="padding:10px 0px 0px 30px;">
	本协议书基于其所包含的条款和条件，于签订日起一年内有效，并按照本协议有关条款和条件的规定终止。
</div>
<div style="font-weight: bold;padding-top:10px;">第一条．	名词定义：</div>
<div style="padding:10px 0px 0px 10px;">1.1 云趣家：依云智酷（北京）科技有限公司旗下直销平台。</div>
<div style="padding:10px 0px 0px 10px;">1.2 云趣家成员：享有云趣新芽产品的销售和分红权利的人员。</div>
<div style="padding:10px 0px 0px 10px;">1.3 一级推荐:本人直接推荐。</div>
<div style="padding:10px 0px 0px 30px;">二级推荐:本人直接推荐人员的再次推荐。</div>
<div style="padding:10px 0px 0px 10px;">1.4 成员推荐奖励：云趣家成员推荐新客户给予的金钱奖励。</div>
<div style="padding:10px 0px 0px 30px;">家族贡献奖励：云趣家成员销售每台产品给予的积分奖励。</div>
<!-- <div style="padding:10px 0px 0px 10px;">1.5 积分说明：1积分兑换100元，满100分可提现。 </div> -->
<div style="padding:10px 0px 0px 10px;">1.5 有效订单：指订单状态为交易成功并且售后状态为30天内未发起售后，或者发起部分售后并且售后完成、售后关闭或者售后撤销的订单，排除尚在交易中的订单、发生退货退款的订单以及因各类原因导致交易失败的订单。</div>
<!-- <div style="padding:10px 0px 0px 10px;">1.7 客户满意度：客户收到货一个月后，厂家电话回访，客户对云趣家成员销售服务的评价。</div>
<div style="padding:10px 0px 0px 10px;">评分标准：</div>
<div style="padding:10px 0px 0px 10px;">1.71 购买过程中交谈是否愉快1分</div>
<div style="padding:10px 0px 0px 10px;">1.72 所描述产品是否和收到的实物一致1分</div>
<div style="padding:10px 0px 0px 10px;">1.73 是否了解如何使用产品1分</div>
<div style="padding:10px 0px 0px 10px;">1.74 对产品是否有过体验1分</div>
<div style="padding:10px 0px 0px 10px;">1.75 对产品或销售人员有无建议1分</div> -->
<div style="font-weight: bold;padding-top:10px;">第二条．加盟条件</div>
<div style="padding:10px 0px 0px 10px;">2.1 产品用户（自己本身是产品用户，可直接成为云趣家成员）</div>
<div style="padding:10px 0px 0px 10px;">2.2 家族成员推荐（经云趣家成员推荐也可以变成云趣家成员）</div>
<div style="padding:10px 0px 0px 10px;">2.3.官方审核（在微信公众号点击云趣家申请注册，经官方审核通过即可）</div>
<!-- <div style="padding:10px 0px 0px 10px;">2.4 成为云趣家成员无需代理费，无需进货压货，无中间商赚取差价，厂家一件代发！</div> -->
<div style="font-weight: bold;padding-top:10px;">第三条．利润分享</div>
<div style="padding:10px 0px 0px 10px;">3.1 固定利润：每台400元</div>
<!-- <div style="padding:10px 0px 0px 10px;">3.2 客户满意度奖励：每台100元</div> -->
<div style="padding:10px 0px 0px 10px;">3.2 成员推荐奖励：一级推荐奖励每台50元，二级推荐奖励每台25元</div>
<div style="padding:10px 0px 0px 10px;">3.3 家族贡献奖励：贡献分满10分可提现1000</div>
<div style="padding:10px 0px 0px 25px;">（1）直接销售一台积1分</div>
<div style="padding:10px 0px 0px 25px;">（2）一级推荐分0.5分</div>
<div style="padding:10px 0px 0px 25px;">（3）二级推荐分0.25分</div>
<!-- <div style="padding:10px 0px 0px 25px;">（4）每月积分有特殊用途（销售满月后揭晓）</div> -->
<div style="padding:10px 0px 0px 10px;">3.4 股份奖励：销售数量和客户满意度符合公司营销政策规定，成为公司股东（具体根据代理销售情况而定）</div>
<div style="font-weight: bold;padding-top:10px;">第四条．提现时限</div>
<div style="padding:10px 0px 0px 10px;">4.1 固定利润：生成有效订单</div>
<!-- <div style="padding:10px 0px 0px 10px;">4.2 客户满意度奖励：生成有效订单，客户满意度不低于5分</div> -->
<div style="padding:10px 0px 0px 10px;">4.2 成员推荐奖励：生成有效订单</div>
<div style="padding:10px 0px 0px 10px;">4.3 家族贡献奖励：满10分即可提现，未达到10分，积分终身保留不清零</div>
<div style="padding:10px 0px 0px 10px;">4.4 股份奖励：财务年终（根据公司总销售额，和最优秀代理来定）</div>
<div style="font-weight: bold;padding-top:10px;">第五条．提现方式</div>
<div style="padding:10px 0px 0px 10px;">5.1 云趣家系统自助提现，可提现至支付宝、微信和银行卡，1-2个工作日到账。</div>
<div style="font-weight: bold;padding-top:10px;">第六条．优惠政策</div>
<div style="padding:10px 0px 0px 10px;">6.1 服务：一对一指导（统一培训资料，视频，电话等）</div>
<div style="padding:10px 0px 0px 10px;">6.2 优惠支持：标准版的价格，睿智版的配置（详见淘宝企业店规格分类）</div>
<div style="padding:10px 0px 0px 10px;">6.3 无需代理费，无需进货压货，无中间商赚取差价，厂家一件代发</div>
<!-- <div style="padding:10px 0px 0px 10px;">6.4 支持：礼品、代金券等厂家活动</div> -->
<div style="font-weight: bold;padding-top:10px;">第七条．利润提现</div>
<div style="padding:10px 0px 0px 10px;">7.1 提现时限</div>
<div style="padding:10px 0px 0px 20px;">7.2 固定利润：有效订单</div>
<div style="padding:10px 0px 0px 20px;">7.3 成员推荐奖励：有效订单</div>
<div style="padding:10px 0px 0px 20px;">7.4 家族贡献奖励：满10分可提现，超出的部分不清零，继续累积；未达到10分，积分终身保留不清零直至满10分后提现。</div>
<div style="font-weight: bold;padding-top:10px;">第八条．销售价格</div>
<div style="padding:10px 0px 0px 10px;">8.1中华小书童，型号S1全国统一销售价格2680，任何成员不可以低于此价格销售。（厂家不干涉云趣家成员给客户赠送礼品以及其他形式的优惠）</div>
<div style="font-weight: bold;padding-top:10px;">第九条．适用法律与争议解决</div>
<div style="padding:10px 0px 0px 10px;">9.1 本协议中未规定内容双方本着友好、共赢的原则商讨决定。</div>
<div style="padding:10px 0px 0px 10px;">9.2 凡因本协议引起的或与本协议有关的任何争议与纠纷，双方协商解决；协商不成时，应提交中国国际经济贸易仲裁委员会，按照申请仲裁时该会现行有效的仲裁规则进行仲裁。仲裁裁决是终局的，对双方均有约束力。</div>
<div style="padding:10px 0px 0px 10px;">9.3 本协议一经签订，立即生效，云趣家的每一位成员须共同遵守。</div>
<div style="font-weight: bold;padding-top:10px;">第十条．其他</div>
<div style="padding:10px 0px 0px 10px;">10.1 双方在此声明：双方不会因根据本协议产生的合作，构成任何形式的劳动或雇佣关系。 乙方不隶属于甲方，不受甲方内部规章制度的约束。甲方除向乙方支付本协议约定的服务外，云趣家微商招募。不承担乙方的任何其他费用，包括但不限于因推广活动所产生的成本、社会保险、福利和医疗保险费用等。</div>
<div style="padding:10px 0px 0px 10px;">10.2 本协议不包含任何可能理解为双方之间设立一种代理或合伙关系的内容。乙方无权代表甲方对外缔结合同。乙方不得以甲方的名义开展任何与约定的推广无关的活动或者从事违法犯罪活动，否则一切后果由乙方自行承担，同时甲方保留追究其法律责任的权利。</div>
<div style="font-weight: bold;padding-top:10px;font-size: 10px;">
<table style="color:#000000;width:100%;">
<tr><td style="height:20px;">甲方:依云智酷（北京）科技有限公司</td><td style="height:20px;">已方:<label id="yifang2"></label></td></tr>
<tr><td>日期:<label id="year1"></label>年<label id="month1"></label>月<label id="day1"></label>日</td>
	<td>日期:<label id="year2"></label>年<label id="month2"></label>月<label id="day2"></label>日</td></tr>
</table>
</div>
<div style="margin:-40px 0px 0px 50px;"><img src="images1/gongzhang.png" style="width:60px;height:60px;"/></div>
<div style="padding-top:20px;">
	<div style="height:30px;font-size: 16px;font-weight: bold;">中华小书童售后服务条款</div>
	一．	售后服务条款<br/><br/>
	1．30天无理由退换货条款<br/><br/>
	自您收到商品之日起30天内可享受无理由退换货，详细条款：<br/><br/>
	退货理由	是否可退换货	运费承担方	备注<br/><br/>
	质量问题	是	厂家	<br/><br/>
	非质量问题	是	用户	<br/><br/>
	产品颜色发错	是	厂家	<br/><br/>
	发票无遗失或破损	是	用户	如购买时带发票退货时需寄回，如丢失破损需补税点<br/><br/>
	配件无破损	是	用户	如有破损，参见配件折价表<br/><br/>
	未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确        的操作	否	用户	<br/><br/>
	底部标签撕毁	否	用户	<br/><br/>
	注：产品包装及赠品一起发回，如有缺失，参见配件折价表<br/><br/>
	
	2.一年售后服务条款<br/><br/>
	自您收到购买的商品一年内，如遇产品本身质量问题，本公司将会为您免费保修，来回运费由本公司承担。如人为造成的损坏，客户有偿维修， 来回运费由客户承担。<br/><br/>
	以下情况所造成的产品问题不属于免费保修范围，需有偿维修：<br/><br/>
	2.1擅自改造，拆解，维修，刷机，导致书童功能无效或其它损坏或损伤。。<br/><br/>
	2.2将本体以及电源进入水中或沾水。在澡堂、浴室温室等湿气重的场所使用或者保管本产品。<br/><br/>
	2.3进行充电等相关操作时未使用原厂提供的配件，而造成无法预期的损坏。<br/><br/>
	2.4未按产品说明书要求使用、维护、保养而造成的损坏<br/><br/>
	2.5撕毁底部标签，超过“三包”服务有效期；<br/><br/>
	除以上情况外，均属于保修范围，如有未包含的问题双方商讨解决。<br/><br/>
	有偿维修价格参照条款三《配件折价表》。<br/><br/>
	其他三包范围参照《国家微型计算机三包规定》。<br/><br/>
	
	二．产品配件折价表：<br/><br/>
	品名	数量	价格	哪些情况需要赔偿<br/><br/>
	包装盒/包装袋	1	60	破损或有无法擦拭的污垢 <br/><br/>
	外壳	1	200	破损或有无法擦拭的污垢 <br/><br/>
	帽子	1	50	破损或有无法擦拭污垢 <br/><br/>
	触控笔	1	98	破损或有无法擦拭的污垢 <br/><br/>
	幕布	1	38	破损或有无法擦拭的污垢 <br/><br/>
	桌面触控膜	1	20	破损或有无法擦拭的污垢 <br/><br/>
	支架	1	48	破损或有无法擦拭的污垢 <br/><br/>
	遥控器	1	28	破损或有无法擦拭的污垢 <br/><br/>
	学习卡	1	199	已使用或丢失<br/><br/>
	桌面投影组件	1	100	破损或有无法擦拭的污垢 <br/><br/>
	电源适配器	1	45	破损或有无法擦拭的污垢 <br/><br/>
	电路板组件	1	价格视情况而定	可维修，视情况而定<br/><br/>
</div>
<div id="diva1">
	<input type="checkbox" style="width:20px;height:20px;margin-left: 10px" id="issaleagree" onclick="changesaleagree();"/>
	<span style="margin-top:-5px;">我同意云趣家销售协议</span>
</div>
<div class="ui-btn-wrap" style="text-align: center;" id="diva2"><button type="button" onclick="agreesale();" id="agreesaleBtn">确定</button> </div>
</div>
</body>
</html>