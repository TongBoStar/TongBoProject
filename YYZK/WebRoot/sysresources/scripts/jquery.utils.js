try{
	jQuery.extend({
	    /** * @see 将javascript数据类型转换为json字符串 * @param 待转换对象,支持object,array,string,function,number,boolean,regexp * @return 返回json字符串 */
	    toJSON: function(object) {
		    if(object==null){
			    return '{}';
		    }
	      var type = typeof object;
	      if ('object' == type) {
	        if (Array == object.constructor) type = 'array';
	        else if (RegExp == object.constructor) type = 'regexp';
	        else type = 'object';
	      }
	      switch (type) {
	      case 'undefined':
	      case 'unknown':
	        return;
	        break;
	      case 'function':
	      case 'boolean':
	      case 'regexp':
	        return object.toString();
	        break;
	      case 'number':
	        return isFinite(object) ? object.toString() : 'null';
	        break;
	      case 'string':
	        return '"' + object.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g, function() {
	          var a = arguments[0];
	          return (a == '\n') ? '\\n': (a == '\r') ? '\\r': (a == '\t') ? '\\t': ""
	        }) + '"';
	        break;
	      case 'object':
	        if (object === null) return 'null';
	        var results = [];
	        for (var property in object) {
	          var value = jQuery.toJSON(object[property]);
	          if (value !== undefined) results.push(jQuery.toJSON(property) + ':' + value);
	        }
	        return '{' + results.join(',') + '}';
	        break;
	      case 'array':
	        var results = [];
	        for (var i = 0; i < object.length; i++) {
	          var value = jQuery.toJSON(object[i]);
	          if (value !== undefined) results.push(value);
	        }
	        return '[' + results.join(',') + ']';
	        break;
	      }
	    },
	    
	    showWaiting : function(target){
			var rnt = $('<div  style="width:100%;text-align: center"><img src="'+ctx+'/images/loading-small.gif"></img></div>');
			rnt.appendTo($(target));
			return rnt;
		},
		hiddeWaiting : function(waitObject){
			$(waitObject).hide();
		},
		showMessage :function(msg, y, x, notHide){
			if($.trim(msg) == ''){
				return;
			}
			var tooltip = $('#tooltipMessage');
			if(y) {
				mousey = y;
			}
			if(x) {
				mousex = x;
			}
			
			if(!tooltip.is( ":hidden ")) {
				tooltip.hide();
			}
			
			tooltip.css({  top: mousey, left: mousex ,display: "block"});
			tooltip.html(msg);
			if(!notHide) {
				window.setTimeout(function(){tooltip.hide("slow");},5000);
			}
			
		},
		showPromptMessage :function(msg, top, left){
			
			var tooltip = $('#tooltipMessage');
			tooltip.css({  top: top, left: left ,display: "block"});
			tooltip.html(msg);
			window.setTimeout(function(){tooltip.hide("slow");},5000);
		},
		addNumber :function(obj,num){
			var numberObject = $(obj);
			var oldNum = parseInt(numberObject.html(),10);
			 numberObject.html(oldNum+num);
		},
		getHour: function(){
			var today = new Date();
			return today.getHours();
		},
		confirmDialog:function(message,okHandler, cancelHandler){
			if(message==''){
				message = '确认吗？';
			}
			alert('这个弹出有问题，回头再改');
			return;
			var commonMessageDiv = $('#commonMessageDiv');
			commonMessageDiv.html('');
			var message_box = document.getElementById("message_box");
			  $(message_box).css({visibility:'visible'});
			 // message_box.style.left =
			  var pageSize = $._getPageSize();//这里的方法 返回的是页面的宽度，页面的高度，屏幕的高度，屏幕的宽度!
			
			  var pageWidth =  pageSize[0];//页面的宽度
			  var pageHeight = pageSize[1];//页面的高度
			  var ScreenWidth = pageSize[2];//屏幕的宽度
			  var ScreenHeight = pageSize[3];//屏幕的高度
			  var divWidth = 300;//div的宽度
			  var divHeight = 150;//div 的高度
			  var scrollTop = $(parent.window).scrollTop();
			  $(message_box).css({
				    width: divWidth
				  , height: divHeight
				  , left: (ScreenWidth-divWidth)/2
				  , top: (parseInt(100))+scrollTop});
			 // message_box.style.width = divWidth+"px";//设置div 的宽度
			 // message_box.style.height = divHeight+"px";//设置div的高度
			  
			 // message_box.style.left = (ScreenWidth-divWidth)/2+"px";//弹出div层屏幕中水平居中的位置
			 // message_box.style.top = (ScreenHeight-divHeight)/2+"px";//弹出div层屏幕垂直居中的位置
			  //message_box.style.top = (ScreenHeight-pageHeight+divHeight)/2+"px";//弹出div层，所属上一层div居中的位置,本实例中就为contentDiv高度一半的位置
			  //alert(pageSize) 打印的数据可以看出ScreenHeight 和PageHeight的高度是一样的，可能__getPageSize计算屏幕或者页面的高度有问题!所以关于div垂直居中的问题，请大家手动解决
			  //创建灰色背景层
			  procbg = document.createElement("div"); 
			  procbg.setAttribute("id","mybg"); 
			  procbg.style.background = "#000"; 
			  procbg.style.width = "100%"; 
			  procbg.style.height = pageHeight + 'px'; 
			  procbg.style.position = "absolute"; 
			  procbg.style.top = "0"; 
			  procbg.style.left = "0"; 
			  procbg.style.zIndex = "500"; 
			  procbg.style.opacity = "0.3"; 
			  procbg.style.filter = "Alpha(opacity=30)"; 
			  //背景层加入页面
			  document.body.appendChild(procbg);
			  document.body.style.overflow = "hidden";
			  
			  var messageContent = $(message_box).find('#message');
			 messageContent.find("#message_content").remove();
			 //黄色框按钮样式为butn01
			  messageContent.find(".InptOrange").remove();
			  $('<label id="message_content"></label>').html("<br><br>"+message+"<br><br>").appendTo(messageContent);
			  var okBtn = $('<input type="button" value="确认" class="InptOrange"/>');
				var cancelBtn = $('<input type="button" value="取消" class="InptOrange"/>');
				
				okBtn.appendTo(messageContent);
				messageContent.append('&nbsp;&nbsp;');
				cancelBtn.appendTo(messageContent);
				//$('<div id="message_button"></div>').append().append();
				okBtn.click(function(){okHandler.apply(this) ;closeMessage();});
				cancelBtn.click(function(){cancelHandler.apply(this) ;closeMessage();});
				
			  /*
			$('<div></div>').html(message+"<br><br>").appendTo(commonMessageDiv);
			var okBtn = $('<button class="butnOrange"></button>').html('确认');
			var cancelBtn = $('<button class="butnOrange"></button>').html('取消');
			okBtn.appendTo(commonMessageDiv);
			commonMessageDiv.append('&nbsp;&nbsp;');
			cancelBtn.appendTo(commonMessageDiv);
			okBtn.click(function(){okHandler.apply(this) ;commonMessageDiv.hide();});
			cancelBtn.click(function(){cancelHandler.apply(this) ;commonMessageDiv.hide();});
			commonMessageDiv.css({
				'position': 'absolute',
				'border': '1px solid #92B7E5',
				'width': '150px',
				'padding': '15px',
				//'background-color': '#FFFFFF',
				'left':(x)+"px",
				'top':(y)+"px",
				"z-index":1000}
			).show();*/
		},
		
		webAjax: function(ajaxSettings) {
			var s = jQuery.extend(true, {}, jQuery.ajaxSettings, ajaxSettings);
			var callbackContext = ajaxSettings && ajaxSettings.context || s;
			//alert((ajaxSettings.async==false?ajaxSettings.async:true));
			$.ajax({
				type: ajaxSettings.type,
				cache: false,
				async: (ajaxSettings.async==false?ajaxSettings.async:true),
				url: ajaxSettings.url,
				data: ajaxSettings.data,
				beforeSend: function(XMLHttpRequest) {
					this; 
				},
				complete: function  (XMLHttpRequest, textStatus) {
				    this; // 调用本次AJAX请求时传递的options参数
				},
				dataFilter: function (data, type) {
				    if(type == 'json') {
				    	data = $.parseJSON(data);
				    }
				    return data  // 返回处理后的数据
				},
				success: function(data) {
//					if(data.indexOf('<html') != -1 || data.indexOf('<HTML') != -1) {
//						if(data.indexOf('stacktrace') != -1) {
//							$.showMessage($(data).find('.stacktrace').html(), 1, 1, true);
//						} else if(data.indexOf('j_spring_security_check') != -1){
//							location.href = ctx + "/login.jsp";
//						} else {
//							$.showMessage(data, 1, 1, true);
//						}
//						
//					} else {
//						s.success.call( callbackContext, data);
//					}
					s.success.call( callbackContext, data);
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
				    if(XMLHttpRequest.status==403)
				    alert("你没有权限，请与管理员联系.");
					// 通常 textStatus 和 errorThrown 之中
					// 只有一个会包含信息
				    this; // 调用本次AJAX请求时传递的options参数
				}
			});
		},
		webAjaxFormSubmit: function(options) {
			if(options.formId) {
				var context = options.context || options;
				$('#' + options.formId).ajaxSubmit({	
					//target:        '#output2',   // target element(s) to be updated with server response 
					url:       options.url,         // override for form's 'action' attribute 
			        type:      options.type,       // 'get' or 'post', override for form's 'method' attribute 
			        //dataType:  options.dataType,        // 'xml', 'script', or 'json' (expected server response type) 
			        //clearForm: true        // clear all form fields after successful submit 
			        //resetForm: true        // reset the form after successful submit 
			 
			        // $.ajax options can be used here too, for example: 
			        //timeout:   3000 
//			        beforeSubmit: function(a,f,o) {
//			            options.beforeSubmit.apply(context, [a, f, o]);
//			        },
			        success: function(data) {
				        if(data.indexOf('<html') != -1 || data.indexOf('<HTML') != -1) {
							if(data.indexOf('stacktrace') != -1) {
								$.showMessage($(data).find('.stacktrace').html(), 1, 1, true);
							} else if(data.indexOf('j_spring_security_check') != -1){
								location.href = ctx + "/login.jsp";
							} else {
								$.showMessage(data, 1, 1, true);
							}
						} else {
							options.success.apply(context, [data]);		
						}
			            				
			        }
			    });
			}
			
		},
		getSpecifiedLength: function(val, length) {
			if(!val) {
				return '';
			}
			var len = 8;
			if(length) {
				len = length;
			}
			var str = val;
			cur = $.getByteLen(str); 
			if(cur > len) {
				str = $.getByteVal(val, len) + '...';
			}
			return str;
		},
		 getByteLen: function(val) { 
	    	var len = 0; 
	    	for (var i = 0; i < val.length; i++) { 
	    	if (val.charAt(i).match(/[^\x00-\xff]/ig) != null) //全角 
	    	len += 2; 
	    	else 
	    	len += 1; 
	    	} 
	    	return len; 
	    },
	    getByteVal: function (val, max) { 
	    	var returnValue = ''; 
	    	var byteValLen = 0; 
	    	for (var i = 0; i < val.length; i++) { 
		    	if (val.charAt(i).match(/[^\x00-\xff]/ig) != null) 
		    	byteValLen += 2; 
		    	else 
		    	byteValLen += 1; 
		    	
		    	if (byteValLen > max) 
		    	break; 
		    	returnValue += val.charAt(i); 
		    	
	    	} 
	    	return returnValue; 
	    } ,
	    checkDigits:function(value){
			return /^\d+$/.test(value);
		},
		
		cloneObj: function(obj) {
			
			 if(typeof(obj) != "object"){
			  return obj;
			 }
			 var cloneDepth = ((arguments.length >= 1)?((isNaN(parseInt(arguments[0])))?(null):parseInt(arguments[0])):null);
			 if (cloneDepth){
			  cloneDepth=((cloneDepth <= 0)?(null):(cloneDepth));
			 }
			 var cloneObject = null;
			 var thisConstructor = obj.constructor;
			 var thisConstructorPrototype = thisConstructor.prototype;
			 if (thisConstructor == Array){
			  cloneObject = new Array();
			 } else if(thisConstructor == Object){
			  cloneObject = new Object();
			 } else {
			  try{
			   cloneObject = new thisConstructor;
			  } catch(exception) {
			   cloneObject = new Object();
			   cloneObject.constructor = thisConstructor;
			   cloneObject.prototype = thisConstructorPrototype;
			  }
			 }
			 
			 var propertyName = "";
			 var newObject=null;
			 
			 for (propertyName in obj){
			  newObject = obj[propertyName];
			  if (!thisConstructorPrototype[propertyName]){
			   if (typeof(newObject)=="object"){
			    if (newObject === null){
			     cloneObject[propertyName] = null;
			    } else {
			     if(cloneDepth){
			      if(cloneDepth == 1){
			       cloneObject[propertyName] = null;
			      } else {
			       cloneObject[propertyName] = $.cloneObj(newObject);(--cloneDepth);
			      }
			     } else {
			      cloneObject[propertyName] = $.cloneObj(newObject);
			     }
					    }
					   } else {
					    cloneObject[propertyName] = newObject;
					   }
					  }
					 }
					 
					 return cloneObject;
				
		},
        paging:function(pagingDiv, formId, callbackFunName, data) {
        	$('#' + pagingDiv).load(
        			ctx + '/common/paging.jsp', 
        			{form:formId, 
        				pageNo:data.pageNo,
        				pageSize:data.pageSize, 
        		orderBy:data.orderBy, 
        		order:data.order, 
        		totalCount:data.totalCount,
        		totalPages:data.totalPages, 
        		linkPageNumbers:$.toJSON(data.linkPageNumbers), 
        		callback: callbackFunName}
        	);
        },
/**
 * {
 * element:,
 * params:{type:'pic' or swf sound },
 * buttonTitle:
 * onComplete:function(id, fileName, responseJSON){},
 * sizeLimit:,
 * allowedExtensions:['jpg','gif']
 * }
 */
 createFileUploader:function(o){
			var _options = {
                //element: document.getElementById('photo-uploader'),
                action: ctx+'/common/file-upload.htm',
                multiple:false,
                params: {},
                sizeLimit:1024000,
                allowedExtensions:['jpg','gif'],
                maxConnections: 1,
                template: '<span class="qq-uploader">' + 
                '<div class="qq-upload-drop-area" style="display:none"><span>Drop files here to upload</span></div>' +
                '<a class="qq-upload-button"><span>'+o.buttonTitle+'</span></a>' +
                '<span class="qq-upload-list"></span>' + 
             '</span>',
             fileTemplate: '<div>' +
                '<span class="qq-upload-file"></span>' +
                '<span class="qq-upload-spinner"></span>' +
                '<span class="qq-upload-size"></span>' +
                '<a class="qq-upload-cancel" href="#">取消</a>' +
                '<span class="qq-upload-failed-text">失败</span>' +
            '</div>',
                onComplete: function(id, fileName, responseJSON){
            	 //alert($.toJSON(responseJSON));
            	 //$("#photo-uploader").css("background-image","url(<%=path %>/files/"+responseJSON.filename+")");
            	 $(".qq-upload-list").html('');
            	 },
            	 messages: {
		            typeError: "{file} 文件类型不正确. 只允许 {extensions} 文件类型.",
		            sizeError: "{file} 太大了, 最大文件限制 {sizeLimit}.",
		            minSizeError: "{file} 太小了, 最小文件限制 {minSizeLimit}.",
		            emptyError: "{file} 不存在, 请重新选择.",
		            onLeave: "文件正在上传, 如果确认离开,请先取消上传."            
		        },
                debug: true
            };
			qq.extend(_options, o);
            var uploader = new qq.FileUploader(_options);
            return uploader;
        },
        _getPageSize: function () {
        	var xScroll, yScroll;  
             if (window.innerHeight && window.scrollMaxY) {    
                 xScroll = window.innerWidth + window.scrollMaxX;  
                 yScroll = window.innerHeight + window.scrollMaxY;  
             } else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac  
                 xScroll = document.body.scrollWidth;  
                 yScroll = document.body.scrollHeight;  
             } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari  
                 xScroll = document.body.offsetWidth;  
                 yScroll = document.body.offsetHeight;  
             }  
             var windowWidth, windowHeight;  
             if (self.innerHeight) { // all except Explorer  
                 if(document.documentElement.clientWidth){  
                     windowWidth = document.documentElement.clientWidth;   
                 } else {  
                     windowWidth = self.innerWidth;  
                 }  
                 windowHeight = self.innerHeight;  
             } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode  
                 windowWidth = document.documentElement.clientWidth;  
                 windowHeight = document.documentElement.clientHeight;  
             } else if (document.body) { // other Explorers  
                 windowWidth = document.body.clientWidth;  
                 windowHeight = document.body.clientHeight;  
             }     
             // for small pages with total height less then height of the viewport  
             if(yScroll < windowHeight){  
                 pageHeight = windowHeight;  
             } else {   
                 pageHeight = yScroll;  
             }  
             // for small pages with total width less then width of the viewport  
             if(xScroll < windowWidth){     
                 pageWidth = xScroll;          
             } else {  
                 pageWidth = windowWidth;  
             }  
             arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight);  
             return arrayPageSize;  
        }
	 });
	}catch(e){alert(e.description);}

function showDiv(divId){
	$("#"+divId).show();
}

function hiddenDiv(divId){
	$("#"+divId).hide();
}
function showOrHiddenDiv(divId){
	if($("#"+divId).css('display')=='none'){
		showDiv(divId);
	}else{
		hiddenDiv(divId);
		
	}
}

var mousex =0;
var mousey =0;
$(document).mousemove(function(e) {
	mousex = e.pageX + 10;
	mousey = e.pageY + 5;
	//$(this).contents("span:last-child").css({  top: mousey, left: mousex });
});

