var number = 10;

function sendSms() {
    $.ajax({
        url: "smssend.do",
        data: {receiver: $("#phone").val()},
        type: "post",
        success: function (result) {
            $("#phone").attr("readonly", true);
            alert("인증번호 발송");
            console.log(result);
            number = result;
        }
    });
}

function numberchk() {
    if ($('#phone2').val() == number) {
        alert("인증 완료");
        $('#phone2').attr('disabled', true);
        console.log($('#phone2').attr('disabled'));
    } else {
        alert("인증번호를 다시 확인해주세요");
    }
}

function test() {
    if ($('#join_user_agree').is(":checked") === true && $('#join_priv_agree').is(":checked")) {
        if ($('#phone2').attr('disabled') === "disabled") {
            $('#regiform').submit();
        } else {
            alert("핸드폰 인증을 해주세요.");
        }
    } else {
        alert("약관 체크를 해주세요.");
    }
}

function checkNumber(event) {
    if (event.key >= 0 && event.key <= 9) {
        return true;
    }
    return false;
}
