<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>报价清单打印</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jquery -->
<script type="text/javascript" src="${ctx}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/plugins/baidu/baiduTemplate.js"></script>
<script id="bidinglc" type="text/template">
<table class="tbbiding" border="3">
	<tr>
    	<td colspan="8"><img src="<!=lcImg!>" width="784px"/></td>
  	</tr>
</table>
</script>
<script id="bidingzz" type="text/template">
<table class="tbbiding" border="3">
	<tr>
    	<td colspan="8"><img src="<!=zzImg!>"  width="784px"/></td>
  	</tr>
</table>
</script>
<script id="bidingjc" type="text/template">
<table class="tbbiding" border="3">
	<tr>
    	<td colspan="8"><img src="<!=jcImg!>"  width="784px"/></td>
  	</tr>
</table>
</script>
<script id="biding" type="text/template">
<table class="tbbiding" border="3">
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
	<!if(list.length<35){!>
	<!for(var i = 0; i<(35-list.length);i++){ !>
		<tr>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
    		<td align="left">&nbsp;</td>
  		</tr>
	<!}!>
  <!}!>
</table>

</script>
<script type="text/javascript">
function create(itemId,islast,sortval){
	$.ajax({
		type: "post",
		url: "${ctx}/offer/offer!bindingPrint.htm?offerProjectItemQuery.itemId="+itemId,
		dataType: "json",
		async: false,
		success: function (data, textStatus) {
			var bt=baidu.template;
			baidu.template.LEFT_DELIMITER='<!';
			baidu.template.RIGHT_DELIMITER='!>';
			
			
			var entrancePressure = data.entrancePressureValue;
			var outletPressure = data.outletPressureValue;
			var flow = data.flowValue;
				
			
			var lcImg = data.lcImg;
			var zzImg = data.wxImg;
			var jcImg = data.jcImg;
			
			
			if(sortval==1){
				//流程图
				if(lcImg!="" && lcImg!="null"){
					var tpllcdata = {};
					tpllcdata.lcImg="${ctx}/upload/lc/"+lcImg;
					var html=bt('bidinglc',tpllcdata);
					$("#divbiding").append(html);
					$("#divbiding").append('<div class="w3cbbs"></div>');
				}
			}else if(sortval==2){
				//外形图
				if(zzImg!="" && zzImg!="null"){
					var tplzzdata = {};
					tplzzdata.zzImg="${ctx}/upload/wx/"+zzImg;
					var html=bt('bidingzz',tplzzdata);
					$("#divbiding").append(html);
					$("#divbiding").append('<div class="w3cbbs"></div>');
				}
			}else if(sortval==3){
				//基础图
				if(jcImg!="" && jcImg!="null"){
					var tpljcdata = {};
					tpljcdata.jcImg="${ctx}/upload/jc/"+jcImg;
					var html=bt('bidingjc',tpljcdata);
					$("#divbiding").append(html);
					$("#divbiding").append('<div class="w3cbbs"></div>');
				}
			}else if(sortval=4){
				//清单
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
					
				var html=bt('biding',tpldata);
				if(islast){
					$("#divbiding").append(html);
				}else{
					$("#divbiding").append(html);
					$("#divbiding").append('<div class="w3cbbs"></div>');
				}
			}
		}
		}
	);
}

function GetQueryString(name)
{
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return  unescape(r[2]); return null;
}

$(function () {
	var printlist = GetQueryString('printlist');
	var printarray = printlist.split(',');
	$.each(printarray,function(i,val){
		var sort = GetQueryString('sort');
		var sortarray = sort.split(',');
		$.each(sortarray,function(sorti,sortval){
			if(sortval!=''){
				create(val,printarray.length==(i+1),sortval);
			}
		});
		
	});
});

</script>
<style>
#divbiding{
	text-align: center;
	width:100%;
}
#dvivbiding .iframediv{
	color: red;
}
table.tbbiding{
	margin:auto;
	border-collapse: collapse;
    color: #666;
    width: 800px;
    font-family: '微软雅黑';
	font-size:12px;
	color:#333333;
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
.w3cbbs { page-break-after:always;}
</style>
</head>
<body>
	<div id="divbiding">
	</div>
</body>
</html>