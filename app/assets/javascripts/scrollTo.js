//SCROLL TO ANCHOR POSITION
var scrollTo = function( anchor ) {
    target = $(anchor);
    animationTime = 1000;

    if (target.length > 0) {
        $("html, body").animate({
                scrollTop: target.offset().top
            },
            animationTime
        )
    }

}