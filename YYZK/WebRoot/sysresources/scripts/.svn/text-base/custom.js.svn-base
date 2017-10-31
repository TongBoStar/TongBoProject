

/*
 * Woai9 Admin Center JavaScript v2012
 * Copyright 2012 Atlantis (Beijing). All rights reserved.
 * http://www.woai9.com 
 *
 * Author: MichaeLee IT
 * Updated: Fri Feb 3 11:27 2012
 */


$(document).ready(function() {

	//Reset main, left and right height
	$("#main, #left, #right").css("height",(($(window).height())-($("#globalheader").outerHeight())-($("#globalfooter").outerHeight())-42)+"px");
	//alert($("#left").outerHeight());
	
	//Reset right width
	//$("#right").css("width",(($(window).width())-($("#left").outerWidth())-62)+"px");
	
	//Reset leftmenu height
	$("#menuUl").css("height",(($(window).height())-($("#globalheader").outerHeight())-($(".mlm-scroll").outerHeight())*2-($("#globalfooter").outerHeight())-42)+"px");
	//alert($(".ml-menu").outerHeight());
	
	//Reset mr-control width
	//$(".mr-control").css("width",(($(window).width())-($("#left").outerWidth())-82)+"px");
	$(".mr-control").css("width","99%");
	//Reset mr-content height
	$(".mr-content").css("height",(($(window).height())-($("#globalheader").outerHeight())-($(".mlm-scroll").outerHeight())*2-($("#globalfooter").outerHeight())-92-25)+"px");
	
	$(".noctrlbox").css("height",(($(window).height())-($("#globalheader").outerHeight())-($("#globalfooter").outerHeight())-92)+"px");
	
	//Scroll menus
	$(".gnt-topleft").toggle(
		function() {
			$("#gn-logo").css("display", "none");
			$("#gn-menu").css("margin-left","0");
		},
		function() {
			$("#gn-logo").css("display", "block");
			$("#gn-menu").css("margin-left","160px");
		}
	);
	
	//Hide and show left
	$(".gnt-left").toggle(
		function() {
			$("#left").css("display", "none");
			$("#right").css("width",(($(window).width())-($("#left").outerWidth())-62+171)+"px");
			$(".mr-control").css("width",(($(window).width())-($("#left").outerWidth())-62+171-20)+"px");
		},
		function() {
			$("#left").css("display", "block");
			$("#right").css("width",(($(window).width())-($("#left").outerWidth())-62)+"px");
			$(".mr-control").css("width",(($(window).width())-($("#left").outerWidth())-62-20)+"px");
		}
	);
	
	//Hide and show topleft
	$(".gnt-topleft").toggle(
		function() {
			$("#gn-logo").css("display", "none");
			$("#gn-menu").css("margin-left","0");
		},
		function() {
			$("#gn-logo").css("display", "block");
			$("#gn-menu").css("margin-left","160px");
		}
	);
	
	//Reset tabs style
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("tabs-bar-cap");
		$("ul.tabs li").addClass("tabs-bar");
		$(this).removeClass("tabs-bar");
		$(this).addClass("tabs-bar-cap");
	});

});

//Left tree hide and show menus
function showHideMenu(id) {
	if($('#'+id).css("display")=="block") {			
		$('#'+id).hide();				
	}
	else {
		$('#'+id).show();
	}
}

//Show and hide products content
function showHideTabs(id) {
	if ($('#'+id).css("display")=="none") {
		$('.nobdTB').hide();
		$('#'+id).show();
	}
}