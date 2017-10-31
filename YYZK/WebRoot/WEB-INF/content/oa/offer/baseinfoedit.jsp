<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>基础信息维护</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/defaultheader.jsp" flush="true"/>
<script type="text/javascript">
$(function () {
	$('#centerdatagrid').datagrid({
    	//url:'${ctx}/offer/offer!baseInfoPage.htm',
        title: '基础数据列表',
        iconCls:'iconfont icon-iconlist',
        toolbar:'#centertoolbar',
        border: true,
        fit: true,
        singleSelect: true,
        striped : true,
        pagination: false,
        rownumbers: true,
        fitColumns: false,
        columns: [
		[	
			{field: "baseInfoId", title: "baseInfoId", hidden: true},
		 	{field: 'name', title: '零部件名称',width:'120',editor:{
		 		type:'textbox',
		 		options:{
			 		required:true
		 		}
		 	}},
		 	{field: 'typeAndSpecification', title: '型号及规格',width:'360',editor:{
		 		type:'textbox',
		 		options:{
			 		required:true
		 		}
		 	}},
		 	{field: 'unit', title: '单位',width:'60'
		 		,formatter:function(value,row){
                	return row.unitValue;
            	},editor:{
			 		type:'combobox',
			 		options:{
			 			valueField: 'id',
				        textField: 'text',
				 		url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=34',
				 		required:true
			 		}
			 	}
		 	},
		 	{field: 'number', title: '数量',width:'60',editor:{
		 		type:'textbox',
		 		options:{
			 		required:true
		 		}
		 	}},
		 	{field: 'remarks', title: '备注',width:'120',editor:{
		 		type:'textbox',
		 		options:{
			 		required:true
		 		}
		 	}},
		 	{field: 'unitPrice', title: '列表单价',width:'120',editor:{
		 		type:'textbox',
		 		options:{
			 		required:true
		 		}
		 	}},
		 	{field: 'sort', title: '排序',width:'120',editor:{
		 		type:'numberbox',
		 		options:{
			 		required:true
		 		}
		 	}}
		]
        ],
        onBeforeLoad:function(){},
        onLoadSuccess:function(){},
        onDblClickCell:onDblClickCell,
        onClickCell:onClickCell
    });
	
	$("#entrancePressure").combobox({
		onChange : loadData
	});
	$("#outletPressure").combobox({
		onChange : loadData
	});
	$("#flow").combobox({
		onChange : loadData
	});
	
	if("${baseInfo.entrancePressure}"!=""){
		$('#entrancePressure').combobox('setValue', "${baseInfo.entrancePressure}");
	}
	if("${baseInfo.outletPressure}"!=""){
		$('#outletPressure').combobox('setValue', "${baseInfo.outletPressure}");
	}
	if("${baseInfo.flow}"!=""){
		$('#flow').combobox('setValue', "${baseInfo.flow}");
	}
	
	
	loadData();
});

function loadData(){
	var entrancePressureValue = $("#entrancePressure").combobox('getValue');
	var outletPressureValue = $("#outletPressure").combobox('getValue');
	var flowValue = $("#flow").combobox('getValue');
	
	if(entrancePressureValue!="" && outletPressureValue!="" && flowValue!=""){
		$('#centerdatagrid').datagrid({
			url:'${ctx}/offer/offer!baseInfoNoPage.htm',    
			queryParams:{'offerBaseInfoQuery.entrancePressure':entrancePressureValue,  'offerBaseInfoQuery.outletPressure':outletPressureValue,'offerBaseInfoQuery.flow':flowValue }
		});
	}
}


function save(){
	//var rows = $('#centerdatagrid').datagrid('getChanges');
    //alert(rows.length+' rows are changed!');
	
	if (endEditing()){
        $('#centerdatagrid').datagrid('acceptChanges');
        
        
        $('#form').form('submit',{
            onSubmit:function(){
                if($(this).form('enableValidation').form('validate')){
                	
                	var entrancePressureValue=$("#entrancePressure").combobox('getValue');
                	var outletPressureValue=$("#outletPressure").combobox('getValue');
                	var flowValue=$("#flow").combobox('getValue');
                	
                	var rows = $("#centerdatagrid").datagrid("getRows");
                	var param = {};
                	var count = 0;
                	for(var i=0;i<rows.length;i++)
                	{
                		//alert(rows[i].baseInfoId);
                		/*
                		if(rows[i].baseInfoId==undefined){
                			param["baseInfoList[" + count + "].baseInfoId"] = rows[count].baseInfoId;
                    		param["baseInfoList[" + count + "].entrancePressure"] = entrancePressureValue;
                    		param["baseInfoList[" + count + "].outletPressure"] = outletPressureValue;
                    		param["baseInfoList[" + count + "].flow"] = flowValue;
                    		param["baseInfoList[" + count + "].name"] = rows[count].name;
                    		param["baseInfoList[" + count + "].typeAndSpecification"] = rows[count].typeAndSpecification;
                    		param["baseInfoList[" + count + "].unit"] = rows[count].unit;
                    		param["baseInfoList[" + count + "].number"] = rows[count].number;
                    		param["baseInfoList[" + count + "].remarks"] = rows[count].remarks;
                    		param["baseInfoList[" + count + "].unitPrice"] = rows[count].unitPrice;
                    		count++;
                		}
                		*/
                		if(rows[i].baseInfoId!=undefined){
                			param["baseInfoList[" + i + "].baseInfoId"] = rows[i].baseInfoId;
                		}
                		param["baseInfoList[" + i + "].entrancePressure"] = entrancePressureValue;
                		param["baseInfoList[" + i + "].outletPressure"] = outletPressureValue;
                		param["baseInfoList[" + i + "].flow"] = flowValue;
                		param["baseInfoList[" + i + "].name"] = rows[i].name;
                		param["baseInfoList[" + i + "].typeAndSpecification"] = rows[i].typeAndSpecification;
                		param["baseInfoList[" + i + "].unit"] = rows[i].unit;
                		param["baseInfoList[" + i + "].number"] = rows[i].number;
                		param["baseInfoList[" + i + "].remarks"] = rows[i].remarks;
                		param["baseInfoList[" + i + "].unitPrice"] = rows[i].unitPrice;
                		param["baseInfoList[" + i + "].sort"] = rows[i].sort;
                		//获取每一行的数据
                		//alert(rows[i].id);//假设有id这个字段
                	}
                	if(rows.length>0){
                		$.ajax({
            				type: "post",
            				url: "${ctx}/offer/offer!baseInfoBathEdit.htm",
            				data:param,
            				dataType: "json",
            				async: false,
            				beforeSend:function(){},
            				success: function (data, textStatus) {
            					if(data.success==true){
            						$.messager.confirm('提示', '保存成功！', function(r){
            							//window.location.href = "${ctx}/oa/offer/baseinfo.htm";
            						});
            					}
            				}
            			});
                	}
                }
            }
        });
    }
}

var editIndex = undefined;
function endEditing(){
    if (editIndex == undefined){return true}
    if ($('#centerdatagrid').datagrid('validateRow', editIndex)){
        var ed = $('#centerdatagrid').datagrid('getEditor', {index:editIndex,field:'unit'});
        var unitValue = $(ed.target).combobox('getText');
        $('#centerdatagrid').datagrid('getRows')[editIndex]['unitValue'] = unitValue;
        $('#centerdatagrid').datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}


function add(){
	if($("#entrancePressure").combobox('getText')!="" && $("#outletPressure").combobox('getText')!="" && $("#flow").combobox('getText')!=""){
		if(endEditing()){
			$('#centerdatagrid').datagrid('appendRow',{});
		    editIndex = $('#centerdatagrid').datagrid('getRows').length-1;
		    $('#centerdatagrid').datagrid('selectRow', editIndex).datagrid('beginEdit', editIndex);
		}
	}else{
		$.messager.confirm('提示', '请选择进口压力，出口压力及流量！', function(r){
			
		});
	}
	
}

function del(){
	//baseInfoDelete
	//如果存在id，则需要同时删除表
	var row = $('#centerdatagrid').datagrid('getSelected');
	if(row){
		if(row.baseInfoId!=undefined){
			$.ajax({
				type: "post",
				url: "${ctx}/offer/offer!baseInfoDelete.htm?baseInfo.baseInfoId="+row.baseInfoId,
				dataType: "json",
				async: false,
				beforeSend:function(){},
				success: function (data, textStatus) {
					if(data.success){
						if (editIndex == undefined){return}
						$('#centerdatagrid').datagrid('cancelEdit', editIndex).datagrid('deleteRow', editIndex);
						editIndex = undefined;
					}
				}
			});
		}else{
			if (editIndex == undefined){return}
			$('#centerdatagrid').datagrid('cancelEdit', editIndex).datagrid('deleteRow', editIndex);
			editIndex = undefined;
		}
	}
}

function onDblClickCell(index, field){
    if (editIndex != index){
        if (endEditing()){
            $('#centerdatagrid').datagrid('selectRow', index).datagrid('beginEdit', index);
            var ed = $('#centerdatagrid').datagrid('getEditor', {index:index,field:field});
            if (ed){
                ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
            }
            editIndex = index;
        } else {
            $('#centerdatagrid').datagrid('selectRow', editIndex);
        }
    }
}

function onClickCell(index,field){
	if (endEditing()){
        $('#centerdatagrid').datagrid('acceptChanges');
    }
}

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
			<div class="easyui-layout" data-options="fit:true,border:false">
				<div data-options="region:'north',border:false">
					<div id="toolbar" class="datagrid-toolbar">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-iconsave',plain:true" onclick="save()">保存</a>
					</div>
				</div>
				<div data-options="region:'center',border:false">
					<form id="form" method="post">
						<table class="my-table-form">
							<tr>
				   				<th class="my-w80">进口压力</th>
				      			<td>
									<input id="entrancePressure" name="baseInfo.entrancePressure" style="width:200px;" class="easyui-combobox" data-options="
							        valueField: 'id',
							        textField: 'text',
							        required:true,
							        url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=5'">
									<s:hidden name="baseInfo.baseInfoId" id="baseInfoId"></s:hidden>
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">出口压力</th>
				      			<td>
				        			<input id="outletPressure" name="baseInfo.outletPressure" style="width:200px;" class="easyui-combobox" data-options="
							        valueField: 'id',
							        textField: 'text',
							        required:true,
							        url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=6'">
				        		</td>
				        	</tr>
				        	<tr>
				   				<th class="my-w80">流量</th>
				      			<td>
				        			<input id="flow" name="baseInfo.flow" style="width:200px;" class="easyui-combobox" data-options="
							        valueField: 'id',
							        textField: 'text',
							        required:true,
							        url: '${ctx}/offer/offer!dictItemCombobox.htm?offerDictItemQuery.dictTreeId=7'">
				        		</td>
				        	</tr>
				        	<tr>
				        		<td colspan="2" style="height:400px;">
				        			<table id="centerdatagrid"></table>
				        			<div id="centertoolbar">
										<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontadd',plain:true" onclick="add()">新增</a>
										<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'iconfont icon-fontdel',plain:true" onclick="del()">删除</a>
									</div>
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