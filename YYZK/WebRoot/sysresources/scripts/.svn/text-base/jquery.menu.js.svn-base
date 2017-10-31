$(document).ready(function() {
	buildMenu();
	//$(".ml-menu").find(".menuSubTree").first().click();
});

function buildMenu(){
	$(".ml-menu  .menuSubTree").each(function(index,item){
		//alert($(this).html());
	});
	$(".ml-menu").find(".menuSubTree").bind("click",{},function(event){
		$(".ml-menu").find("div").hide();
		$(this).next().show();
	});
	$(".menuSubTree2").bind("click",{},function(event){
		$(this).next().show();
	});
	$(".ml-menu").find("div").hide();
}