<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>

<body>

<div class="wwrap">
    
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
    
  <div class="content" style="min-height: 1200px;">
    <div class="container" id="mainpageArea">
        <div class="row">
            <h2>최신순</h2>
        </div>
        <hr class="hrClass1">
        <div class="row">
        <c:forEach items="${list}" var="pr_dto">
                <div class="col-2 mainNewImgDiv">
                <a class="mainNewLink" href="Detail.do?prNo=${pr_dto.prNo }"><img class="mainNewImg" src="${pr_dto.prImage}"/></a><br>
                <a class="mainNewLink" href="Detail.do?prNo=${pr_dto.prNo }">${pr_dto.prTitle }</a>
                <br>
                </div>
        </c:forEach>
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
        <c:forEach items="${list2}" var="pr_dto2">
                <div class="col-2 mainNewImgDiv">
                  <a class="mainNewLink" href="Detail.do?prNo=${pr_dto2.prNo }"><img class="mainNewImg" src="${pr_dto2.prImage}"/></a><br>
                <a class="mainNewLink" href="Detail.do?prNo=${pr_dto2.prNo }">${pr_dto2.prTitle }</a>
                <br>
                <img class="mainStarImg" src="<c:url value="/resources/img_header/starimg.png"/>"/>
                <label class="mainStarLabel">${pr_dto2.e}</label><br>
                <label class="mainRating">${pr_dto2.w}개의 평가</label>
            </div>
        </c:forEach>
        
        </div>
    </div>
   </div>  
	    
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>