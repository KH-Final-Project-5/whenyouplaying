<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

    <!-- 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/footer.css"/>">
</head>
<body>
<div class="foo_div">
    <img src="<c:url value="/resources/img_header/logo.png"/>">
</div>
<div class="foo_div1">
    <span>놀면 뭐하니?</span> <span> | </span>
    <span>대표 : 김완주</span> <span> | </span>
    <span>사업자등록번호 : 667-13-5358</span> <span> | </span>
    <p>주소 : 서울시 강남구 역삼동 1004-1번지 1004호</p>
    <p>ⓒCopyright © 2021 nolmyeonmohani Inc. All rights reserved.</p>

    <img src="<c:url value="/resources/img_header/kakao.png"/>">
    <img src="<c:url value="/resources/img_header/google.png"/>">
    <img src="<c:url value="/resources/img_header/naver.png"/>">
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
    var socket = null;
    var isStomp = false;
    $(function () {
        connectStompMes();
    });

    function connectStompMes(){
        const ws = new SockJS("/stompTest");
        var client = Stomp.over(ws);
        isStomp = true;
        socket = client;

        client.connect({},function() {
            console.log("Connected stompTest!!");

            client.subscribe('/topic/mes/${user.usId}' , function (event) {
                var content = JSON.parse(event.body).content;
                /*console.log(content);
                console.log('!!!!!!!!!!!!!!!!evnt>>', event);*/
                let $socketAlert = $('div#socketAlert');
                var content2 = "<a href='selllist.do?usNo=${user.usNo}&finStatus=거래취소'>" + content + "</a>";
                $socketAlert.html(content2);
                $socketAlert.css('display', 'block');
                setTimeout(function () {
                    $socketAlert.css('display', 'none');
                }, 3000);
            });
        });
    }

    function connectStopm(dealNo, buyer) {
        const ws = new SockJS("/stompTest");
        var client = Stomp.over(ws);
        isStomp = true;
        socket = client;

        client.connect({},function() {
            console.log("Connected stompTest!!");
            console.log(dealNo);
            // client.send('/TTT', {}, "msg:haha");

            client.subscribe('/topic/message/'+dealNo+"/"+writer , function (event) {
                var content = JSON.parse(event.body).content;
                var user = JSON.parse(event.body).writer;
                $('#chatul').append('<li class="left"><b>' + user + "</b></li>");
                $('#chatul').append('<li class="left">' + content + "</li>");
                $('#chatArea').val("");
                $('.chat')
                    .stop()
                    .animate({ scrollTop: $('.chat')[0].scrollHeight }, 1000);
                console.log('!!!!!!!!!!!!!!!!evnt>>', JSON.parse(event.body).content);
                // console.log()
            });
        });
    }

    /*function connectWs() {


        ws.onopen = function () {
            console.log("info : connection opened.");


        };

        ws.onmessage = function (evt) {
            var data = evt.data;
            console.log("ReceiveMessage : " + data + "\n");
            let $socketUl = $('ul#chatul');
            $socketUl.append('<li id="chatUl">' + data + '</li>');
            let $chatdiv = $('div.chat');
            $chatdiv.stop()
                .animate({scrollTop: $('.chat')[0].scrollHeight}, 1000);


        };

        ws.onclose = function (event) {
            console.log("Info : Connection closed.");
        };

        ws.onerror = function (err) {
            console.log("Error : ", err);
        };
    }*/
</script>


</body>
</html>