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


    <!--css 가져오는 방법-->
    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">


    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        function checkPW() {

            var userPw = "${user.usPw}";
            var inputPw = $('#inputPW').val();

            if (userPw == inputPw) {
                return true;
            } else {
                alert("올바른 비밀번호가 아닙니다.");
                return false;
            }
        }


    </script>


</head>
<body>


<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

   <div class="content">
    <div class="container" style="margin-top: 60px; margin-bottom:60px;">
        <div class="row">
            <div class="col-3">
                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img id="adminImg"
                             src="${user.usImg}"
                             alt="사진">
                    </div>
                    <div id="userName">
                        ${user.usId}
                    </div>
                </div>
                <hr>

                <div id="pageName"><b>MY PAGE</b></div>

                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="colorA" href="noticemainuser.do">공지사항</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="useredit.do">회원정보</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="buylist.do?usNo=${user.usNo }&finStatus=1">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="selllist.do?usNo=${user.usNo }&finStatus=거래취소">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="cashrecord.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="manageaccount.do?usNo=${user.usNo }">계좌 관리</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="pointdeposituser.do?usNo=${user.usNo }">포인트 출금</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="withdrawhistory.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">포인트 출금내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="closeaccountform.do"><u><b>회원 탈퇴</b></u></a></span><br><br>
                </div>
            </div>
            <div class="col-9" align="center">
                <h2>회원 탈퇴</h2>
                <hr>
                <table>
                    <tr>
                        <th class="userleave-th" colspan="3">회원님의 비밀번호를 입력해 주세요.</th>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    <tr>
                        <td>&nbsp;</td>

                        <form action="closeaccount.do" method="get" onsubmit="return checkPW()">
                            <input type="hidden" name="usNo" value="${user.usNo }">
                    <tr>
                        <th>Password</th>
                        <td><input id="inputPW" type="password"></td>
                    </tr>
                    <td colspan="3" align="right">
                        <input type="submit" value="탈퇴하기" class="btn btn-outline-primary btn-sm">
                    </td>
                    </tr>
                    </form>

                </table>
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