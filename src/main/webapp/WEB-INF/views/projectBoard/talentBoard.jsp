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
                    <h2>?????? ?????? ?????????</h2>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-12" align="right" style="margin-bottom: 90px;">
                    <button class="btn btn-outline-primary" id="insertBtn"
                            onclick="location.href='insertProject.do'">?????? ????????????
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
                         * Youtube API ??????
                         */
                        var tag = document.createElement('script');
                        tag.src = "https://www.youtube.com/iframe_api";
                        var firstScriptTag = document.getElementsByTagName('script')[0];
                        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                        /**
                         * onYouTubeIframeAPIReady ????????? ????????? ???????????? ??????.
                         * ???????????? API??? ?????? JavaScript ???????????? ?????? ??? API??? ??? ?????? ????????????.
                         * ????????? ?????? ??? ????????? ???????????? ????????? ???????????? ??????.
                         */
                        var player;

                        function onYouTubeIframeAPIReady() {
                            player = new YT.Player('1iframe', {
//                height: '315',            // <iframe> ?????? ????????? ????????????
//                width: '560',             // <iframe> ?????? ????????? ????????????
//                videoId: '9bZkp7q19f0',   // <iframe> ?????? ????????? ????????????
//                playerVars: {             // <iframe> ?????? ????????? ????????????
//                    controls: '2'
//                },
                                events: {
                                    'onReady': onPlayerReady,               // ???????????? ????????? ???????????? API ????????? ?????? ????????? ??? ????????? ??????
                                    'onStateChange': onPlayerStateChange    // ??????????????? ????????? ????????? ????????? ??????
                                }
                            });
                        }

                        function onPlayerReady(event) {
                            console.log('onPlayerReady ??????');

                            // ???????????? ???????????? (??????: ?????????????????? ?????????????????? ??????)
                            event.target.playVideo();
                        }

                        var playerState;

                        function onPlayerStateChange(event) {
                            playerState = event.data == YT.PlayerState.ENDED ? '?????????' :
                                event.data == YT.PlayerState.PLAYING ? '?????? ???' :
                                    event.data == YT.PlayerState.PAUSED ? '???????????? ???' :
                                        event.data == YT.PlayerState.BUFFERING ? '????????? ???' :
                                            event.data == YT.PlayerState.CUED ? '???????????? ?????????' :
                                                event.data == -1 ? '???????????? ??????' : '??????';

                            console.log('onPlayerStateChange ??????: ' + playerState);
                        }
                    </script>
                </div>
                <div class="col-4">
                    <iframe id="2iframe" width="350" height="300"
                            src="https://www.youtube.com/embed/9bZkp7q19f0?rel=0&enablejsapi=1"
                            frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

                    <script type="text/javascript">
                        /**
                         * Youtube API ??????
                         */
                        var tag = document.createElement('script');
                        tag.src = "https://www.youtube.com/iframe_api";
                        var firstScriptTag = document.getElementsByTagName('script')[0];
                        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                        /**
                         * onYouTubeIframeAPIReady ????????? ????????? ???????????? ??????.
                         * ???????????? API??? ?????? JavaScript ???????????? ?????? ??? API??? ??? ?????? ????????????.
                         * ????????? ?????? ??? ????????? ???????????? ????????? ???????????? ??????.
                         */
                        var player;

                        function onYouTubeIframeAPIReady() {
                            player = new YT.Player('2iframe', {
//                height: '315',            // <iframe> ?????? ????????? ????????????
//                width: '560',             // <iframe> ?????? ????????? ????????????
//                videoId: '9bZkp7q19f0',   // <iframe> ?????? ????????? ????????????
//                playerVars: {             // <iframe> ?????? ????????? ????????????
//                    controls: '2'
//                },
                                events: {
                                    'onReady': onPlayerReady,               // ???????????? ????????? ???????????? API ????????? ?????? ????????? ??? ????????? ??????
                                    'onStateChange': onPlayerStateChange    // ??????????????? ????????? ????????? ????????? ??????
                                }
                            });
                        }

                        function onPlayerReady(event) {
                            console.log('onPlayerReady ??????');

                            // ???????????? ???????????? (??????: ?????????????????? ?????????????????? ??????)
                            event.target.playVideo();
                        }

                        var playerState;

                        function onPlayerStateChange(event) {
                            playerState = event.data == YT.PlayerState.ENDED ? '?????????' :
                                event.data == YT.PlayerState.PLAYING ? '?????? ???' :
                                    event.data == YT.PlayerState.PAUSED ? '???????????? ???' :
                                        event.data == YT.PlayerState.BUFFERING ? '????????? ???' :
                                            event.data == YT.PlayerState.CUED ? '???????????? ?????????' :
                                                event.data == -1 ? '???????????? ??????' : '??????';

                            console.log('onPlayerStateChange ??????: ' + playerState);
                        }
                    </script>
                </div>
                <div class="col-4">
                    <iframe id="3iframe" width="350" height="300"
                            src="https://www.youtube.com/embed/9bZkp7q19f0?rel=0&enablejsapi=1"
                            frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>

                    <script type="text/javascript">
                        /**
                         * Youtube API ??????
                         */
                        var tag = document.createElement('script');
                        tag.src = "https://www.youtube.com/iframe_api";
                        var firstScriptTag = document.getElementsByTagName('script')[0];
                        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                        /**
                         * onYouTubeIframeAPIReady ????????? ????????? ???????????? ??????.
                         * ???????????? API??? ?????? JavaScript ???????????? ?????? ??? API??? ??? ?????? ????????????.
                         * ????????? ?????? ??? ????????? ???????????? ????????? ???????????? ??????.
                         */
                        var player;

                        function onYouTubeIframeAPIReady() {
                            player = new YT.Player('3iframe', {
//                height: '315',            // <iframe> ?????? ????????? ????????????
//                width: '560',             // <iframe> ?????? ????????? ????????????
//                videoId: '9bZkp7q19f0',   // <iframe> ?????? ????????? ????????????
//                playerVars: {             // <iframe> ?????? ????????? ????????????
//                    controls: '2'
//                },
                                events: {
                                    'onReady': onPlayerReady,               // ???????????? ????????? ???????????? API ????????? ?????? ????????? ??? ????????? ??????
                                    'onStateChange': onPlayerStateChange    // ??????????????? ????????? ????????? ????????? ??????
                                }
                            });
                        }

                        function onPlayerReady(event) {
                            console.log('onPlayerReady ??????');

                            // ???????????? ???????????? (??????: ?????????????????? ?????????????????? ??????)
                            event.target.playVideo();
                        }

                        var playerState;

                        function onPlayerStateChange(event) {
                            playerState = event.data == YT.PlayerState.ENDED ? '?????????' :
                                event.data == YT.PlayerState.PLAYING ? '?????? ???' :
                                    event.data == YT.PlayerState.PAUSED ? '???????????? ???' :
                                        event.data == YT.PlayerState.BUFFERING ? '????????? ???' :
                                            event.data == YT.PlayerState.CUED ? '???????????? ?????????' :
                                                event.data == -1 ? '???????????? ??????' : '??????';

                            console.log('onPlayerStateChange ??????: ' + playerState);
                        }
                    </script>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="board-content">

                    <c:choose>
                        <c:when test="${empty pr_dto }">
                            <h1>---------????????? ???????????? ????????????------------</h1>
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
                                                     alt="??????">
                                            </c:if>
                                            <c:if test="${pr_dto.prImage ne 'a'}">
                                                <img id="ai-img" src="${pr_dto.prImage}"
                                                     alt="??????">
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
                                                    class="btn btn-outline-primary deleteBtn">??? ??????
                                            </button>

                                        </div>


                                    </div>

                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!--????????????-->
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
                                <input type="text" name="searchContent" placeholder="??? ???????????? ??????"
                                       class="search-bar"> <input type="submit"
                                                                  class="btn btn-outline-primary" value="????????????"
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
                                        aria-hidden="true">&laquo;??????</span>
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
        <!-- grid??????, ????????? 12?????? ???????????? ?????? ?????? ????????? ?????? ?????????. -->
    </div>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>
</body>
</html>