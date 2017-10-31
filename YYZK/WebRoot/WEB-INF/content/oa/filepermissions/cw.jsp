<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>文件夹权限</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/common/myheader.jsp" flush="true"/>
<script>
$(function () {
	$("#dg").datagrid({
		fitColumns:true
	});
});
</script>
<style>
.red{font-weight:bold;color:red;}
.blue{font-weight:bold;color:blue;}
</style>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false" style="padding: 3px;">
	<div class="easyui-layout" data-options="fit:true">
		<table id="dg" style="height:100%;" data-options="rownumbers:true">
			<thead frozen="true" >
				<tr>
					<th data-options="field:'item01'" data-options="frozen:true">文件夹名称</th>
				</tr>
			</thead>
			<thead>
  				<tr>
    				<th colspan="11" data-options="field:'item02'">本部门人员权限</th>
    				<th colspan="4" data-options="field:'item03'">其他部门人员权限</th>
  				</tr>
  			</thead>
  			<thead>
  				<tr>
					<th data-options="field:'item05'">王粉萍</th>
					<th data-options="field:'item06'">缪素明</th>
					<th data-options="field:'item07'">时骏</th>
					<th data-options="field:'item08'">孟月华</th>
					<th data-options="field:'item09'">杨洪香</th>
					<th data-options="field:'item10'">祝丽伟</th>
					<th data-options="field:'item11'">王云峰</th>
					<th data-options="field:'item12'">蒋亚菊</th>
					<th data-options="field:'item13'">刘玮</th>
					<th data-options="field:'item14'">宋京晶</th>
					<th data-options="field:'item15'">郑诗瑶</th>
					<th data-options="field:'item16'">许颉</th>
					<th data-options="field:'item17'">顾文勇</th>
					<th data-options="field:'item18'">汤犇</th>
					<th data-options="field:'item19'">李亚峰</th>
  				</tr>
  			</thead>
   			<tbody>
				<tr>
					<td>1到期款</td>
					<td><span class="blue">读</span></td><!-- 王粉萍  -->
					<td>&nbsp;</td><!-- 缪素明  -->
					<td>&nbsp;</td><!-- 时骏  -->
					<td>&nbsp;</td><!-- 孟月华  -->
					<td>&nbsp;</td><!-- 杨洪香  -->
					<td>&nbsp;</td><!-- 祝丽伟  -->
					<td>&nbsp;</td><!-- 王云峰  -->
					<td>&nbsp;</td><!-- 蒋亚菊  -->
					<td>&nbsp;</td><!-- 刘玮  -->
					<td>&nbsp;</td><!-- 宋京晶 -->
					<td>&nbsp;</td><!-- 郑诗瑶  -->
					<td>&nbsp;</td><!-- 许颉  -->
					<td>&nbsp;</td><!-- 顾文勇  -->
					<td>&nbsp;</td><!-- 汤犇  -->
					<td>&nbsp;</td><!-- 李亚峰  -->
				</tr>
				<tr>
					<td>1函证</td>
					<td><span class="blue">读</span></td><!-- 王粉萍 -->
					<td>&nbsp;</td><!-- 缪素明  -->
					<td>&nbsp;</td><!-- 时骏  -->
					<td>&nbsp;</td><!-- 孟月华  -->
					<td>&nbsp;</td><!-- 杨洪香  -->
					<td>&nbsp;</td><!-- 祝丽伟  -->
					<td>&nbsp;</td><!-- 王云峰  -->
					<td>&nbsp;</td><!-- 蒋亚菊  -->
					<td>&nbsp;</td><!-- 刘玮  -->
					<td>&nbsp;</td><!-- 宋京晶 -->
					<td>&nbsp;</td><!-- 郑诗瑶  -->
					<td>&nbsp;</td><!-- 许颉  -->
					<td>&nbsp;</td><!-- 顾文勇  -->
					<td>&nbsp;</td><!-- 汤犇  -->
					<td>&nbsp;</td><!-- 李亚峰  -->
				</tr>
				<tr>
					<td>1回款开票考核</td>
					<td><span class="blue">读</span></td><!-- 王粉萍 -->
					<td>&nbsp;</td><!-- 缪素明  -->
					<td>&nbsp;</td><!-- 时骏  -->
					<td>&nbsp;</td><!-- 孟月华  -->
					<td>&nbsp;</td><!-- 杨洪香  -->
					<td>&nbsp;</td><!-- 祝丽伟  -->
					<td>&nbsp;</td><!-- 王云峰  -->
					<td>&nbsp;</td><!-- 蒋亚菊  -->
					<td>&nbsp;</td><!-- 刘玮  -->
					<td>&nbsp;</td><!-- 宋京晶 -->
					<td>&nbsp;</td><!-- 郑诗瑶  -->
					<td>&nbsp;</td><!-- 许颉  -->
					<td>&nbsp;</td><!-- 顾文勇  -->
					<td>&nbsp;</td><!-- 汤犇  -->
					<td>&nbsp;</td><!-- 李亚峰  -->
				</tr>
				<tr>
					<td>1结算</td>
					<td><span class="blue">读</span></td><!-- 王粉萍 -->
					<td>&nbsp;</td><!-- 缪素明  -->
					<td>&nbsp;</td><!-- 时骏  -->
					<td>&nbsp;</td><!-- 孟月华  -->
					<td>&nbsp;</td><!-- 杨洪香  -->
					<td>&nbsp;</td><!-- 祝丽伟  -->
					<td>&nbsp;</td><!-- 王云峰  -->
					<td>&nbsp;</td><!-- 蒋亚菊  -->
					<td>&nbsp;</td><!-- 刘玮  -->
					<td>&nbsp;</td><!-- 宋京晶 -->
					<td>&nbsp;</td><!-- 郑诗瑶  -->
					<td>&nbsp;</td><!-- 许颉  -->
					<td>&nbsp;</td><!-- 顾文勇  -->
					<td>&nbsp;</td><!-- 汤犇  -->
					<td>&nbsp;</td><!-- 李亚峰  -->
				</tr>
				<tr>
					    <td>1先报税</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>1发票与签收记录</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>12011年销售台账</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>1合同执行情况</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2保函</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2信用证</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2贷款</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2承兑</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2投标保证金</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2银行对账单</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2报表</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2银行授信所需公司文件</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2票据备查簿</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2银行账户信息汇总表</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>2资金计划</td>
					    <td><span class="red">写</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>3资金日报表</td>
					    <td><span class="red">写</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>3押金台账</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>4盘点报告</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>4销售出库明细表</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>4销售开票分析</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>4完工产品料工费归集汇总表</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>4动力消耗（水、电、气、油）明细</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>4统计报表</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>5现场服务费</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>5吨位统计</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>5供应商对账单</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>6在建固定资产台账</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>6研发台账</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>7报表分析</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>7生产报表及物料呆滞表</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>7供应商协议</td>
					    <td><span class="blue">读</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>8财务相关制度</td>
					    <td><span class="red">写</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>86S检查表</td>
					    <td><span class="red">写</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>8考核指标</td>
					    <td><span class="red">写</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
					  <tr>
					    <td>8工作计划</td>
					    <td><span class="red">写</span></td><!-- 王粉萍 -->
					    <td>&nbsp;</td><!-- 缪素明  -->
						<td>&nbsp;</td><!-- 时骏  -->
						<td>&nbsp;</td><!-- 孟月华  -->
						<td>&nbsp;</td><!-- 杨洪香  -->
						<td>&nbsp;</td><!-- 祝丽伟  -->
						<td>&nbsp;</td><!-- 王云峰  -->
						<td>&nbsp;</td><!-- 蒋亚菊  -->
						<td>&nbsp;</td><!-- 刘玮  -->
						<td>&nbsp;</td><!-- 宋京晶 -->
						<td>&nbsp;</td><!-- 郑诗瑶  -->
						<td>&nbsp;</td><!-- 许颉  -->
						<td>&nbsp;</td><!-- 顾文勇  -->
						<td>&nbsp;</td><!-- 汤犇  -->
						<td>&nbsp;</td><!-- 李亚峰  -->
					  </tr>
  					</tbody>
				</table>
			</div>
		</div>
</body>
</html>