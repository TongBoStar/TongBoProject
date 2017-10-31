(function($) {
	jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {   
   var length = value.length;   
  for(var i = 0; i < value.length; i++){   
   if(value.charCodeAt(i) > 127){   
     length++;   
    }   
   } 
	
  return this.optional(element) || ( length >= param[0] && length <= param[1] );   
}, "请确保输入的值在3-{1}个字节之间");   
  
/* 追加自定义验证方法 */   
// 身份证号码验证   
jQuery.validator.addMethod("isIdCardNo", function(value, element) {   
  return this.optional(element) || isIdCardNo(value);   
}, "请正确输入您的身份证号码");   
  
// 字符验证   
jQuery.validator.addMethod("word", function(value, element) {   
  return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);   
}, "用户名只能包括中文字、英文字母、数字和下划线");   
  
// 手机号码验证   
jQuery.validator.addMethod("isMobile", function(value, element) {   
   var length = value.length;   
  return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(14[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));   
}, "请正确填写您的手机号码");   
  
// 电话号码验证   
jQuery.validator.addMethod("isPhone", function(value, element) {   
   var tel = /^(\d{3,4}-?)?\d{7,9}$/g;   
  return this.optional(element) || (tel.test(value));   
}, "请正确填写您的电话号码");   
  
// 邮政编码验证   
jQuery.validator.addMethod("isZipCode", function(value, element) {   
   var tel = /^[0-9]{6}$/;   
  return this.optional(element) || (tel.test(value));   
}, "请正确填写您的邮政编码");   

// 不等于
jQuery.validator.addMethod("notEqualToVal", function(value, element, param) { 
	return value != param;
}, "不能输入相同的值");   
})(jQuery);

