<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/childrenHeader.jsp"%>
<script language="JavaScript" type="text/JavaScript">
$().ready(function() {
	roleList();
	
});

/**
 * 绑定查询参数
 */
function bindQueryParam(param) {
	param['roleQuery.roleName'] = $.trim($('#roleName').val());
	return param;
}

/**
 * 查询角色
 */
function roleList(param) {
	if(!param) {
		param = {"page.pageNo":1, "page.pageSize":10, "page.orderBy": "roleId", "page.order": "desc"};
	}
	param = bindQueryParam(param);
	//console.log('param: ' + $.toJSON(param));
	var url = ctx + '/role/role!list.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			
			if(data && data instanceof Object) {
				
				$('#data-body').html('');
				$.each(data.result, function(i, o){
					var html = '';
					html += '<tr>';
					html += '	<td><input type="checkbox" id="checkedRole" name="checkedRole" value="' + o.roleId + '"/></td>';
					html += '	<td>' + o.roleName + '</td>';			
					
					html += '	<td><a href="javascript:modifyRole(\'' + o.roleId + '\')"><img src="${ctx}/images/icon01.gif"/></a> | <a href="javascript:delRole(\'' + o.roleId + '\')"><img src="${ctx}/images/delete_small.gif"/></a></td>';
					html += '</tr>';
					
					$('#data-body').append(html);
				});
				$.paging('data-paging', 'queryForm', 'roleList', data);
			} else {
				alert(data);
			}
		}
	});
}

/**
 * 添加角色
 */
function addRole() {
	window.location.href = ctx + '/role/role_add.htm';
}

/**
 * 修改角色
 */
function modifyRole(roleId) {
	window.location.href = ctx + '/role/role-input.htm?roleId=' + roleId;
}

/**
 * 删除角色
 */
function delRole(roleId) {
	var param = {};
	if(roleId) {
		param['checkedIdList[0]'] = roleId;
	} else {		
		var delRoles = $('[name="checkedRole"]:checked');
		//console.log('del role length: ' + delRoles.length);
		var cnt = 0;
		$.each(delRoles, function(i, o){			
			param['checkedIdList[' + cnt + ']'] = $(o).val();
			cnt++;
		});
	}
	//console.log('param : ' + param['checkedIdList[0]']);
	if(!param['checkedIdList[0]']) {
		alert('请选择要删除的角色！');
		return;
	}
	
	if(!confirm('确定删除角色？')) {
		return;
	}
	var url = ctx + '/role/role!delete.htm';
	$.webAjax( {
		type : 'post',
		url : url,
		data : param,
		success : function(data) {
			
			if(data && data == 'success') {
				roleList();
			} else {
				alert(data);
			}
		}
	});
}

</script>
<form action="" name="queryForm" id="queryForm" method="post">
            <div class="mr-control">
                <div class="mrc-left">
                    角色名称 <input type="text" class="inputall" id="roleName" name="roleQuery.roleName"/>&nbsp;
                    <input type="button" value="搜索" class="btnall" onclick="roleList()"/>
                </div>
                <div class="mrc-right"><input type="button" value="添加角色" class="btnred" onclick="addRole()"/><input type="button" value="删除角色" class="btnred" onclick="delRole()"/></div>
            </div>
            <div class="mr-content">
                <table cellspacing="0" cellpadding="0" border="0" class="datalist">
                	<thead class="data-head">
                    <tr>
                        <th align="left" width="20"><input type="checkbox" onclick="$.antiSelectAllCheckboxes('queryForm', 'checkedRole')"/></th>
                        <th align="left" width="150" sort="t_role.roleName">角色名称</th>
                        <th align="left" width="80">操作</th>
                    </tr>
                    </thead>
                    <tbody id="data-body">
                    </tbody>
                </table>
                <div id="data-paging" class="col2 mb10">
                    </div>
            </div>
            <div class="mr-control" style="position:absolute; bottom:0; left:0; text-align:center;">
              <!--    <input type="button" value="确认" class="btnall" /> <input type="button" value="取消" class="btnall" /> <input type="button" value="无效" class="btnall" /> <input type="button" value="移除" class="btnall" /> <input type="button" value="打印" class="btnall" />
              -->
            </div>
 </form>
 <%@ include file="/common/childrenFooter.jsp"%>