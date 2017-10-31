

 var lineMove = false;
 var currTh = null;
 $(document).ready(function() {
   //产生滚动条后作用失效
     $("body").bind("mousemove", function(event) {
	     if (lineMove == true) {
	        var pos = currTh.offset();
	        var index = currTh.prevAll().length;
	        currTh.width(event.clientX - pos.left);
	        currTh.parent().parent().find("tr").each(function() {
	            $(this).children().eq(index).width(event.clientX - pos.left);
	        });
	    }
     });
	
     $("th").bind("mousemove", function(event) {
         var th = $(this);
         if (th.prevAll().length <= 1 || th.nextAll().length < 1) {
             return;
         }
         var left = th.offset().left;
         if (event.clientX - left < 4 || (th.width() - (event.clientX - left)) < 4) {
             th.css({ 'cursor':'w-resize' });
         }else{
             th.css({ 'cursor': 'default' });
         }
          
     });

     $("th").bind("mousedown", function(event) {
         var th = $(this);
         if (th.prevAll().length <= 1 | th.nextAll().length < 1) {//第一列和最后一列不允许改变
             return;
         }
         var pos = th.offset();
         if (event.clientX - pos.left < 4 || (th.width() - (event.clientX - pos.left)) < 4) {
             var height = th.parent().parent().height();
             var top = pos.top;
             lineMove = true;
             if (event.clientX - pos.left < th.width() / 2) {
                 currTh = th.prev();
             }else {
                 currTh = th;
             }
         }
     });

     $("body").bind("mouseup", function(event) {
         if (lineMove == true) {
             lineMove = false;
         }
     });
     $("th").bind("mouseup", function(event) {
         if (lineMove == true) {
             lineMove = false;
         }
     });
 });
