<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Insert title here</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

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

    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

    <script src="<c:url value="/resources/js/messagePopup.js"/>"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <script>
        const pryt = '${dto.prYoutube}';
        function reportsubmit() {
            location.href = 'reportsubmit.do?prNo=${dto.prNo}&decNo=${dto.decNo}';
        }

        function reportNega() {
            location.href = 'reportNega.do?decNo=${dto.decNo}';
        }

        $(function () {
            if (pryt == 'b') {
                $('.detail-content').hide();
            }
            var status = '${dto.decStatus}';
            if (status == "삭제 완료" || status=="삭제 반려") {
                $('.detail-button4').hide();
            }
        });
    </script>

</head>


<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

   <div class="content" style="min-height: 3000px;">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img class="userImg" src="${dto.usImg}">
                    </div>
                    <div id="userName" style="margin-top: 120px;">
                        ${dto.usId}
                    </div>

                    <div id="message">

                    </div>
                </div>

                <hr>

                <div id="pageName" style="margin-top: 150px;"><b style="margin-right: 45px;">자기소개</b></div>

                <div id="menuList">
                    <div style="border: black solid 3px; width: 269px; height: 1000px; ">
                        ${dto.usSelfInfo}
                    </div>
                </div>
            </div>


            <div class="col-9">

                <form action="#">
                    <div class="row">
                        <div class="col-12">
                            <div class="detail-content">
                                <b id="detail-title">${dto.prTitle}</b>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="detail-content">
                                <img id="ai-img" src="${dto.prImage}" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">

                            <div class="detail-content">
                                <iframe id="gangnamStyleIframe" width="350" height="300"
                                        src="https://www.youtube.com/embed/${dto.prYoutube }"
                                        frameborder="0"
                                        allow="autoplay; fullscreen" allowfullscreen></iframe>

                                <script type="text/javascript">
                                    /**
                                     * Youtube API 로드
                                     */
                                    var tag = document.createElement('script');
                                    tag.src = "https://www.youtube.com/iframe_api";
                                    var firstScriptTag = document.getElementsByTagName('script')[0];
                                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                                    /**
                                     * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                                     * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                                     * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                                     */
                                    var player;

                                    function onYouTubeIframeAPIReady() {
                                        player = new YT.Player('gangnamStyleIframe', {
//                height: '315',            // <iframe> 태그 지정시 필요없음
//                width: '560',             // <iframe> 태그 지정시 필요없음
//                videoId: '9bZkp7q19f0',   // <iframe> 태그 지정시 필요없음
//                playerVars: {             // <iframe> 태그 지정시 필요없음
//                    controls: '2'
//                },
                                            events: {
                                                'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                                'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                                            }
                                        });
                                    }

                                    function onPlayerReady(event) {
                                        console.log('onPlayerReady 실행');

                                        // 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
                                        event.target.playVideo();
                                    }

                                    var playerState;

                                    function onPlayerStateChange(event) {
                                        playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                                            event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                                event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                                    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                                        event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                                            event.data == -1 ? '시작되지 않음' : '예외';

                                        console.log('onPlayerStateChange 실행: ' + playerState);
                                    }
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>재능 등록 날짜 : &nbsp;</b></span><span
                                class="detail-data">${dto.prDate }</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>재능 종류 : &nbsp;</b></span><span
                                class="detail-data">${dto.prTalent}</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>거래 방법 : &nbsp;</b></span>
                            <span class="detail-data">
                       <!--거래방법 선택하기-->

                                ${dto.prDeal}
                            </span>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>재능&nbsp;&nbsp;&nbsp; 상세&nbsp;&nbsp;&nbsp; 정보</b></span>
                        </div>
                        <div class="row" id="detail-content">
                            ${dto.prContent }
                        </div>
                    </div>
                    <!--거래방법을 통한 구매하기 submit-->
                </form>
                <div class="row" id="button-div">
                    <div class="col-12">
                        <button onclick="reportsubmit()" class="detail-button2 btn btn-outline-primary btn-sm detail-button4">신고승인
                        </button>
                        <button onclick="reportNega()" class="detail-button2 btn btn-outline-primary btn-sm detail-button4">신고반려
                        </button>
                        <button onclick="history.back()" class="detail-button2 btn btn-outline-primary btn-sm detail-button4">대기
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <hr>
       </div>
    </div>


    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>
</body>
</html>