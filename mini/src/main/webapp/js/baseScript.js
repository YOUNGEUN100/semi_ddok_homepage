$(document).ready(function(){
	$(window).scrollTop(0);
	
	// slick sliderEvent
    var mainVisualSlider = $(".mainVisualSlider");
    var mainContentSlider = $(".mainContentSlider");
    mainVisualSlider.slick({
        slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2500,
        dots: true,
	    arrows: false,
	    infinite: true,
	    draggable: true,
	    fade: true,
		speed: 500,
		cssEase: 'linear'
    });
	mainContentSlider.slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2500,
	    dots: false,
	    arrows: false,
	    infinite: true,
	    responsive: [
					{breakpoint: 1024 + 1,
					 settings: {slidesToShow: 2} 
					},
				]
    });
    
    
	// cartBtn clickEvent
    $(".cartBtn").off().click(function(){
        var icon = $(this).children("i");
        setTimeout(function() {
            $(icon).removeClass("action");
            alert("장바구니에 성공적으로 담았습니다.");
        }, 800);
        $(icon).addClass("action");
    });
    
    // scollBtn clickEvent
	/*$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$("#scrollBtn").fadeIn();
		} else{
			$("#scrollBtn").fadeOut();
		}
	});*/
	$("#scrollBtn").click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});
	
	// adminCtrlBox Title
    $("#adminCtrlArea #adminBox .boxTitle .pageName").text(document.getElementById("pageTitle").innerText);
	$("#adminBox").hide();
	$("#adminBtn").click(function(){
		$("#adminBox").fadeToggle();
	});
});