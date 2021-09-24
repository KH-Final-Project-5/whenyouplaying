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

    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bankAccount.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">


    <script type="text/javascript">

        $(function () {

            $("#registerArea").hide();

        });

        function registForm() {

            $("#registerArea").show();
            $(".col-3, #tableArea, #contentTitle").css('opacity', '0.25');

        }

        function registerCancle() {

            $("#registerArea").hide();
            $(".col-3, #tableArea, #contentTitle").css('opacity', 'unset');

        }


        function openBank() {

            var url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
                "response_type=code&" +
                "client_id=b16b6e96-be84-4b16-bbde-4a9ffe23c677&" +
                "redirect_uri=http://localhost:8105/whenyouplay/bankauth.do&" +
                "scope=login inquiry transfer&" +
                "state=12345678901234567890123456789012&" +
                "auth_type=0";

            var options = "width=700, height=700, top=30";

            window.open(url, "오픈뱅킹 계좌등록", options);


        }


    </script>

</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>


    <div class="container">
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
                <div id="pageName"><b>My Page</b></div>

                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="acA" href="noticemainuser.do">공지사항</a></span><br><br>
                    <span class="menuText"><a class="acA" href="useredit.do">회원정보</a></span><br><br>
                    <span class="menuText"><a class="acA"
                                              href="buylist.do?usNo=${user.usNo }&finStatus=1">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="acA"
                                              href="selllist.do?usNo=${user.usNo }&finStatus=거래취소">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="acA"
                                              href="cashrecord.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="acA" href="manageaccount.do?usNo=${user.usNo} "><b><u>계좌 관리</u></b></a></span><br><br>
                    <span class="menuText"><a class="acA"
                                              href="pointdeposituser.do?usNo=${user.usNo }">포인트 출금</a></span><br><br>
                    <span class="menuText"><a class="acA"
                                              href="withdrawhistory.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">포인트 출금내역</a></span><br><br>
                    <span class="menuText"><a class="acA" href="closeaccountform.do">회원 탈퇴</a></span><br><br>
                </div>
            </div>
            <div class="col-9">
                <div id="titleName"><h3>계좌 관리</h3></div>

                <div id="tableArea">
                    <table id="table">
                        <thead>
                        <tr class="table-secondary">
                            <th class="thcss">No.</th>
                            <th class="thcss">별칭</th>
                            <th class="thcss">은행명</th>
                            <th class="thcss">계좌번호</th>
                            <th class="thcss">예금주</th>
                            <th class="thcss" style="width: 50px;"></th>
                            <th id="lastTh"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty accountList }">
                                <tr>
                                    <td colspan="7" align="center">---------------------- 계좌가 없습니다.
                                        -------------------------
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${accountList }" var="dto">
                                    <tr>
                                        <td id="bankId" class="centerTd"
                                            style="border-left: 1px solid black;">${dto.baNo }</td>
                                        <td class="centerTd">${dto.baNickName }</td>
                                        <td class="centerTd">${dto.baBankName }</td>
                                        <td class="centerTd">${dto.baBankNumber }</td>
                                        <td class="centerTd">${dto.baOwner }</td>
                                        <td class="centerTd">
                                            <button class="btn btn-secondary btn-sm"
                                                    onclick="location.href='deleteaccount.do?baNo=${dto.baNo}&usNo=${user.usNo }'">
                                                삭제
                                            </button>
                                        </td>
                                        <td class="centerTd">
                                            <button class="btn btn-secondary btn-sm" onclick="openBank();">인증</button>
                                        <td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        <tr id="lastTr">
                            <td colspan="7">
                                <button style="margin-top: 10px;" class="btn btn-primary btn-sm"
                                        onclick="registForm();">계좌등록
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div id="registerArea" class="shadow">
                    <form action="insertaccount.do" method="get">
                        <input type="hidden" name="usNo" value="${user.usNo }">
                        <b style="font-size: 17px;">계좌등록</b>
                        <hr style="margin: 3px;">

                        <label>별칭</label>
                        <br>
                        <input class="accountInput" type="text" name="baNickName" placeholder="별칭을 입력하세요">
                        <hr style="margin: 3px;">

                        <label>은행명</label>
                        <br>
                        <style>
                            select:invalid {
                                color: gray;
                            }
                        </style>
                        <select name="baBankName" class="accountInput" id="selectArea" required>
                            <option disabled selected>선택해주세요</option>
                            <option value="국민은행/004">국민은행</option>
                            <option value="하나은행/081">하나은행</option>
                            <option value="신한은행/088">신한은행</option>
                            <option value="카카오뱅크/090">카카오뱅크</option>
                            <option value="농협은행/011">농협은행</option>
                            <option value="우리은행/020">우리은행</option>
                            <option value="산업은행/002">산업은행</option>
                            <option value="기업은행/003">기업은행</option>
                            <option value="수협은행/007">수협은행</option>
                            <option value="SC제일은행/023">SC제일은행</option>
                            <option value="씨티은행/027">씨티은행</option>
                            <option value="토스/092">토스(Toss)</option>
                        </select>
                        <hr style="margin: 3px;">

                        <label>계좌번호</label>
                        <br>
                        <input class="accountInput" type="text" name="baBankNumber" placeholder="계좌를 입력하세요">
                        <hr style="margin: 3px;">

                        <label>예금주</label>
                        <br>
                        <input class="accountInput" type="text" name="baOwner" placeholder="예금주명을 입력하세요">
                        <hr style="margin: 3px;">

                        <input id="submitButton" class="btn btn-sm btn-outline-primary" type="submit" value="등록하기">
                        <input id="cancleButton" class="btn btn-sm btn-outline-primary" type="reset" value="취소하기"
                               onclick="registerCancle();">
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