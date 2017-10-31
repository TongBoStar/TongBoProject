(function($) {
	jQuery.extend( {

		/**
		 * ajax方式保存表单
		 * @param {Object} formId 表单id
		 * @param {Object} saveComplete 保存完成后调用方法
		 * @memberOf {TypeName} 
		 */
		ajaxSave : function(formId, saveComplete) {
			$.webAjaxFormSubmit( {
				formId : formId,
				success : function(data) {
					saveComplete.apply(this, [ data ]);
	
				}
			});	
		},

		/**
		 * ajax方式删除
		 * @param {Object} actionUrl 删除url
		 * @param {Object} deleteIds 删除id
		 * @param {Object} message 删除前提示信息
		 * @param {Object} deleteComplete 删除后调用方法
		 * @memberOf {TypeName} 
		 */
		ajaxDelete : function(actionUrl, deleteIds, message, deleteComplete) {
			var m = '确定删除吗？';
			if(message) {
				m = message;
			}
			$.confirmDialog(m, function() {
				var url = actionUrl;
				$.webAjax( {
					type : "post",
					url : url,
					data : deleteIds,
					success : function(data) {
						deleteComplete.apply(this, [ data ]);
					}
				});
			}, function() {});
			
	
		},
		/**
		 * ajax方式修改
		 * @param {Object} actionUrl 修改url
		 * @param {Object} updateIds 修改id
		 * @param {Object} message 修改前提示信息
		 * @param {Object} updateComplete 修改后调用方法
		 * @memberOf {TypeName} 
		 */
		ajaxUpdate : function(actionUrl, updateIds, message, updateComplete) {
			var m = '确定修改吗？';
			if(message) {
				m = message;
			}
			$.confirmDialog(m, function() {
				var url = actionUrl;
				$.webAjax( {
					type : "post",
					url : url,
					data : updateIds,
					success : function(data) {
						updateComplete.apply(this, [ data ]);
					}
				});
			}, function() {});
	
		},
		getSelected:function(formId,selectName)
		{
			var selectedIds='';
			var cn='selectedIdList';
			if(selectName)
			{
				cn=selectName;
			}
			if(!formId)
			{
				return;
			}
			$.each($('#'+formId+' select[name="' + cn + '"] option:selected'), function(i, n) {
				if (i > 0) {
					selectedIds += '&';
				}
				selectedIds += cn + '[' + i + ']=' + $(n).val();
			});			
			return selectedIds;
		},
		getPhoto : function (formId, checkboxName, type)
		{
				var photoList = '';
				var cn = 'photoList';
				if (checkboxName) {
					cn = checkboxName;
				}
				if (!formId) {
					return;
				}		
				
				$.each($('#'+formId+' input[name="' + cn + '"]'), function(i, n) {
					if (i > 0) {
						photoList += '&';
					}
					photoList += cn + '[' + i + ']=' + $(n).val();
				});
				return photoList;
				
		},
		/**
		 * 获取列表选中复选框
		 * @param {Object} formId 表单id
		 * @param {Object} checkboxName 复选框名称
		 * @param {Object} type 单选或多选 
		 * @return {TypeName} 选中复选框id字符串，如：checkedIdList=1&checkedIdList=2
		 */
		getCheckedIds : function(formId, checkboxName, type) {
			var checkedIds = '';
			var cn = 'checkedIdList';
			if (checkboxName) {
				cn = checkboxName;
			}
			if (!formId) {
				return;
			}
			
			if(type && type == 'radio') {
				if($('#'+formId+' input[name="' + cn + '"]:checked').length > 1){
					return checkedIds;
				}
			}
			
			$.each($('#'+formId+' input[name="' + cn + '"]:checked'), function(i, n) {
				if (i > 0) {
					checkedIds += '&';
				}
				checkedIds += cn + '[' + i + ']=' + $(n).val();
			});
			return checkedIds;
		},
		/**
		 * 获取列表选中复选框
		 * @param {Object} formId 表单id
		 * @param {Object} checkboxName 复选框名称
		 * @return {TypeName} 选中复选框id数组
		 */
		getCheckedIdToArray : function(formId, checkboxName) {
			var checkedIds = '';
			var cn = 'checkedIdList';
			if (checkboxName) {
				cn = checkboxName;
			}
			if (!formId) {
				return;
			}
			var checkedArray = new Array();
			$.each($('#'+formId+' input[name="' + cn + '"]:checked'), function(i, n) {
				checkedArray[i] = $(n).val();
			});
			return checkedArray;
		},
		
		/**
		 * 反选所有复选框
		 * @param {Object} checkboxName 复选框名称
		 */
		antiSelectAllCheckboxes : function (formId, checkboxName) {
			var cn = 'checkedIdList';
			if (checkboxName) {
				cn = checkboxName;
			}
			if (!formId) {
				return;
			}
			
			var elms = $('#'+formId+' input[name="' + cn + '"]');
			
			if(elms.length == 0) {
				return;
			}
			var state = !elms[0].checked;
			$.each(elms, function(i, n) {
				elms[i].checked = state;
			});
		},
		scrollDiv:function(divId)
		{			
			var screenwidth=$(window).width();
			var screenheight=$(window).height();
			$(window).resize(function(){
			screenwidth=$(window).width();
			screenheight=$(window).height();
			mytop=$(document).scrollTop();
			getPosLeft=screenwidth/4;
			getPosTop=screenheight/4;
			$('#'+divId).css({"left":getPosLeft,"top":getPosTop+mytop});
			});
			$(window).scroll(function(){
			screenwidth=$(window).width();
			screenheight=$(window).height();
			mytop=$(document).scrollTop();
			getPosLeft=screenwidth/4;
			getPosTop=screenheight/4;
			$('#'+divId).css({"left":getPosLeft,"top":getPosTop+mytop});
			})
			
		},
		openDiv : function(divId) {
			if(!$('#'+divId).is(':hidden')) {
				return;
			}
			var top = $(window).height() / 4;
			var left = $(window).width() / 4;
			var scroolTop=$(document).scrollTop();
			var divWidth = $('#'+divId).width();
			var divHeight = $('#'+divId).height();
			
			var windowWidth = $(parent.window).width();
			var windowHeight = $(parent.window).height();
			var windowScrollTop = $(parent.document).scrollTop();
			var p = $("#right", window.parent.document);
			var mainFramePosition = p.offset();
			//alert('windowHeight/2:'+windowHeight/2+'divHeight/2 :'+divHeight/2 + 'mainFramePosition.top*2'+mainFramePosition.top*2+'windowScrollTop:'+windowScrollTop);
			var divTop = (top)+scroolTop;
			var divLeft = (left);
			if(mainFramePosition)
			{
				//divTop = windowHeight/2  - mainFramePosition.top*2 + windowScrollTop ;
				divTop = (windowHeight - divHeight)/2 - mainFramePosition.top +windowScrollTop;
				divLeft = windowWidth/2- divWidth/2 - mainFramePosition.left;				
			}
			//alert(windowHeight + '--'+divHeight);
			//divTop = (windowHeight - divHeight)/2 - mainFramePosition.top +windowScrollTop;
			
			if(divTop <0) {
				divTop = 0;
			}
			if(divLeft < 0) {
				divLeft = 0;
			}
			//var div_title_a = $('<a id="div_title_close" class="butnOrange"><span style="float:right;">关闭</span></a>');
			var div_title_a = $('<a class="butnOrange"><span>关闭</span></a>');
			var div_title = $('<h2 class="titleh2"><b>操作提示</b></h2>');
			div_title_a.appendTo(div_title);
			div_title_a.bind('click', function() {
				$.closeDiv(divId);
			});
			var h2 = $('#' + divId).find('h2').first();
			h2.addClass('titleh2');
			h2.css({cursor: 'move'});
			//alert($('#' + divId).find('h2').first().attr("ID"));
			if($('#' + divId).find('h2').first().html() == null) {
				div_title.prependTo($('#' + divId));
				div_title.css({cursor: 'move'});
			}
			
			$('#' + divId).draggable({containment: 'document',handle: "h2.titleh2"});
			/*$('#' + divId).Drags({
					  handler: '#div_title',                
					  zIndex:200,
					  opacity:.9
				  });
			*/
			$('#backgroundDiv').height($(window).height());
			$('#backgroundDiv').width($(document).width());
			$('#backgroundDiv').show();
			//new SimpleDrag(divId);
			//$('#' + divId).css({ top: divTop, left: divLeft });
			$('#' + divId).center();
			$('#' + divId).show();
			//alert('top:'+ divTop+', left: '+divLeft);
			//$.scrollDiv(divId);
		},
	
		closeDiv : function(divId) {
			$('#backgroundDiv').hide();
			$('#' + divId).hide();
		}
	
		});

})(jQuery);

function setAllCheckboxState(name) {
	var elms = document.getElementsByName(name);
	var state = !elms[0].checked;
	for ( var i = 0; i < elms.length; i++) {
		elms[i].checked = state;

	}
}
jQuery.fn.center = function(loaded) {
	var obj = this;
	body_width = parseInt($(window).width());
	body_height = parseInt($(window).height());
	block_width = parseInt(obj.width());
	block_height = parseInt(obj.height());
	
	left_position = parseInt((body_width/2) - (block_width/2)  + $(window).scrollLeft());//控制div的显示的位置
	if (body_width<block_width) { left_position = 0 + $(window).scrollLeft(); };
	
	top_position = parseInt((body_height/2) - (block_height/2) + $(window).scrollTop());//控制div的显示的位置
	if (body_height<block_height) { top_position = 0 + $(window).scrollTop(); };
	
	if(!loaded) {
		obj.css({'position': 'absolute'});
		obj.css({ 'top': top_position, 'left': left_position });
		$(window).bind('resize', function() { 
			obj.center(!loaded);
		});
		$(window).bind('scroll', function() { 
			obj.center(!loaded);
		});
		
	} else {
		obj.stop();
		obj.css({'position': 'absolute'});
		obj.animate({ 'left':left_position }, 200, 'linear');
	}
}