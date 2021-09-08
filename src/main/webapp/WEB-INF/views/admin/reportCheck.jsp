<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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

    <!-- css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/reportCheck.css"/>">
    <%--    <script src="<c:url value="/resources/js/reportCheck.js"/>"></script>--%>

    <script>
        function movingpage() {
            opener.location.href = 'reportDetail.do?prNo=${reportDto.prNo}&decNo=${reportDto.decNo}';
            window.close();
        }
    </script>


</head>
<body>

<div id="divBox">
    <div id="titleName"><h1>신고확인</h1><br></div>
    <br><br>
    <label>신고자 ID : </label>&nbsp;<input type="text" value="${userDto.usId}" id="userId" readonly="readonly">
    <hr>
    <label>해당 글 작성자 : </label> &nbsp;<input type="text" value="${reportDto.usId}" id="userId" readonly="readonly"><br>
    <label>해당 글 제목 : </label> &nbsp;<input type="text" value="${reportDto.prTitle}" id="titleName2" readonly="readonly">
    <hr>

    <h3>신고 내용</h3><br>
    <textarea readonly="readonly">
        ${reportDto.deContent}
    </textarea> <br>


</div>


<div id="btn">
    <input type="button" onclick="movingpage()" value="게시글로 이동" class="btn btn-outline-primary"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" onclick="window.close()" value="닫기" class="btn btn-outline-primary">
</div>

<br>


</body>
</html>