
function suspend(){
    if(confirm("사용자를 정지하시겠습니까?") == true){
        alert("사용자가 정지 되었습니다.")
    }else{
        alert("취소되었습니다.")
    }
}


$(function (){
    $('.tdTitle').click(function(){
        if($(this).nextAll('.reportReason').text()==="기타"){
            openPop();
        }
       
    });
});


function openPop(){
    var popup = window.open('reportCheck.html', '신고확인', 'width=720px,height=830px,scrollbars=no');
}