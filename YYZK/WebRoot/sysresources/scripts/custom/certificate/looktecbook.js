$(document).ready(function() {

})

function lookTecBook(workno, itemcode, seqno, itemname, itemmode,orderfbillno) {

	// window.open('${ctx}/factory/checkBaoGao.htm?workno='+workno+'&itemcode='+encodeURI(encodeURI(itemcode))+'&seqno='+encodeURI(encodeURI(seqno))+'&itemname='+encodeURI(encodeURI(itemname))+'&itemmode='+encodeURI(encodeURI(itemmode)));

	// 物料关联套式 rpid套式id--套式关联-模板，获取url
	// 获取模板详细url
	/*
	 * qualitybook.jsp
		qualitybook_noty.jsp//
		qualitybook_noqd.jsp//
		qualitybook_10.jsp//技术参数(高压出厂资料10)
		qualitybook_tjf.jsp//调节阀
		qualitybook_zj.jsp//技术参数(直接调压器)
	 */
	
	var urlall = "factory/qualitybook.htm";//总
	var urlnoty= "factory/qualitybook_noty.htm";//高压出厂资料不带调压的切断
	var urlnoqd= "factory/qualitybook_noqd.htm";//高压出厂资料（ 不带切断调压器）
	var urlgy  = "factory/qualitybook_10.htm";//技术参数(高压出厂资料10)
	var urltjf = "factory/qualitybook_tjf.htm";//调节阀
	var urlzj  = "factory/qualitybook_zj.htm";//技术参数(直接调压器)
	
	
//	var orderfbillno=decodeURI('${param.orderfbillno}', "UTF-8");
	
	$.webAjax( {
		type : 'post',
		url : ctx + '/baseItem/base-item!showCertificateUrl.htm',
		data : 'baseItemQuery.itemcode=' + itemcode,
		success : function(data) {
			data = $.parseJSON(data);
			if (data.resultInfo[0] == '0') {

				var bookurl = '';
				$.each(data.baseItemList,
						function(i, o) {
							if (o.url == urlall || o.url == urlnoty
									|| o.url == urlnoqd||o.url ==urlgy||o.url ==urltjf||o.url ==urlzj) {
								bookurl = o.url;
							}
						});
				if (bookurl == '') {
					alert(itemcode + "（此物料未绑定技术参数显示模板，请先绑定模板后再来操作！）");
				} else {
					//alert("-----------------------------------bookurl="+bookurl);	
					// window.open(ctx+'/'+bookurl+'?workno='+workno+'&itemcode='+encodeURI(encodeURI(itemcode))+'&seqno='+encodeURI(encodeURI(seqno))+'&itemname='+encodeURI(encodeURI(itemname))+'&itemmode='+encodeURI(encodeURI(itemmode)));
					window.open(ctx + '/' + bookurl
							+ '?showbtn=1&orderfbillno='+encodeURI(encodeURI(orderfbillno))+'&itemcode='
							+ encodeURI(encodeURI(itemcode)) + '&serial='
							+ encodeURI(encodeURI(seqno)) + '&itemmode='
							+ encodeURI(encodeURI(itemmode)));
				}

			} else {
				alert(data.resultInfo[1]);
			}
		}
	});

}
