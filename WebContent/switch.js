/**
 * 
 */

$(function(){
    $("ul li").click(function(){
        $("ul li").removeClass("on");
        $(this).addClass("on"); 
    });
});