/**
 * 格式化时间
 * @param time 要格式化的时间
 * @param type 样式 1:"yyyy-MM-dd" 0:"HH:mm:ss"
 * @returns 格式化后的时间
 */
function formtdate(time,type){
	var times = time.split(" ");
	if(type==0){
		return times[0];
	}
	if(type==1){
		var timet = times[1].split(".");
		return timet[0];
	}
}
/**
 * 加载出厂报告头部
 * @param type
 * @return
 */
var ordersproductentity=null;
var showbtn=null;//是否显示底部的保存和反审按钮
function loadhead(type){//type:1:全部 2：noty 3:noqd
		//t_factory_report
		var html='';
		var url = ctx+"/factoryReport/factory-report!showByOrderno.htm";
		//querystr='factoryReportQuery.orderno='+orderfbillno;
		//	querystr+='&factoryReportQuery.itemcode='+itemmode;
		//	querystr+='&factoryReportQuery.itemmode='+itemmode;
		var querystr='factoryReportQuery.serial='+sn;
		$.webAjax({
			type:'post',
			url:url,
			data:querystr,
			success: function(data)
			{
			//alert(data);
				data = $.parseJSON(data);
				if(data.resultInfo[0]=="0")
				{
					
					var model = data.model;
					
					ordersproductentity=model.ordersproductlist[0];
					$('#reportid').val(model.reportid==null?"":model.reportid);
					$('#tplid').val(model.tplid==null?"":model.tplid);
					$('#reportno').text(model.reportno==null?"":model.reportno);
					$('#reportdate').text(model.reportdate==null?"":formtdate(model.reportdate,0));
					$('#orderno').text(model.orderno==null?"":model.orderno);
					$('#customername').text(model.customername==null?"":model.customername);
					$('#itemname').text(model.itemname==null?"":model.itemname);
					$('#itemmode').text(model.itemmode==null?"":model.itemmode);
					if(type==6){//调节阀
						$('#itemcode').text(model.itemcode==null?"":model.itemcode);
						$('#serial').text(model.serial==null?"":model.serial);
					}else if(type==4){//直接调压器
						$('#itemcode').text(model.itemcode==null?"":model.itemcode);
						$('#serial').text(model.serial==null?"":model.serial);
					}else if(type==5){//高压出厂资料10
						$('#itemcode').text(model.itemcode==null?"":model.itemcode);
						$('#serial').text(model.serial==null?"":model.serial);
					}else{
					//------------
							//主阀
							$('#fmodel1').text(model.fmodel1==null?"":model.fmodel1);
							$('#fserial1').text(model.fserial1==null?"":model.fserial1);
						if(type==1){//高压出厂资料9
							//指挥器
							$('#fmodel2').text(model.fmodel2==null?"":model.fmodel2);
							$('#fserial2').text(model.fserial2==null?"":model.fserial2);
							//切断机构
							$('#fmodel3').text(model.fmodel3==null?"":model.fmodel3);
							$('#fserial3').text(model.fserial3==null?"":model.fserial3);
						}else if(type==2){//高压出厂资料不带调压的切断
							//切断机构
							$('#fmodel3').text(model.fmodel3==null?"":model.fmodel3);
							$('#fserial3').text(model.fserial3==null?"":model.fserial3);
						}else if(type==3){//高压出厂资料（ 不带切断调压器）
							//指挥器
							$('#fmodel2').text(model.fmodel2==null?"":model.fmodel2);
							$('#fserial2').text(model.fserial2==null?"":model.fserial2);
						}
					}	
				/**--------------------------------------------------------------------	
					if(model.tecid==null||model.tecid===''){//未审核--从物料及订单抓取数据
						loadNewBody(type);		
						if(showbtn){//打印页面不显示保存及审核按钮
							$("#checktec").show();	
						}
						
					}else{//已审核--从技术参数表读取数据
						loadbody(model.tecid,type);
						if(showbtn){//打印页面不显示保存及审核按钮
							$("#unchecktec").show();	
						}
					}
					*/
					loadbody(model.tecid,type);
					if(showbtn){//打印页面不显示保存及审核按钮
						$("#unchecktec").show();	
					}
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});		
		
		
}

/**
 * 加载技术参数
 * @param tecid
 * @param type
 * @return
 */
function loadbody(tecid,type){//type:1:全部 2：noty 3:noqd
	 unsavetecid=tecid;
		var url=ctx+"/reportTec/report-tec!listToQuery.htm";
		$.webAjax({
			type:'post',
			url:url,
			data:'reportTecQuery.reportid='+$("#reportid").val(),
			success: function(data)
			{
				data = $.parseJSON(data);
				if(data.resultInfo[0]=="0"&&data.reportTecList.length>0)
				{
					var model = data.reportTecList[0];
					if(type==1){//全部
						$("#mtv").text(model.mtv==null?"":model.mtv);	//	主阀型号
						$("#ccode").text(model.ccode==null?"":model.ccode);	//	主阀部件代码
						$("#inletdn").text(model.inletdn==null?"":model.inletdn);	//	主阀入口公称尺寸
						$("#outletdn").text(model.outletdn==null?"":model.outletdn);	//	主阀出口公称尺寸
						$("#orificesize").text(model.orificesize==null?"":model.orificesize);	//	主阀阀口尺寸
						$("#apps").text(model.apps==null?"":model.apps);	//	主阀设计压力
						$("#iprbpu").text(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
						$("#oprwdss").text(model.oprwdss==null?"":model.oprwdss);	//	主阀出口压力范围
						$("#mindifference").text(model.mindifference==null?"":model.mindifference);	//	主阀最小进出口压差
						$("#maxopc").text(model.maxopc==null?"":model.maxopc);	//	皮膜腔最大工作压力
						$("#cpressure").text(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
						$("#fend").text(model.fend==null?"":model.fend);	//	主阀连接方式
						$("#struclen").text(model.struclen==null?"":model.struclen);	//	主阀结构长度
						$("#structype").text(model.structype==null?"":model.structype);	//	主阀结构类型
						$("#fgas").text(model.fgas==null?"":model.fgas);	//	主阀适用介质
						$("#temprange").text(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
						$("#maxdifferent").text(model.maxdifferent==null?"":model.maxdifferent);	//	主阀皮膜最大压差
						$("#cgval").text(model.cgval==null?"":model.cgval);	//	主阀流量系数Cg
						$("#pilottype").text(model.pilottype==null?"":model.pilottype);	//	指挥器型号
						$("#pilotcode").text(model.pilotcode==null?"":model.pilotcode);	//	指挥器部件代码
						$("#pilotmaxpress").text(model.pilotmaxpress==null?"":model.pilotmaxpress);	//	指挥器最大进口压力
						$("#pilotpressrange").text(model.pilotpressrange==null?"":model.pilotpressrange);	//	指挥器设定压力范围
						$("#pcmaxpress").text(model.pcmaxpress==null?"":model.pcmaxpress);	//	指挥器皮膜腔最大工作压力
						$("#pilotsetpressure").val(model.pilotsetpressure==null?"":model.pilotsetpressure);	//	指挥器设定压力
						$("#cuttype").text(model.cuttype==null?"":model.cuttype);	//	切断机构型号
						$("#cutcode").text(model.cutcode==null?"":model.cutcode);	//	切断机构部件代码
						$("#overrange").text(model.overrange==null?"":model.overrange);	//	切断机构超高压切断范围
						$("#underrange").text(model.underrange==null?"":model.underrange);	//	切断机构超低压切断范围
						$("#cmaxpress").text(model.cmaxpress==null?"":model.cmaxpress);	//	切断机构皮膜腔最大工作压力
						$("#cnature").text(model.cnature==null?"":model.cnature);	//	切断机构性能等级
						
						$("#qdinmaxpress").text(model.qdinmaxpress==null?"":model.qdinmaxpress);	//切断机构最大进口压力
						$("#overpressval").val(model.overpressval==null?"":model.overpressval);	//	切断机构超高压切断设定值
						$("#underpressval").text(model.underpressval==null?"":model.underpressval);	//	切断机构超低压切断设定值
						$("#resptime").text(model.resptime==null?"":model.resptime);	//	切断机构响应时间
						$("#ac").val(model.ac==null?"":model.ac);	//	稳压精度AC
						$("#sz").val(model.sz==null?"":model.sz);	//	关闭压力区等级SZ
						$("#sg").val(model.sg==null?"":model.sg);	//	关闭压力等级SG
						$("#leakage").text(model.leakage==null?"":model.leakage);	//	泄漏等级
						$("#aq").val(model.aq==null?"":model.aq);	//	切断精度等级
						$("#resetdifferent").text(model.resetdifferent==null?"":model.resetdifferent);	//	复位压差
					}else if(type==2){//无指挥器
						$("#mtv").text(model.mtv==null?"":model.mtv);	//	主阀型号
						$("#ccode").text(model.ccode==null?"":model.ccode);	//	主阀部件代码
						$("#inletdn").text(model.inletdn==null?"":model.inletdn);	//	主阀入口公称尺寸
						$("#outletdn").text(model.outletdn==null?"":model.outletdn);	//	主阀出口公称尺寸
						$("#orificesize").text(model.orificesize==null?"":model.orificesize);	//	主阀阀口尺寸
						$("#apps").text(model.apps==null?"":model.apps);	//	主阀设计压力
						$("#iprbpu").text(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
						$("#cgval").text(model.cgval==null?"":model.cgval);	//	主阀流量系数Cg
						$("#cpressure").text(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
						$("#fend").text(model.fend==null?"":model.fend);	//	主阀连接方式
						$("#struclen").text(model.struclen==null?"":model.struclen);	//	主阀结构长度
						$("#structype").text(model.structype==null?"":model.structype);	//	主阀结构类型
						$("#fgas").text(model.fgas==null?"":model.fgas);	//	主阀适用介质
						$("#temprange").text(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
						
						$("#cuttype").text(model.cuttype==null?"":model.cuttype);	//	切断机构型号
						$("#cutcode").text(model.cutcode==null?"":model.cutcode);	//	切断机构部件代码
						$("#overrange").text(model.overrange==null?"":model.overrange);	//	切断机构超高压切断范围
						$("#underrange").text(model.underrange==null?"":model.underrange);	//	切断机构超低压切断范围
						$("#cmaxpress").text(model.cmaxpress==null?"":model.cmaxpress);	//	切断机构皮膜腔最大工作压力
						$("#cnature").text(model.cnature==null?"":model.cnature);	//	切断机构性能等级
						$("#overpressval").val(model.overpressval==null?"":model.overpressval);	//	切断机构超高压切断设定值
						$("#underpressval").text(model.underpressval==null?"":model.underpressval);	//	切断机构超低压切断设定值
						$("#resptime").text(model.resptime==null?"":model.resptime);	//	切断机构响应时间
						
						$("#ac").val(model.ac==null?"":model.ac);	//	稳压精度AC
						$("#leakage").text(model.leakage==null?"":model.leakage);	//	泄漏等级
						$("#resetdifferent").text(model.resetdifferent==null?"":model.resetdifferent);	//	复位压差	
						$("#cnature").text(model.cnature==null?"":model.cnature);	//	切断机构性能等级
						
					}else if(type==3){//无切断机构
						$("#mtv").text(model.mtv==null?"":model.mtv);	//	主阀型号
						$("#ccode").text(model.ccode==null?"":model.ccode);	//	主阀部件代码
						$("#inletdn").text(model.inletdn==null?"":model.inletdn);	//	主阀入口公称尺寸
						$("#outletdn").text(model.outletdn==null?"":model.outletdn);	//	主阀出口公称尺寸
						$("#orificesize").text(model.orificesize==null?"":model.orificesize);	//	主阀阀口尺寸
						$("#apps").text(model.apps==null?"":model.apps);	//	主阀设计压力
						$("#iprbpu").text(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
						$("#mindifference").text(model.mindifference==null?"":model.mindifference);	//	主阀最小进出口压差
						$("#maxopc").text(model.maxopc==null?"":model.maxopc);	//	皮膜腔最大工作压力
						$("#cpressure").text(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
						$("#fend").text(model.fend==null?"":model.fend);	//	主阀连接方式
						$("#struclen").text(model.struclen==null?"":model.struclen);	//	主阀结构长度
						$("#structype").text(model.structype==null?"":model.structype);	//	主阀结构类型
						$("#fgas").text(model.fgas==null?"":model.fgas);	//	主阀适用介质
						$("#temprange").text(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
						$("#maxdifferent").text(model.maxdifferent==null?"":model.maxdifferent);	//	主阀皮膜最大压差
						
						$("#pilottype").text(model.pilottype==null?"":model.pilottype);	//	指挥器型号
						$("#pilotcode").text(model.pilotcode==null?"":model.pilotcode);	//	指挥器部件代码
						$("#pilotinrange").text(model.pilotinrange==null?"":model.pilotinrange);	//	指挥器入口压力范围
						$("#pilotoutrange").text(model.pilotoutrange==null?"":model.pilotoutrange);	//	指挥器出口压力范围
						$("#pcmaxpress").text(model.pcmaxpress==null?"":model.pcmaxpress);	//	指挥器皮膜腔最大工作压力
						$("#pilotsetpressure").val(model.pilotsetpressure==null?"":model.pilotsetpressure);	//	指挥器设定压力
						
						$("#ac").val(model.ac==null?"":model.ac);	//	稳压精度AC
						$("#sz").val(model.sz==null?"":model.sz);	//	关闭压力区等级SZ
						$("#sg").val(model.sg==null?"":model.sg);	//	关闭压力等级SG
						$("#leakage").text(model.leakage==null?"":model.leakage);	//	泄漏等级

					}else if(type==4){//直接调压器
						$("#inletdn").text(model.inletdn==null?"":model.inletdn);	//	主阀入口公称尺寸
						$("#outletdn").text(model.outletdn==null?"":model.outletdn);	//	主阀出口公称尺寸
						$("#orificesize").text(model.orificesize==null?"":model.orificesize);	//	主阀阀口尺寸
						$("#apps").text(model.apps==null?"":model.apps);	//	主阀设计压力
						$("#iprbpu").text(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
						$("#zfpress").text(model.zfpress==null?"":model.zfpress);	//	设定压力
						
						$("#mindifference").text(model.mindifference==null?"":model.mindifference);	//	主阀最小进出口压差
						$("#maxopc").text(model.maxopc==null?"":model.maxopc);	//	皮膜腔最大工作压力
						$("#cpressure").text(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
						$("#fend").text(model.fend==null?"":model.fend);	//	主阀连接方式
						$("#struclen").text(model.struclen==null?"":model.struclen);	//	主阀结构长度
						$("#structype").text(model.structype==null?"":model.structype);	//	主阀结构类型
						$("#fgas").text(model.fgas==null?"":model.fgas);	//	主阀适用介质
						$("#temprange").text(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
						$("#maxdifferent").text(model.maxdifferent==null?"":model.maxdifferent);	//	主阀皮膜最大压差
						
						$("#ac").val(model.ac==null?"":model.ac);	//	稳压精度AC
						$("#sz").val(model.sz==null?"":model.sz);	//	关闭压力区等级SZ
						$("#sg").val(model.sg==null?"":model.sg);	//	关闭压力等级SG
						$("#leakage").text(model.leakage==null?"":model.leakage);	//	泄漏等级
						$("#aq").val(model.aq==null?"":model.aq);	//	切断精度等级
						
					}else if(type==5){//高压出厂资料10
						$("#diameter").text(model.diameter==null?"":model.diameter);	//	公称直径
						$("#orificesize").text(model.orificesize==null?"":model.orificesize);	//	主阀阀口尺寸
						$("#apps").text(model.apps==null?"":model.apps);	//	主阀设计压力
						$("#iprbpu").text(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
						$("#oprwdss").text(model.oprwdss==null?"":model.oprwdss);	//	主阀出口压力范围
						$("#mindifference").text(model.mindifference==null?"":model.mindifference);	//	主阀最小进出口压差
						$("#maxopc").text(model.maxopc==null?"":model.maxopc);	//	皮膜腔最大工作压力
						$("#pilotpressrange").text(model.pilotpressrange==null?"":model.pilotpressrange)//设定压力范围
						$("#overrange").text(model.overrange==null?"":model.overrange)//超高压切断范围
						$("#cgval").text(model.cgval==null?"":model.cgval);	//	主阀流量系数Cg
						$("#cnature").text(model.cnature==null?"":model.cnature);	//	切断机构性能等级
						
						
						$("#cpressure").text(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
						$("#fend").text(model.fend==null?"":model.fend);	//	主阀连接方式
						$("#struclen").text(model.struclen==null?"":model.struclen);	//	主阀结构长度
						$("#structype").text(model.structype==null?"":model.structype);	//	主阀结构类型
						$("#fgas").text(model.fgas==null?"":model.fgas);	//	主阀适用介质
						$("#temprange").text(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
						$("#maxdifferent").text(model.maxdifferent==null?"":model.maxdifferent);	//	主阀皮膜最大压差
						$("#pilotsetpressure").val(model.pilotsetpressure==null?"":model.pilotsetpressure)//设定压力
						$("#overpressval").val(model.overpressval==null?"":model.overpressval)//超高压切断设定值
						$("#resptime").text(model.resptime==null?"":model.resptime);	//	切断机构响应时间
						$("#resetdifferent").text(model.resetdifferent==null?"":model.resetdifferent);	//	复位压差

						
						$("#ac").val(model.ac==null?"":model.ac);	//	稳压精度AC
						$("#sz").val(model.sz==null?"":model.sz);	//	关闭压力区等级SZ
						$("#sg").val(model.sg==null?"":model.sg);	//	关闭压力等级SG
						$("#aq").val(model.aq==null?"":model.aq);	//	切断精度等级
						$("#leakage").text(model.leakage==null?"":model.leakage);	//	泄漏等级
						
					}else if(type==6){//调节阀2
						$("#diameter").text(model.diameter==null?"":model.diameter);	//	公称直径
						$("#cpressure").text(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
						$("#oldfeatures").text(model.oldfeatures==null?"":model.oldfeatures);	//	固有流量特性
						$("#fend").text(model.fend==null?"":model.fend);	//	主阀连接方式
						$("#apps").text(model.apps==null?"":model.apps);	//	主阀设计压力
						$("#struclen").text(model.struclen==null?"":model.struclen);	//	主阀结构长度
						$("#iprbpu").text(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
						$("#fgas").text(model.fgas==null?"":model.fgas);	//	主阀适用介质
						$("#fheart").text(model.fheart==null?"":model.fheart);	//	阀芯型式
						$("#temprange").text(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
						$("#trip").text(model.trip ==null?"":model.trip);//trip//额定行程
						$("#cv").text(model.cv ==null?"":model.cv);//cv//额定流量系数cv
						$("#fbody").text(model.fbody ==null?"":model.fbody);//fbody//阀体材质
						$("#mfbody").text(model.mfbody ==null?"":model.mfbody);//mfbody//密封材质
						$("#allowdvalue").text(model.allowdvalue ==null?"":model.allowdvalue);//allowdvalue//允许压差
						$("#structure").text(model.structure ==null?"":model.structure);//structure//结构型式
						
						
						$("#voltage").text(model.voltage ==null?"":model.voltage);//voltage//供电电压
						$("#protecttype").text(model.protecttype ==null?"":model.protecttype);//protecttype//防护型式
						$("#insignal").text(model.insignal ==null?"":model.insignal);//insignal//输入信号范围
						if(model.fixed){
							if(model.fixed==1){
								$("#fixed").attr("checked", true);
							}else{
								$("#unfixed").attr("checked", true);
							}
						}
						
						$("#jdrank").text(model.jdrank ==null?"":model.jdrank);//jdrank//精度等级
						$("#basedvalue").text(model.basedvalue ==null?"":model.basedvalue);//basedvalue//基本误差
						$("#returndvalue").text(model.returndvalue ==null?"":model.returndvalue);//returndvalue//回差
						$("#diearea").text(model.diearea ==null?"":model.diearea);//diearea//死区
						$("#tripdvalue").text(model.tripdvalue ==null?"":model.tripdvalue);//tripdvalue//额定行程偏差
						$("#leakage").text(model.leakage==null?"":model.leakage);	//	泄漏等级
						
					}
				}else{
					alert("技术参数未初始化!");	
				}
			}
		})	
			
}


/*
 * var orderfbillno='';
	var sn='';
	var itemcode='';
	var itemmode='';
 */

function loadNewBody(type){//加载技术参数
	
	
	if(type==4||type==5||type==6){//直接调压器//高压出厂资料10//调节阀
		
		loadzj(type);
	}else{
		
		loadzf(type);//主阀	
	}
	
}

function loadzf(type){//主阀
	
	var url=ctx+"/baseItem/base-item!showBySn.htm";
	$.webAjax({
		type:'post',
		url:url,
		data:'baseItemQuery.itemsn='+$('#fserial1').text()+'&baseItemQuery.orderfbillno='+orderfbillno,
		success: function(data)
		{
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0")
			{
				var model = data.model;
				if(type==1){//type:1:全部 2：noty 3:noqd

					$("#mtv").text(model.formatno==null?"":model.formatno);	//	主阀型号
					$("#ccode").text(model.itemcode==null?"":model.itemcode);	//	主阀部件代码
					$("#inletdn").text(model.f106==null?"":model.f106);	//	主阀入口公称尺寸
					$("#outletdn").text(model.f108==null?"":model.f108);	//	主阀出口公称尺寸
					$("#cpressure").text(model.f107==null?"":model.f107);	//	主阀压力等级
					$("#fend").text(model.f119==null?"":model.f119);	//	主阀连接方式
					$("#orificesize").text(model.f116==null?"":model.f116);	//	主阀阀口尺寸
					
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#apps").text(icitemDesign.allowpresure==null?"":icitemDesign.allowpresure);	//	主阀设计压力
						$("#iprbpu").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	主阀入口压力范围
						$("#oprwdss").text(icitemDesign.fopr==null?"":icitemDesign.fopr);	//	主阀出口压力范围
						$("#mindifference").text(icitemDesign.mindifference==null?"":icitemDesign.mindifference);	//	主阀最小进出口压差
						$("#maxopc").text(icitemDesign.pressmax==null?"":icitemDesign.pressmax);	//	皮膜腔最大工作压力
						$("#struclen").text(icitemDesign.structlen==null?"":icitemDesign.structlen);	//	主阀结构长度
						$("#structype").text(icitemDesign.structtype==null?"":icitemDesign.structtype);	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text(icitemDesign.otemprange==null?"":icitemDesign.otemprange);	//	主阀工作温度范围
						$("#maxdifferent").text(icitemDesign.chambermax==null?"":icitemDesign.chambermax);	//	主阀皮膜最大压差
						$("#cgval").text(icitemDesign.fcg==null?"":icitemDesign.fcg);	//	主阀流量系数Cg
					}else{
						$("#apps").text("");	//	主阀设计压力
						$("#iprbpu").text("");	//	主阀入口压力范围
						$("#oprwdss").text("");	//	主阀出口压力范围
						$("#mindifference").text("");	//	主阀最小进出口压差
						$("#maxopc").text("");	//	皮膜腔最大工作压力
						$("#struclen").text("");	//	主阀结构长度
						$("#structype").text("");	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text("");	//	主阀工作温度范围
						$("#maxdifferent").text("");	//	主阀皮膜最大压差
						$("#cgval").text("");	//	主阀流量系数Cg
					}
					
				}else if(type==2){//type:1:全部 2：noty 3:noqd
					$("#mtv").text(model.formatno==null?"":model.formatno);	//	主阀型号
					$("#ccode").text(model.itemcode==null?"":model.itemcode);	//	主阀部件代码
					$("#inletdn").text(model.f106==null?"":model.f106);	//	主阀入口公称尺寸
					$("#outletdn").text(model.f108==null?"":model.f108);	//	主阀出口公称尺寸
					$("#cpressure").text(model.f107==null?"":model.f107);	//	主阀压力等级
					$("#fend").text(model.f119==null?"":model.f119);	//	主阀连接方式
					$("#orificesize").text(model.f116==null?"":model.f116);	//	主阀阀口尺寸
					//-------------
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#apps").text(icitemDesign.allowpresure==null?"":icitemDesign.allowpresure);	//	主阀设计压力
						$("#iprbpu").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	主阀入口压力范围
						$("#cgval").text(icitemDesign.fcg==null?"":icitemDesign.fcg);	//	主阀流量系数Cg
						$("#struclen").text(icitemDesign.structlen==null?"":icitemDesign.structlen);	//	主阀结构长度
						$("#structype").text(icitemDesign.structtype==null?"":icitemDesign.structtype);	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text(icitemDesign.otemprange==null?"":icitemDesign.otemprange);	//	主阀工作温度范围
					}else{
						$("#apps").text("");	//	主阀设计压力
						$("#iprbpu").text("");	//	主阀入口压力范围
						$("#cgval").text("");	//	主阀流量系数Cg
						$("#struclen").text("");	//	主阀结构长度
						$("#structype").text("");	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text("");	//	主阀工作温度范围
						
					}
					
				}else if(type==3){//type:1:全部 2：noty 3:noqd
					$("#mtv").text(model.formatno==null?"":model.formatno);	//	主阀型号
					$("#ccode").text(model.itemcode==null?"":model.itemcode);	//	主阀部件代码
					$("#inletdn").text(model.f106==null?"":model.f106);	//	主阀入口公称尺寸
					$("#outletdn").text(model.f108==null?"":model.f108);	//	主阀出口公称尺寸
					$("#cpressure").text(model.f107==null?"":model.f107);	//	主阀压力等级
					$("#fend").text(model.f119==null?"":model.f119);	//	主阀连接方式
					$("#orificesize").text(model.f116==null?"":model.f116);	//	主阀阀口尺寸	
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#apps").text(icitemDesign.allowpresure==null?"":icitemDesign.allowpresure);	//	主阀设计压力
						$("#iprbpu").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	主阀入口压力范围
						$("#mindifference").text(icitemDesign.mindifference==null?"":icitemDesign.mindifference);	//	主阀最小进出口压差
						$("#maxopc").text(icitemDesign.pressmax==null?"":icitemDesign.pressmax);	//	皮膜腔最大工作压力
						$("#struclen").text(icitemDesign.structlen==null?"":icitemDesign.structlen);	//	主阀结构长度
						$("#structype").text(icitemDesign.structtype==null?"":icitemDesign.structtype);	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text(icitemDesign.otemprange==null?"":icitemDesign.otemprange);	//	主阀工作温度范围
						$("#maxdifferent").text(icitemDesign.chambermax==null?"":icitemDesign.chambermax);	//	主阀皮膜最大压差
						
					}else{
						$("#apps").text("");	//	主阀设计压力
						$("#iprbpu").text("");	//	主阀入口压力范围
						$("#mindifference").text("");	//	主阀最小进出口压差
						$("#maxopc").text("");	//	皮膜腔最大工作压力
						$("#struclen").text("");	//	主阀结构长度
						$("#structype").text("");	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text("");	//	主阀工作温度范围
						$("#maxdifferent").text("");	//	主阀皮膜最大压差
					}
				}		
				
				//loadzhq(type);
				if(type==1){//全部
					loadty(type);	
				}else if(type==2){//noty
					loadqd(type);
				}else if(type==3){//noqd
					loadty(type);
				}
				
			}else{
				alert(data.resultInfo[1]);
			}	
		}
	})
	
}

function loadty(type){//指挥器
		
	var url=ctx+"/baseItem/base-item!showBySn.htm";
	$.webAjax({
		type:'post',
		url:url,
		data:'baseItemQuery.itemsn='+$('#fserial2').text()+'&baseItemQuery.orderfbillno='+orderfbillno,
		success: function(data)
		{
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0")
			{
				var model = data.model;
				if(type==1){
					if(!model){
						loadqd(type);
					}else{
					
					
					$("#pilottype").text(model.formatno==null?"":model.formatno);	//	指挥器型号
					$("#pilotcode").text(model.itemcode==null?"":model.itemcode);	//	指挥器部件代码
					var icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#pilotmaxpress").text(icitemDesign.fmaxip==null?"":icitemDesign.fmaxip);	//	指挥器最大进口压力	
					}else{
						$("#pilotmaxpress").text("");	//	指挥器最大进口压力	
					}
					$("#pcmaxpress").text("0.3MP");	//	指挥器皮膜腔最大工作压力
					$("#pilotpressrange").text(icitemDesign.setpressure==null?"":icitemDesign.setpressure);//指挥器设定压力范围
					
					
				//	var orderproduct=model.orderproduct;
				//	if(orderproduct!=null){
					if(ordersproductentity!=null){
						
						$("#pilotsetpressure").val(ordersproductentity.outpressure==null?"":ordersproductentity.outpressure);//	指挥器设定压力--销售订单设定出口压力
						
						var restr=showzhq(ordersproductentity.outpressure);//根据指挥器出口压力返回参数--AC，SG,SZ
						var restrvalue=restr.split(",");
						$("#ac").val(restrvalue[0]);
						$("#sg").val(restrvalue[1]);
						$("#sz").val(restrvalue[2]);
							
					}else{
						$("#pilotsetpressure").val("");
						$("#ac").val("");
						$("#aq").val("");
						$("#sg").val("");
						$("#sz").val("");
					}
					
					loadqd(type);
					}
				}else{//无切断机构
					$("#pilottype").text(model.formatno==null?"":model.formatno);	//	指挥器型号
					$("#pilotcode").text(model.itemcode==null?"":model.itemcode);	//	指挥器部件代码
					$("#pcmaxpress").text("0.3");	//	指挥器皮膜腔最大工作压力
					
					var icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#pilotinrange").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	指挥器入口压力范围
						$("#pilotoutrange").text(icitemDesign.fopr==null?"":icitemDesign.fopr);	//	指挥器出口压力范围
					}else{
						$("#pilotinrange").text("");	//	指挥器入口压力范围
						$("#pilotoutrange").text("");	//	指挥器出口压力范围
					}
					
				//	var orderproduct=model.orderproduct;
				//	if(orderproduct!=null){
					if(ordersproductentity!=null){
						
						$("#pilotsetpressure").val(ordersproductentity.outpressure==null?"":ordersproductentity.outpressure);//	指挥器设定压力--销售订单设定出口压力
						var restr=showzhq(ordersproductentity.outpressure);//根据指挥器出口压力返回参数--AC，SG,SZ
						var restrvalue=restr.split(",");
						$("#ac").val(restrvalue[0]);
						$("#sg").val(restrvalue[1]);
						$("#sz").val(restrvalue[2]);
						
					}else{
						$("#pilotsetpressure").val("");
						$("#ac").val("");	//	稳压精度AC
						$("#sz").val("");	//	关闭压力区等级SZ
						$("#sg").val("");	//	关闭压力等级SG
					}
					//---------------------------------------
					
					$("#leakage").text("VI");	//	泄漏等级
				}
				
			}else{
				alert(data.resultInfo[1]);
			}	
		}
	})
		
}
//切断机构
function loadqd(type){
	var url=ctx+"/baseItem/base-item!showBySn.htm";
	$.webAjax({
		type:'post',
		url:url,
		data:'baseItemQuery.itemsn='+$('#fserial3').text()+'&baseItemQuery.orderfbillno='+orderfbillno,
		success: function(data)
		{
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0")
			{
				var model = data.model;
				if(!model){
					return false;
				}
				if(type==1){
					
					$("#cuttype").text(model.formatno==null?"":model.formatno);	//	切断机构型号
					$("#cutcode").text(model.itemcode==null?"":model.itemcode);	//	切断机构部件代码
					var icitemDesign=model.icitemDesign;	
					$("#overrange").text(icitemDesign.soverpressure==null?"":icitemDesign.soverpressure);	//	切断机构超高压切断范围
					$("#underrange").text(icitemDesign.sunderpressure==null?"":icitemDesign.sunderpressure);	//	切断机构超低压切断范围
					$("#qdinmaxpress").text(icitemDesign.fmaxip==null?"":icitemDesign.fmaxip);	//
					
				//	var orderproduct=model.orderproduct;
				//	if(orderproduct!=null){
					if(ordersproductentity!=null){
					
						$("#overpressval").val(ordersproductentity.morehighpressure==null?"":ordersproductentity.morehighpressure);	//	切断机构超高压切断设定值
						$("#underpressval").text(ordersproductentity.morelowpressure==null?"":ordersproductentity.morelowpressure);	//	切断机构超低压切断设定值
						var restr=showqd(ordersproductentity.morehighpressure);//根据超高压设定值返回性能参数--复位差压，AG切断精度
						var restrvalue=restr.split(",");
						
						$("#resetdifferent").text(restrvalue[0]);	//	复位压差
						$("#aq").val(restrvalue[1]);	//	AG切断精度AQ
					}else{
						$("#overpressval").val("");	//	切断机构超高压切断设定值
						$("#underpressval").text("");	//	切断机构超低压切断设定值
						$("#resetdifferent").text("");	//	复位压差
						$("#aq").val("");	//	AG切断精度AQ
					}
					
							
					$("#resptime").text("<1 秒");	//	切断机构响应时间
					$("#cnature").text("B");	//	切断机构性能等级

				}else{//无指挥器noty
					$("#cuttype").text(model.formatno==null?"":model.formatno);	//	切断机构型号
					$("#cutcode").text(model.itemcode==null?"":model.itemcode);	//	切断机构部件代码
					var icitemDesign=model.icitemDesign;	
					$("#overrange").text(icitemDesign.soverpressure==null?"":icitemDesign.soverpressure);	//	切断机构超高压切断范围
					$("#underrange").text(icitemDesign.sunderpressure==null?"":icitemDesign.sunderpressure);	//	切断机构超低压切断范围
				
					
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign==null){
						$("#cmaxpress").text("");	//	切断机构皮膜腔最大工作压力
					}else{
						$("#cmaxpress").text(icitemDesign.pressmax==null?"":icitemDesign.pressmax);	//	切断机构皮膜腔最大工作压力
					}
					$("#cnature1").text("B");	//	切断机构性能等级
					
				//	var orderproduct=model.orderproduct;
				//	if(orderproduct!=null){
					if(ordersproductentity!=null){
						$("#overpressval").val(ordersproductentity.morehighpressure==null?"":ordersproductentity.morehighpressure);	//	切断机构超高压切断设定值
						$("#underpressval").text(ordersproductentity.morelowpressure==null?"":ordersproductentity.morelowpressure);	//	切断机构超低压切断设定值
						
						var restr=showqd(ordersproductentity.morehighpressure);//根据超高压设定值返回性能参数--复位差压，AG切断精度
						var restrvalue=restr.split(",");
						$("#aq").val(restrvalue[1]);	//	AG切断精度AQ
						
					}else{
						$("#overpressval").val("");	//	切断机构超高压切断设定值
						$("#underpressval").text("");	//	切断机构超低压切断设定值
					}
					
				//	$("#ac").val("********");	//	稳压精度AC
					$("#resptime").text("<1秒");	//	切断机构响应时间
					$("#leakage").text("VI");	//	泄漏等级
					$("#resetdifferent").text("10");	//	复位压差	
					$("#cnature").text("B");	//	切断机构性能等级
				}
								
				
			}else{
				alert(data.resultInfo[1]);
			}	
		}
	})
		
	
	
}

/**
 * 添加技术参数
 * @param type 1:全部 2：noty 3:noqd
 * @return
 */
function savetec(type){//type:1:全部 2：noty 3:noqd
		//	issavebtn:null 未保存			
		var savestr='';
			savestr+='tplid='+$("#tplid").val();
			savestr+='&reportid='+$("#reportid").val();
		if(type==1){//全部参数
			savestr+='&mtv='+$("#mtv").text();
			savestr+='&ccode='+$("#ccode").text();
			savestr+='&inletdn='+$("#inletdn").text();
			savestr+='&outletdn='+$("#outletdn").text();
			savestr+='&orificesize='+$("#orificesize").text();
			savestr+='&apps='+$("#apps").text();
			savestr+='&iprbpu='+$("#iprbpu").text();
			savestr+='&oprwdss='+$("#oprwdss").text();
			savestr+='&mindifference='+$("#mindifference").text();
			savestr+='&maxopc='+$("#maxopc").text();
			savestr+='&cpressure='+$("#cpressure").text();
			savestr+='&fend='+$("#fend").text();
			savestr+='&struclen='+$("#struclen").text();
			savestr+='&structype='+$("#structype").text();
			savestr+='&fgas='+$("#fgas").text();
			savestr+='&temprange='+$("#temprange").text();
			savestr+='&maxdifferent='+$("#maxdifferent").text();
			savestr+='&cgval='+$("#cgval").text();
			savestr+='&pilottype='+$("#pilottype").text();
			savestr+='&pilotcode='+$("#pilotcode").text();
			savestr+='&pilotmaxpress='+$("#pilotmaxpress").text();
			savestr+='&pilotpressrange='+$("#pilotpressrange").text();
			savestr+='&pcmaxpress='+$("#pcmaxpress").text();
			
			
			savestr+='&pilotsetpressure='+$("#pilotsetpressure").val();
			savestr+='&cuttype='+$("#cuttype").text();
			savestr+='&cutcode='+$("#cutcode").text();
			savestr+='&overrange='+$("#overrange").text();
			savestr+='&underrange='+$("#underrange").text();
			savestr+='&cmaxpress='+$("#cmaxpress").text();
			savestr+='&cnature='+$("#cnature").text();
			savestr+='&overpressval='+$("#overpressval").val();
			savestr+='&underpressval='+$("#underpressval").text();
			savestr+='&resptime='+$("#resptime").text();
			savestr+='&ac='+$("#ac").val();
			savestr+='&sz='+$("#sz").val();
			savestr+='&sg='+$("#sg").val();
			savestr+='&leakage='+$("#leakage").text();
			savestr+='&aq='+$("#aq").val();
			savestr+='&resetdifferent='+$("#resetdifferent").text();
			savestr+='&qdinmaxpress='+$("#qdinmaxpress").text();
		}else if(type==2){//noty不带指挥器
			
			savestr+='&mtv='+$("#mtv").text();//	主阀型号
			savestr+='&ccode='+$("#ccode").text();//	主阀部件代码
			savestr+='&inletdn='+$("#inletdn").text();//	主阀入口公称尺寸
			savestr+='&cpressure='+$("#cpressure").text();//	主阀压力等级
			savestr+='&outletdn='+$("#outletdn").text();//	主阀出口公称尺寸
			savestr+='&fend='+$("#fend").text();//	主阀连接方式
			savestr+='&orificesize='+$("#orificesize").text();//	主阀阀口尺寸
			savestr+='&struclen='+$("#struclen").text();//	主阀结构长度
			savestr+='&apps='+$("#apps").text();//	主阀设计压力
			savestr+='&structype='+$("#structype").text();//	主阀结构类型
			savestr+='&iprbpu='+$("#iprbpu").text();//	主阀入口压力范围
			savestr+='&fgas='+$("#fgas").text();//	主阀适用介质
			savestr+='&cgval='+$("#cgval").text();//	主阀流量系数Cg
			savestr+='&temprange='+$("#temprange").text();//	主阀工作温度范围
			
			savestr+='&cuttype='+$("#cuttype").text();//	切断机构型号
			savestr+='&cutcode='+$("#cutcode").text();//	切断机构部件代码
			savestr+='&overrange='+$("#overrange").text();//	切断机构超高压切断范围
			savestr+='&underrange='+$("#underrange").text();//	切断机构超低压切断范围
			savestr+='&cmaxpress='+$("#cmaxpress").text();//	切断机构皮膜腔最大工作压力
			savestr+='&cnature='+$("#cnature").text();//	切断机构性能等级
			savestr+='&overpressval='+$("#overpressval").val();//	切断机构超高压切断设定值
			savestr+='&underpressval='+$("#underpressval").text();//	切断机构超低压切断设定值
			savestr+='&resetdifferent='+$("#resetdifferent").text();//	复位压差
			
			savestr+='&ac='+$("#ac").val();//	稳压精度AC
			savestr+='&leakage='+$("#leakage").text();//	泄漏等级
			savestr+='&resptime='+$("#resptime").text();//	切断机构响应时间
			savestr+='&cnature='+$("#cnature").text();//	切断机构性能等级
			
		}else if(type==3){//noqd不带切断
			
			savestr+='&mtv='+$("#mtv").text();//主阀型号
			savestr+='&ccode='+$("#ccode").text();//主阀部件代码
			savestr+='&inletdn='+$("#inletdn").text();//主阀入口公称尺寸
			savestr+='&outletdn='+$("#outletdn").text();//主阀出口公称尺寸
			savestr+='&orificesize='+$("#orificesize").text();//主阀阀口尺寸
			savestr+='&apps='+$("#apps").text();//主阀设计压力
			savestr+='&iprbpu='+$("#iprbpu").text();//主阀入口压力范围
			savestr+='&mindifference='+$("#mindifference").text();//主阀最小进出口压差
			savestr+='&maxopc='+$("#maxopc").text();//皮膜腔最大工作压力
			savestr+='&cpressure='+$("#cpressure").text();//主阀压力等级
			savestr+='&fend='+$("#fend").text();//主阀连接方式
			savestr+='&struclen='+$("#struclen").text();//主阀结构长度
			savestr+='&structype='+$("#structype").text();//主阀结构类型
			savestr+='&fgas='+$("#fgas").text();//主阀适用介质
			savestr+='&temprange='+$("#temprange").text();//主阀工作温度范围
			savestr+='&maxdifferent='+$("#maxdifferent").text();//主阀皮膜最大压差
			
			savestr+='&pilottype='+$("#pilottype").text();//指挥器型号
			savestr+='&pilotcode='+$("#pilotcode").text();//指挥器部件代码
			savestr+='&pilotinrange='+$("#pilotinrange").text();//指挥器入口压力范围
			savestr+='&pilotoutrange='+$("#pilotoutrange").text();//指挥器出口压力范围
			savestr+='&pcmaxpress='+$("#pcmaxpress").text();//指挥器皮膜腔最大工作压力
			savestr+='&pilotsetpressure='+$("#pilotsetpressure").val();//指挥器设定压力
			
			savestr+='&ac='+$("#ac").val();//稳压精度AC
			savestr+='&sz='+$("#sz").val();//关闭压力区等级SZ
			savestr+='&sg='+$("#sg").val();//关闭压力等级SG
			savestr+='&leakage='+$("#leakage").text();//泄漏等级
		}else if(type==4){//直接调压器
			savestr+='&inletdn ='+$("#inletdn").text();//主阀入口公称尺寸
			savestr+='&outletdn ='+$("#outletdn").text();//主阀出口公称尺寸
			savestr+='&cpressure ='+$("#cpressure").text();//主阀压力等级
			savestr+='&fend ='+$("#fend").text();//主阀连接方式
			savestr+='&orificesize ='+$("#orificesize").text();//主阀阀口尺寸
			savestr+='&apps ='+$("#apps").text();//主阀设计压力
			savestr+='&iprbpu ='+$("#iprbpu").text();//主阀入口压力范围
		//	savestr+='&mindifference ='+$("#mindifference").text();//主阀最小进出口压差
			savestr+='&zfpress ='+$("#zfpress").text();//---设定压力
			savestr+='&maxopc ='+$("#maxopc").text();//皮膜腔最大工作压力
			savestr+='&struclen ='+$("#struclen").text();//主阀结构长度
			savestr+='&structype ='+$("#structype").text();//主阀结构类型
			savestr+='&fgas ='+$("#fgas").text();//主阀适用介质
			savestr+='&temprange ='+$("#temprange").text();//主阀工作温度范围
			savestr+='&maxdifferent ='+$("#maxdifferent").text();//主阀皮膜最大压差
			savestr+='&ac ='+$("#ac").val();//稳压精度AC
			savestr+='&sz ='+$("#sz").val();//关闭压力区等级SZ
			savestr+='&sg ='+$("#sg").val();//关闭压力等级SG
			savestr+='&leakage ='+$("#leakage").text();//泄漏等级
			
		}else if(type==5){//
				
			savestr+='&cpressure ='+$("#cpressure").text();//主阀压力等级
			savestr+='&fend ='+$("#fend").text();//主阀连接方式
			savestr+='&orificesize ='+$("#orificesize").text();//主阀阀口尺寸
			savestr+='&diameter ='+$("#diameter").text();//公称直径
			savestr+='&apps ='+$("#apps").text();//主阀设计压力
			savestr+='&struclen ='+$("#struclen").text();//主阀结构长度
			savestr+='&iprbpu ='+$("#iprbpu").text();//主阀入口压力范围
			savestr+='&structype ='+$("#structype").text();//主阀结构类型
			savestr+='&oprwdss ='+$("#oprwdss").text();//主阀出口压力范围
			savestr+='&fgas ='+$("#fgas").text();//主阀适用介质
			savestr+='&mindifference ='+$("#mindifference").text();//主阀最小进出口压差
			savestr+='&temprange ='+$("#temprange").text();//主阀工作温度范围
			savestr+='&maxopc ='+$("#maxopc").text();//皮膜腔最大工作压力
			savestr+='&maxdifferent ='+$("#maxdifferent").text();//主阀皮膜最大压差
			
			savestr+='&pilotsetpressure ='+$("#pilotsetpressure").val();////---设定压力
			savestr+='&overpressval ='+$("#overpressval").val();//---超高压切断设定值
			savestr+='&pilotpressrange ='+$("#pilotpressrange").text();//---设定压力范围
			savestr+='&overrange ='+$("#overrange").text();//-超高压切断范围
			savestr+='&cgval ='+$("#cgval").text();//主阀流量系数Cg
			savestr+='&resetdifferent ='+$("#resetdifferent").text();////复位压差
			savestr+='&cnature ='+$("#cnature").text();////性能等级
			savestr+='&resptime ='+$("#resptime").text();//响应时间
			savestr+='&ac ='+$("#ac").val();//稳压精度AC
			savestr+='&sz ='+$("#sz").val();//关闭压力区等级SZ
			savestr+='&sg ='+$("#sg").val();//关闭压力等级SG
			savestr+='&leakage ='+$("#leakage").text();//泄漏等级
			savestr+='&aq='+$("#aq").val();
		}else if(type==6){//调节阀2
			
			
				savestr+='&diameter='+$("#diameter").text();//	主阀压力等级
				savestr+='&cpressure='+$("#cpressure").text();//	主阀压力等级
				savestr+='&fend='+$("#fend").text();//	主阀连接方式
				savestr+='&apps='+$("#apps").text();//	主阀设计压力
				savestr+='&struclen='+$("#struclen").text();//	主阀结构长度
				savestr+='&iprbpu='+$("#iprbpu").text();//	主阀入口压力范围
				savestr+='&fgas='+$("#fgas").text();//	主阀适用介质
				savestr+='&temprange='+$("#temprange").text();	//	主阀工作温度范围
				savestr+='&fheart='+$("#fheart").text();//阀芯型式
				savestr+='&oldfeatures='+$("#oldfeatures").text();//固有流量特性
				savestr+='&trip='+$("#trip").text();//trip//额定行程
				savestr+='&cv='+$("#cv").text();//cv//额定流量系数cv
				savestr+='&fbody='+$("#fbody").text();//fbody//阀体材质
				savestr+='&mfbody='+$("#mfbody").text();//mfbody//密封材质
				savestr+='&allowdvalue='+$("#allowdvalue").text();//allowdvalue//允许压差
				savestr+='&structure='+$("#structure").text();//structure//结构型式
				savestr+='&voltage='+$("#voltage").text();//voltage//供电电压
				savestr+='&protecttype='+$("#protecttype").text();//protecttype//防护型式
				savestr+='&insignal='+$("#insignal").text();//insignal//输入信号范围
				if($('#fixed').attr('checked')){
					savestr+='&fixed=1';//fixed//定位器--1有，2无	
				}else{
					savestr+='&fixed=0';//fixed//定位器--1有，2无
				}
				savestr+='&jdrank='+$("#jdrank").text();//jdrank//精度等级
				savestr+='&basedvalue='+$("#basedvalue").text();//basedvalue//基本误差
				savestr+='&returndvalue='+$("#returndvalue").text();//returndvalue//回差
				savestr+='&diearea='+$("#diearea").text();//diearea//死区
				savestr+='&tripdvalue='+$("#tripdvalue").text();//tripdvalue//额定行程偏差
				savestr+='&leakage ='+$("#leakage").text();//泄漏等级
		}
		
		
	var url=ctx+"/reportTec/report-tec!saveToJson.htm";
	$.webAjax({
		type:'post',
		url:url,
		data:savestr,
		success: function(data)
		{
		data = $.parseJSON(data);
		
			if(data.resultInfo[0]=="0")
			{
			alert(data.resultInfo[1]);		
		//	$('#checktec').css("display","none");
			location.reload();
			}else{
			alert(data.resultInfo[1]);
			}		
		}
	})
	
	
}


function loadzj(type){
	

	var url=ctx+"/baseItem/base-item!showBySnzj.htm";
	$.webAjax({
		type:'post',
		url:url,
		data:'baseItemQuery.itemsn='+$('#serial').text()+'&baseItemQuery.orderfbillno='+orderfbillno+'&baseItemQuery.itemcode='+itemcode,
		success: function(data)
		{
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0")
			{
				var model = data.model;
				if(type==6){//type6:调节阀2
					$("#cpressure").text(model.f107==null?"":model.f107);	//	主阀压力等级
					$("#fend").text(model.f119==null?"":model.f119);	//	主阀连接方式
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#diameter").text(icitemDesign.fdn==null?"":icitemDesign.fdn);	//	公称直径
						$("#apps").text(icitemDesign.allowpresure==null?"":icitemDesign.allowpresure);	//	主阀设计压力
						$("#struclen").text(icitemDesign.structlen==null?"":icitemDesign.structlen);	//	主阀结构长度
						$("#iprbpu").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	主阀入口压力范围
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text(icitemDesign.otemprange==null?"":icitemDesign.otemprange);	//	主阀工作温度范围
						
						$("#fheart").text(icitemDesign.fheart==null?"":icitemDesign.fheart);//阀芯型式
						$("#oldfeatures").text(icitemDesign.oldfeatures==null?"":icitemDesign.oldfeatures);//固有流量特性
						$("#trip").text(icitemDesign.trip==null?"":icitemDesign.trip);//trip//额定行程
						$("#cv").text(icitemDesign.cv==null?"":icitemDesign.cv);//cv//额定流量系数cv
						$("#fbody").text(icitemDesign.fbody==null?"":icitemDesign.fbody);//fbody//阀体材质
						$("#mfbody").text(icitemDesign.mfbody==null?"":icitemDesign.mfbody);//mfbody//密封材质
						$("#allowdvalue").text(icitemDesign.allowdvalue==null?"":icitemDesign.allowdvalue);//allowdvalue//允许压差
						$("#structure").text(icitemDesign.structtype==null?"":icitemDesign.structtype);//structure//结构型式
					//	$("#voltage").text(icitemDesign.voltage==null?"":icitemDesign.voltage);//voltage//供电电压
					//	$("#protecttype").text(icitemDesign.protecttype==null?"":icitemDesign.protecttype);//protecttype//防护型式
					//	$("#insignal").text(icitemDesign.insignal==null?"":icitemDesign.insignal);//insignal//输入信号范围
					//	$("#fixed").text(icitemDesign.fixed==null?"":icitemDesign.fixed);//fixed//定位器--1有，2无
						$("#fixed").attr("checked", true);
					/*	if(icitemDesign.fixed){
							if(icitemDesign.fixed==1){
								$("#fixed").attr("checked", true);
							}else{
								$("#unfixed").attr("checked", true);
							}
						}
						*/
						$("#jdrank").text(icitemDesign.jdrank==null?"":icitemDesign.jdrank);//jdrank//精度等级
						$("#basedvalue").text(icitemDesign.basedvalue==null?"":icitemDesign.basedvalue);//basedvalue//基本误差
						$("#returndvalue").text(icitemDesign.returndvalue==null?"":icitemDesign.returndvalue);//returndvalue//回差
						$("#diearea").text(icitemDesign.diearea==null?"":icitemDesign.diearea);//diearea//死区
						$("#tripdvalue").text(icitemDesign.tripdvalue==null?"":icitemDesign.tripdvalue);//tripdvalue//额定行程偏差
						
					}else{
						
						$("#apps").text("");	//	主阀设计压力
						$("#struclen").text("");	//	主阀结构长度
						$("#iprbpu").text("");	//	主阀入口压力范围
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text("");	//	主阀工作温度范围
						
						$("#fheart").text("");//阀芯型式
						$("#oldfeatures").text("");//固有流量特性
						$("#trip").text("");//trip//额定行程
						$("#cv").text("");//cv//额定流量系数cv
						$("#fbody").text("");//fbody//阀体材质
						$("#mfbody").text("");//mfbody//密封材质
						$("#allowdvalue").text("");//allowdvalue//允许压差
						$("#structure").text("");//structure//结构型式
					//	$("#voltage").text("");//voltage//供电电压
					//	$("#protecttype").text("");//protecttype//防护型式
					//	$("#insignal").text("");//insignal//输入信号范围
					//	$("#fixed").text("");//fixed//定位器--1有，2无
						$("#jdrank").text("");//jdrank//精度等级
						$("#basedvalue").text("");//basedvalue//基本误差
						$("#returndvalue").text("");//returndvalue//回差
						$("#diearea").text("");//diearea//死区
						$("#tripdvalue").text("");//tripdvalue//额定行程偏差
					}	

				}else if(type==4){//type:直接调压器
					$("#inletdn").text(model.f106==null?"":model.f106);	//	主阀入口公称尺寸
					$("#outletdn").text(model.f108==null?"":model.f108);	//	主阀出口公称尺寸
					$("#cpressure").text(model.f107==null?"":model.f107);	//	主阀压力等级
					$("#fend").text(model.f119==null?"":model.f119);	//	主阀连接方式
					$("#orificesize").text(model.f116==null?"":model.f116);	//	主阀阀口尺寸
					
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#apps").text(icitemDesign.allowpresure==null?"":icitemDesign.allowpresure);	//	主阀设计压力
						$("#iprbpu").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	主阀入口压力范围
					//	$("#mindifference").text(icitemDesign.mindifference==null?"":icitemDesign.mindifference);	//	主阀最小进出口压差
						$('#zfpress').text(icitemDesign.fpds==null?"":icitemDesign.fpds);//---设定压力
						
						$("#maxopc").text(icitemDesign.pressmax==null?"":icitemDesign.pressmax);	//	皮膜腔最大工作压力
						
						$("#struclen").text(icitemDesign.structlen==null?"":icitemDesign.structlen);	//	主阀结构长度
						$("#structype").text(icitemDesign.structtype==null?"":icitemDesign.structtype);	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text("-20/60");	//	主阀工作温度范围
						$("#maxdifferent").text(icitemDesign.chambermax==null?"":icitemDesign.chambermax);	//	主阀皮膜最大压差
						
						var restr=showH50();//返回AC,SG,SZ-----直接接调压器
						var realvalue=restr.split(",");
						$("#ac").val(realvalue[0]);	//	稳压精度AC
						$("#sg").val(realvalue[1]);	//	关闭压力等级SG
						$("#sz").val(realvalue[2]);	//	关闭压力区等级SZ
						$("#leakage").text("VI");	//	泄漏等级
						
					}else{
						$("#apps").text("");	//	主阀设计压力
						$("#iprbpu").text("");	//	主阀入口压力范围
						$("#mindifference").text("");	//	主阀最小进出口压差
						$("#maxopc").text("");	//	皮膜腔最大工作压力
						
						$("#struclen").text("");	//	主阀结构长度
						$("#structype").text("");	//	主阀结构类型
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#temprange").text("-20/60");	//	主阀工作温度范围
						$("#maxdifferent").text("");	//	主阀皮膜最大压差
						
						$("#ac").val("");	//	稳压精度AC
						$("#sz").val("");	//	关闭压力区等级SZ
						$("#sg").val("");	//	关闭压力等级SG
						$("#leakage").text("");	//	泄漏等级

					}
					
					
					
					
				}else if(type==5){//type:资料10
					
					$("#cpressure").text(model.f107==null?"":model.f107);	//	主阀压力等级
					$("#fend").text(model.f119==null?"":model.f119);	//	主阀连接方式
					$("#orificesize").text(model.f116==null?"":model.f116);	//	主阀阀口尺寸
					
					var icitemDesign=null;
					icitemDesign=model.icitemDesign;
					if(icitemDesign!=null){
						$("#diameter").text(icitemDesign.fdn==null?"":icitemDesign.fdn);	//	公称直径
						$("#apps").text(icitemDesign.allowpresure==null?"":icitemDesign.allowpresure);	//	主阀设计压力
						$("#struclen").text(icitemDesign.structlen==null?"":icitemDesign.structlen);	//	主阀结构长度
						$("#iprbpu").text(icitemDesign.fipr==null?"":icitemDesign.fipr);	//	主阀入口压力范围
						$("#structype").text(icitemDesign.structtype==null?"":icitemDesign.structtype);	//	主阀结构类型
						$("#oprwdss").text(icitemDesign.fopr==null?"":icitemDesign.fopr);	//	主阀出口压力范围
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#mindifference").text(icitemDesign.mindifference==null?"":icitemDesign.mindifference);	//	主阀最小进出口压差
						$("#temprange").text(icitemDesign.otemprange==null?"":icitemDesign.otemprange);	//	主阀工作温度范围
						$("#maxopc").text(icitemDesign.pressmax==null?"":icitemDesign.pressmax);	//	皮膜腔最大工作压力
						$("#maxdifferent").text(icitemDesign.chambermax==null?"":icitemDesign.chambermax);	//	主阀皮膜最大压差
						
						$('#zfpress').text(icitemDesign.chambermax==null?"":icitemDesign.chambermax);//---设定压力
					//	$('#zfovervalue').text(icitemDesign.chambermax==null?"":icitemDesign.chambermax);//---超高压切断设定值
						
						$('#pilotpressrange').text(icitemDesign.setpressure==null?"":icitemDesign.setpressure);//---设定压力范围
						$('#overrange').text(icitemDesign.soverpressure==null?"":icitemDesign.soverpressure);//---超高压切断范围

						
						var orderproduct=model.orderproduct;
						if(orderproduct!=null){
							$("#pilotsetpressure").val(orderproduct.outpressure==null?"":orderproduct.outpressure);//设定压力
							$("#overpressval").val(orderproduct.morehighpressure==null?"":orderproduct.morehighpressure);//切断机构超高压切断设定值
							var restr=showzdy(orderproduct.outpressure);// AC，SG，SZ
							var restrvalue=restr.split(",");
							$("#ac").val(restrvalue[0]);
							$("#aq").val(restrvalue[0]);
							$("#sg").val(restrvalue[1]);
							$("#sz").val(restrvalue[2]);
							
						}else{
							$("#pilotsetpressure").val("");////设定压力
							$("#overpressval").val("");	//	切断机构超高压切断设定值
							$("#ac").val("");
							$("#aq").val("");
							$("#sg").val("");
							$("#sz").val("");
						}
						
						$("#cgval").text(icitemDesign.fcg==null?"":icitemDesign.fcg);	//	主阀流量系数Cg
						$("#resetdifferent").text(icitemDesign.resetdifferent==null?"":icitemDesign.resetdifferent);//复位压差	
					}else{
						$("#diameter").text("");	//	公称直径
						$("#apps").text("");	//	主阀设计压力
						$("#struclen").text("");	//	主阀结构长度
						$("#iprbpu").text("");	//	主阀入口压力范围
						$("#structype").text("");	//	主阀结构类型
						$("#oprwdss").text("");	//	主阀出口压力范围
						$("#fgas").text("天然气");	//	主阀适用介质
						$("#mindifference").text("");	//	主阀最小进出口压差
						$("#temprange").text("");	//	主阀工作温度范围
						$("#maxopc").text("");	//	皮膜腔最大工作压力
						$("#maxdifferent").text("");	//	主阀皮膜最大压差
						$('#zfpress').text("");//---设定压力
						$('#zfovervalue').text("");//---超高压切断设定值
						$('#zfpressrange').text("");//---设定压力范围
						$('#zfoverrange').text("");//---超高压切断范围
						$("#cgval").text("");	//	主阀流量系数Cg
						$("#resetdifferent").text("");//复位压差
					}
					
					$('#cnature').text("B");//性能等级
					$('#resptime').text("<1");//响应时间
					
					
				}		
				
				
			}else{
				alert(data.resultInfo[1]);
			}	
		}
	})

	
	
	
	
	
}



/**
 * 
 * @param outpress 出口压力
 * @return
 */
function showzdy(outpress){//返回中低压调压器的 AC，SG，SZ---高压出厂资料（切断直接调压一体式）10
	
	if(outpress){
	
		if(outpress>=1.7&&outpress<3){
			return "10,"+"20,"+"10";
		}else if(outpress>=3&&outpress<8){
			return "10,"+"15,"+"10";
		}else if(outpress>=8&&outpress<100){
			return "5,"+"10,"+"10";
		}else if(outpress>=100&&outpress<250){
			return "2.5,"+"5,"+"10";
		}
	}	
/*
 * 出口压力范围	稳压精度	 关闭压力等级	 关闭压力区等级
	1.7~3 Kpa	AC10	 SG20			SZ10
	3~8 Kpa  	AC10	 SG15			SZ10
	8~100 Kpa	AC5	     SG10			SZ10
	100~250 Kpa	AC2.5	 SG5 			SZ10 
 */	
}

/**
 * 获取切断执行机构，性能参数
 * @param overpress  超高压设定值
 * @return
 */
function showqd(overpress){//根据超高压设定值返回性能参数--复位差压，AG切断精度
	
	if(overpress){
		if(overpress<1){
			return "20,"+"5";
		}else if(overpress>=1&&overpress<6){
			return "10,"+"2";
		}else if(overpress>=6&&overpress<20){
			return "10,"+"1";
		}else if(overpress>=20&&overpress<=90){
			return "20,"+"1";
		}
	}	
	/*
	 * 执行机构类型	最大允许压力		复位差压		超高压范围	AG最小
			AE201	1				0.2Pd		28mbar-1bar	  5
			AE202	50				0.1 Pd		1bar-6bar	  2
			AE203	100				0.1 Pd		6bar-20bar	  1
			AE204	100				0.2 Pd		20bar-90bar	  1

	 */
	
}

/**
 * 获取指挥器性能参数
 * @param outpress 出口压力
 * @return
 */
function showzhq(outpress){//根据指挥器出口压力返回参数--稳压精度，关闭压力等级,关闭压力区等级
	
	if(outpress){
		if(outpress>=0.02&&outpress<0.1){
			return "2.5,"+"10,"+"10";
		}else if(outpress>=0.1&&outpress<1){
			return "2.5,"+"10,"+"10";
		}else if(outpress>=1&&outpress<4){
			return "2.5,"+"10,"+"10";
		}else if(outpress>=4&&outpress<60){
			return "1,"+"5,"+"5";
		} 
	}	
	/*
	 * 出口压力范围		稳压精度		关闭压力等级		关闭压力区等级
		0.02-0.1 bar	AC2.5		SG10			SZ10
		0.1-1 bar		AC2.5		SG10			SZ10
		1-4 bar			AC2.5		SG10			SZ10
		4-60 bar		AC1			SG5				SZ5 
	 */
}

function showH50(){//获取H50调压器的性能参数,AC,SG,SZ

	return "10,"+"20,"+"20"; 
	//AC10	SG20	SZ20
}

//-----------------------------
var unsavetecid;
function unsavetec(){//反审，删除技术参数
	
	if(!confirm("是否确认反审？！！")){
		return false;
	}
	
	var url=ctx+"/reportTec/report-tec!deleteToJson.htm";
	$.webAjax({
		type:'post',
		url:url,
		data:'checkedIdList[0]='+unsavetecid,
		success: function(data)
		{
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0")
			{
				alert(data.resultInfo[1]);	
				location.reload();
			}else{
				alert(data.resultInfo[1]);	
			}
		}
	})
	
	
	
}






/*	
$("#id").val(model.id==null?"":model.id);	//	id
$("#tplid").val(model.tplid==null?"":model.tplid);	//	报告模板id
$("#reportid").val(model.reportid==null?"":model.reportid);	//	reportid
$("#mtv").val(model.mtv==null?"":model.mtv);	//	主阀型号
$("#ccode").val(model.ccode==null?"":model.ccode);	//	主阀部件代码
$("#inletdn").val(model.inletdn==null?"":model.inletdn);	//	主阀入口公称尺寸
$("#outletdn").val(model.outletdn==null?"":model.outletdn);	//	主阀出口公称尺寸
$("#orificesize").val(model.orificesize==null?"":model.orificesize);	//	主阀阀口尺寸
$("#apps").val(model.apps==null?"":model.apps);	//	主阀设计压力
$("#iprbpu").val(model.iprbpu==null?"":model.iprbpu);	//	主阀入口压力范围
$("#oprwdss").val(model.oprwdss==null?"":model.oprwdss);	//	主阀出口压力范围
$("#mindifference").val(model.mindifference==null?"":model.mindifference);	//	主阀最小进出口压差
$("#maxopc").val(model.maxopc==null?"":model.maxopc);	//	皮膜腔最大工作压力
$("#cpressure").val(model.cpressure==null?"":model.cpressure);	//	主阀压力等级
$("#fend").val(model.fend==null?"":model.fend);	//	主阀连接方式
$("#struclen").val(model.struclen==null?"":model.struclen);	//	主阀结构长度
$("#structype").val(model.structype==null?"":model.structype);	//	主阀结构类型
$("#fgas").val(model.fgas==null?"":model.fgas);	//	主阀适用介质
$("#temprange").val(model.temprange==null?"":model.temprange);	//	主阀工作温度范围
$("#maxdifferent").val(model.maxdifferent==null?"":model.maxdifferent);	//	主阀皮膜最大压差
$("#cgval").val(model.cgval==null?"":model.cgval);	//	主阀流量系数Cg
$("#pilottype").val(model.pilottype==null?"":model.pilottype);	//	指挥器型号
$("#pilotcode").val(model.pilotcode==null?"":model.pilotcode);	//	指挥器部件代码
$("#pilotmaxpress").val(model.pilotmaxpress==null?"":model.pilotmaxpress);	//	指挥器最大进口压力
$("#pilotpressrange").val(model.pilotpressrange==null?"":model.pilotpressrange);	//	指挥器设定压力范围
$("#pcmaxpress").val(model.pcmaxpress==null?"":model.pcmaxpress);	//	指挥器皮膜腔最大工作压力
$("#pilotsetpressure").val(model.pilotsetpressure==null?"":model.pilotsetpressure);	//	指挥器设定压力
$("#cuttype").val(model.cuttype==null?"":model.cuttype);	//	切断机构型号
$("#cutcode").val(model.cutcode==null?"":model.cutcode);	//	切断机构部件代码
$("#overrange").val(model.overrange==null?"":model.overrange);	//	切断机构超高压切断范围
$("#underrange").val(model.underrange==null?"":model.underrange);	//	切断机构超低压切断范围
$("#cmaxpress").val(model.cmaxpress==null?"":model.cmaxpress);	//	切断机构皮膜腔最大工作压力
$("#cnature").val(model.cnature==null?"":model.cnature);	//	切断机构性能等级
$("#overpressval").val(model.overpressval==null?"":model.overpressval);	//	切断机构超高压切断设定值
$("#underpressval").val(model.underpressval==null?"":model.underpressval);	//	切断机构超低压切断设定值
$("#resptime").val(model.resptime==null?"":model.resptime);	//	切断机构响应时间
$("#ac").val(model.ac==null?"":model.ac);	//	稳压精度AC
$("#sz").val(model.sz==null?"":model.sz);	//	关闭压力区等级SZ
$("#sg").val(model.sg==null?"":model.sg);	//	关闭压力等级SG
$("#leakage").val(model.leakage==null?"":model.leakage);	//	泄漏等级
$("#aq").val(model.aq==null?"":model.aq);	//	切断精度等级
$("#resetdifferent").val(model.resetdifferent==null?"":model.resetdifferent);	//	复位压差
*/


