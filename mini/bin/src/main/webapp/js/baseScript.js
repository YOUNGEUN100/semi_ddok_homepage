$(document).ready(function(){
	$(window).scrollTop(0);
	
	// slick sliderEvent
    var mainVisualSlider = $('.mainVisualSlider');
    var mainContentSlider = $('.mainContentSlider');
    mainVisualSlider.slick({
        slidesToShow: 1,
        dots: true,
    });
    mainContentSlider.slick({
        slidesToShow: 3,
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
});