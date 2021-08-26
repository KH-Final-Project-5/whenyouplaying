<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wj
  Date: 2021/08/19
  Time: 8:13 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>title</title>
</head>
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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet">

<link rel="stylesheet" href="<c:url value="/resources/css/mainpage.css"/>">

<%--<link rel="stylesheet" href="resources/css/mainpage.css">--%>
<%--<link rel="stylesheet" href="../css/mainpage.css">--%>
<body>
<div class="container">
    <div class="row">
        <h2>최신순</h2>
    </div>
    <hr class="hrClass1">
    <div class="row">
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
    </div>
    <!--    <hr>-->
    <br>
    <br>
    <br>
    <div class="row">
        <h2>인기순</h2>
    </div>
    <hr class="hrClass1">
    <div class="row">
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
        <div class="col-2 mainNewImgDiv">
            <img class="mainNewImg" src="../lion.jpeg"/><br>
            <a class="mainNewLink" href="#">제목이 입력 만약 이게 길게되면 아래로 내려가나?</a>
            <br>
            <img class="mainStarImg" src="../lion.jpeg"/>
            <label class="mainStarLabel">5.0</label><br>
            <label class="mainRating">100개 평가</label>
        </div>
    </div>
    <div id="map" style="width:100%;height:100%;">dwaawd</div>

    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36484ecb4bc45702e85b48b3ddeabe57"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        map.setDraggable(false);

        // 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
        function setDraggable() {
            // 마우스 드래그로 지도 이동 가능여부를 설정합니다
            map.setDraggable(false);
        }
    </script>
</div>
</body>
</html>