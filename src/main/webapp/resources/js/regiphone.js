function test() {
    // console.log($('#orderCheckBox').is(":checked"));
    var joinForm = $('#joinForm');
    if ($('#join_user_agree').is(":checked") === true && $('#join_priv_agree').is(":checked")) {
            joinForm.submit();
    } else {
        alert("모두 동의 해야 회원가입이 가능합니다.");
    }
}