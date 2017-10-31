var simpleTable = null;
(function($) {
	var SimpleTableConfigDefault = {
		id: 'simpleTable',
		formId : 'defaultPageForm',
		pageNo : 1,
		pageSize : 10,
		sortColumns : '',
		order: '',
		orderBy: '',
		pageSizeName: 'page.pageSize',
		pageNoName: 'page.pageNo',
		oderByName: 'page.orderBy',
		oderName: 'page.order',
		totalPagesName: 'page.totalPages',
		submitForm: function(){}
	};

	
    $.SimpleTable = function(e, o) {
		this.options = $.extend( {}, SimpleTableConfigDefault, o || {});//加载配置项
		this.defaultOptions =  $.cloneObj(this.options); //加载配置项

//		--------------------排序选中设置-----------------		
		
		var selector = '#' + this.options.formId + ' .gridBody th[sortColumn="' + this.options.orderBy + '"]';
		$(selector).addClass("sort " + this.options.order.toLowerCase());//设置排序字段样式
//		--------------------排序选中设置-----------------
		
		$('#' + this.options.formId +' .gridBody tbody tr').mouseover(function() {
			$(this).toggleClass('highlight',true);
		}).mouseout(function() {
			$(this).toggleClass('highlight',false);
		});
	};
   
    var $st = $.SimpleTable;

    $st.fn = $st.prototype = {
    		SimpleTable: '0'
    };

    $st.fn.extend = $st.extend = $.extend;

    $st.fn.extend({
    	bindStyle: function () {
    		var unSelector = '#' + this.options.formId + ' .gridBody thead th';
    		//var removeClass = '';
    		//if(this.options.order.toLowerCase() == 'asc') {
    		//	removeClass = 'sort desc';
    		//} else {
    		//	removeClass = 'sort asc';
    		//}
    		$(unSelector).removeClass('sort asc');
    		$(unSelector).removeClass('sort desc');
    		
	    	var selector = '#' + this.options.formId + ' .gridBody th[sortColumn="' + this.options.orderBy + '"]';
			if(this.options.order.toLowerCase()=='asc'){
				$(selector).removeClass("sort desc");//设置排序字段样式
			}else{
				$(selector).removeClass("sort asc");//设置排序字段样式
			}
			$(selector).addClass("sort " + this.options.order.toLowerCase());//设置排序字段样式
	//		--------------------排序设置-----------------
			
			$('#' + this.options.formId +' .gridBody tbody tr').mouseover(function() {
				$(this).toggleClass('highlight',true);
			}).mouseout(function() {
				$(this).toggleClass('highlight',false);
			});
    	},
    	setDefaultPageParam: function() {
			
			this.options = $.cloneObj(this.defaultOptions);
    	},
    	bindPageParam: function() {
			
			var params = '';
			params += this.options.pageNoName + '=' + this.options.pageNo;
			params += '&' + this.options.pageSizeName + '=' + this.options.pageSize;
			params += '&' + this.options.oderByName + '=' + this.options.orderBy;
			params += '&' + this.options.oderName + '=' + this.options.order;
			return params;
    	},
    	togglePageNew : function(pageSize,pageNo) {
			this.options.pageNo = pageNo;
			this.options.pageSize = pageSize;
			this.submitForm();
		},
    	togglePage : function(pageNo) {
			this.options.pageNo = pageNo;
			this.submitForm();
		},
		
		togglePageSize : function(pageSize) {
			this.options.pageSize = pageSize;
			this.submitForm();
		},
		
    	toggleSort: function(column, sort) {
			this.options.order = sort;
			this.options.orderBy = column;			
			this.submitForm();
		},
		
		submitForm: function() {
			if (this.options['submitForm'] != null ) {
				this.callback('submitForm', this.bindPageParam());
			} 
		},
		callback: function(event, a, b, c, d ,e ) {
			if (this.options[event] == null ) {
                return;
            }
			var callback = this.options[event];
			if (!$.isFunction(callback)) {
                return;
            }
			
			 var self = this;
			 callback(self, a, b);
		}
		
    });

    $st.extend({
    	
    });

    
    $.fn.SimpleTable = function(o) {
    	var obj = new $st(this, o);
    	//--------------------绑定排序字段click事件------------------------
    	$("#" + obj.options.formId + " .gridBody th[sortColumn]")
				.click(function() {
					//handle click sort header
						var column = $(this).attr('sortColumn');

						if(obj.options.orderBy == column) {
//							toLowerCase() 
						
							if(obj.options.order.toLowerCase() == 'asc') {
								obj.toggleSort(column, 'desc');
							} else {
								obj.toggleSort(column, 'asc');
							}
						} else {
							obj.toggleSort(column, 'desc');
						}
						
					}).mouseover(function() {
					$(this).toggleClass('tableHeaderSortHover', true);
				}).mouseout(function() {
					$(this).toggleClass('tableHeaderSortHover', false);
				});
    	//--------------------绑定排序字段click事件------------------------
    	return obj;
    };

    
    
    var SimpleTableUtils = {
    	
    };
   
   
})(jQuery);
