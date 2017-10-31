$(document).ready(function() {
	//alert("ff"+$('#queryForm').css("width"));
	$(".mr-control").width(''+$('#queryForm').css("width")+'');
});
/**
 * 将null转换为空字符串
 * @param obj 要转换的对象
 * @returns 空字符串
 */
function replaceNull(obj){
	if(obj==null){
		obj = "";
	}
	return obj;
}
/**
 * 格式化时间(yyyy-MM-dd)
 * @param date 要格式化的日期
 * @returns 格式化后的结果
 */
function formatDate(formt,date){
	if(null!=date&&date!=""){
		if(formt=="yyyy-MM-dd"){
			return date.split(" ")[0];
		}else if(formt=="yyyy-MM-dd HH:mm:ss"){
			return date.substring(0,date.length-2);
		}
	}else{
		return "";
	}
}