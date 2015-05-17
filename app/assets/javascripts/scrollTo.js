//SCROLL TO ANCHOR POSITION
var scrollTo = function( anchor ){
    target = $( anchor );
    animationTime = 1000;

    $("html, body").animate({
            scrollTop: target.offset().top},
        animationTime
    )
}