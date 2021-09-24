<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        /*let talent = '${user.usTalent}';
        $(function () {
            if (talent == 'N') {
                $('.sellList').hide();
            }
        });*/
    </script>

</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

    <!-- grid영역, 컬럼은 12줄로 이루어져 있고 갯수 비율로 틀을 잡는다. -->
    <div class="container" style="margin-top:60px; height: 30px; padding-bottom: 100px; min-height: 0px;">
        <div class="row">
            <div class="col-12 userNav">
                <h2><img style="width: 50px; height: 50px;" src="${userDto.usImg}">${userDto.usName }님의 mypage</h2>
                <hr>
            </div>
        </div>
    </div>


    <div class="container" style="padding-bottom: 300px;">

        <!--첫번째 줄-->
        <div class="row">

            <div class="col-4">
                <div class="col-8">
                    <a href="useredit.do"><img src="<c:url value="/resources/img_mypage/accountManage.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA" href="useredit.do"><b>회원 정보 수정</b></a>
                </div>

                <div class="col-8">
                    <p>놀면뭐하니에서 가입한<br>회원정보를 수정<br>할 수 있습니다.<br>

                </div>


            </div>


            <div class="col-4">
                <div class="col-8">
                    <a href="manageaccount.do?usNo=${user.usNo }"><img
                            src="<c:url value="/resources/img_mypage/bank.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA" href="manageaccount.do?usNo=${user.usNo }"><b>계좌 관리</b></a>
                </div>

                <div class="col-8">
                    <p>입/출금을 위한 계좌를 관리할 수 있습니다.<br>

                </div>
            </div>
        </div>

        <!--두번째 줄-->
        <div class="row">
            <div class="col-4">
                <div class="col-8">
                    <a href="buylist.do?usNo=${user.usNo }&finStatus=1"><img
                            src="<c:url value="/resources/img_mypage/buy.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA" href="buylist.do?usNo=${user.usNo }&finStatus=1"><b>재능 구매 내역</b></a>
                </div>
                <div class="col-8">
                    <p>회원님의 재능 구매 내역을<br>확인 할 수 있습니다.<br>
                </div>
            </div>

            <div class="col-4 sellList">
                <div class="col-8">
                    <a href="selllist.do?usNo=${user.usNo }&finStatus=거래취소"><img
                            src="<c:url value="/resources/img_mypage/sell.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA" href="selllist.do?usNo=${user.usNo }&finStatus=거래취소"><b>재능 판매 내역</b></a>
                </div>

                <div class="col-8">
                    <p>회원님의 재능 판매 내역을<br>확인 할 수 있습니다.<br>

                </div>
            </div>

            <div class="col-4">
                <div class="col-8">
                    <a href="cashrecord.do?usNo=${userDto.usNo }&startDate=2021-01-01&endDate=2022-01-01""><img
                        src="<c:url value="/resources/img_mypage/chargehistory.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA"
                       href="cashrecord.do?usNo=${userDto.usNo }&startDate=2021-01-01&endDate=2022-01-01"><b>충전 내역확인</b></a>
                </div>

                <div class="col-8">
                    <p>회원님의 충전 내역을<br>확인 할 수 있습니다.<br>

                </div>
            </div>

        </div>

        <!-- 세번째 줄 -->
        <div class="row">

            <div class="col-4">
                <div class="col-8">
                    <a href="pointdeposituser.do?usNo=${user.usNo }"><img
                            src="<c:url value="/resources/img_mypage/point.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA" href="pointdeposituser.do?usNo=${user.usNo }"><b>포인트 출금</b></a>
                </div>

                <div class="col-8">
                    <p>포인트를 유저의 계좌로 출금할 수 있습니다.<br>
                </div>
            </div>


            <div class="col-4">
                <div class="col-8">
                    <a href="withdrawhistory.do?usNo=${userDto.usNo }&startDate=2021-01-01&endDate=2022-01-01"><img
                            src="<c:url value="/resources/img_mypage/pointhistory.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA"
                       href="withdrawhistory.do?usNo=${userDto.usNo }&startDate=2021-01-01&endDate=2022-01-01"><b>포인트 출금
                        내역</b></a>
                </div>

                <div class="col-8">
                    <p>포인트 출금 내역을 확인 할 수 있습니다.<br>
                </div>
            </div>


            <div class="col-4">
                <div class="col-8">
                    <a href="closeaccountform.do"><img
                            src="<c:url value="/resources/img_mypage/closeAccount.png"/>"></a>
                </div>
                <div class="col-8">
                    <a class="colorA" href="closeaccountform.do"><b>회원 탈퇴</b></a>
                </div>

                <div class="col-8">
                    <p>회원 탈퇴시 내역은 모두 사라집니다.<br>
                </div>
            </div>

        </div>

    </div>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>


</body>
</html>