<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>报价生成</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript" src="${ctx}/resources/plugins/baidu/baiduTemplate.js"></script>
<script id="biding" type="text/template">
<table class="tbbiding" border="1">
  <tr>
    <td colspan="8"><h1>箱式燃气调压（计量）站主要零部件清单</h1></td>
  </tr>
  <tr>
    <td colspan="6">进口压力<!=entrancePressure!>，出口压力<!=outletPressure!>，Q=<!=flow!>m3/h</td>
    <td colspan="2">列表价</td>
  </tr>
  <tr>
    <td colspan="6" style="text-align:left;">调压（计量）站名称：箱式燃气调压柜	</td>
    <td colspan="2" rowspan="2"><h1><!=allprice!></h1></td>
  </tr>
  <tr>
    <td colspan="6" style="text-align:left;">调压（计量）站型号：TE-RX100/0.4A</td>
  </tr>
  <tr>
    <td align="left">序号</td>
    <td align="left">零部件名称</td>
    <td align="left">型号及规格</td>
    <td align="left">单位</td>
    <td align="left">数量</td>
    <td align="left">备注</td>
    <td align="left">列表单价</td>
    <td align="left">列表总价</td>
  </tr>
  <!if(list.length>0){!>
	<!for(var i = 0; i<list.length;i++){
		var item = list[i];
		!>
		<tr>
    		<td align="left"><!=item.id!></td>
    		<td align="left"><!=item.name!></td>
    		<td align="left"><!=item.typeAndSpecification!></td>
    		<td align="left"><!=item.unitValue!></td>
    		<td align="left"><!=item.number!></td>
    		<td align="left"><!=item.remarks!></td>
    		<td align="left"><!=item.unitPrice!></td>
    		<td align="left"><!=item.price!></td>
  		</tr>
	<!}!>
  <!}!>
  
</table>
</script>
<script type="text/javascript">
function create(){
	//console.log($("#entrancePressure").combobox("getText"));
	/*
	var data = 'offerProjectItemQuery.entrancePressure='+$('#entrancePressure').combobox('getValue')+
			'&offerProjectItemQuery.outletPressure='+$('#outletPressure').combobox('getValue')+
			'&offerProjectItemQuery.flow='+ $('#flow').combobox('getValue')+
			'&offerProjectItemQuery.isElectricTracing='+ ($("#isElectricTracing").switchbutton("options").checked==true?"on":"off")+
			'&offerProjectItemQuery.isTankInsulation='+ ($("#isTankInsulation").switchbutton("options").checked==true?"on":"off")+
			'&offerProjectItemQuery.isSwitchBox='+ ($("#isSwitchBox").switchbutton("options").checked==true?"on":"off")
	*/
	
	//$("#isElectricTracing").switchbutton("options").checked
	
	//if($(this).form('enableValidation').form('validate')){
		$.ajax({
			type: "post",
			url: "${ctx}/offer/offer!binding.htm",
			dataType: "json",
			//data: data,
			data : $('#form').serialize(),
			async: false,
			success: function (data, textStatus) {
				var entrancePressure = $("#entrancePressure").combobox("getText");
				var outletPressure = $("#outletPressure").combobox("getText");
				var flow = $("#flow").combobox("getText");
				
				var tpldata = {};
				tpldata.entrancePressure = entrancePressure;
				tpldata.outletPressure = outletPressure;
				tpldata.flow = flow;
				
				var items=[];
				var allprice = 0;
				$.each(data.rows,function(i,o){
					var item = {};
					item["id"] = i+1;
					item["name"] = o.name;
					item["typeAndSpecification"]=o.typeAndSpecification;
					item["unitValue"]=o.unitValue;
					item["number"]=o.number;
					item["remarks"]=o.remarks;
					item["unitPrice"]=o.unitPrice;
					item["price"]=o.unitPrice*o.number;
					allprice = allprice + o.unitPrice*o.number;
					items.push(item);
				});
				tpldata.allprice = allprice;
				tpldata.list = items;
				var bt=baidu.template;
				baidu.template.LEFT_DELIMITER='<!';
				baidu.template.RIGHT_DELIMITER='!>';
				
				var html=bt('biding',tpldata);
				$("#divbiding").html(html);
			}
		});
//	}
	
	
	
	
}

function save(){
	$('#form').form('submit',{
        onSubmit:function(){
            if($(this).form('enableValidation').form('validate')){
            	$.ajax({
    				type: "post",
    				url: "${ctx}/offer/offer!projectItemEdit.htm",
    				data:$('#form').serialize(),
    				dataType: "json",
    				async: false,
    				beforeSend:function(){},
    				success: function (data, textStatus) {
    					if(data.type=="add"){
    						$.messager.confirm('提示', '新增成功！', function(r){
    							window.parent.reloadGrid();
    							window.parent.closeWin();
    						});
    					}else{
    						$.messager.confirm('提示', "修改成功！", function(r){
    							window.parent.reloadGrid();
    							window.parent.closeWin();
    						});
    					}
    				},
    				error: function(XMLHttpRequest, textStatus, errorThrown) {
    					var error = XMLHttpRequest.responseText.match("<li>(.*?)\</li>");
    					if(error.length==2){
    						$.messager.confirm('提示', error[1], function(r){
							});
    					}
 					}
    			});
            }
        }
    });
}

$(function () {
	if('<s:property value="offerProjectItem.isElectricTracing"/>'=='on'){
		$('#isElectricTracing').switchbutton({
            checked: true
        })
	}
	if('<s:property value="offerProjectItem.isTankInsulation"/>'=='on'){
		$('#isTankInsulation').switchbutton({
            checked: true
        })
	}
	if('<s:property value="offerProjectItem.isSwitchBox"/>'=='on'){
		$('#isSwitchBox').switchbutton({
            checked: true
        })
	}
	
	if('<s:property value="offerProjectItem.itemId"/>'!=''){
		create();
	}
	
	
	$("#valveType").combobox({
		onSelect:function(record){
			//alert(record);
			if(record.text=='前球，后球'){
				//$("#trqf").css("display","none")
				//$("#trdf").css("display","none")
				
				//$("#trqf").css("display","block")
				
				$("#trdf").hide();
				$("#trqf").show();
				
			}else{
				//$("#trqf").css("display","none")
				//$("#trdf").css("display","none")
				
				//$("#trdf").css("display","block")
				
				$("#trdf").show();
				$("#trqf").hide();
			}
		}
	});
});

</script>
<style>
#divbiding{
	text-align: center;
	width:100%;
}

table.tbbiding{
	margin:auto;
	border-collapse: collapse;
    color: #666;
    width: 88%;
    margin-top:20px;
    font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}

table.tbbiding tr td, table.tbbiding tr th {
    vertical-align: middle;
    border-width: 1px;
	padding: 5px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}

</style>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'" title="报价清单">
			<div id="divbiding">
			</div>
		</div>
		<div data-options="region:'east',split:true" title="参数配置" style="width:330px;">
			<div class="easyui-layout" data-options="fit:true,border:false">
				<div data-options="region:'north',border:false">
					<div id="toolbar" class="datagrid-toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconsave',plain:true" onclick="save()">保存报价</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconqingdan',plain:true" onclick="create()">生成清单</a>
					</div>
				</div>
				<div data-options="region:'center',border:false">
				<form id="form" method="post">
					<table class="my-table-form">
						<tr>
							<th colspan="2">基本参数</th>
						</tr>
						<tr>
							<th class="my-w60">进口压力</th>
							<td>
								<s:textfield id="entrancePressure" name="offerProjectItem.entrancePressure" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
								        valueField: 'id',
								        textField: 'text',
								        required:true,
								        url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=5'"></s:textfield>
								<s:hidden name="offerProjectItem.itemId" id="itemId"></s:hidden>
								<s:hidden name="offerProjectItem.projectId" id="projectId"></s:hidden>
							</td>
						</tr>
						<tr>
							<th class="my-w60">出口压力</th>
							<td>
								<s:textfield id="outletPressure" name="offerProjectItem.outletPressure" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
								 	required:true,
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=6'"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">流量</th>
							<td>
								<s:textfield id="flow" name="offerProjectItem.flow" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
								 	required:true,
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=7'"></s:textfield>
							</td>
						</tr>
						<tr>
							<th colspan="2">结构参数</th>
						</tr>
						<tr>
							<th class="my-w60">结构</th>
							<td>
								<s:textfield id="structure" name="offerProjectItem.structure" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
								 	required:true,
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=8'"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">阀门类型</th>
							<td>
								<s:textfield id="valveType" name="offerProjectItem.valveType" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
								 	required:true,
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=9'"></s:textfield>
							</td>
						</tr>
						<tr>
							<th colspan="2">设备参数</th>
						</tr>
						<tr>
							<th class="my-w60">调压器厂家</th>
							<td>
								<s:textfield id="voltageRegulatorFactory" name="offerProjectItem.voltageRegulatorFactory" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
								 	required:true,
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=10'"></s:textfield>
							</td>
						</tr>
						<tr id="trqf">
							<th class="my-w60">球阀厂家</th>
							<td>
								<s:textfield id="globeValveFactory" name="offerProjectItem.globeValveFactory" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=11'"></s:textfield>
							</td>
						</tr>
						<tr id="trdf">
							<th class="my-w60">蝶阀厂家</th>
							<td>
								<s:textfield id="butterflyValveFactory" name="offerProjectItem.butterflyValveFactory" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=12'"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">箱体材料</th>
							<td>
								<s:textfield id="boxMaterial" name="offerProjectItem.boxMaterial" theme="simple" style="width:200px;" cssClass="easyui-combobox" data-options="
									valueField: 'id',
									textField: 'text',
								 	required:true,
									url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=13'"></s:textfield>
							</td>
						</tr>
						<tr>
							<th colspan="2">可选项</th>
						</tr>
						<tr>
							<th class="my-w60">电伴热</th>
							<td>
								<s:textfield id="isElectricTracing" name="offerProjectItem.isElectricTracing" theme="simple" cssClass="easyui-switchbutton"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">箱体保温</th>
							<td>
								<s:textfield id="isTankInsulation" name="offerProjectItem.isTankInsulation" theme="simple" cssClass="easyui-switchbutton"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">防爆开关箱</th>
							<td>
								<s:textfield id="isSwitchBox" name="offerProjectItem.isSwitchBox" theme="simple" cssClass="easyui-switchbutton"></s:textfield>
							</td>
						</tr>
						<tr>
							<th colspan="2">其他费用</th>
						</tr>
						<tr>
							<th class="my-w60">运费</th>
							<td>
								<s:textfield id="freightFee" name="offerProjectItem.freightFee" theme="simple" cssClass="easyui-textbox" style="width:200px;"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">吊装费</th>
							<td>
								<s:textfield id="hoistingFee" name="offerProjectItem.hoistingFee" theme="simple" cssClass="easyui-textbox" style="width:200px;"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">仪表标定费</th>
							<td>
								<s:textfield id="calibrationFee" name="offerProjectItem.calibrationFee" theme="simple" cssClass="easyui-textbox" style="width:200px;"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">培训费</th>
							<td>
								<s:textfield id="trainingExpenseFee" name="offerProjectItem.trainingExpenseFee" theme="simple" cssClass="easyui-textbox" style="width:200px;"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">特殊工具费</th>
							<td>
								<s:textfield id="specialFee" name="offerProjectItem.specialFee" theme="simple" cssClass="easyui-textbox" style="width:200px;"></s:textfield>
							</td>
						</tr>
						<tr>
							<th class="my-w60">备品备件费</th>
							<td>
								<s:textfield id="sparePartsFee" name="offerProjectItem.sparePartsFee" theme="simple" cssClass="easyui-textbox" style="width:200px;"></s:textfield>
							</td>
						</tr>
					</table>
				</form>
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>