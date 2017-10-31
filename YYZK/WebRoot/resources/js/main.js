var sysmenus;
$(function () {
	$.ajax({
		type: "post",
		url: "menu/menu!showList.htm",
		dataType: "json",
		async: false,
		success: function (listData, textStatus) {
			sysmenus = new Backbone.Collection(listData.rows);  
			var layers1 = sysmenus.where({layers: 1});
			var lis='';
			$.each(layers1,function(index,obj1){
				var layers2 = sysmenus.where({layers: 2,pId:obj1.attributes.id});
				var lis2 = '';
				$.each(layers2,function(index,obj2){
					var layers3 = sysmenus.where({layers: 3,pId:obj2.attributes.id});
					var lis3 = '';
					$.each(layers3,function(index,obj3){
						var targetUrl = obj3.attributes.url+"?menuId="+obj3.attributes.id;
						lis3 = lis3 + '<li class=""><a hidefocus="hidefocus" onclick="createTab('+obj3.attributes.id+',\''+obj3.attributes.name+'\',\''+targetUrl+'\',\'\');" href="javascript:;" class="second-menu-item">'+obj3.attributes.name+'</a></li>';
					});
					lis2 = lis2 + 
					'    <h4>'+obj2.attributes.name+'</h4>' + 
	            	'    <ul class="second-menu" id="second-menulist-'+obj2.attributes.id+'">' + 
	            	lis3 +
	                '    </ul>'+
					'    <div style="clear:both"></div>' ;
				});
				lis = lis+	'<li data-submenu-id="second-menu-'+obj1.attributes.id+'">' + 
		      	'  <div class="first-menu-item" hidefocus="hidefocus">' + 
		      	'    <i class="iconfont" style="color:'+obj1.attributes.iconColor+'">'+obj1.attributes.iconFont+'</i>' + 
		      	'    <span class="first-menu-title">'+obj1.attributes.name+'</span>' + 
            	'  </div>' + 
            	'  <div class="second-panel" id="second-menu-'+obj1.attributes.id+'">' + 
            	lis2 +
            	'  </div>' + 
            	'</li>';
			});
			$("#first_menu").append(lis);
			
			initMenuHeight();
		}
	});
});

