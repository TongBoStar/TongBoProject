<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="applicable-device" content="mobile" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>提现记录</title>
<style type="text/css">
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
    font-size: 12px;
}
/*----------------------*/
.zebra td, .zebra th {
    padding: 10px;
    border-bottom: 1px solid #f2f2f2;  
    text-align: center;   
}

.zebra tbody tr:nth-child(even) {
    background: #f5f5f5;
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
}

.zebra th {
    text-align: left;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
    border-bottom: 1px solid #ccc;
    background-color: #eee;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));
    background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
    background-image:    -moz-linear-gradient(top, #f5f5f5, #eee);
    background-image:     -ms-linear-gradient(top, #f5f5f5, #eee);
    background-image:      -o-linear-gradient(top, #f5f5f5, #eee); 
    background-image:         linear-gradient(top, #f5f5f5, #eee);
}

.zebra th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;  
}

.zebra th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.zebra th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.zebra tfoot td {
    border-bottom: 0;
    border-top: 1px solid #fff;
    background-color: #f1f1f1;  
}

.zebra tfoot td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

.zebra tfoot td:only-child{
    -moz-border-radius: 0 0 6px 6px;
    -webkit-border-radius: 0 0 6px 6px
    border-radius: 0 0 6px 6px
}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.utils.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
function wxlogin(){
	var formParam = $('#frm_login').serialize();
	$.ajax({
		type: "post",
		url: "${ctx}/admin/admin!wxlogin.htm",
		data:formParam,
		success: function (data) {
			data = $.parseJSON(data);
			if(data.resultInfo[0]=='0'){
				window.location.href = "${ctx}/mobile/wxindex.jsp";
			}else{
				alert(data.resultInfo[1]);
			}
		}
	});
}
</script>
</head>
<body style="text-align: center;margin:0 auto; font-size: 12px;">
<div class="mobile" style="max-width:400px;min-width:300px;text-align: center;margin:0px auto;padding:0px;">
<table class="zebra">
    <thead>
    <tr>
        <th style="text-align: center;">#</th>        
        <th style="text-align: center;">提现明细</th>
        <th style="text-align: center;">日期</th>
    </tr>
    </thead>
	<tbody>	
    <!-- <tr>
        <td>1</td> 
        <td>提现到支付宝，金额：3000元</td>
        <td>2017-03-20</td>
    </tr>
    <tr>
        <td>2</td> 
        <td>提现到银行卡，金额：5000元</td>
        <td>2017-03-20</td>
    </tr>
	<tr>
        <td>3</td> 
        <td>提现到支付宝，金额：3000元</td>
        <td>2017-03-20</td>
    </tr>
    <tr>
        <td>4</td> 
        <td>提现到银行卡，金额：3000元</td>
        <td>2017-03-20</td>
    </tr> -->
	</tbody>
	<tfoot>
    <tr>
        <td colspan="2">提现总金额:0</td>        
        <td></td>
    </tr>
    </tfoot>  
</table>
</div>
</body>
</html>