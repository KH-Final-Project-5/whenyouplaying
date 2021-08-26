function checkNumber(event) {
    return event.key >= 0 && event.key <= 9;
}

$(function () {
    $('.selectpicker').selectpicker({
        style: 'btn-info',
        size: 4
    });

    $("#adminOutBank").keyup(function(e) {
            var v = $(this).val();
            $(this).val(v.replace(/[^0-9]/g,''));
    });

});
