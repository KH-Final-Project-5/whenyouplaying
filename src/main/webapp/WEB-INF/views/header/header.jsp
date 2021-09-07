<%--<jsp:useBean id="user" scope="session" type="com.dto.UserDto"/>--%>
<%--<%@ page import="com.dto.UserDto" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Insert title here</title>

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
            integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
            integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
            crossorigin="anonymous"></script>

    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- jQeury-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- js -->
    <script src="<c:url value="/resources/js/header.js"/>"></script>
</head>
<script>
    $(function () {
        <c:choose>
        <c:when test="${empty user.usNo}">

        </c:when>
        <c:otherwise>


        $.ajax({
            type: "post",
            url: "mesCountChk.do?usNo=${user.usNo}",
            dataType: 'json',
            success: function (data) {
                if (data.check == true) {
                    $('.badgeSize').show();
                } else {
                    $('.badgeSize').hide();
                }
            },
            error: function (request, status, error) {

                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }

        });
        var usertalnet = "${user.usTalent}";
        var userrole = "${user.usRole}";
        console.log(userrole);
        if (userrole === "user") {
            $('#defaultHeader').hide();
            $("#loginHeader").show();
            // $("#userWelcome").text("");
            // $("#userPoint").text("");
            if (usertalnet === "N") {
                $('.enroll').show();
            } else {
                $('.enroll2').html("전문가 변경");
            }


        } else if (userrole === "admin") {
            $('#defaultHeader').hide();
            $("#adminHeader").show();
        }

        </c:otherwise>
        </c:choose>


    });
</script>
<body>


<!-- default -->
<div id="defaultHeader">
    <div class="headerBack">
        <div class="container">
            <div class="row line1">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="<c:url value="/resources/img_header/logo.png"/>" alt="" width="60" height="30"
                             class="d-inline-block" onclick="location.href='main.do'">
                        <b class="logoText" onclick="location.href='main.do'">놀면 뭐하니?</b>
                    </a>
                    <div class="contentList">
                        <a href="noticemain.do" class="navA">공지사항</a>
                        |
                        <a href="loginform.do" class="navA">로그인</a>
                        |
                        <a href="regiform.do" class="navA">회원가입</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="searchArea">
                    <div class="input-group input-group mb-3 ">
                            <span class="input-group-text" style="padding: 0px;"><img
                                    src="<c:url value="/resources/img_header/search.png"/>" alt="음성인식" width="40"
                                    height="20"></span>
                        <form action="">

                            <input type="search" class="searchBar" name="search">
                            <button class="btn btn-outline-primary" type="submit">검색</button>
                        </form>


                        <div class="mic">
                            <a href=""><img src="<c:url value="/resources/img_header/mic.png"/>" alt="" width="50"
                                            height="35"></a>
                        </div>

                        <div class="rec">
                            <button class="btn btn-primary">전문가 추천</button>
                        </div>

                        <div class="enroll">
                            <button class="btn btn-primary enroll2"
                                    onclick="location.href='talentform.do'">전문가 등록
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="categoryArea">
                    <ul class="list-group list-group-horizontal flex-fill listArea">
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=design" class="catA">디자인</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=translation"
                                                                 class="catA">번역/외국어</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=document"
                                                                 class="catA">문서작성</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=music"
                                                                 class="catA">음악/영상</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=program"
                                                                 class="catA">프로그램개발</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=biz"
                                                                 class="catA">마케팅/비지니스</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=life" class="catA">생활서비스</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- login -->
<div id="loginHeader">
    <div class="headerBack">
        <div class="container">
            <div class="row line1">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="<c:url value="/resources/img_header/logo.png"/>" alt="" width="60" height="30"
                             class="d-inline-block" onclick="location.href='main.do'">
                        <b class="logoText" onclick="location.href='main.do'">놀면 뭐하니?</b>
                    </a>


                    <div class="contentList">
                        <label id="userWelcome">${user.usName}님 환영합니다!</label>
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav"
                                onclick="location.href='logout.do'">logOut
                        </button>
                        |
                        <label id="userPoint">포인트 : ${user.usCash}Point</label>
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav">충전</button>
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav">출금</button>
                        |
                        <a href="mypage.do?usNo=${user.usNo }" class="navA">MY PAGE</a>
                        |
                        <a href="" class="navA">공지사항</a>
                        |
                        <a href="messagechk.do?usNo=${user.usNo}" class="chatA">
                            <span class="material-icons md-36 chaticon">
                                wechat
                                <span class="rounded-pill badgeSize">1</span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="searchArea">
                    <div class="input-group input-group mb-3 ">
                            <span class="input-group-text" style="padding: 0px;"><img
                                    src="<c:url value="/resources/img_header/search.png"/>" alt="음성인식" width="40"
                                    height="20"></span>
                        <form action="">

                            <input type="search" class="searchBar" name="search">
                            <button class="btn btn-outline-primary" type="submit">검색</button>
                        </form>


                        <div class="mic">
                            <a href=""><img src="<c:url value="/resources/img_header/mic.png"/>" alt="" width="50"
                                            height="35"></a>
                        </div>

                        <div class="rec">
                            <button class="btn btn-primary">전문가 추천</button>
                        </div>

                        <div class="enroll">
                            <button class="btn btn-primary enroll2"
                                    onclick="location.href='talentform.do'">전문가 등록
                            </button>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="categoryArea">
                    <ul class="list-group list-group-horizontal flex-fill listArea">
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=design" class="catA">디자인</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=translation"
                                                                 class="catA">번역/외국어</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=document"
                                                                 class="catA">문서작성</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=music"
                                                                 class="catA">음악/영상</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=program"
                                                                 class="catA">프로그램개발</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=biz"
                                                                 class="catA">마케팅/비지니스</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=life" class="catA">생활서비스</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- admin-->
<div id="adminHeader">
    <div class="headerBack">
        <div class="container">
            <div class="row line1">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="<c:url value="/resources/img_header/logo.png"/>" alt="" width="60" height="30"
                             class="d-inline-block" onclick="location.href='main.do'">
                        <b class="logoText" onclick="location.href='main.do'">놀면 뭐하니?</b>
                    </a>


                    <div class="contentList">
                        관리자님 환영합니다!!
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav"
                                onclick="location.href='logout.do'">logOut
                        </button>
                        |
                        <a href="noticeListAdmin.do" class="navA">Admin page</a>
                        |
                        <a href="noticemainadmin.do" class="navA">공지사항</a>
                        |
                        <a href="messagechk.do?usNo=${user.usNo}" class="chatA">
                            <span class="material-icons md-36 chaticon">
                                wechat
                                <span class="rounded-pill badgeSize">1</span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="searchArea">
                    <form action="">
                        <div class="input-group input-group mb-3 ">
                            <span class="input-group-text" style="padding: 0px;"><img
                                    src="<c:url value="/resources/img_header/search.png"/>" alt="음성인식" width="40"
                                    height="20"></span>
                            <input type="search" class="searchBar" name="search">
                            <button class="btn btn-outline-primary" type="submit">검색</button>

                            <div class="mic">
                                <a href=""><img src="<c:url value="/resources/img_header/mic.png"/>" alt="" width="50"
                                                height="35"></a>
                            </div>

                            <div class="rec">
                                <button class="btn btn-primary">전문가 추천</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="categoryArea">
                    <ul class="list-group list-group-horizontal flex-fill listArea">
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=design" class="catA">디자인</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=translation"
                                                                 class="catA">번역/외국어</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=document"
                                                                 class="catA">문서작성</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=music"
                                                                 class="catA">음악/영상</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=program"
                                                                 class="catA">프로그램개발</a></li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=biz"
                                                                 class="catA">마케팅/비지니스</a>
                        </li>
                        <li class="list-group-item listSpace"><a href="category.do?prTalent=life" class="catA">생활서비스</a>
                        </li>
                    </ul>
                </div>
            </div>


        </div>
    </div>
</div>

</body>
</html>