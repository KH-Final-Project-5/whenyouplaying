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
    <link rel="stylesheet" href="<c:url value="/resources/css/reportPage.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- js -->
    <script src="<c:url value="/resources/js/reportPage.js"/>"></script>


</head>
<body>

    <div id="reportArea" class="shadow">
        <form action="">
            <div id="title">
                <label id="titleFont" class="align-middle">신고하기</label>
            </div>
            <hr id="titleLine">

            <div id="contentArea">
                <div id="contentTitle">
                    <label >제 목 &nbsp&nbsp:</label>&nbsp&nbsp<input type="text" class="textcss" readonly="readonly" value="한.영 변환"><br>
                    <label>작성자 :</label>&nbsp&nbsp<input type="text" class="textcss" readonly="readonly" value="작성자">
                </div>
                <hr id="middleHr">
                
                <div id="radioTitle">
                    <label class="radioFont">사유선택 :</label>&nbsp<input type="text" id="textCssContent" class="radioFont" readonly="readonly" value="여러 사유에 해당하는 경우, 대표적인 사유 1개를 선택해주세요">
                </div>
                
                <div id="radioArea">
                    <input class="form-check-input" type="radio" name="report" id="report1" value="">
                    <label class="form-check-label" for="report1">부적절한 홍보 게시글</label>
                    <br>
                    <input class="form-check-input" type="radio" name="report" id="report2" value="">
                    <label class="form-check-label" for="report2">음란성 또는 청소년에게 부적합한 내용</label>
                    <br>
                    <input class="form-check-input" type="radio" name="report" id="report3" value="">
                    <label class="form-check-label" for="report3">저작권 침해</label>
                    <br>
                    <input class="form-check-input" type="radio" name="report" id="report4" value="etc">
                    <label class="form-check-label" for="report4">기타 :</label>
                    <div id="textArea">
                        <textarea cols="40" rows="6" name="etcContent" id="textbox"></textarea>
                    </div>

                </div>

                <div id="submitArea">
                    <input type="submit" class="btn btn-primary" value="신고하기" >
                </div>

            </div>
        </form>

    </div>



</body>
</html>