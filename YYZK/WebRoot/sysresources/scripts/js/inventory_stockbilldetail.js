
//遍历待修改-------OK


//-----------------------------------------------------------------------------------
function showAdd(){
		
		var url =ctx + '/picking/picking!showEmpTeam.htm';
		$.webAjax( {
			type : 'post',
			url : url,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					$.openDiv('contralDiv');	
					loadaddstock();
					
				}else{
					alert(data.resultInfo[1]);
				}
			}
			});
		//searchInventory();
}

function loadaddstock(){
	//qfitemid
	var html='';
	var url = ctx + '/stock/stock!listToQuery.htm';
		$.webAjax( {
			type : 'post',
			url : url,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=='0'){
					html+='<option value="">全部</option>';
					$.each(data.stockList,function(i,o){
						html+='<option value="'+o.fitemid+'">'+o.fname+'</option>';					
					})		
					$('#qfitemid').html(html);
					
				}else{
					alert(data.resultInfo[1]);
				}
			}
			});
}

function addsel(number){
	//alert("=============");
	var aa=document.getElementById("selbox"+number);
	var batchid=$('#batchid'+number).val();
		if(aa.checked==true){
				
				var isaddstatus=0;
				$("input[name=batchidlist]").each(function(){
					if(batchid==$(this).val()){
						isaddstatus=1;
						return false;
					}	
				});
				if(isaddstatus==1){//已存在,不用重复添加
						return false;
				}
				
				var code=$('#itemcode'+number).text();
				var name=$('#itemname'+number).text();
				var formatno=$('#formatno'+number).text();
				var fqty=$('#fqty'+number).text();
				var unitname=$('#unitname'+number).text();
				var stockname=$('#stockname'+number).text();
				var stockid=$('#stockid'+number).val();
				var batchno=$('#batchno'+number).text();
				var dbno=$('#dbno'+number).text();
				var isbatch=$('#isbatch'+number).val();
				var issn=$('#issn'+number).val();
	            
				 
				var html='';
				html+='<tr id="savetr'+batchid+'" name="savetr">';
					html+='<td><img src="/images/delete_small.gif" onclick="delsavetr('+batchid+')"  style="cursor: pointer;"/></td>';
					html+='<td name="tdcode" id="tdcode'+number+'">'+
						'<input type="hidden" name="codelist" value="'+code+'">'+
						'<input type="hidden" name="namelist" value="'+name+'">'+
						'<input type="hidden" name="formatnolist" value="'+formatno+'">'+
						'<input type="hidden" name="unitnamelist" value="'+unitname+'">'+
						'<input type="hidden" name="stockidlist" id="stockid'+number+'" value="'+stockid+'">'+
						'<input type="hidden" name="batchnolist" value="'+batchno+'">'+
						'<input type="hidden" name="dbnolist" value="'+dbno+'">'+
						'<input type="hidden" name="issnlist" id="tdissn'+number+'" value="'+issn+'">'+
						'<input type="hidden" name="batchidlist" value="'+batchid+'">'+code+'</td>';
						
					html+='<td name="tdname" id="tdname'+number+'">'+name+'</td>';
					html+='<td name="tdformatno" id="tdformatno'+number+'">'+formatno+'</td>';
					html+='<td ><input name="tdfqty"  id="tdfqty'+number+'" value="'+fqty+'" class="myinputall" /></td>';
					html+='<td name="tdrealfqty"  id="tdrealfqty'+number+'" >'+fqty+'</td>';
					html+='<td name="tdunitname" id="tdunitname'+number+'">'+unitname+'</td>';
					html+='<td name="tdstockname" id="tdstockname'+number+'">'+stockname+'</td>';
					if(issn==1){//序列号管理
						html+='<td name="tdbatchno" id="tdbatchno'+number+'"> <a href="javascript:showSnDiv('+number+');">SN</a> <input type="hidden" id="tdisbatch'+number+'" value="'+isbatch+'"/></td>';
					}else{
						html+='<td name="tdbatchno" id="tdbatchno'+number+'">'+batchno+'<input type="hidden" id="tdisbatch'+number+'" value="'+isbatch+'"/></td>';
					}
					
					//html+='<td name="tddbno" id="tddbno'+number+'">'+dbno+'</td>';
					
				html+='</tr>';
				$('#saveTbody').append(html);
				
				if(issn==1){//序列号管理
					var snhtml='<input type="hidden" name="snstrlist" id="snstrlist'+number+'" value="" />';
					$('#sncheckedDiv').append(snhtml);
				}
				
		}else{
				$('#savetr'+batchid).remove();
				$('#snstrlist'+batchid).remove();		
		}
}
function delsavetr(number){
		$('#savetr'+number).remove();
		$('#snstrlist'+number).remove();
}

function delAlltr(){
		$("tr[name=savetr]").each(function(){
			$(this).remove();
		})
		
		$("input[name=snstrlist]").each(function(){
			$(this).remove();
		})
}
//---------------
//var allNumber=0;
function searchInventory(){//icon_load.gif

		$('#seleTbody').html('<img src="/images/icon_load.gif"/>');

		var url =ctx +  "/baseItem/base-item!listToInventory.htm";
		var html='';
		var itemcode=$('#codeitem').val();
		var itemname=$('#nameitem').val();
		var qfitemid=$('#qfitemid').val(); 
		
			$.webAjax({
					type : "post",
					url : url,
					data:'baseItemQuery.itemcode='+itemcode+'&baseItemQuery.itemname='+itemname+'&baseItemQuery.fitemid='+qfitemid,
					success : function(data) {
							data = $.parseJSON(data);
								if(data.resultInfo[0]=='0')
								{	
									$.each(data.baseItemList,function(k,o){
									var allNumber=o.inventoryBatch.batchid;
										html+='<tr>';
									//	html+='<td  align="left" width="5px"><input type="checkbox" name="checkedIdList" id="checkedIdList" value="'+o.baseitemid+'" /><td>';
										html+='<td align="left"><input type="checkbox" name="selbox" id="selbox'+allNumber+'" onchange="addsel('+allNumber+');" value="'+o.baseitemid+'" />'+
										'<input type="hidden" id="issn'+allNumber+'" value="'+o.fissnmanager+'" />'+
										'<input type="hidden" id="batchid'+allNumber+'" value="'+o.inventoryBatch.batchid+'" /></td>';
										html+='<td align="left" id="itemcode'+allNumber+'">'+o.itemcode+'</td>';
										html+='<td align="left" id="itemname'+allNumber+'">'+o.itemname+'</td>';
										html+='<td align="left" id="formatno'+allNumber+'">'+o.formatno+'</td>';
										html+='<td align="left" id="fqty'+allNumber+'">'+o.inventoryBatch.fqty+'</td>';
										html+='<td align="left" id="unitname'+allNumber+'">'+o.unitname+'</td>';
										html+='<td align="left" id="stockname'+allNumber+'">'+o.inventoryBatch.stockname+'<input type="hidden" id="stockid'+allNumber+'" value="'+o.inventoryBatch.fitemid+'"/></td>';
										html+='<td align="left" id="batchno'+allNumber+'">'+o.inventoryBatch.batchno+'<input type="hidden" id="isbatch'+allNumber+'" value="'+o.isbatch+'"/></td>';
										//html+='<td align="left" id="dbno'+allNumber+'">'+o.inventoryBatch.dbno+'</td>';
										
										html+='</tr>';
									//	allNumber++;
									});
									
								}else{
								alert(data.resultInfo[1]);
								}
								if(html==''){
								alert("无查询结果");
								}
							$('#seleTbody').html(html);
					}
				});		
}


function closeItemDiv(){

	closeDiv('contralDiv');
	$('#seleTbody').html('');
	$('#saveTbody').html('');
	$('#sncheckedDiv').html('');
}

function addSelectItem(){
	
	if(!check()){
		return false;
	}
	if(!checksn()){
		return false;
	}
	
	
	var formParam = $('#saveform').serialize();
	var reqtakeid =$("#reqtakeid").val();
	var pickingtype=$('#pickingtype').val();
	//alert(formParam);
	//saveToOut
	block_viewport();
//	var url =ctx +  "/pickingDetail/picking-detail!saveToOut.htm";
	var url =ctx +  "/pickingDetail/picking-detail!saveToAdd.htm";
	var ppickingid=$('#nowpickingid').val();
	
		$.webAjax({
				type : "post",
				url : url,
				data:'reqtakeid='+reqtakeid+'&'+formParam+'&pickingtype='+pickingtype+'&notes='+$('#notes').val()+'&pickingid='+ppickingid,
				success : function(data) {
						data = $.parseJSON(data);
							if(data.resultInfo[0]=='0')
							{
								loadbillTools();
								xval.remove();
								alert(data.resultInfo[1]);
								
								closeItemDiv();
							}else{
								alert(data.resultInfo[1]);
								xval.remove();
								closeItemDiv();
							}
				}
		});			
	
//--------------------------------------------	
	
	
}
//-----------------------------
//-----------------------------
	/*var xval, tval, bval, rval, lval;
		function block_viewport() {
			xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.1, text:'请稍等...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
			if(xval) {var c=0,t=1;
				xval.ntime=window.setInterval(function() {
					c--; 
					if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
				},50);
			}
		}*/
//-------

//------------------------------
function check(){
		
	var status=0;
	$("input[name=tdfqty]").each(function(){
		if(checkfqty($(this).val())){
			alert("数量只能是大于0的数字!");
			status=-1;
			$(this).focus();
			return false;
		}
		if($(this).val()==0){
			alert("数量只能是大于0的数字!");
			status=-1;
			$(this).focus();
			return false;
		}
		
		var tdid=$(this).attr('id');
		var n=tdid.substring(6);
		if($(this).val()>parseFloat($('#tdrealfqty'+n).text())){
			alert("数量不能大于库存!");			
			status=-1;
			$(this).focus();
			return false;
		}
	});
	if(status==-1){	return false;}
	
	$("td[name=tdstockname]").each(function(){
		if($(this).text()==null||$(this).text()==""){
			alert("仓库不能为空!!!");
			status=-1;
			return false;
		}
	});
	if(status==-1){	return false;}
	
	$("td[name=tdbatchno]").each(function(){
		var tdid=$(this).attr('id');
		//alert(tdid);
		var n=tdid.substring(9);

		if(($(this).text()==null||$(this).text()=="")&&$('#tdisbatch'+n).val()==1){
			alert("批次不能为空!!!");
			status=-1;
			return false;
		}
	});
	
	if(status==-1){
		return false;	
	}
	return true;
}

function checkfqty(fqty) 
{ 
		if(!/^([1-9]\d*|[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$/.test(fqty)){ 
		return true;
		} else{
		return false;
		}
} 


function selAll(){
		var aa=document.getElementById("allcheckbox");
		if(aa.checked==true){
		 	  $("input[name=selbox]").attr("checked",true);
		}
		else{
		      $("input[name=selbox]").attr("checked",false);
		}
		
		$("input[name=selbox]").each(function(){
				var number=parseInt($(this).attr("id").toString().substring(6));
				//alert(number);
				var batchid=$('#batchid'+number).val();
			if($(this).attr("checked")==true){
					var isaddstatus=0;
				$("input[name=batchidlist]").each(function(){
					if(batchid==$(this).val()){
						isaddstatus=1;
						return false;
					}	
				});
				if(isaddstatus==1){//已存在,不用重复添加
						return true;
				}
				
				var code=$('#itemcode'+number).text();
				var name=$('#itemname'+number).text();
				var formatno=$('#formatno'+number).text();
				var fqty=$('#fqty'+number).text();
				var unitname=$('#unitname'+number).text();
				var stockname=$('#stockname'+number).text();
				var stockid=$('#stockid'+number).val();
				var batchno=$('#batchno'+number).text();
				var dbno=$('#dbno'+number).text();
				var isbatch=$('#isbatch'+number).val();
				var issn=$('#issn'+number).val();
	            
	            
	            
				 
				var html='';
				html+='<tr id="savetr'+batchid+'" name="savetr">';
					html+='<td><img src="/images/delete_small.gif" onclick="delsavetr('+batchid+')"  style="cursor: pointer;"/></td>';
					html+='<td name="tdcode" id="tdcode'+number+'">'+
						'<input type="hidden" name="codelist" value="'+code+'">'+
						'<input type="hidden" name="namelist" value="'+name+'">'+
						'<input type="hidden" name="formatnolist" value="'+formatno+'">'+
						'<input type="hidden" name="unitnamelist" value="'+unitname+'">'+
						'<input type="hidden" name="stockidlist" id="stockid'+number+'" value="'+stockid+'">'+
						'<input type="hidden" name="batchnolist" value="'+batchno+'">'+
						'<input type="hidden" name="dbnolist" value="'+dbno+'">'+
						'<input type="hidden" name="issnlist" id="tdissn'+number+'" value="'+issn+'">'+
						'<input type="hidden" name="batchidlist" value="'+batchid+'">'+code+'</td>';
						
					html+='<td name="tdname" id="tdname'+number+'">'+name+'</td>';
					html+='<td name="tdformatno" id="tdformatno'+number+'">'+formatno+'</td>';
					html+='<td ><input name="tdfqty"  id="tdfqty'+number+'" value="'+fqty+'" class="myinputall" /></td>';
					html+='<td name="tdrealfqty"  id="tdrealfqty'+number+'" >'+fqty+'</td>';
					html+='<td name="tdunitname" id="tdunitname'+number+'">'+unitname+'</td>';
					html+='<td name="tdstockname" id="tdstockname'+number+'">'+stockname+'</td>';
					if(issn==1){//序列号管理
						html+='<td name="tdbatchno" id="tdbatchno'+number+'"> <a href="javascript:showSnDiv('+number+');">SN</a> <input type="hidden" id="tdisbatch'+number+'" value="'+isbatch+'"/></td>';
					}else{
						html+='<td name="tdbatchno" id="tdbatchno'+number+'">'+batchno+'<input type="hidden" id="tdisbatch'+number+'" value="'+isbatch+'"/></td>';
					}
					
					html+='<td name="tddbno" id="tddbno'+number+'">'+dbno+'</td>';
					
				html+='</tr>';
				$('#saveTbody').append(html);
				
				if(issn==1){//序列号管理
					var snhtml='<input type="hidden" name="snstrlist" id="snstrlist'+number+'" value="" />';
					$('#sncheckedDiv').append(snhtml);
				}
				}else{
					$('#savetr'+batchid).remove();
					$('#snstrlist'+batchid).remove();
				}
		});
		
}
//--------------------------------------------
function search2(){
	$("#itemcodeDiv2").css("display","");
	$("#reqtakeid").val("");
	var manager = $("#reqtakeemp").val();
	var html='<td><select id="selectCode2" onchange="changeCode2();" style="width: 130px; height: 147px;background-color: gray"; multiple="true">';
	var url =ctx +  "/system/adminListadminName.htm";
	 	$.webAjax({
					type : "post",
					url : url,
					data:'adminQuery.adminName='+manager,
					success : function(data) {
									data = $.parseJSON(data);
									var list = data.adminList;
									$.each(list,function(i,o){
										html+='<option value="'+o.adminId+'" >'+o.adminName+'</option>';
										if(manager==o.adminName){
										$("#reqtakeid").val(o.adminId);
										}
									});
							html+='</select></td>';
							$('#selectsbody2').html(html);
					}
		});	
}

function changeCode2(){
	        var sel = $("#selectCode2").val();
			var txt = $('#selectCode2').find('option:[value='+sel+']').text(); 
			$("#reqtakeemp").attr("value",txt);
			$("#reqtakeid").attr("value",sel);
		$("#itemcodeDiv2").css("display","none");
}
//==============================================================
//显示序列号输入DIV
function showSnDiv(number){
		$.openDiv("batchsndiv");
		$('#snnumber').val(number);
		
		var itemcode= $('#tdcode'+number).text();
		var stockid=$('#stockid'+number).val();
		var dbno=$('#tddbno'+number).text();
		
		var snquery='icserialQuery.itemcode='+itemcode+'&icserialQuery.fstockid='+stockid+'&icserialQuery.db='+dbno;
		snquery+='&icserialQuery.fstatus=1';//可用
		snquery+='&icserialQuery.fvalid=1';//在库
		snquery+='&icserialQuery.lockstatus=0';//未锁库
	//	alert(snquery);
		var url = ctx +  "/icserial/icserial!listToPicking.htm";
		var html='';
	 	$.webAjax({
					type : "post",
					url : url,
					data: snquery,
					success : function(data) {
						data = $.parseJSON(data);
						if(data.resultInfo[0]=='0'){
							//icserialList
							//alert(data.icserialList.length);
							$.each(data.icserialList,function(i,o){
								html+='<option value="'+o.serialid+'">'+o.fserialnum+'</option>';	
							});
							
							$('#sn-list').html(html);
							$('#sn-list').multiSelect();
						//-处理已选择的序列号--------			
							if($('#snstrlist'+number).val()){
								var checkedSnlist=$('#snstrlist'+number).val().toString().split(",");
								var unchecklist=$('.ms-elem-selectable');	
								//	alert(checkedSnlist.length);
								$.each(checkedSnlist,function(n,m){
									//	ms-elem-selectable--未选择
									// class="ms-elem-selectable ms-selected" ms-value="187" style="display: none;"--已选择
									$.each(unchecklist,function(f,k){
										if($(k).attr("ms-value")==m){
											$(k).attr("style","display: none;");
											$(k).removeClass("ms-elem-selectable");
											$(k).addClass("ms-elem-selectable ms-selected");
											
											$("div.ms-selection ul").append('<li class="ms-elem-selected" ms-value="'+m+'" onclick="gaibian(\''+m+'\');" >'+$(k).text()+'</li>');
																								
										}
									});	
								});
							
							}				
							
						}else{
						alert(data.resultInfo[1]);
						}
					}
		});
		
		
}
function gaibian(sq){

	var llist = $(".ms-elem-selected");
	for(var y = 0;y<llist.length;y++){
		if($(llist[y]).attr("ms-value")== sq){
			var llist2 = $(".ms-elem-selectable");
			for(var y2 = 0;y2<llist2.length;y2++){
				if($(llist2[y2]).attr("ms-value") == sq){
					$(llist2[y2]).attr("style","display: list-item;");
					$(llist2[y2]).removeClass("ms-elem-selectable ms-selected");
					$(llist2[y2]).addClass("ms-elem-selectable");
				}
			}
			$(llist[y]).remove();
		}
	}
}

function selectAll(){
	$('#sn-list').multiSelect('select_all');
}
function delAll(){
	$('#sn-list').multiSelect('deselect_all');
}
function saveSnlist(){
	if($('#saveOrupdate').val()==1){
		updateSnlist();
		return ;
	}	
	
		var number=$('#snnumber').val();
		//获取选中的sn,保存到snstrlist+number
		var checkedsnList=$(".ms-elem-selected");
	//	alert("==========="+number+"==="+checkedsnList.length);
		var snstr="";
		var snlength=checkedsnList.length;
		$.each(checkedsnList,function(i,o){
			//alert($(this).attr("ms-value"));
			if(i==(snlength-1)){
				snstr+=$(o).attr("ms-value");
			}else{
				snstr+=$(o).attr("ms-value")+",";
			}
		});
		
		$('#snstrlist'+number).val(snstr);	
		$.closeDiv('batchsndiv');
		$('#sn-list').html('');
		$('#ms-sn-list').remove();
}
function closesnDiv(){
		$.closeDiv('batchsndiv');
		$('#saveOrupdate').val("");
		$('#sn-list').html('');
		$('#ms-sn-list').remove();
}

function checksn(){
			//var snhtml='<input type="hidden" name="snstrlist" id="snstrlist'+number+'" value="" />';
			var status=0;
			$("input[name=snstrlist]").each(function(){
					var snlength=0;
					if($(this).val()){
						var snlist=$(this).val().toString().split(",");
						snlength=snlist.length;
					}
					
					
					var number=$(this).attr("id").toString().substring(9);
					var snfqty=$('#tdfqty'+number).val();
					if(snlength!=snfqty){
						status=1;
						var snmessage="物料:"+$('#tdcode'+number).text()+"("+$('#tdname'+number).text()+")";
						if(snlength>snfqty){
						snmessage+="所选序列号比出库数量多 "+(snlength-snfqty)+" 个,请重新选择!";
						}else{
						snmessage+="所选序列号比出库数量少 "+(snfqty-snlength)+" 个,请重新选择!";
						}
						alert(snmessage);
						return false;
					}
			});
			
			if(status==0){
			return true;
			}else{
			return false;
			}
}

function updateSnlist(){
		var checkedsnList=$(".ms-elem-selected");
		var snstr="";
		var snlength=checkedsnList.length;
		$.each(checkedsnList,function(i,o){
			if(i==(snlength-1)){
				snstr+=$(o).attr("ms-value");
			}else{
				snstr+=$(o).attr("ms-value")+",";
			}
		});

	//	snstr;
		var url = ctx +"/pickingDetail/picking-detail!saveToNewsn.htm";
		$.webAjax( {
			type : "post",
			url : url,
			data:'detailid='+$('#detailupdateid').val()+'&snstr='+snstr,
			success : function(data) {
				data = $.parseJSON(data);
				if(data.resultInfo[0]=="0")
				{
					alert(data.resultInfo[1]);
					closesnDiv();
					loadstock();
				}else{
					alert(data.resultInfo[1]);
				}		
		}
		})
		
	
}

