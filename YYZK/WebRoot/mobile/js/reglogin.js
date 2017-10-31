
jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        if(username == '') {
             $(this).parent().find('.username').focus();
            return false;
        }
        if(password == '') {
			 $(this).parent().find('.password').focus();
            return false;
        }
    });

});
