function fnImgPop(url) {
    var img = new Image();
    img.src = url;
    var img_width = img.width;
    var win_width = img.width + 200;
    var img_height = img.height;
    var win = img.height + 200;
    var OpenWindow = window.open('', '_blank', 'width=' + win_width + ', height=' + win + ', menubars=no, scrollbars=auto');
    OpenWindow.document.write("<style>body{margin:0px;}</style><img src='" + url + "' width='" + win_width + "'>");
}

let today = new Date();

let year = today.getFullYear();
let month = today.getMonth() + 1;
let date = today.getDate();
let hours = today.getHours();
let minutes = today.getMinutes();
let cal = year + "/" + month + "/" + date + "  " + hours + ":" + minutes;
$(function () {
    $('.chat')
        .stop()
        .animate({scrollTop: $('.chat')[0].scrollHeight}, 1000);
    connectStopm(dealNo);
    $('#sellCompBtn').click(function () {
        if (confirm("구매 완료 하시겠습니까?")) {
            location.href = 'buytradecomplete.do?dealNo=' + dealNo;
        }
    });

    $('#chatArea').on('keydown', function (event) {
        var chatcontent = $("#chatArea").val();
        if (event.keyCode == 13)
            if (!event.shiftKey) {
                event.preventDefault();
                let msg = {'writer': writer, 'buyer': buyer, 'dealNo': dealNo, 'content': chatcontent, 'cal': cal};

                if (isStomp) {
                    socket.send('/TTT', {}, JSON.stringify(msg));
                } else {
                    socket.send(msg);
                }
                $('#chatul').append('<li class="left"><b>' + writer + "</b>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    cal + "</li>");
                $('#chatul').append('<li class="left">' + chatcontent + "</li>");

                $('#chatArea').val("");
                $('.chat')
                    .stop()
                    .animate({scrollTop: $('.chat')[0].scrollHeight}, 1000);

            }
    });
});
