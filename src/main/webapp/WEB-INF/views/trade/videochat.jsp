<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wj
  Date: 2021/09/14
  Time: 4:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>화상채팅</title>
</head>
<style>
    button {
        margin: 0 20px 0 0;
        width: 83px;
    }

    button#hangupButton {
        margin: 0;
    }

    video {
        --width: 45%;
        width: var(--width);
        height: calc(var(--width) * 0.75);
        margin: 0 0 20px 0;
        vertical-align: top;
    }

    video#localVideo {
        margin: 0 20px 20px 0;
    }

    div.box {
        margin: 1em;
    }

    @media screen and (max-width: 400px) {
        button {
            width: 83px;
            margin: 0 11px 10px 0;
        }

        video {
            height: 90px;
            margin: 0 0 10px 0;
            width: calc(50% - 7px);
        }

        video#localVideo {
            margin: 0 10px 20px 0;
        }

    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let dealNo = '${dealNo}'+'번';
</script>



<body>
<div>
    <video id="localVideo" autoplay width="480px"></video>
    <video id="remoteVideo" width="480px" autoplay></video>
</div>

<script src="http://124.51.17.204:8080/socket.io/socket.io.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="<c:url value="/resources/js/video.js"/>"></script>

</body>

</html>
