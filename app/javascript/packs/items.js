$(window).on("scroll", function(){
    documentHeight = $(document).height();
    scrollPosition = $(this).height() + $(this).scrollTop();
    footerHeight = $(".footer_container").outerHeight();

    if (documentHeight - scrollPosition <= footerHeight){
        $(".add_box").css({
            position: "absolute",
            bottom: 230
        })
    }
    else{
        $(".add_box").css({
            position: "fixed",
            bottom: 30
        })
    }
})