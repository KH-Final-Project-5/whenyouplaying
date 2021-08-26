function paySubmit(){
    // console.log($('#orderCheckBox').is(":checked"));
    var payForm = $('#payForm');
    if($('#orderCheckBox').is(":checked")===true){
        if (confirm("결제하시겠습니까?")) {
            payForm.submit();
        }
    }else{
        alert("주문 확인을 체크해주세요.");
    }
}