<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dto.UserDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>talnetBoard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
            rel="stylesheet">


    <!-- bootstrap css -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <!-- jQeury-->
    <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
</head>


<script>
    $(function () {
        var user = "<%=session.getAttribute("user")%>";
        var userrole = "${user.usRole}"
        var usTalent = "${user.usTalent}"

        if (usTalent == "N") {
            $("#insertBtn").hide();
        }


        if (userrole !== "admin") {
            $(".deleteBtn").hide();
        } else if (user === "null" || user == null) {
            $(".deleteBtn").hide();
        }


        if (user === "null" || user == null) {
            $("#insertBtn").hide();
        }

        let url = new URL(window.location.href);

        let urlParams = url.searchParams;

        console.log(url);

        let prTalent = urlParams.get("prTalent");

        if (prTalent == 'design') {
            $("#1iframe").attr('src', 'https://www.youtube.com/embed/o3uMD8AV25s?rel=0&enablejsapi=1');
            $("#2iframe").attr('src', 'https://www.youtube.com/embed/hp7TJRksIC8?rel=0&enablejsapi=1');
            $("#3iframe").attr('src', 'https://www.youtube.com/embed/mXytyvQvfso?rel=0&enablejsapi=1');
        } else if (prTalent == 'translation') {
            $("#1iframe").attr('src', 'https://www.youtube.com/embed/Lo05O39IPXk?rel=0&enablejsapi=1');
            $("#2iframe").attr('src', 'https://www.youtube.com/embed/8Te944ThqkQ?rel=0&enablejsapi=1');
            $("#3iframe").attr('src', 'https://www.youtube.com/embed/O2BI9NonVWk?rel=0&enablejsapi=1');
        } else {
            $(".youtubeDiv").hide();
        }


    });

</script>


<body>


<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

    <div class="content" style="min-height: 3500px;">
        <div class="container" style="margin-top: 60px; margin-bottom: 60px;">
            <div class="row">
                <div class="col-12 userNav">
                    <h2>재능 판매 게시판</h2>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-12" align="right" style="margin-bottom: 90px;">
                    <button class="btn btn-outline-primary" id="insertBtn"
                            onclick="location.href='insertProject.do'">재능 등록하기
                    </button>
                </div>
            </div>
            <div class="row youtubeDiv">
                <div class="col-4">
                    <iframe id="1iframe" width="350" height="300"
                            src="https://www.youtube.com/embed/o3uMD8AV25s?rel=0&enablejsapi=1"
                            frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

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
                            player = new YT.Player('1iframe', {
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
                <div class="col-4">
                    <iframe id="2iframe" width="350" height="300"
                            src="https://www.youtube.com/embed/9bZkp7q19f0?rel=0&enablejsapi=1"
                            frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

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
                            player = new YT.Player('2iframe', {
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
                <div class="col-4">
                    <iframe id="3iframe" width="350" height="300"
                            src="https://www.youtube.com/embed/9bZkp7q19f0?rel=0&enablejsapi=1"
                            frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

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
                            player = new YT.Player('3iframe', {
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
            <hr>
            <div class="row">
                <div class="board-content">

                    <c:choose>
                        <c:when test="${empty pr_dto }">
                            <h1>---------등록된 게시물이 없습니다------------</h1>
                        </c:when>

                        <c:otherwise>
                            <c:forEach items="${pr_dto }" var="pr_dto">
                                <div class="col-12" style="text-align: center;">
                                    <h3>
                                        <a href="Detail.do?prNo=${pr_dto.prNo }">${pr_dto.prTitle }</a>
                                    </h3>
                                </div>
                                <div class="col-12">
                                    <div class="row" style="border-bottom: 1px solid black">


                                        <div class="col-4">
                                            <c:if test="${pr_dto.prImage eq 'a'}">
                                                <img id="ai-img" src="http://wjwan0.dothome.co.kr/stoarge/spring.jpg"
                                                     alt="사진">
                                            </c:if>
                                            <c:if test="${pr_dto.prImage ne 'a'}">
                                                <img id="ai-img" src="${pr_dto.prImage}"
                                                     alt="사진">
                                            </c:if>
                                        </div>

                                        <div class="col-5">
                                            <p>
                                                <a href="Detail.do?prNo=${pr_dto.prNo }">${pr_dto.prContent }</a>
                                            </p>
                                        </div>

                                        <div class="col-3">

                                            <div class="talent-price">
                                                <b>${pr_dto.prPrice } Point</b>

                                            </div>
                                            <button
                                                    onclick="location.href='ProjectDelete.do?prNo=${pr_dto.prNo}'"
                                                    class="btn btn-outline-primary deleteBtn">글 삭제
                                            </button>

                                        </div>


                                    </div>

                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!--검색기능-->
            <br>
            <br>
            <div class="row">
                <div class="col-12 search">

                    <div class="row">


                        <div class="col-2 search-select"></div>
                        <div class="col-8" style="margin-left: 150px; float: left;">

                            <img src="<c:url value="/resources/ProjectImg/search.png"/>"
                                 class="search-img"
                                 style="float: left; margin-right: 10px; margin-top: 6px;">
                            <form action="search.do">
                                <input type="hidden" name="prTalent" value="${pr_cri.prTalent }">
                                <input type="text" name="searchContent" placeholder="글 내용으로 검색"
                                       class="search-bar"> <input type="submit"
                                                                  class="btn btn-outline-primary" value="검색하기"
                                                                  id="search-button">
                                <img src="<c:url value="/resources/ProjectImg/mike.jpg"/>"
                                     class="search-img2">
                            </form>


                            <button class="search-img2" onclick=""></button>

                        </div>
                    </div>

                    <hr>
                </div>
            </div>
            <!--pagination-->
            <div class="row">
                <div class="col-12 page-nav">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${pr_PageMaker.prev }">
                                <li class="page-item"><a class="page-link"
                                                         href="${pr_PageMaker.makeQuery(pr_PageMaker.startPage - 1) }"
                                                         aria-label="Previous"> <span
                                        aria-hidden="true">&laquo;이전</span>
                                </a></li>
                            </c:if>
                            <c:forEach begin="${pr_PageMaker.startPage }"
                                       end="${pr_PageMaker.endPage }" var="idx">
                                <li class="page-item"><a class="page-link"
                                                         href="category.do${pr_PageMaker.makeQuery3(idx) }">${idx }</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pr_PageMaker.next && pr_PageMaker.endPage > 0 }">
                                <li class="page-item"><a class="page-link"
                                                         href="category.do${pr_PageMaker.makeQuery(pr_PageMaker.endPage + 1) }"
                                                         aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- grid영역, 컬럼은 12줄로 이루어져 있고 갯수 비율로 틀을 잡는다. -->
    </div>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>
</body>
</html>