$(function () {

    //BEGIN CALENDAR
    $("#my-calendar").zabuto_calendar({
        language: "en"
    });
    //END CALENDAR

    //BEGIN TO-DO-LIST
    $('.todo-list').slimScroll({
        "width": '100%',
        "height": '250px',
        "wheelStep": 30
    });
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
    //END TO-DO-LIST

    //BEGIN AREA CHART SPLINE
    var d6_1 = [["Jan", 67],["Feb", 91],["Mar", 36],["Apr", 150],["May", 28],["Jun", 123],["Jul", 38]];
    var d6_2 = [["Jan", 59],["Feb", 49],["Mar", 45],["Apr", 94],["May", 76],["Jun", 22],["Jul", 31]];
    //END AREA CHART SPLINE

    //BEGIN CHAT FORM
    $('.chat-scroller').slimScroll({
        "width": '100%',
        "height": '505px',
        "wheelStep": 30,
        "scrollTo": "1px"
    });
    $('.chat-form input#input-chat').on("keypress", function(e){

        var $obj = $(this);
        var $me = $obj.parents('.portlet-body').find('ul.chats');
        
        if (e.which == 13) {
            var content = $obj.val();
            
            if (content !== "") {
                $me.addClass(content);
                var d = new Date();
                var h = d.getHours();
                var m = d.getMinutes();
                if (m < 10) m = "0" + m;
                $obj.val(""); // CLEAR TEXT ON TEXTAREA
                
                var element = ""; 
                element += "<li class='in'>";
                element += "<img class='avatar' src='https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg'>";
                element += "<div class='message'>";
                element += "<span class='chat-arrow'></span>";
                element += "<a class='chat-name' href='#'>Admin &nbsp;</a>";
                element += "<span class='chat-datetime'>at July 6, 2014 " + h + ":" + m + "</span>";
                element += "<span class='chat-body'>" + content + "</span>";
                element += "</div>";
                element += "</li>";
                
                $me.append(element);
                var height = 0;
                $me.find('li').each(function(i, value){
                    height += parseInt($(this).height());
                });

                height += '';
                $('.chat-scroller').slimScroll({
                    scrollTo: height,
                    "wheelStep": 30,
                });
            }
        }
    });
    $('.chat-form span#btn-chat').on("click", function(e){

        e.preventDefault();
        var $obj = $(this).parents('.chat-form').find('input#input-chat');
        var $me = $obj.parents('.portlet-body').find('ul.chats');
        var content = $obj.val();

        if (content !== "") {
            $me.addClass(content);
            var d = new Date();
            var h = d.getHours();
            var m = d.getMinutes();
            if (m < 10) m = "0" + m;
            $obj.val(""); // CLEAR TEXT ON TEXTAREA
            
            var element = ""; 
            element += "<li class='in'>";
            element += "<img class='avatar' src='https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg'>";
            element += "<div class='message'>";
            element += "<span class='chat-arrow'></span>";
            element += "<a class='chat-name' href='#'>Admin &nbsp;</a>";
            element += "<span class='chat-datetime'>at July 6, 2014" + h + ":" + m + "</span>";
            element += "<span class='chat-body'>" + content + "</span>";
            element += "</div>";
            element += "</li>";
            
            $me.append(element);
            var height = 0;
            $me.find('li').each(function(i, value){
                height += parseInt($(this).height());
            });
            height += '';

            $('.chat-scroller').slimScroll({
                scrollTo: height,
                "wheelStep": 30,
            });
        }
        
    });
    //END CHAT FORM

    //BEGIN COUNTER FOR SUMMARY BOX
    counterNum($(".profit h4 span:first-child"), 189, 112, 1, 30);
    counterNum($(".income h4 span:first-child"), 636, 812, 1, 50);
    counterNum($(".task h4 span:first-child"), 103, 155 , 1, 100);
    counterNum($(".visit h4 span:first-child"), 310, 376, 1, 500);
    function counterNum(obj, start, end, step, duration) {
        $(obj).html(start);
        setInterval(function(){
            var val = Number($(obj).html());
            if (val < end) {
                $(obj).html(val+step);
            } else {
                clearInterval();
            }
        },duration);
    }
    //END COUNTER FOR SUMMARY BOX
});

