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
    $('#chatArea').on('keydown', function (event) {
        var chatcontent = $("#chatArea").val();
        if (event.keyCode == 13)
            if (!event.shiftKey) {
                event.preventDefault();
                let msg = {'writer': writer, 'buyer': buyer, 'dealNo': dealNo, 'content': chatcontent, 'cal': cal};


                if (isStomp) {
                    socket.send('/TTT', {}, JSON.stringify(msg));
                } else {
                    socket.send(sockMsg);
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

/*

const Chat = (function(){
    const myName = "blue";

    // init 함수
    function init() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function(e){
            if(e.keyCode == 13 && !e.shiftKey) {
                e.preventDefault();
                const message = $(this).val();

                // 메시지 전송
                sendMessage(message);
                // 입력창 clear
                clearTextarea();
            }
        });
    }

    // 메세지 태그 생성
    function createMessageTag(LR_className, senderName, message) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();

        // 값 채우기
        chatLi.addClass(LR_className);
        chatLi.find('.sender span').text(senderName);
        chatLi.find('.message span').text(message);

        return chatLi;
    }

    // 메세지 태그 append
    function appendMessageTag(LR_className, senderName, message) {
        const chatLi = createMessageTag(LR_className, senderName, message);

        $('div.chat:not(.format) ul').append(chatLi);

        // 스크롤바 아래 고정
        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
    }

    // 메세지 전송
    function sendMessage(message) {
        // 서버에 전송하는 코드로 후에 대체
        const data = {
            "senderName"    : "blue",
            "message"        : message
        };

        // 통신하는 기능이 없으므로 여기서 receive
        resive(data);
    }

    // 메세지 입력박스 내용 지우기
    function clearTextarea() {
        $('div.input-div textarea').val('');
    }

    // 메세지 수신
    function resive(data) {
        const LR = (data.senderName != myName)? "left" : "right";
        appendMessageTag("right", data.senderName, data.message);
    }

    return {
        'init': init
    };
})();

$(function(){
    Chat.init();
});*/
/*채팅 js부분*/