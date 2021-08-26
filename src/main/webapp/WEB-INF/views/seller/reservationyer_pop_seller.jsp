<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>판매자 예약 관리</title>
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


<link rel="stylesheet" href="<c:url value="/resources/css/reservation_seller.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/css/reservation_seller.css"/>"></script>
<script>
</script>

<body>
<div class="container">
    <div class="row">
        <div class="sellerCalender col-9">
            캘린더가 들어갈 예정입니다.
        </div>
        <div class="col-3">
            <button class="btn btn-outline-primary" id="calenderUpdate">수정 완료</button>
            <br><br>
            <button class="btn btn-outline-primary" id="closePop">닫기</button>
        </div>
    </div>dwq
    <br>
    <div class="row">
        <div class="updateCalender col-9">
            <form action="" method="post">
                <label>
                    <input type="checkbox" name="reservation_chk1" id="reservation_chk1">
                    <label>예약 일정 선택</label>
                    <label class="eventreservation1">* 선택하면 하루만 선택 가능합니다.</label>
                </label>
                <br>
                <div class="inputdate">
                    <input type="date" name="reserStartDate">
                    <label class="inputEndDate" id="inputEndDate1">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="date" name="reserEndDate"></label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" class="btn btn-outline-dark" value="입력">
                </div>
            </form>
            <hr class="hrClass1">
            <br>
            <form action="" method="post">
                <label>
                    <input type="checkbox" name="reservation_chk2" id="reservation_chk2">
                    <label class="reservation"> 예약하기</label>
                    <label class="eventreservation2">* 선택하면 하루만 선택 가능합니다.</label>
                </label>
                <br>
                <input type="text" name="reserName" placeholder="예약자 이름" id="reserName">
                <br>
                <input type="date" name="reserStartDate">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label class="inputEndDate" id="inputEndDate2">~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="date" name="reserEndDate">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <input type="submit" class="btn btn-outline-dark" value="입력">
            </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>
</body>
</html>