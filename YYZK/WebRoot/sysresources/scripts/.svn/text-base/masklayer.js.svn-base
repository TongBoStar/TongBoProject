var xval, tval, bval, rval, lval;
function block_viewport() {
	xval=getBusyOverlay('viewport',{color:'#A59F9F', opacity:0.1, text:'请稍等...', style:'text-shadow: 0 0 3px black;font-weight:bold;font-size:16px;color:blue;'},{color:'#ff0', size:100, type:'o'});
	if(xval) {var c=0,t=1;
		xval.ntime=window.setInterval(function() {
			c--; 
			if(c>t) {window.clearInterval(xval.ntime); xval.remove();}
		},50);
	}
}