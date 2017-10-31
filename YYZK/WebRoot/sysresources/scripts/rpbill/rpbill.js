$(document).ready(function() {
			window.simpleTable =$(document).SimpleTable({
				id:'rppage',
				formId: 'queryForm',
				pageNo: '1',
				pageSize : '15',
				order: 'desc',
				orderBy: 't_rp_bill.fbillid',
				submitForm : submitForm//分页回调函数
				});	
			search();
});
function submitForm()
{
	search();
}
/**
 * 添加业务员
 */
function addBusinessUser(){
	var selectValue = $('#businessUserSelect').val();
	var selectTxt = $("#businessUserSelect").find('option:selected').text();
	$('#fcurempnameQuery').val(selectTxt);
	//$('#businessUserId').val(selectValue);
	$("#selectBusinessUserDiv").css("display","none");
}
/**
 * 弹出业务员列表
 */
function toAddBusinessUser(){
	$("#selectBusinessUserDiv").css("display","");
	var name = $("#fcurempnameQuery").val();//文本域输入值
	
	var data = 'adminQuery.adminName='+name;
	var html='<td><select id="businessUserSelect" onchange="addBusinessUser();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		html+='<option value="">----------</option>';
	//var url =ctx+'/system/adminList.htm';
	var url =ctx+'/system/findListByDepart.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			//data = $.parseJSON(data);
			//var list = data.adminList;
			$.each(data,function(i,o){
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
			});
			html+='</select></td>';
			$('#selectBusinessUser').html(html);
		}
	});	
}
function request(paras){ 
	var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {}  
	for (i=0; j=paraString[i]; i++){  
	paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
	return "";  
	}else{  
	return returnValue; 
	}
}
function search()
{
	var html='';
	var pageParam = simpleTable.bindPageParam();
	var formParam = $('#queryForm').serialize();
	var menuId = request("menuId");
	//alert("menuId:"+menuId);
	var menuidparam = request("menuidparam");
	if(null!=menuId&&""!=menuId){
		menuidparam =menuId;
	}
	//var url = ctx+"/rpBill/rp-bill!listToJson.htm";
	var url = ctx+'/rpBill/rp-bill!listToJson.htm?rpBillQuery.menuidparam='+menuidparam;
	//alert("url:"+url);
	$.webAjax( {
		type : "post",
		url : url,
		data:pageParam +'&'+formParam,
		success : function(data) {
		data = $.parseJSON(data);
		var page = data.page;
		$.refreshPageToolbar(page,"rppage",simpleTable);
			if(data.resultInfo[0]=='0')
			{
				/*var fexchangeamount=14246633.00;
				var personalprize=(Number( (  fexchangeamount*0.003*35*0.01 ).toFixed(3) )  );
				alert("personalprize:"+personalprize);
				
				var fexchangeamount2=577500;
				var personalprize2=(Number( (  fexchangeamount2*0.003*50*0.01 ).toFixed(3) )  );
				alert("personalprize2:"+personalprize2);
				
				var personalprize3=(Number( (  personalprize+personalprize2 ).toFixed(3) )  );
				alert("personalprize3:"+personalprize3);*/
				
				var editVal = true;//false
				var addVal = false;
				var delVal = true;//false
				var statisticVal = false;
				
				/**/$.each(data.menuOperatelist, function(i, o){
					
					if(o.functionName=='add()'){//  
						$('#addrpBillBtn').html(''+'<input type="button" value="添加" onclick="addRpbill();" class="btnall" />');
					}
					if(o.functionName=='edit()'){// 
						editVal = true;//编辑
					}
					editVal = true;//编辑
					if(o.functionName=='del()'){// 
						delVal = true;//删除
					}
					delVal = true;//删除
					if(o.functionName=='statistic()'){// 
						$('#statisticrpBillBtn').html(''+'<input type="button" value="统计" onclick="goRpbillstatistic();" class="btnall" />');
					}
			    });
				//加入权限控制
				var editrpBill = "";//列表页中 显示 修改 链接
				
				var addrpBill = "";//列表页中 显示 添加 链接
				var delrpBill = "";//列表页中 显示 删除 链接
				
				var splitrpBill = "";//列表页中  链接之间的分隔符
				
				var statisticrpBill = "";//列表页中 显示 统计 链接
				
				
				
				$.each(page.result,function(i,o){
					var countOptLink=0;
					if(editVal){
						editrpBill = '<a href="javascript:editrpBill('+o.fbillid+');">编辑</a>';
						countOptLink++;
					}
					if(delVal){
						countOptLink++;
						delrpBill = '<a href="javascript:del('+o.fbillid+');">删除</a></td>';
					}
					if(0<countOptLink){
						splitrpBill = "|";
					}
					
					html+='<tr align="center">';
					html+='<td width="30px;" >'+(i+1)+'</td>';
					html+='<td>'+(o.fcontractno==null?"":o.fcontractno)+'</td>';
					html+='<td>'+(o.forderno==null?"":o.forderno)+'</td>';
					var lname=(o.fanaitem==null?"":o.fanaitem);
					var sname = '';
					if(lname.length>4){
						sname=lname.substring(0,4);
					}else{
						sname=lname;
					}
					html+='<td><a data-rel="tooltip" href="javascript:void(0);" data-original-title="'+lname+'">'+sname+'</a></td>';
					html+='<td  >'+(o.forderdate==null?"":replaceNull(o.forderdateString))+'</td>';
					html+='<td>'+(o.forderamountfor==null?"":o.forderamountfor)+'</td>';
					html+='<td>'+(o.fcurempname==null?"":o.fcurempname)+'</td>';
					html+='<td>'+(o.fempName==null?"":o.fempName)+'</td>';
					html+='<td>'+(o.fdate==null?"":o.fdate)+'</td>';
					html+='<td>'+(o.fexchangeamount==null?"":o.fexchangeamount)+'</td>';
					html+='<td>'+(o.fratio==null?"":o.fratio)+'</td>';
					html+='<td>'+(o.famount==null?"":o.famount)+'</td>';
					
					html+='<td   >'+editrpBill+" "+delrpBill+'</td>';
					//html+='<td   ><a href="javascript:editrpBill('+o.fbillid+');">编辑</a>|<a href="javascript:del('+o.fbillid+');">删除</a></td>';
					  
					html+='</tr>';
				});
				$('#plantable').html(html);
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				//alert("html:"+html);
				//显示总金额
				var exchangeamount = data.resultInfo[2];
				//alert("exchangeamount:"+exchangeamount);
				$('#productPLCountShowTxt').val(exchangeamount+'');
				//奖励合计
				var awardamount = data.resultInfo[3];
				//alert("awardamount:"+awardamount);
				$('#awardamountShowTxt').val(awardamount+'');
			}
			closeblockdiv();
		}
	});
}
/**
 * 回款金额(元) 改变修改业绩奖
 * @return
 */
function mathpersonalprize(){
	var fexchangeamount = $('#fexchangeamount').val();// 回款金额(元)
	var personalpercent=$('#personalpercent').val();//个人比例
	//alert("personalpercent:"+personalpercent);
	if(""==personalpercent||null==personalpercent||"null"==personalpercent){
		$('#personalpercent').val("0");
	}
	var personalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
	var curempname=$('#fcurempname').val(); 
	if(null!=curempname && "钟俊武"==curempname){
		//钟俊武 的 奖励比例 0.25%
		//alert("当前负责人钟俊武");
		personalprize=(Number( (  fexchangeamount*0.0025*personalpercent*0.01 ).toFixed(4) )  );
	}
	$('#personalprize').val(personalprize);
	//销售经理
	var salempersonalpercent=$('#salempersonalpercent').val();//销售经理个人比例
	var salempersonalprize=(Number( (  fexchangeamount*0.003*salempersonalpercent*0.01 ).toFixed(4) )  );
	$('#salempersonalprize').val(salempersonalprize);
	//区域经理
	var amanagerpersonalpercent=$('#amanagerpersonalpercent').val();//区域经理个人比例
	var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*amanagerpersonalpercent*0.01 ).toFixed(4) )  );
	$('#amanagerpersonalprize').val(amanagerpersonalprize);
}
//添加事件
function addRpbill(){
	//添加跳转链接
	window.open(ctx+'/receivable/rpbill-add.htm');
}
//跳转到统计销售人员业绩奖数据列表
function goRpbillstatistic(){
	//添加跳转链接
	window.open('/receivable/rpbill-statistic.htm');
}
//编辑事件保存
function update()
{
	//校验操作
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
	var formParam = $('#rpbillForm').serialize();
	var url = ctx + "/rpBill/rp-bill!updateRpBill.htm";
	$.webAjax( {
		type : "post",
		url : url,
		data:formParam ,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=="0"){
				alert("保存成功!");
				closedesign();
				search();
			}else{
				alert("保存失败");
			}
		}
	});
}
//编辑事件
function editrpBill(fbillid){
	//显示要修改的信息
	$.webAjax({
		type : 'post',
		url : ctx + '/rpBill/rp-bill!input.htm?rpBillId='+fbillid,
		success : function(data) {
			data = $.parseJSON(data);
			var rpBillEntity = data.entity;//应收款实体
			
			$('#fbillid').val(fbillid);//隐藏域ID值
			$('#forderno').val(rpBillEntity.forderno);//订单号
			$('#fcontractno').val(rpBillEntity.fcontractno);//合同号
			
			$('#fanaitem').val(rpBillEntity.fanaitem);//核算项目
			$('#forderdate').val(rpBillEntity.forderdate);//订单日期
			var forderdate = rpBillEntity.forderdate;
			if(forderdate.indexOf("T") > 0 )
			{
				forderdate =forderdate.substring(0 ,forderdate.indexOf("T") );
				$('#forderdate').val(forderdate);//订单日期
			}
			$('#forderamountfor').val(rpBillEntity.forderamountfor);//订单金额
			$('#fempname').val(rpBillEntity.fempname);//业务员名
			$('#fempid').val(rpBillEntity.fempid);//业务员ID
			
			//alert("rpBillEntity.fcurempname"+rpBillEntity.fcurempname);
			$('#fcurempname').val(rpBillEntity.fcurempname);//当前业务员名
			
			$('#fcurempid').val(rpBillEntity.fcurempid);//当前业务员ID
			$('#fdate').val(rpBillEntity.fdate);//回款月份
			$('#fexchangeamount').val(rpBillEntity.fexchangeamount);//回款金额
			$('#personalpercent').val(rpBillEntity.fratio);//当前负责人比例
			$('#personalprize').val(rpBillEntity.famount);//当前负责人个人将金额
			//通过当前应收款实体的当前业务员名去显示其销售经理和区域经理比例信息
			getSuperSalePerFee(rpBillEntity.fcurempid,rpBillEntity.fcurempname,rpBillEntity.fexchangeamount);
		}
		
	});
	openDiv('designDiv');
}
//删除事件
function del(fbillid){
	var data = 'checkedIdList[0]='+fbillid;
	if(!confirm('确定删除吗？')) {
		return;
	}
	var url = '/rpBill/rp-bill!deleteRpBillInfo.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : data,
		success : function(data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				search();
			} else {
				alert('删除失败！');
			}
		}
	});
}
//关闭弹出的修改应收款信息
function closedesign(){
	$("#forderno").attr("value","");
	$("#fcontractno").attr("value","");
	$("#fanaitem").attr("value","");
	$("#forderdate").attr("value","");
	$("#forderamountfor").attr("value","");
	$("#fempname").attr("value","");
	$("#fempid").attr("value","");
	$("#fcurempid").attr("value","");
	$("#salemid").attr("value","");
	$("#amanagerid").attr("value","");
	$("#fdate").attr("value","");
	$("#fexchangeamount").attr("value","");
	$("#personalpercent").attr("value","");
	$("#salempersonalpercent").attr("value","");
	$("#amanagerpersonalpercent").attr("value","");
	$("#personalprize").attr("value","");
	$("#salempersonalprize").attr("value","");
	$("#amanagerpersonalprize").attr("value","");
	$.closeDiv('designDiv');
}
/**
 * 销售订单弹出模糊查询框
 */
function enterCheck(){
	searchOrder();
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
 * 当键盘抬起时搜索输入的销售订单号
 */
function searchOrder(){
	$("#itemcodeDiv").css("display","");
	//var code = $("#forderno").val();
	var code = $("#fcontractno").val();
	var html='<td><select id="selectCode" onchange="changeCode();" style="width: 280px; height: 147px;background-color: #ccc;" multiple="true">';
	var data = 'sysOrderQuery.contractCode='+code;
	//var data = 'sysOrderQuery.orderCode='+code;
	var url ='/system/listSysOrders.htm';
	 	$.webAjax({
					type : "post",
					url : url,
					data:data,
					success : function(data) {
							 		data = $.parseJSON(data);
									var list = data.sysOrderList;
									if(list.length==0){
										alert("无此编号请重新输入");
										$("#forderno").attr("value","");
									}
									$.each(list,function(i,o){
										//var stringObj=o.orderCode; 
										var stringObj=o.contractCode; 
										var stringId=o.sysOrderId; 
										//alert("stringId:"+stringId);
//										var newstr=stringObj.replace("/","XXX"); 
//										newstr=replaceAll(newstr,"-","YYY");
										//html+='<option value="'+stringId+'" >'+stringObj+'|'+o.contractCode+'|'+o.checkProject+'|'+o.contractTimeString+'|'+o.totalFee+'|'+o.businessUser+'|'+o.businessUserId+'|'+'</option>';//
										html+='<option value="'+stringId+'" >'+stringObj+'|'+o.orderCode+'|'+o.checkProject+'|'+o.contractTimeString+'|'+o.totalFee+'|'+o.businessUser+'|'+o.businessUserId+'|'+'</option>';//
										//  html+='<option value="'+o.orderCode+'" >'+o.orderCode+'|'+o.contractCode+'|'+o.checkProject+'|'+o.contractTimeString+'|'+o.totalFee+'|'+o.businessUser+'|'+o.businessUserId+'|'+'</option>';//
									});
							html+='</select></td>';
							$('#selectsbody').html(html);
					}
		});	
}
/**
 * 获取当前行的上级销售经理和区域经理
 */
function getCurempSuperInfo(curempname,curempid){
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
			showCurempSuperInfo(curempname,curempid,salemid,amanagerid);
		}
	});	
}
/**
 * 显示当前负责人的上级销售经理和区域经理信息
 */
function showCurempSuperInfo(curempname,curempid,salemid,amanagerid){
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
				//$('#fcurempname').val('');
				$('#personalpercent').val('');
				$('#personalprize').val('');
				//return false;
			}
			$('#personalpercent').val(list[0].saleratio);
			//计算当前负责人的业绩奖
			//业绩奖=回款额*0.3%*个人比例
			var fexchangeamount=$('#fexchangeamount').val();
			var personalprize=(Number( (  fexchangeamount*0.003*list[0].saleratio*0.01 ).toFixed(4) )  );
			if(null!=curempname && "钟俊武"==curempname){
				//钟俊武 的 奖励比例 0.25%
				//alert("当前负责人钟俊武");
				personalprize=(Number( (  fexchangeamount*0.0025*list[0].saleratio*0.01 ).toFixed(4) )  );
			}
			$('#personalprize').val(personalprize);
			//销售经理个人比例和业绩奖
			if(null==salemid||''==salemid||'null'==salemid){
			} else{
				$('#salempersonalpercent').val(list[0].smratio);
				var salempersonalprize=(Number( (  fexchangeamount*0.003*list[0].smratio*0.01 ).toFixed(4) )  );
				$('#salempersonalprize').val(salempersonalprize);
			}
			//区域经理个人比例和业绩奖
			if(null==amanagerid||''==amanagerid||'null'==amanagerid){
			}else{ 
				$('#amanagerpersonalpercent').val(list[0].szmpratio);
				var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*list[0].szmpratio*0.01 ).toFixed(4) )  );
				$('#amanagerpersonalprize').val(amanagerpersonalprize);
			}
		}
	});	
	//$('#fcurempname'+i).val(curempname);
	//$('#fcurempid'+i).val(curempid);
	//同时设置当前负责任人的销售经理id和区域经理id
	$('#salemid').val(salemid);
	$('#amanagerid').val(amanagerid);
	///$("#selectExamineUserDiv"+i).css("display","none");
}
/**
 * 选择模糊查询中的一个
 * @param i
 * @return
 */
function changeCode(){
	
	var sel = $("#selectCode").val();
	var txt = $('#selectCode').find('option:[value='+sel+']').text();
	/*//订单号
	var fordernostr=txt.toString().split('|')[0];
	$("#forderno").attr("value",fordernostr);
	//合同号 	核算项目 	订单日期 	订单金额 	业务员 
	var fcontractnostr=txt.toString().split('|')[1];
	$("#fcontractno").attr("value",fcontractnostr);*/
	
	//合同号
	var fcontractnostr=txt.toString().split('|')[0];
	$("#fcontractno").attr("value",fcontractnostr);
	//订单号 
	var fordernostr=txt.toString().split('|')[1];
	$("#forderno").attr("value",fordernostr);
	
	$("#fanaitem").attr("value",txt.toString().split('|')[2]);
	$("#forderdate").attr("value",txt.toString().split('|')[3]);
	$("#forderamountfor").attr("value",txt.toString().split('|')[4]);
	$("#fempname").attr("value",txt.toString().split('|')[5]);
	$("#fempid").attr("value",txt.toString().split('|')[6]);
	
	//当前负责人信息
	$("#fcurempname").attr("value",txt.toString().split('|')[5]);
	$("#fcurempid").attr("value",txt.toString().split('|')[6]);
	//查询当前负责人的上级销售经理和区域经理信息
	getCurempSuperInfo(txt.toString().split('|')[5],txt.toString().split('|')[6]);
	
	$("#itemcodeDiv").css("display","none");
}
/**
 * 弹出选择人列表
 */
function toAddExamineUser(){
	$("#selectExamineUserDiv").css("display","");
	var name = $("#fcurempname").val();
	var data = 'adminQuery.adminName='+name;
	var htmladminids='';
	var html='<td><select id="examineUserSelect" onchange="addExamineUser();" style="width: 175px; height: 115px;background-color: #ccc"; multiple="true">';
		//html+='<option value="">人名|销售经理Id|区域经理Id</option>';
	var url ='/system/findListByDepart.htm';
	//var url ='/system/listfindAdmin.htm';
	
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			$.each(data,function(i,o){
				//html+='<option value="'+o.adminId+'" >'+o.adminName+'|'+o.salemid+'|'+o.amanagerid+'|'+'</option>';
				//var tempAdminIdInfo=o.adminId+'|'+o.salemid+'|'+o.amanagerid+'|';
				//html+='<option value="'+o.adminId+'" >'+o.adminName+'|'+o.salemid+'|'+o.amanagerid+'|'+'</option>';
				var tempAdminIdInfo=o.salemid+'@'+o.amanagerid;
				html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
				//html+='<option value="'+tempAdminIdInfo+'" >'+o.adminName+'</option>';
				htmladminids+='<input  id="adminids'+o.adminId+'" type="hidden" value="'+tempAdminIdInfo+'" />';
			});
			html+='</select></td>';
			html+='<td>'+htmladminids+'</td>';
			//alert("html:"+html);
			$('#selectExamineUser').html(html);
		}
	});	
}
/**
 * 得到当前销售人员的销售经理和区域经理ID
 * @return
 */
function getSuperSalePerFee(saleid,salename,fexchangeamount){
	
	var data = 'adminId='+saleid;
	var url ='/system/showAdmin.htm';
 	$.webAjax({
		type : "post",
		url : url,
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var adminEntity = data.entity;
			if(null==adminEntity){
			}else{
				//同时设置当前负责任人的销售经理id和区域经理id
				$('#salemid').val(adminEntity.salemid);
				$('#amanagerid').val(adminEntity.amanagerid);
				getSuperSalePerFeeInfo(saleid,salename,fexchangeamount,adminEntity.salemid,adminEntity.amanagerid);
			}
		}
	});	
}

/**
 * 得到当前销售人员的销售经理和区域经理的个人比例和业绩奖
 */
function getSuperSalePerFeeInfo(saleid,salename,fexchangeamount,salemid,amanagerid){
	//同时查询选择的业务员的个人比例
	var data = 'saleRatioQuery.saleid='+saleid+'&saleRatioQuery.salename='+salename;
	$.webAjax({
		type : "post",
		url : '/saleRatio/sale-ratio!listToQuery.htm',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			var list = data.saleRatioList;
			if(null==list||list.length==0){
			}else{
				//业绩奖=回款额*0.3%*个人比例
				//销售经理个人比例和业绩奖
				if(null==salemid||''==salemid||'null'==salemid){
				} else{
					$('#salempersonalpercent').val(list[0].smratio);
					var salempersonalprize=(Number( (  fexchangeamount*0.003*list[0].smratio*0.01 ).toFixed(4) )  );
					$('#salempersonalprize').val(salempersonalprize);
				}
				//区域经理个人比例和业绩奖
				if(null==amanagerid||''==amanagerid||'null'==amanagerid){
				}else{ 
					$('#amanagerpersonalpercent').val(list[0].szmpratio);
					var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*list[0].szmpratio*0.01 ).toFixed(4) )  );
					$('#amanagerpersonalprize').val(amanagerpersonalprize);
				}
			}
		}
	});	
}
/**
 * 添加选择的人
 */
function addExamineUser(){
	var selectValue = $('#examineUserSelect').val();
	
	var adminids = $('#adminids'+''+selectValue).val();//隐藏域中的值
	//alert("adminids:"+adminids);
	var saleid =selectValue.toString();
	//alert("saleid:"+saleid);
	var selectTxt = $("#examineUserSelect").find('option:selected').text();
	//alert("selectTxt:"+selectTxt);
	//判断选择的当前负责人的销售经理和区域经理是否存在
	//var salemid =selectTxt.toString().split('|')[1];
	var salemid =adminids.toString().split('@')[0];
	//alert("salemid:"+salemid);
	/**
	if(null==salemid||''==salemid||'null'==salemid){
		alert("当前选择的负责人的销售经理 不能为空!");
		return false;
	} 
	**/
	//var amanagerid =selectTxt.toString().split('|')[2];
	var amanagerid =adminids.toString().split('@')[1];
	//alert("amanagerid:"+amanagerid);
	/**
	if(null==amanagerid||''==amanagerid||'null'==amanagerid){
		alert("当前选择的负责人的区域经理 不能为空!");
		return false;
	} 
	**/
	
	//同时查询选择的业务员的个人比例
	//var data = 'saleRatioQuery.saleid='+selectValue+'&saleRatioQuery.salename='+selectTxt.toString().split('|')[0];
	var data = 'saleRatioQuery.salename='+selectTxt.toString();
	$.webAjax({
		type : "post",
		url : '/saleRatio/sale-ratio!listToQuery.htm',
		data:data,
		success : function(data) {
			data = $.parseJSON(data);
			//alert("1");
			var list = data.saleRatioList;
			if(null==list||list.length==0){
				//alert("当前选择的负责人的个人比例信息 不能为空!");
				//$('#fcurempname').val('');
				$('#personalpercent').val('');
				$('#personalprize').val('');
				//return false;
				$('#personalpercent').val("0");
			}else{
				$('#personalpercent').val(list[0].saleratio);
			}
			//alert("2");
			
			//alert("3");
			var personalpercent=$('#personalpercent').val();//个人比例
			//alert("personalpercent:"+personalpercent);
			if(""==personalpercent||null==personalpercent||"null"==personalpercent){
				$('#personalpercent').val("0");
			}
			 
			//计算当前负责人的业绩奖
			//业绩奖=回款额*0.3%*个人比例
			var fexchangeamount=$('#fexchangeamount').val();
			//var personalprize=(Number( (  fexchangeamount*0.003*list[0].saleratio*0.01 ).toFixed(4) )  );
			var personalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
			if(null!=selectTxt.toString() && "钟俊武"==selectTxt.toString()){
				//钟俊武 的 奖励比例 0.25%
				//alert("当前负责人钟俊武");
				personalprize=(Number( (  fexchangeamount*0.0025*personalpercent*0.01 ).toFixed(4) )  );
			}
			$('#personalprize').val(personalprize);
			
			//销售经理个人比例和业绩奖
			if(null==salemid||''==salemid||'null'==salemid){
			} else{
				$('#salempersonalpercent').val(list[0].smratio);
				//var salempersonalprize=(Number( (  fexchangeamount*0.003*list[0].smratio*0.01 ).toFixed(4) )  );
				var salempersonalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
				$('#salempersonalprize').val(salempersonalprize);
			}
			//区域经理个人比例和业绩奖
			if(null==amanagerid||''==amanagerid||'null'==amanagerid){
			}else{ 
				$('#amanagerpersonalpercent').val(list[0].szmpratio);
				//var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*list[0].szmpratio*0.01 ).toFixed(4) )  );
				var amanagerpersonalprize=(Number( (  fexchangeamount*0.003*personalpercent*0.01 ).toFixed(4) )  );
				$('#amanagerpersonalprize').val(amanagerpersonalprize);
			}
		}
	});	
	
	$('#fcurempname').val(selectTxt.toString());
	$('#fcurempid').val(saleid);
	//同时设置当前负责任人的销售经理id和区域经理id
	$('#salemid').val(salemid);
	$('#amanagerid').val(amanagerid);
	
	/*$('#fcurempname').val(selectTxt.toString().split('|')[0]);
	$('#fcurempid').val(selectValue);
	//同时设置当前负责任人的销售经理id和区域经理id
	$('#salemid').val(selectTxt.toString().split('|')[1]);
	$('#amanagerid').val(selectTxt.toString().split('|')[2]);*/
	
	$("#selectExamineUserDiv").css("display","none");
}
/**
 * 点击空白处关闭模糊查询窗体
 * @return
 */
function closeDV(){
	$(".ordernodiv").css("display","none");
	$(".empnamediv").css("display","none");
	$(".businessUserDiv").css("display","none");
}
