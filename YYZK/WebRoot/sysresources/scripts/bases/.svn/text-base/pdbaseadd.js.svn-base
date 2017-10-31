var a = 10;
//页面初始化方法
$(document).ready(function() {
	var html='';
	for(var i = 1 ;i <a ;i++){
		html+='<tr align="center" id="tr'+i+'">';
		html+='<td>'+i+'</td>';
		//业绩年fyear 产品类别  salestypename(select)  销售员adminId(下拉div)  基数档flevel  下限基数金额minamount  上限基数金额maxamount  业务费比例poc
		html+='<td><input name="entity.fyears" id="fyear'+i+'" value="" class="inputall" style="width:97%;" onclick="WdatePicker({dateFmt:\'yyyy\'})"/></td>';
		html+='<td><select name="entity.salestypenames" id="salestypename'+i+'" class="selectall" style="width:97%;"></select></td>';
		html+='<td ><input  id="empSuperior'+i+'" value="" class="inputall" style="width:97%"  onkeyup="enterCheck('+i+');" onclick="enterCheck('+i+')"/><input name="entity.adminIds" id="adminId'+i+'" value="" type="hidden" /><div id="itemcodeDiv'+i+'" class="itemDiv" style="position:absolute;width: 250px;height: 160px;background: #ccc;display: none; "><table><tbody id="selectsbody'+i+'"></tbody></table></div></td>';
		
		html+='<td><input name="entity.flevels" id="flevel'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.minamounts" id="minamount'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.maxamounts" id="maxamount'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.pocs" id="poc'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		//超额奖基数fbase  销售签约指标kpis  业绩奖励比例 rewards 超额奖比例overratio1  单笔合同额回款比例backratio   单笔回款结算比例blanckratio
		html+='<td><input name="entity.fbases" id="fbase'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.kpiss" id="kpis'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.rewardss" id="rewards'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.overratio1s" id="overratio1'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.allkpratios" id="allkpratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.backratios" id="backratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.blanckratios" id="blanckratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		//全额回款剩余结算比例remainratio  个人比例pratio    销售经理比例pmsalesratio    公司比例 companyratio	区域经理比例pmanagerratio
		html+='<td><input name="entity.remainratios" id="remainratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.pratios" id="pratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.pmsalesratios" id="pmsalesratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.companyratios" id="companyratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.pmanagerratios" id="pmanagerratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		//LNG收到预付款奖励prebonus 	LNG全额回款奖励fullbonus	 LNG奖励限定台数frestrict
		html+='<td><input name="entity.prebonuss" id="prebonus'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.fullbonuss" id="fullbonus'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.frestricts" id="frestrict'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		//PL3000比例 pl3000s  PL4200比例pl4200s     SSV3500比例 ssv3500s     PL2000比例 pl2000s
		html+='<td><input name="entity.pl3000s" id="pl3000'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.pl4200s" id="pl4200'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.ssv3500s" id="ssv3500'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.pl2000s" id="pl2000'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><input name="entity.bratios" id="bratio'+i+'" value="" class="inputall" style="width:90%;"/></td>';
		html+='<td><a href="javascript:delABC('+i+');" style="width:90%;">删除</a></td>';
		html+='</tr>';
	}
	$('#pagecontent').html(html);
	salestypeAdd();
});
function enterCheck(i){
	search(i);
}
//弹出销售员下拉框
function search(i){
	$("#itemcodeDiv"+i).css("display","");
	var code = $("#empSuperior"+i).val();
	var html='<td><select id="selectCode'+i+'" onchange="changeCode('+i+');"  style="width: 240px; height: 147px;background-color: #ccc;" multiple="true">';
	var data = 'adminQuery.adminName='+code; 
	var url = ctx + '/system/adminNewDataSel.htm';
		$.webAjax( {
		type : 'post',
		url : url,
		data:data,
		success : function(data) {
		data = $.parseJSON(data);
		var list = data.adminList;
				$.each(list, function(i, o){
					if(o.type!=1){//管理员排除
					
						html+='<option value="'+o.adminId+'">'+o.adminName+'</option>';
					}
				});
					html+='</select></td>';
					$('#selectsbody'+i).html(html);
			}
		});
	
}
function changeCode(i){
	var sel = $("#selectCode"+i).val();
	var txt = $('#selectCode'+i).find('option:[value='+sel+']').text();
	$("#adminId"+i).attr("value",sel);
	$("#empSuperior"+i).attr("value",txt);
	$("#itemcodeDiv"+i).css("display","none");
}
//删除行
function delABC(i){
	$("#tr"+i).remove();
}

//添加行
function tianjia(){
	var html='';
	html+='<tr align="center" id="tr'+a+'">';
	html+='<td>'+a+'</td>';
	//业绩年fyear 产品类别  salestypename(select)  销售员adminId(下拉div)  基数档flevel  下限基数金额minamount  上限基数金额maxamount  业务费比例poc
	html+='<td><input name="entity.fyears" id="fyear'+a+'" value="" class="inputall" style="width:97%;" onclick="WdatePicker({dateFmt:\'yyyy\'})"/></td>';
	html+='<td><select name="entity.salestypenames" id="salestypename'+a+'" class="selectall" style="width:97%;"></select></td>';
	html+='<td ><input  id="empSuperior'+a+'" value="" class="inputall" style="width:97%"  onkeyup="enterCheck('+a+');" enterCheck="search('+a+')"/><input name="entity.adminIds" id="adminId'+a+'" value="" type="hidden" /><div id="itemcodeDiv'+a+'" class="itemDiv" style="position:absolute;width: 250px;height: 160px;background: #ccc;display: none; "><table><tbody id="selectsbody'+a+'"></tbody></table></div></td>';
	
	html+='<td><input name="entity.flevels" id="flevel'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.minamounts" id="minamount'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.maxamounts" id="maxamount'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pocs" id="poc'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	//超额奖基数fbase  销售签约指标kpis  业绩奖励比例 rewards 超额奖比例overratio1  单笔合同额回款比例backratio   单笔回款结算比例blanckratio
	html+='<td><input name="entity.fbases" id="fbase'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.kpiss" id="kpis'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.rewardss" id="rewards'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.overratio1s" id="overratio1'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.allkpratios" id="allkpratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.backratios" id="backratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.blanckratios" id="blanckratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	//全额回款剩余结算比例remainratio  个人比例pratio    销售经理比例pmsalesratio    公司比例 companyratio	区域经理比例pmanagerratio
	html+='<td><input name="entity.remainratios" id="remainratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pratios" id="pratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pmsalesratios" id="pmsalesratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.companyratios" id="companyratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pmanagerratios" id="pmanagerratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	//LNG收到预付款奖励prebonus 	LNG全额回款奖励fullbonus	 LNG奖励限定台数frestrict
	html+='<td><input name="entity.prebonuss" id="prebonus'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.fullbonuss" id="fullbonus'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.frestricts" id="frestrict'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pl3000s" id="pl3000'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pl4200s" id="pl4200'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.ssv3500s" id="ssv3500'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.pl2000s" id="pl2000'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><input name="entity.bratios" id="bratio'+a+'" value="" class="inputall" style="width:90%;"/></td>';
	html+='<td><a href="javascript:delABC('+a+');" style="width:90%;">删除</a></td>';
	html+='</tr>';
	a++;
	
	$("#pagecontent").append(html);

}

function salestypeAdd(){
	var url = ctx+'/salestype/salestype!listToQuery.htm';
	var html='<option value="">----</option>';
	$.webAjax({
		type:'post',
		url:url,
		success:function(data){
			data = $.parseJSON(data);
			
			if(data.resultInfo[0]=="0"){
				var list = data.salestypeList;
				$.each(list,function(i,o){
					html+='<option value="'+o.fname+'" id="'+(o.salestypeid+o.fname)+'">'+o.fname+'</option>';
				});
				for(var i=1;i<a;i++){
					$("#salestypename"+i).html(html);
				}	
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}

function save(){
	if(checkData()){
		var formParam = $("#inputForm").serialize();
		var url = ctx+'/pdbase/pdbase!saveNew.htm';
		$.webAjax({
			type:'post',
			data:formParam,
			url:url,
			success:function(data){
				data = $.parseJSON(data);
				if(data.resultInfo[0]=="0"){
					alert("操作成功");
					window.close();
					window.opener.loadSalestype();
				}else{
					alert(data.resultInfo[1]);
				}
			}
		});
	}
	
	
}
function checkData(){
	var num1=0;
	var num2=0;
	for(var i=1;i<a;i++){
		var ischeck=0;
		if(isEmpty($("#fyear"+i).val())&&isEmpty($("#salestypename"+i).val())&&isEmpty($("#adminId"+i).val())&&isEmpty($("#flevel"+i).val())&&isEmpty($("#maxamount"+i).val())&&isEmpty($("#minamount"+i).val())&&isEmpty($("#poc"+i).val())&&isEmpty($("#fbase"+i).val())
				&&isEmpty($("#kpis"+i).val())&&isEmpty($("#rewards"+i).val())&&isEmpty($("#overratio1"+i).val())&&isEmpty($("#backratio"+i).val())&&isEmpty($("#blanckratio"+i).val())
				&&isEmpty($("#remainratio"+i).val())&&isEmpty($("#pratio"+i).val())&&isEmpty($("#pmsalesratio"+i).val())&&isEmpty($("#pmanagerratio"+i).val())
				&&isEmpty($("#companyratio"+i).val())&&isEmpty($("#prebonus"+i).val())&&isEmpty($("#fullbonus"+i).val())&&isEmpty($("#frestrict"+i).val())
				&&isEmpty($("#pl3000"+i).val())&&isEmpty($("#pl4200"+i).val())&&isEmpty($("#ssv3500"+i).val())&&isEmpty($("#pl2000"+i).val())&&isEmpty($("#bratio"+i).val())){
			ischeck= 1;
		}
		if(ischeck==0){
			num1++;
			var reg = /^[1-9]d*.d*|0.d*[1-9]d*|0?.0+|0$/;
			var reg2 = /^[1-9]d*|0$/;
			if($("#fyear"+i).val()==null || $("#fyear"+i).val()==""){alert("请输入第"+i+"行的年份");return false;}									
			if($("#salestypename"+i).val()==null || $("#salestypename"+i).val()==""){alert("第"+i+"行产品销售类别不能为空,请选择");return false;}	
			if($("#adminId"+i).val()==null || $("#adminId"+i).val()==""){alert("第"+i+"行销售员不能为空,请选择");return false;}
			if($("#flevel"+i).val()==null || $("#flevel"+i).val()==""){alert("请输入第"+i+"行的基数档");return false;}
			if($("#maxamount"+i).val()==null || $("#maxamount"+i).val()==""){alert("请输入第"+i+"行的下限基数金额");return false;}
			if($("#minamount"+i).val()==null || $("#minamount"+i).val()==""){alert("请输入第"+i+"行的上限基数金额");return false;}
			if($("#poc"+i).val()==null || $("#poc"+i).val()==""){alert("请输入第"+i+"行的业务费比例");return false;}
			if($("#fbase"+i).val()==null || $("#fbase"+i).val()==""){alert("请输入第"+i+"行的超额奖基数");return false;}
			if($("#kpis"+i).val()==null || $("#kpis"+i).val()==""){alert("请输入第"+i+"行的销售签约指标");return false;}
			if($("#rewards"+i).val()==null || $("#rewards"+i).val()==""){alert("请输入第"+i+"行的奖励比例");return false;}
			if($("#overratio1"+i).val()==null || $("#overratio1"+i).val()==""){alert("请输入第"+i+"行的超额奖比例");return false;}
			if($("#backratio"+i).val()==null || $("#backratio"+i).val()==""){alert("请输入第"+i+"行的单比回款比例");return false;}
			if($("#blanckratio"+i).val()==null || $("#blanckratio"+i).val()==""){alert("请输入第"+i+"行的单比回款结算比例");return false;}
			if($("#remainratio"+i).val()==null || $("#remainratio"+i).val()==""){alert("请输入第"+i+"行的全额回款剩余结算比例");return false;}
			if($("#pratio"+i).val()==null || $("#pratio"+i).val()==""){alert("请输入第"+i+"行的个人比例");return;}
			if($("#pmsalesratio"+i).val()==null || $("#pmsalesratio"+i).val()==""){alert("请输入第"+i+"行的销售经理比例");return false;}
			if($("#pmanagerratio"+i).val()==null || $("#pmanagerratio"+i).val()==""){alert("请输入第"+i+"行的区域经理比例");return false;}
			if($("#companyratio"+i).val()==null || $("#companyratio"+i).val()==""){alert("请输入第"+i+"行的公司比例");return false;}
			if($("#prebonus"+i).val()==null || $("#prebonus"+i).val()==""){alert("请输入第"+i+"行的LNG收到预付款奖励");return false;}
			if($("#fullbonus"+i).val()==null || $("#fullbonus"+i).val()==""){alert("请输入第"+i+"行的LNG全额回款奖励");return false;}
			if($("#frestrict"+i).val()==null || $("#frestrict"+i).val()==""){alert("请输入第"+i+"行的LNG奖励限定台数");return false;}
			//pl3000  pl4200 ssv3500  pl2000
			/*if($("#pl3000"+i).val()==null || $("#pl3000"+i).val()==""){alert("请输入第"+i+"行的pl3000比例");return false;}
			if($("#pl4200"+i).val()==null || $("#pl4200"+i).val()==""){alert("请输入第"+i+"行的pl4200比例");return false;}
			if($("#ssv3500"+i).val()==null || $("#ssv3500"+i).val()==""){alert("请输入第"+i+"行的ssv3500比例");return false;}
			if($("#pl2000"+i).val()==null || $("#pl2000"+i).val()==""){alert("请输入第"+i+"行的pl2000比例");return false;}*/
			
			if($("#flevel"+i).val()!=null && $("#flevel"+i).val()!=""  && !reg2.test($("#flevel"+i).val())){ alert("第"+i+"行的基数档请输入数字"); return false; }
			if($("#minamount"+i).val()!=null && $("#minamount"+i).val()!="" && !reg.test($("#minamount"+i).val()) && !reg2.test($("#minamount"+i).val())){ alert("第"+i+"行的上限基数金额请输入数字"); return false; }
			if($("#maxamount"+i).val()!=null && $("#maxamount"+i).val()!="" && !reg.test($("#maxamount"+i).val()) && !reg2.test($("#maxamount"+i).val())){ alert("第"+i+"行的下限基数金额请输入数字"); return false; }
			if($("#poc"+i).val()!=null && $("#poc"+i).val() != "" && !reg.test($("#poc"+i).val())){ alert("第"+i+"行的业务费比例请输入小数"); return false; }
			if($("#rewards"+i).val()!=null && $("#rewards"+i).val()!="" && !reg.test($("#rewards"+i).val())){ alert("第"+i+"行的奖励比例请输入小数"); return false; }
			if($("#overratio1"+i).val()!=null && $("#overratio1"+i).val()!="" && !reg.test($("#overratio1"+i).val())){ alert("第"+i+"行的超额奖比例请输入小数"); return false; }
			if($("#backratio"+i).val()!=null && $("#backratio"+i).val()!="" && !reg.test($("#backratio"+i).val())){ alert("第"+i+"行的单笔回款比例请输入小数"); return false; }
			if($("#blanckratio"+i).val()!=null && $("#blanckratio"+i).val()!="" && !reg.test($("#blanckratio"+i).val())){ alert("第"+i+"行的单笔回款结算比例请输入小数"); return false; }
			if($("#remainratio"+i).val()!=null && $("#remainratio"+i).val()!="" && !reg.test($("#remainratio"+i).val())){ alert("第"+i+"行的全额回款剩余结算比例请输入小数"); return false; }
			if($("#pratio"+i).val()!=null && $("#pratio"+i).val() != "" && !reg.test($("#pratio"+i).val())){ alert("第"+i+"行的个人比例请输入小数"); return; }
			if($("#pmsalesratio"+i).val()!=null && $("#pmsalesratio"+i).val()!="" && !reg.test($("#pmsalesratio"+i).val())){ alert("第"+i+"行的销售经理比例请输入小数"); return false; }
			if($("#prebonus"+i).val()!=null && $("#prebonus"+i).val()!= "" && !reg.test($("#prebonus"+i).val()) && !reg2.test($("#prebonus"+i).val())){ alert("第"+i+"行的LNG收到预付款奖励请输入数字"); return false; }
			if($("#fullbonus"+i).val()!=null && $("#fullbonus"+i).val()!="" && !reg.test($("#fullbonus"+i).val()) && !reg2.test($("#fullbonus"+i).val())){ alert("第"+i+"行的LNG全额回款奖励请输入数字"); return false; }
			if($("#pmanagerratio"+i).val()!=null && $("#pmanagerratio"+i).val()!="" && !reg.test($("#pmanagerratio"+i).val())){ alert("第"+i+"行的区域经理比例请输入小数"); return false; }
			if($("#companyratio"+i).val()!=null && $("#companyratio"+i).val()!="" && !reg.test($("#companyratio"+i).val())){ alert("第"+i+"行的公司比例请输入小数"); return false; }
			if($("#kpis"+i).val()!=null && $("#kpis"+i).val()!="" && !reg.test($("#kpis"+i).val()) && !reg2.test($("#kpis"+i).val())){ alert("第"+i+"行的销售签约指标请输入数字"); return false; }
			if($("#fbase"+i).val()!=null && $("#fbase"+i).val()!="" && !reg.test($("#fbase"+i).val()) && !reg2.test($("#fbase"+i).val())){ alert("第"+i+"行的超额奖基数请输入数字"); return false; }
			if($("#frestrict"+i).val()!=null && $("#frestrict"+i).val()!="" && !reg2.test($("#frestrict"+i).val())){ alert("第"+i+"行的LNG奖励限定台数请输入数字"); return false; }
			//pl3000  pl4200 ssv3500  pl2000
			if($("#pl3000"+i).val()!=null && $("#pl3000"+i).val()!="" && !reg.test($("#pl3000"+i).val())){ alert("第"+i+"行的pl3000比例请输入小数"); return false; }
			if($("#pl4200"+i).val()!=null && $("#pl4200"+i).val()!="" && !reg.test($("#pl4200"+i).val())){ alert("第"+i+"行的pl4200比例请输入小数"); return false; }
			if($("#ssv3500"+i).val()!=null && $("#ssv3500"+i).val()!="" && !reg.test($("#ssv3500"+i).val())){ alert("第"+i+"行的ssv3500比例请输入小数"); return false; }
			if($("#pl2000"+i).val()!=null && $("#pl2000"+i).val()!="" && !reg.test($("#pl2000"+i).val())){ alert("第"+i+"行的pl2000比例请输入小数"); return false; }
			if($("#bratio"+i).val()!=null && $("#bratio"+i).val()!="" && !reg.test($("#bratio"+i).val())){ alert("第"+i+"行的PL奖折扣基数请输入小数"); return false; }
			num2++;
		}
	}
	if(num1==num2&&num1==0){
		alert("请输入要添加的年销售产品业绩基数比例");
		return false;
	}else if(num1==num2&&num1>=0){
		return true;
	}else{
		return false;
	}
	
}
function isEmpty(value){
	if(value==null||(value!=null&&value.trim()=="")){
		return true;
	}else{
		return false;
	}
}
