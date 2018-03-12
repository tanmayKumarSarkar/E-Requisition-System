function alert_box(insertContent) {
    (function ($) {
        if ($('#alert_box').size() == 0) {

            var ok_btn_x = $('<div id="ok_btn" >OK</div>');
            var alrt_var = $('<div id="alert_box"> </div>');
            var shdw = $('<div id="alert_box-shadow"> </div>');
            var smllbx = $('<div id="small_box"> </div>');
            var brdr = $('<div id="border_box"> </div>');


            $(shdw).click(function (e) {
                close_alert_box();
            });
            $(ok_btn_x).click(function (e) {
                close_alert_box();
            });



            $('body').append(alrt_var);
            $('body').append(brdr);
            $('body').append(smllbx);
            $('body').append(ok_btn_x);
            $('body').append(shdw);
        }

        $('#alert_box').empty();
        if (insertContent != null) {
            $('#small_box').append(insertContent);
        }

        $('#alert_box').css('top', $(window).scrollTop() + 100 + 'px');

        $('#alert_box').slideDown();
        $('#small_box').show();
        $('#border_box').show(400);
        $('#ok_btn').show(300);
        $('#alert_box-shadow').show();

    })(jQuery);
}


function close_alert_box() {
    (function ($) {
        $('#ok_btn').hide();
        $('#border_box').hide();
        $('#small_box').hide();
        $('#alert_box').hide();
        $('#alert_box-shadow').hide();
        $('#alert_box').empty();
        $('#small_box').empty();
    })(jQuery);
}