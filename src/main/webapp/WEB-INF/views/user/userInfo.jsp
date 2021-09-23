<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.dto.UserDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보수정</title>

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

    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/userinfo.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- script -->
    <script type="text/javascript">
        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');

            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);


        function idCheck(i) {
            var cont = document.getElementById("usID");
            if (cont.value.length < 6) {
                cont.value = cont.value.substr(0, 6);
                alert('입력한 글자가 6글자 이상 이어야 해요!!');
                return false;
            }
        }


        $(function () {

            $("#addrBtn").click(function () {
                new daum.Postcode({
                    oncomplete: function (data) { //선택시 입력값 세팅
                        $("#praddress").val(data.address); // 주소 넣기
                        $("#praddress2").focus(); //상세입력 포커싱
                    }
                }).open();
            });

            $("#confirmPw").hide();

            $("#usPW2").change(function () {

                var pw1 = $("#usPW").val();
                var pw2 = $("#usPW2").val();

                if (pw1 != pw2) {
                    $("#confirmPw").show();
                }

            });
        });


        function check() {

            var pw1 = $("#usPW").val();
            var pw2 = $("#usPW2").val();

            if (pw1 != pw2) {
                return false;
            } else {
                return true;
            }
        }


    </script>

</head>
<body>

<div class="wwrap">

    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

    <div class="container">
        <div class="input-form-backgroud row">
            <div class="col-3">

                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img id="adminImg"
                             src="data:image/jpeg;base64,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"
                             alt="사진">
                    </div>
                    <div id="userName">
                        USER
                    </div>
                </div>
                <hr>
                <div id="pageName"><b>My Page</b></div>

                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="colorA" href="#">공지사항</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="useredit.do"><b><u>회원정보</u></b></a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">찜 내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">계좌 관리</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">포인트 출금</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">포인트 출금내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="#">회원 탈퇴</a></span><br><br>
                </div>
            </div>

            <div class="col-9">
                <div id="titleName"><h3>회원정보 수정</h3></div>

                <form action="usereditres.do" method="get" class="validation-form" onsubmit="return check()" novalidate>
                    <input type="hidden" value="${user.usNo}" name="usNo">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <br>
                            <br>

                            <label for="usID">ID</label>
                            <br>
                            <input type="text" class="form-control" id="usID" name="usId" value="${user.usId }" required
                                   readonly="readonly">

                            <div class="invalid-feedback"> 아이디를 입력해주세요.</div>
                        </div>

                        <div class="col-md-6 mb-3"></div>

                        <div class="col-md-6 mb-3">

                            <label for="usPW">PW </label>
                            <br>
                            <input type="text" class="form-control" id="usPW" name="usPw" value="${user.usPw }"
                                   required>

                            <div class="invalid-feedback"> 비밀번호를 입력해주세요.</div>
                            <div id="confirmPw"> 비밀번호가 일치하지 않습니다.</div>

                        </div>

                        <div class="col-md-6 mb-3">

                            <label for="usPW2">PW 확인</label>
                            <br>
                            <input type="text" class="form-control" id="usPW2" name="usPw2" value="${user.usPw }"
                                   required>

                            <div class="invalid-feedback"> 비밀번호를 입력해주세요.</div>

                        </div>


                        <div class="col-md-6 mb-3">

                            <label for="usName">이름</label>
                            <br>
                            <input type="text" class="form-control" id="usName" name="usName" value="${user.usName }"
                                   required>

                        </div>
                    </div>

                    <label for="usEmail">이메일</label>
                    <br>
                    <input type="usEmail" class="form-control" id="usEmail" placeholder="you@example.com" name="usEmail"
                           value="${user.usEmail }" required>

                    <div class="invalid-feedback"> 이메일을 입력해주세요.</div>

                    <br>
                    <br>

                    <%
                        UserDto userDto = (UserDto) session.getAttribute("user");
                        String usPhone = userDto.getUsPhone();

                        String usPhone1 = usPhone.substring(0, 3);
                        String usPhone2 = usPhone.substring(3, 7);
                        String usPhone3 = usPhone.substring(7);

                    %>
                    <div class="mb-3">

                        <label for="usPhone">휴대전화</label>

                        <table>
                            <tr>
                                <td>
                                    <input type="usPhone" style="width: 65px" class="form-control" required
                                           name="usPhone1" value="<%=usPhone1 %>">
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <input type="usPhone" style="width: 65px" class="form-control" required
                                           name="usPhone2" value="<%=usPhone2 %>">
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <input type="usPhone" style="width: 65px" class="form-control" required
                                           name="usPhone3" value="<%=usPhone3 %>">
                                </td>
                            </tr>
                        </table>

                        <div class="invalid-feedback"> 휴대전화를 입력해주세요.</div>

                        <br>

                        <div class="mb-3">

                            <label for="prAddress">주소</label>
                            <br>
                            <input type="text" style="display: inline;" class="form-control" readonly id="praddress" required
                                   name="usAddress1" value="${user.usAddress1 }">
                            <button type="button" class="btn btn-outline-primary btn-sm" id="addrBtn">주소찾기</button>

                            <div class="invalid-feedback"> 주소를 입력해주세요.</div>

                        </div>


                        <div class="mb-3">

                            <label for="prAddress2">상세주소</label>
                            <span class="text-muted" required>&nbsp;</span>

                            <br>

                            <input type="text" class="form-control" id="prAddress2" name="usAddress2"
                                   value="${user.usAddress2 }">

                        </div>


                        <div class="mb-3">
                            <label for="usinfo">자기소개</label>
                            <br>
                            <textarea id="userinfo" name="usSelfInfo">${user.usSelfInfo }</textarea>

                        </div>
                    </div>

                    <hr class="mb-4">

                    <button class="btn btn-primary btn-lg btn-block" type="submit">회원정보 변경</button>
                </form>

            </div>
        </div>
    </div>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>