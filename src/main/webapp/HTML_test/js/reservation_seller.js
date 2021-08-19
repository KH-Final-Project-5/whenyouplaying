$(function () {
    $('#reservation_chk1').change(function () {
        if ($('#reservation_chk1').is(":checked") === true) {
            $('.eventreservation1').show();
            $('#inputEndDate1').hide();
        } else {
            $('#inputEndDate1').show();
            $('.eventreservation1').hide();
        }
    });
    $('#reservation_chk2').change(function () {
        if ($('#reservation_chk2').is(":checked") === true) {
            $('.eventreservation2').show();
            $('#inputEndDate2').hide();
        } else {
            $('#inputEndDate2').show();
            $('.eventreservation2').hide();
        }
    });
});
