$(document).ready(function(){
    var header = $("header#header");
    var menuAll = $("header#header #gnbMenu");
    var menuSub = $("header#header #gnbMenu ul.depth2");
    var menuMainItem = $("header#header #gnbMenu ul.depth1 > li");

    // header menu hoverEvent
    $(menuSub).hide();
    $(menuAll).hover(function(){
        var self = this;
        $(self).addClass("active");
        $(header).addClass("active", 400);
        $(menuSub).stop(true,true).slideDown(400);
    }, function() {
        var self = this;
        $(self).removeClass("active");
        $(header).removeClass("active");
        $(menuSub).stop(true,true).slideUp(300);
    });
    
    // header scrollEvent
	var bodyOffset = $("body").offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > bodyOffset.top) {
			$(header).addClass("active");
		} else {
			$(header).removeClass("active");
		}
	});

    // header menuItem hoverEvent
    $(menuMainItem).hover(function(){
        var self = this;
        $(self).addClass("active");
    }, function() {
        var self = this;
        $(self).removeClass("active");
    });
});