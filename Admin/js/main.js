(function ($) {
    "use strict";

    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }



    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });

    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });

    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });

    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });

    $(".ProductImg").change(function () { 
        if (this.files && this.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                $(".SelectedProductImage").attr("src", e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
    

})(jQuery);
