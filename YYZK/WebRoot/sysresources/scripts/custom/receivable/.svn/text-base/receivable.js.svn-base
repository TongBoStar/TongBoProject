/**
 * 添加2015年4月前应收款信息JS
 */

/**
 * 1默认加载50行
 */
var a = 0;
function load(num){
	var html='';
	for(var i = 0 ;i <num ;i++){
	html+='<tr align="center" id="tr'+a+'">';
	//行号
	html+='<td>'+(a+1)+'<input name = "pids" value="" id = "" type="hidden"/></td>';
	html+='<td ><input name="entity.fcontractnos"  id="fcontractno'+a+'" value="" class="inputall" style="width:97%;" onkeyup="enterCheck('+a+');" onclick="enterCheck('+a+');" /><div id="itemcodeDiv'+a+'" class="ordernodiv" style="position:absolute;width: 300px;height: 160px;background: #ccc;display: none; "><table><tbody id="selectsbody'+a+'"></tbody></table></div></td>';

	html+='<td><input name="entity.fordernos" id="forderno'+a+'" value="" class="inputall" style="border:0px;width:95%;" readonly="readonly"  /></td>';
	html+='<td><input name="entity.fanaitems"  id="fanaitem'+a+'" value="" class="inputall" style="border:0px;width:95%;" readonly="readonly"/></td>';
	html+='<td><input name="entity.forderdates" id="forderdate'+a+'" value=""  class="inputall" style="border:0px;width:95%;" readonly="readonly"/></td>';
	html+='<td><input name="entity.forderamountfors" id="forderamountfor'+a+'" value=""  class="inputall" style="border:0px;width:95%;" readonly="readonly"/></td>';
	html+='<td><input name="entity.fempnames" id="fempname'+a+'" value=""  class="inputall" style="border:0px;width:95%;"  readonly="readonly" /><input name="entity.fempids" id="fempid'+a+'"   value="" type="hidden"/></td>';
	
	html+='<td><input name="entity.fcurempnames" id="fcurempname'+a+'" value=""  class="inputall" style="width:95%;" onkeyup="toAddExamineUser('+a+');" onclick="toAddExamineUser('+a+');" /><input name="entity.fcurempids" id="fcurempid'+a+'"   value="" type="hidden"/>'
	+'<input name="entity.salemids" id="salemid'+a+'"   value="" type="hidden"/>'
	+'<input name="entity.amanagerids" id="amanagerid'+a+'"   value="" type="hidden"/>'
	+'<div id="selectExamineUserDiv'+a+'" class="empnamediv"    style="background-color: #eee;width: 180px;height: 120px;position: absolute;overflow: auto;display: none;padding: 5px;">'
	+'<table><tbody id="selectExamineUser'+a+'"></tbody></table>'+
	+'</div></td>';
	//html+='<td><input name="entity.fdates" id="fdate'+a+'" value=""  class="inputall" style="width:95%;" onfocus="WdatePicker({dateFmt:\'yyyyMM\'})" /></td>';
	html+='<td><input name="entity.fdates" id="fdate'+a+'" value=""  class="inputall" style="width:95%;" onclick="WdatePicker({dateFmt:\'yyyy年 MM季度\',  disabledDates:[\'....-0[5-9]-..\',\'....-1[0-2]-..\'], startDate:\'%y-01-01\' })" /></td>';
	
	
	html+='<td align="center"><input name="entity.fexchangeamounts" id="fexchangeamount'+a+'"   value="" class="inputall" style="width:95%;"  onkeyup="mathpersonalprize('+a+');"   /> </td>';
	html+='<td><input name="entity.personalpercents" id="personalpercent'+a+'" value=""  class="inputall" style="border:0px;width:95%;" readonly="readonly" />'
	+'<input name="entity.salempersonalpercents" id="salempersonalpercent'+a+'"   value="" type="hidden"/>'
	+'<input name="entity.amanagerpersonalpercents" id="amanagerpersonalpercent'+a+'"   value="" type="hidden"/></td>';
	html+='<td><input name="entity.personalprizes" id="personalprize'+a+'" value=""  class="inputall" style="border:0px;width:95%;" readonly="readonly" />'
	+'<input name="entity.salempersonalprizes" id="salempersonalprize'+a+'"   value="" type="hidden"/>'
	+'<input name="entity.amanagerpersonalprizes" id="amanagerpersonalprize'+a+'"   value="" type="hidden"/></td>';
	html+='<td ><a href="javascript:delABC('+a+');" >删除</a></td>';
	html+='</tr>';
	a++;
	}
	$("#pagecontent").append(html);
}
/**
 * 2销售订单弹出模糊查询框
 */
function enterCheck(i){
	search(i);
}
/**
 * 3当键盘抬起时搜索输入的销售订单号
 */
function search(i){
	$("#itemcodeDiv"+i).css("display","");
	//var code = $("#forderno"+i).val();
	var code = $("#fcontractno"+i).val();
	var html='<td><select id="selectCode'+i+'" onchange="changeCode('+i+');" style="width: 280px; height: 147px;background-color: #ccc;" multiple="true">';
	//var data = 'sysOrderQuery.orderCode='+code;
	var data = 'sysOrderQuery.contractCode='+code;
	var url =ctx+'/system/listSysOrders.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
							 		data = $.parseJSON(data);
									var list = data.sysOrderList;
									if(list.length==0){
										alert("无此编号请重新输入");
										$("#forderno"+i).attr("value","");
									}
									$.each(list,function(i,o){
										//var stringObj=o.orderCode; 
										var stringObj=o.contractCode; 
										var stringId=o.sysOrderId; 
										//替换错别字“终古”为“中国” 
										//并返回替换后的新字符 
										//原字符串stringObj的值没有改变 
										//var newstr=stringObj;
										//var newstr=stringObj.replace("/","XXX"); 
//										newstr=newstr.replace("-","YYY"); 
//										newstr=newstr.replace("-","YYY"); 
										//newstr=replaceAll(newstr,"/","XXX");
										//newstr=replaceAll(newstr,"-","YYY");
										
										html+='<option value="'+stringId+'" >'+stringObj+'|'+o.orderCode+'|'+o.checkProject+'|'+o.contractTimeString+'|'+o.totalFee+'|'+o.businessUser+'|'+o.businessUserId+'|'+'</option>';// 
										//html+='<option value="'+stringId+'" >'+stringObj+'|'+o.contractCode+'|'+o.checkProject+'|'+o.contractTimeString+'|'+o.totalFee+'|'+o.businessUser+'|'+o.businessUserId+'|'+'</option>';// 
										//html+='<option value="'+o.orderCode+'" >'+o.orderCode+'|'+o.contractCode+'|'+o.checkProject+'|'+o.contractTimeString+'|'+o.totalFee+'|'+o.businessUser+'|'+o.businessUserId+'|'+'</option>';//
									});
							html+='</select></td>';
							//alert("html:"+html);
							$('#selectsbody'+i).html(html);
					}
		});	
}
function replaceAll(obj,str1,str2){
	//alert(eval("/"+str1+"/gi"));
    var result  = obj.replace(eval("/"+str1+"/gi"),str2); 
    //alert(result);
    //result= result.replace(str1+"/gi",str2);
    //alert(result);
    return result;  
  }   
  
  
/**
 * 5选择模糊查询中的一个
 * @param i
 * @return
 */
function changeCode(i){
	//alert("0:");
	var sel = $("#selectCode"+i).val();
	//sel=sel.replace("/","XXX"); 
	//sel=replaceAll(sel,"-","YYY");
	//alert("sel1:"+sel);
	//alert("$('#selectCode'+i).find('option:[value='+sel+']'):"+$('#selectCode'+i).find('option:[value='+sel+']') );
	var txt = $('#selectCode'+i).find('option:[value='+sel+']').text();
	//alert("sel2:"+sel);
	//alert("txt:"+txt);
	/*//订单号
	var fordernostr=txt.toString().split('|')[0];
	$("#forderno"+i).attr("value",fordernostr);
	//合同号 	核算项目 	订单日期 	订单金额 	业务员 
	var fcontractnostr=txt.toString().split('|')[1];
	$("#fcontractno"+i).attr("value",fcontractnostr);*/
	
	//新需求改为合同号
	var fcontractnostr=txt.toString().split('|')[0];
	$("#fcontractno"+i).attr("value",fcontractnostr);
	 
	var fordernostr=txt.toString().split('|')[1];
	$("#forderno"+i).attr("value",fordernostr);
	
	
	$("#fanaitem"+i).attr("value",txt.toString().split('|')[2]);
	$("#forderdate"+i).attr("value",txt.toString().split('|')[3]);
	$("#forderamountfor"+i).attr("value",txt.toString().split('|')[4]);
	$("#fempname"+i).attr("value",txt.toString().split('|')[5]);
	$("#fempid"+i).attr("value",txt.toString().split('|')[6]);
	//当前负责人信息
	$("#fcurempname"+i).attr("value",txt.toString().split('|')[5]);
	$("#fcurempid"+i).attr("value",txt.toString().split('|')[6]);
	//查询当前负责人的上级销售经理和区域经理信息
	getCurempSuperInfo(i,txt.toString().split('|')[5],txt.toString().split('|')[6]);
	
	$("#itemcodeDiv"+i).css("display","none");
}
/**
 * 获取当前行的上级销售经理和区域经理
 */
function getCurempSuperInfo(i,curempname,curempid){
	var data = 'adminQuery.adminName='+curempname;
	var url =ctx+'/system/findAdminById.htm';
	var salemid='';
	var amanagerid ='';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
 			data = $.parseJSON(data);
			var list = data.adminList;
			if(null==list||list.length==0){
			}else{
				if(null==list[0].salemid||''==list[0].salemid||'null'==list[0].salemid||'NULL'==list[0].salemid){
					
				}else{
					salemid=list[0].salemid;
				}
				if(null==list[0].amanagerid||''==list[0].amanagerid||'null'==list[0].amanagerid||'NULL'==list[0].amanagerid){
					
				}else{
					amanagerid =list[0].amanagerid;
				}
				curempid=list[0].adminId;
			}
			//
			showCurempSuperInfo(i,curempname,curempid,salemid,amanagerid);
		}
	});	
}
/**
 * 显示当前负责人的上级销售经理和区域经理信息
 */
function showCurempSuperInfo(i,curempname,curempid,salemid,amanagerid){
	//同时查询选择的业务员的个人比例
	var data = 'saleRatioQuery.saleid='+curempid+'&saleRatioQuery.salename='+curempname;
	$.webAjax({
		type : "post",
		url : ctx+'/saleRatio/sale-ratio!listToQuery.htm',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.saleRatioList;
			if(null==list||list.length==0){
				//alert("当前负责人的个人比例信息 不能为空!");
				//$('#fcurempname'+i).val('');
				$('#personalpercent'+i).val('');
				$('#personalprize'+i).val('');
				//return false;
			}
			$('#personalpercent'+i).val(list[0].saleratio);
			//计算当前负责人的业绩奖
			//业绩奖=回款额*0.3%*个人比例
			var fexchangeamount=$('#fexchangeamount'+i).val();
			var personalprize=(Number( (  fexchangeamount*0.003*list[0].saleratio*0.01 ).toFixed(4) )  );
			//alert("curempname:"+curempname);
			if(null!=curempname && "钟俊武"==curempname){
				//钟俊武 的 奖励比例 0.25%
				//alert("当前负责人钟俊武");
				personalprize=(Number( (  fexchangeamount*0.025*list[0].saleratio*0.01 ).toFixed(4) )  );
			}
			$('#personalprize'+i).val(personalprize);
			//销售经理个人比例和业绩奖
			if(null==salemid||''==salemid||'null'==salemid){
			} else{
				$('#salempersonalpercent'+i).val(list[0].smratio);
				var salempersonalprize=(Number( (  fexchangeamount*0.003*list[0].smratio*0.01 ).toFixed(4) )  );
				$('#salempersonalprize'+i).val(salempersonalprize);
			}
			//区域经理个人比例和业绩奖
			if(null==amanagerid||''==amanagerid||'null'==amanagerid){
			}else{ 
				$('#amanagerpersonalpercent'+i).val(list[0].szmpratio);
				var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*list[0].szmpratio*0.01 ).toFixed(4) )  );
				$('#amanagerpersonalprize'+i).val(amanagerpersonalprize);
			}
		}
	});	
	//$('#fcurempname'+i).val(curempname);
	//$('#fcurempid'+i).val(curempid);
	//同时设置当前负责任人的销售经理id和区域经理id
	$('#salemid'+i).val(salemid);
	$('#amanagerid'+i).val(amanagerid);
	///$("#selectExamineUserDiv"+i).css("display","none");
}
/**
 * 6删除当前行
 * @param i
 * @return
 */
function delABC(i){
	$("#tr"+i).remove();
}
/**
 * 7保存操作
 * @param i
 * @return
 */
function saveAll(){
	var fordernoslist = $('input[name="entity.fordernos"]');
	var sq = 0;
	for(var a = 0;a<fordernoslist.length;a++){
		if($(fordernoslist[a]).val() != "" && $(fordernoslist[a]).val() != null){
			sq++;
		}
	}
	if(0==sq){
    	alert("请选择订单号!");
		return;
    }
	//当前负责人 	
	var fcurempnameslist = $('input[name="entity.fcurempnames"]');
	//回款月份 	
	var fdateslist = $('input[name="entity.fdates"]');
	//回款金额(元)
	var fexchangeamountslist = $('input[name="entity.fexchangeamounts"]');
	for(var i=0;i<fordernoslist.length;i++){
		if(($.trim(fordernoslist.eq(i).val())!="") &&($.trim(fcurempnameslist.eq(i).val())=="") ){
			alert("当前负责人 不能为空!");
			return false;
		}
		else if(($.trim(fordernoslist.eq(i).val())!="") &&($.trim(fdateslist.eq(i).val())=="")){
			alert("回款月份不能为空!");
			return false;
		}
		else if(($.trim(fordernoslist.eq(i).val())!="") &&($.trim(fexchangeamountslist.eq(i).val())=="")){
			alert("回款金额(元)不能为空!");
			return false;
		}
	}
	//保存操作
	var formParam = $('#queryForm').serialize();
	var url = ctx+"/rpBill/rp-bill!saveRpBill.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam ,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0"){
				alert("保存成功!");
				window.location.href = ctx+"/receivable/rpbill.htm";
			}else{
				alert("保存失败");
			}
		}
	});
	
}

/**
 * 8弹出选择人列表
 */
function toAddExamineUser(ii){
	$("#selectExamineUserDiv"+ii).css("display","");
	var name = $("#fcurempname"+ii).val();
	var data = 'adminQuery.adminName='+name;
	var htmladminids='';
	var html='<td><select id="examineUserSelect'+ii+'" onchange="addExamineUser('+ii+');" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
	//html+='<option value="">人名|销售经理Id|区域经理Id</option>';
	var url ='/system/findListByDepart.htm';
	//var url =ctx+'/system/listfindAdmin.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			$.each(data,function(i,o){
				var tempAdminIdInfo=o.salemid+'@'+o.amanagerid;
				//html+='<option value="'+o.adminId+'" >'+o.adminName+'|'+o.salemid+'|'+o.amanagerid+'|'+'</option>';
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
				htmladminids+='<input  id="adminids'+ii+o.adminId+'" type="hidden" value="'+tempAdminIdInfo+'" />';
			});
			html+='</select></td>';
			
			html+='<td>'+htmladminids+'</td>';
			//alert("html:"+html);
			$('#selectExamineUser'+ii).html(html);
		}
	});	
 	//changeCode(ii);
}
/**
 * 9添加选择的人
 */
function addExamineUser(i){
	var selectValue = $('#examineUserSelect'+i).val();//option 中value的值
	//alert("selectValue:"+selectValue);
	
	var adminids = $('#adminids'+i+''+selectValue).val();//隐藏域中的值
	//alert("adminids:"+adminids);
	
	var saleid =selectValue.toString();
	//alert("saleid:"+saleid);
	
	var selectTxt = $("#examineUserSelect"+i).find('option:[value='+selectValue+']').text();//option 中value的值对应的选项值
	///alert("selectTxt:"+selectTxt);
	//判断选择的当前负责人的销售经理和区域经理是否存在
	//var salemid =selectTxt.toString().split('|')[1];
	var salemid =adminids.toString().split('@')[0];
	//alert("salemid:"+salemid);
	/**//**
	if(null==salemid||''==salemid||'null'==salemid){
		alert("当前选择的负责人的销售经理 不能为空!");
		return false;
	} 
	**/
	//var amanagerid =selectTxt.toString().split('|')[2];
	var amanagerid =adminids.toString().split('@')[1];
	//alert("amanagerid:"+amanagerid);
	/**//**
	if(null==amanagerid||''==amanagerid||'null'==amanagerid){
		alert("当前选择的负责人的区域经理 不能为空!");
		return false;
	} 
	**/
	//同时查询选择的业务员的个人比例
	//var data = 'saleRatioQuery.saleid='+selectValue+'&saleRatioQuery.salename='+selectTxt.toString().split('|')[0];
	//var data = 'saleRatioQuery.salename='+selectTxt.toString().split('|')[0];
	//alert("selectTxt.toString():"+selectTxt.toString());
	var data = 'saleRatioQuery.salename='+selectTxt.toString();
	$.webAjax({
		type : "post",
		url : ctx+'/saleRatio/sale-ratio!listToQuery.htm',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.saleRatioList;
			if(null==list||list.length==0){
				//alert("当前选择的负责人的个人比例信息 不能为空!");
				//$('#fcurempname'+i).val('');
				$('#personalpercent'+i).val('');
				$('#personalprize'+i).val('');
				//return false;
				$('#personalpercent'+i).val("0");
			}else{
				$('#personalpercent'+i).val(list[0].saleratio);
			}
			
			var personalpercent=$('#personalpercent'+i).val();//个人比例
			//alert("personalpercent:"+personalpercent);
			if(""==personalpercent||null==personalpercent||"null"==personalpercent){
				$('#personalpercent').val("0");
			}
			
			//计算当前负责人的业绩奖
			//业绩奖=回款额*0.3%*个人比例
			var fexchangeamount=$('#fexchangeamount'+i).val();
			//var personalprize=(Number( (  fexchangeamount*0.003*list[0].saleratio*0.01 ).toFixed(4) )  );
			var personalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
			if( null!=selectTxt.toString() && "钟俊武"==selectTxt.toString() ){
				//钟俊武 的 奖励比例 0.25%
				//alert("当前负责人钟俊武");
				personalprize=(Number( (  fexchangeamount*0.0025*personalpercent*0.01 ).toFixed(4) )  );
			}
			
			$('#personalprize'+i).val(personalprize);
			//销售经理个人比例和业绩奖
			if(null==salemid||''==salemid||'null'==salemid){
			} else{
				$('#salempersonalpercent'+i).val(list[0].smratio);
				//var salempersonalprize=(Number( (  fexchangeamount*0.003*list[0].smratio*0.01 ).toFixed(4) )  );
				var salempersonalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
				$('#salempersonalprize'+i).val(salempersonalprize);
			}
			//区域经理个人比例和业绩奖
			if(null==amanagerid||''==amanagerid||'null'==amanagerid){
			}else{ 
				$('#amanagerpersonalpercent'+i).val(list[0].szmpratio);
				//var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*list[0].szmpratio*0.01 ).toFixed(4) )  );
				var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
				$('#amanagerpersonalprize'+i).val(amanagerpersonalprize);
			}
		}
	});	
	
	$('#fcurempname'+i).val(selectTxt.toString());
	$('#fcurempid'+i).val(saleid);
	//同时设置当前负责任人的销售经理id和区域经理id
	$('#salemid'+i).val(salemid);
	$('#amanagerid'+i).val(amanagerid);
	
	/*$('#fcurempname'+i).val(selectTxt.toString().split('|')[0]);
	$('#fcurempid'+i).val(selectValue);
	//同时设置当前负责任人的销售经理id和区域经理id
	$('#salemid'+i).val(selectTxt.toString().split('|')[1]);
	$('#amanagerid'+i).val(selectTxt.toString().split('|')[2]);*/
	
	$("#selectExamineUserDiv"+i).css("display","none");
}
/**
 * 回款金额(元) 改变修改业绩奖
 * @return
 */
function mathpersonalprize(i){
	var fexchangeamount = $('#fexchangeamount'+i).val();// 回款金额(元)
	var personalpercent=$('#personalpercent'+i).val();//个人比例
	//alert("personalpercent:"+personalpercent);
	if(""==personalpercent||null==personalpercent||"null"==personalpercent){
		$('#personalpercent'+i).val("0");
	}
	var personalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
	var curempname=$('#fcurempname'+i).val(); 
	if(null!=curempname && "钟俊武"==curempname){
		//钟俊武 的 奖励比例 0.25%
		//alert("当前负责人钟俊武");
		personalprize=(Number( (  fexchangeamount*0.0025*personalpercent*0.01 ).toFixed(4) )  );
	}
	$('#personalprize'+i).val(personalprize);
	//销售经理
	var salempersonalpercent=$('#salempersonalpercent'+i).val();//销售经理个人比例
	var salempersonalprize=(Number( (  fexchangeamount*0.003*salempersonalpercent*0.01 ).toFixed(4) )  );
	$('#salempersonalprize'+i).val(salempersonalprize);
	//区域经理
	var amanagerpersonalpercent=$('#amanagerpersonalpercent'+i).val();//区域经理个人比例
	var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*amanagerpersonalpercent*0.01 ).toFixed(4) )  );
	$('#amanagerpersonalprize'+i).val(amanagerpersonalprize);
	
}
/**
 * 10点击空白处关闭模糊查询窗体
 * @return
 */
function closeDV(){
	$(".ordernodiv").css("display","none");
	$(".empnamediv").css("display","none");
}








