
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  	<!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>

    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- jQeury-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

<!-- default -->
<div id="defaultHeader">
    <div class="headerBack">
        <div class="container">
            <div class="row line1" >
                <div class="container-fluid">
                    <a class="navbar-brand" href="#" >
                        <img src="resources/img_header/logo.png" alt="" width="60" height="30" class="d-inline-block">
                        <b class="logoText">놀면 뭐하니?</b>
                    </a>
                    <div class="contentList">
                        <a href="" class="navA">공지사항</a>
                        |
                        <a href="" class="navA">로그인</a>
                        |
                        <a href="" class="navA">회원가입</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="searchArea">
                    <form action="" >
                        <div class="input-group input-group mb-3 ">
                            <span class="input-group-text" style="padding: 0px;"><img src="resources/img_header/search.png" alt="음성인식" width="40" height="20"></span>
                            <input type="search"  class="searchBar" name="search"  >
                            <button class="btn btn-outline-primary" type="submit">검색</button>
                            
                            <div class="mic">
                                <a href=""><img src="resources/img_header/mic.png" alt="" width="50" height="35"></a>
                            </div>

                            <div class="rec">
                                <button class="btn btn-primary">전문가 추천</button>
                            </div>
        
                            <div class="enroll">
                                <button class="btn btn-primary">전문가 등록</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="row">
                <div class="categoryArea">
                    <ul class="list-group list-group-horizontal flex-fill listArea">
                        <li class="list-group-item listSpace"><a href="" class="catA">디자인</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">번역/외국어</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">문서작성</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">음악/영상</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">프로그램개발</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">마케팅/비지니스</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">생활서비스</a></li>
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
            <div class="row line1" >
                <div class="container-fluid">
                    <a class="navbar-brand" href="#" >
                        <img src="resources/img_header/logo.png" alt="" width="60" height="30" class="d-inline-block">
                        <b class="logoText">놀면 뭐하니?</b>
                    </a>
                    
    
                    <div class="contentList">
                        00님 환영합니다!!!
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav">logOut</button>
                        |
			                           포인트: 10,000cash
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav">충전</button>
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav">출금</button>
                        |
                        <a href="" class="navA">MY PAGE</a>
                        |
                        <a href="" class="navA">공지사항</a>
                        |
                        <a href="" class="chatA">
                            <span class="material-icons md-36 chaticon">
                                wechat
                                <span class="rounded-pill badgeSize" >1</span>
                            </span>
                        </a>   
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="searchArea">
                    <form action="" >
                        <div class="input-group input-group mb-3 ">
                            <span class="input-group-text" style="padding: 0px;"><img src="resources/img_header/search.png" alt="음성인식" width="40" height="20"></span>
                            <input type="search"  class="searchBar" name="search"  >
                            <button class="btn btn-outline-primary" type="submit">검색</button>
                            
                            <div class="mic">
                                <a href=""><img src="resources/img_header/mic.png" alt="" width="50" height="35"></a>
                            </div>

                            <div class="rec">
                                <button class="btn btn-primary">전문가 추천</button>
                            </div>
        
                            <div class="enroll">
                                <button class="btn btn-primary">전문가 등록</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="categoryArea">
                    <ul class="list-group list-group-horizontal flex-fill listArea">
                        <li class="list-group-item listSpace"><a href="" class="catA">디자인</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">번역/외국어</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">문서작성</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">음악/영상</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">프로그램개발</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">마케팅/비지니스</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">생활서비스</a></li>
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
            <div class="row line1" >
                <div class="container-fluid">
                    <a class="navbar-brand" href="#" >
                        <img src="resources/img_header/logo.png" alt="" width="60" height="30" class="d-inline-block">
                        <b class="logoText">놀면 뭐하니?</b>
                    </a>
                    
    
                    <div class="contentList">
                        00님 환영합니다!!!
                        <button class="btn btn-outline-primary btn-sm rounded-pill marginNav">logOut</button>
                        |
                        <a href="" class="navA">Admin page</a>
                        |
                        <a href="" class="navA">공지사항</a>
                        |
                        <a href="" class="chatA">
                            <span class="material-icons md-36 chaticon">
                                wechat
                                <span class="rounded-pill badgeSize" >1</span>
                            </span>
                        </a>   
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="searchArea">
                    <form action="" >
                        <div class="input-group input-group mb-3 ">
                            <span class="input-group-text" style="padding: 0px;"><img src="resources/img_header/search.png" alt="음성인식" width="40" height="20"></span>
                            <input type="search"  class="searchBar" name="search"  >
                            <button class="btn btn-outline-primary" type="submit">검색</button>
                            
                            <div class="mic">
                                <a href=""><img src="resources/img_header/mic.png" alt="" width="50" height="35"></a>
                            </div>

                            <div class="rec">
                                <button class="btn btn-primary">전문가 추천</button>
                            </div>
        
                            <div class="enroll">
                                <button class="btn btn-primary">전문가 등록</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="categoryArea">
                    <ul class="list-group list-group-horizontal flex-fill listArea">
                        <li class="list-group-item listSpace"><a href="" class="catA">디자인</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">번역/외국어</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">문서작성</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">음악/영상</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">프로그램개발</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">마케팅/비지니스</a></li>
                        <li class="list-group-item listSpace"><a href="" class="catA">생활서비스</a></li>
                    </ul>
                </div>
            </div>


        </div>
    </div> 
</div>

</body>
</html>