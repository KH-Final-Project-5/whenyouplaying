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
        function checkNumber(event, type) {
            if (type == 'numbers') {
                if (event.keyCode < 48 || event.keyCode > 57) return false;
            }
        }

        function fn_press_han(obj) {
            obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        }

        $(document).ready(function () {
            $("#addrBtn").click(function () {
                new daum.Postcode({
                    oncomplete: function (data) { //선택시 입력값 세팅
                        $("#praddress").val(data.address); // 주소 넣기
                        $("#praddress2").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        });

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

        function setThumbnail1(event) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var img = document.getElementById("profileImg");
                img.setAttribute("src", event.target.result);


            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

</head>
<body>

<div class="wwrap">

    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

   <div class="content" style="min-height: 2000px;">
    <div class="container" style="margin-top: 60px; margin-bottom: 60px;">
        <div class="input-form-backgroud row">
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
                <div id="pageName"><b>My Page</b></div>

                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="colorA" href="noticemainuser.do">공지사항</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="useredit.do"><b><u>회원정보</u></b></a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="buylist.do?usNo=${user.usNo }&finStatus=1">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="selllist.do?usNo=${user.usNo }&finStatus=거래취소">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="cashrecord.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="manageaccount.do?usNo=${user.usNo }">계좌 관리</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="pointdeposituser.do?usNo=${user.usNo }">포인트 출금</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="withdrawhistory.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">포인트 출금내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="closeaccountform.do">회원 탈퇴</a></span><br><br>
                </div>
            </div>

            <div class="col-9">
                <div id="titleName"><h3>회원정보 수정</h3></div>

                <form action="usereditres.do" method="post" enctype="multipart/form-data" class="validation-form"
                      onsubmit="return check()" novalidate>
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
                        String usPhone1 = null;
                        String usPhone2 = null;
                        String usPhone3 = null;
                        if (usPhone.length() == 10) {
                            usPhone1 = usPhone.substring(0, 3);
                            usPhone2 = usPhone.substring(3, 6);
                            usPhone3 = usPhone.substring(6);
                        } else {
                            usPhone1 = usPhone.substring(0, 3);
                            usPhone2 = usPhone.substring(3, 7);
                            usPhone3 = usPhone.substring(7);
                        }


                    %>
                    <div class="mb-3">

                        <label for="usPhone">휴대전화</label>

                        <table>
                            <tr>
                                <td>
                                    <input type="text" style="width: 65px; IME-MODE: disabled;" id="usPhone" class="form-control" required
                                           name="usPhone1" value="<%=usPhone1 %>"
                                           onkeypress="return checkNumber(event, 'numbers');" onkeydown="fn_press_han(this)"
                                           minlength="3" maxlength="3">
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <input type="text" style="width: 65px" class="form-control" required
                                           name="usPhone2" value="<%=usPhone2 %>"
                                           onkeypress="return checkNumber(event, 'numbers');" onkeydown="fn_press_han(this)"
                                           minlength="3" maxlength="4">
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <input type="text" style="width: 65px" class="form-control" required
                                           name="usPhone3" value="<%=usPhone3 %>"
                                           onkeypress="return checkNumber(event, 'numbers');" onkeydown="fn_press_han(this)"
                                           minlength="4" maxlength="4">
                                </td>
                            </tr>
                        </table>

                        <div class="invalid-feedback"> 휴대전화를 입력해주세요.</div>

                        <br>

                        <div class="mb-3">

                            <label for="prAddress">주소</label>
                            <br>
                            <input type="text" style="display: inline;" class="form-control" id="praddress" required
                                   name="usAddress1" value="${user.usAddress1 }" readonly>
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
                            <label class="btn btn-outline-dark" id="uploadBtn" style="margin-top: 10px">
                                프로필 사진<input type="file" onchange="setThumbnail1(event);"
                                             name="usImgFile" class="file-input"
                                             accept="image/*" style="display: none">
                            </label>
                            <div id="blah1">
                                <img src="${user.usImg}" id="profileImg" style="width: 200px; height: 200px">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="userinfo">자기소개</label>
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
    </div>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>