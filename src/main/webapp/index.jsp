<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>mainpage</title>

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
	
	<%--css 가져오는 방법--%>
	<link rel="stylesheet" href="<c:url value="/resources/css/mainpage.css"/>">
	    
	    
</head>

<body>

<jsp:include page="WEB-INF/views/header/header.jsp" flush="true"/>

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
</div>
</body>
</html>