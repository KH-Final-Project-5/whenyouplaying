<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

     <!-- css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/reportCheck.css"/>">
    <script src="<c:url value="/resources/js/reportCheck.js"/>"></script>
</head>
<body>

                <div id="divBox">
                    <div id="titleName"><h1>신고확인</h1><br></div><br><br>
                    <label>신고자 ID : </label>&nbsp;<input type="text" value="admin" id="userId" readonly="readonly">
                    <label>신고자 :</label>&nbsp;<input type="text" value="이순신" id="userId" readonly="readonly">
                    <hr>
                    
                    
                    
                    <label>신고된 게시물 번호 : </label> &nbsp;<input type="text" value="1" id="reportNo" readonly="readonly"><br>
                    <label>해당 글 작성자 : </label> &nbsp;<input type="text" value="홍길동" id="userId" readonly="readonly"><br>
                    <label>신고 사유 : </label> &nbsp;<input type="text" value="기타" readonly="readonly"> <br>
                    <label>해당 글 제목 : </label> &nbsp;<input type="text" value="한번 클릭해봐!! " id="titleName2" readonly="readonly"> 
                    <hr>

                    <h3>신고 내용</h3><br>
                    <textarea readonly="readonly">
안녕하세요 관리자님.
해당 게시물 신고합니다. 확인후 처리 부탁드립니다!!
                    </textarea> <br>


                </div>



                <div id="btn">
                    <input type="button" value="신고 반려" class="btn btn-outline-primary">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="신고 승인" class="btn btn-outline-primary">
                </div>
            </div>
        </div>
    </div><br>


      


</body>
</html>