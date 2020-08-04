$(window).on("scroll", function(){
    documentHeight = $(document).height();
    scrollPosition = $(this).height() + $(this).scrollTop();
    footerHeight = $(".footer_container").outerHeight();

    if (documentHeight - scrollPosition <= footerHeight){
        console.log(documentHeight);
        console.log(footerHeight);
        $(".add_box").css({
            position: "absolute",
            bottom: 10
        })
    }
    else{
        $(".add_box").css({
            position: "fixed",
            bottom: 10
        })
    }
})