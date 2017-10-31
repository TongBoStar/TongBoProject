// JavaScript Document
var MENU_ITEM_HEIGHT = 30;
var SCROLL_HEIGHT = 4 * MENU_ITEM_HEIGHT;

$(function () {
	resizeLayout();
	
	$('#tabs_container').tabs({
		tabsLeftScroll:'tabs_left_scroll',
		tabsRightScroll:'tabs_right_scroll',
		panelsContainer:'center',
		secondTabsContainer: 'funcbar_left'
	});
	
	$('#funcbar_left').delegate('.second-tab-item','click',function(){
        var self = $(this);
        var url = self.attr('action');
        var id = self.attr('secondTabId');
        if(url.indexOf("?")>-1){
        	url = url+"&menuId="+self.attr('menuId');
        }else{
        	url = url+"?menuId="+self.attr('menuId');
        }
        $("#tabs_"+id+"_iframe").attr('src',url);
    });
	
	$(".west-body").delegate(".scroll-up","click",function(){
		var ul = $('ul#first_menu');
		ul.scrollTop(-SCROLL_HEIGHT);
	});
	
	$(".west-body").delegate(".scroll-down","click",function(){
		var ul = $('ul#first_menu');
		ul.scrollTop(SCROLL_HEIGHT);
	});
	
	$(window).resize(function() {
  		resizeLayout();
	});
	
	createTab(1000, '我的桌面', 'desktop.htm', '');
	createTab(1001, '信息中心', 'info.htm', '');
	selectTab(1001);
});


function Text2Object(data){
    var self = this;
    try{
        var func = new Function("return " + data);
        return func();
    }
    catch(ex){
        return '<b>' + ex.description + '</b><br /><br />' + self.HTML2Text(data) + '';
    }
}

function HTML2Text(html){
    var div = document.createElement('div');
    div.innerHTML = html;
    return div.innerText;
}

function selectTab(id){
    $('#tabs_container').tabs('select', id);
}
function closeTab(id){
    $('#tabs_container').tabs('close', id);
}

function createTab(id, name, code, open_window){
	$.ajax({
		type: "post",
		url: "menu/menu!showList.htm",
		data:{"menuQuery.pId":id},
		dataType: "json",
		async: false,
		success: function (list, textStatus) {
			var url = "";
			var html = "";
			if(list.rows.length>0){
				var array = list.rows;
		        for(var i=0; i< array.length; i++)
		        {
		            var className = i==0 ? ' class="second-tab-item active"' : 'class="second-tab-item"';//默认打开第一个标签页地址
		            var href = array[i].url;
		            if(href.indexOf("?")>-1){
		            	href = href+"&menuidparam="+array[i].id;
			        }else{
			        	href = href+"?menuidparam="+array[i].id;
			        }
		            html += '<a menuId="'+array[i].id+'" title="' + array[i].name + '" action="' + href + '" secondTabId="' + id + '"' + className + ' hidefocus="hidefocus"><span>' + array[i].name + '</span></a>';
		        }
		        html = '<div id="second_tabs_' + id + '" class="second-tabs-container">' + html +'</div>';
		        $(html).appendTo('#funcbar_left');
		
		        var secondTabs = jQuery('#second_tabs_' + id);
		        $('a', secondTabs).click(function(){
		            $('a.active', secondTabs).removeClass('active');
		            $(this).addClass('active');
		        });
		
		        if($('a.active', secondTabs).length <= 0)
		            $('a:first', secondTabs).addClass('active');
		        $('a:last', secondTabs).addClass('last');
		
		        url =  array[0].url;
		        if(url.indexOf("?")>-1){
		        	url = url+"&menuId="+array[0].id;
		        }else{
		        	url = url+"?menuId="+array[0].id;
		        }
		        addTab(id, name, url, true);
				
			}else{
				addTab(id, name, code, open_window);
			}
		}
	});
}

function addTab(id, name, code, open_window){
	var height = '100%';
	$('#tabs_container').tabs('add', {
    	id: id,
      	title: name,
      	closable:"closable",
		selected: "selected",
		style: 'height:' + height + ';',
		content: '<iframe id="tabs_' + id + '_iframe" name="tabs_' + id + '_iframe" src="' + code + '"' +  ' border="0" frameborder="0" framespacing="0" marginheight="0" marginwidth="0" style="width:100%;height:' + height + ';"></iframe>',
		callback: function() {
            callback && callback();
        }
	});
}

function resizeLayout(){
	var wWidth = (window.document.documentElement.clientWidth || window.document.body.clientWidth || window.innerHeight);
	var width = wWidth - $('#logo').outerWidth() - $('#infobar').outerWidth();
	$('#tabs_container').width(width - $('#tabs_left_scroll').outerWidth() - $('#tabs_right_scroll').outerWidth() - 36);
	$('#taskbar').width(width-36);
	
	//console.log("############");
	//console.log("tabs_left_scroll:"+$('#tabs_left_scroll').outerWidth());
	//console.log("tabs_right_scroll:"+$('#tabs_right_scroll').outerWidth());
	//console.log(width);
	//console.log("############");
	
	$('#tabs_container').triggerHandler('_resize');
	initMenuHeight();
}

function initMenuHeight(){
    var availheight = $('.west-footer').offset().top-$('#north').height()-$("#funcbar").height();
    var scrollheight = $("#first_menu")[0].scrollHeight;
    if(availheight < scrollheight){
        availheight = availheight-40;//avail height - top bottom scroll height
        $("#first_menu").height(availheight);
        $('.scroll-up').show();
        $('.scroll-down').show();
    }
    else{
        $("#first_menu").height(availheight);
        $('.scroll-up').hide();
        $('.scroll-down').hide();
    }
}

