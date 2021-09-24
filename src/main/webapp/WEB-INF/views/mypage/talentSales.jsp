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

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        $(function () {
            console.log($('.finstatus').text());
            if ($('.finstatus').text() == "거래완료") {
                $(this).nextAll(".moveBtn").hide();
            }

            var finStatus = "${finStatus}";

            if (finStatus == '거래취소') {
                $('#status').val('거래취소').prop("selected", ture);
            } else if (finStatus == '거래완료') {
                $('#status').val('거래완료').prop("selected", ture);
            } else if (finStatus == '진행중') {
                $('#status').val('진행중').prop("selected", ture);
            }

        });

        function tradeForm(form) {
            var dealNo = $(form).parent().prevAll(".dealNo").text()
            if ($(form).attr('id') == "online") {
                location.href = 'onlineTradeSellForm.do?dealNo=' + dealNo;
            } else if ($(form).attr('id') == "direct") {
                location.href = 'directTradeSellForm.do?dealNo=' + dealNo;
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
                    <span class="menuText"><a class="colorA" href="selllist.do?usNo=${user.usNo }&finStatus=거래취소"><u><b>재능 판매내역</b></u></a></span><br><br>
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
                <h2 style="text-align: center;">재능 판매 내역</h2>
                <hr>
                <form action="selllist.do" method="get">
                    <input type="hidden" name="usNo" value="${user.usNo }">
                    <div style="float: right;">
                        <select id="status" name="finStatus">
                            <option value="거래취소">전체</option>
                            <option value="거래완료">거래완료</option>
                            <option value="진행중">진행중</option>
                        </select>
                        <button type="submit" class="btn btn-outline-primary btn-sm" id="array-button">정렬하기</button>
                    </div>
                </form>

                <div class="buy-table-div" style="margin-top: 70px;">
                    <table border="1" class="buy-table">
                        <colgroup>
                            <col width="70px">
                            <col width="440">
                            <col width="90px">
                            <col width="80px">
                            <col width="100px">
                            <col width="90px">
                        </colgroup>

                        <tr class="tr_bottom_line">
                            <th class="th_right_line">거래번호</th>
                            <th class="th_right_line">프로젝트명</th>
                            <th class="th_right_line">거래 상태</th>
                            <th class="th_right_line">구매자</th>
                            <th class="th_right_line">거래날짜</th>
                            <th>이동</th>
                        </tr>

                        <c:choose>
                            <c:when test="${empty AllList}">
                                <tr>
                                    <td colspan="5" align="center"> -------- 기록이 없습니다 ---------</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${AllList}" var="dto" varStatus="status">
                                    <tr class="tr_bottom_line">
                                        <td class="th_right_line dealNo">${dto.dealNo }</td>
                                        <td class="th_right_line">${dto.prTitle}</td>
                                        <c:if test="${dto.finIf eq 'B'}">
                                            <td class="th_right_line">완료 대기중</td>
                                        </c:if>
                                        <c:if test="${dto.finIf ne 'B'}">
                                            <td class="th_right_line">${dto.finStatus }</td>
                                        </c:if>
                                        <td class="th_right_line">${dto.usId }</td>
                                        <td class="th_right_line">${dto.finDate }</td>
                                        <c:if test="${dto.finStatus eq '거래완료'}">
                                            <td>완료</td>
                                        </c:if>
                                        <c:if test="${dto.finIf eq 'S' && dto.finStatus ne '거래완료'}">
                                            <td>대기중</td>
                                        </c:if>
                                        <c:if test="${dto.finIf ne 'S' && dto.finStatus ne '거래완료'}">

                                            <td>
                                                <button class="btn btn-outline-success btn-sm rounded-pill moveBtn"
                                                        id="${dto.prDeal}"
                                                        onclick=tradeForm(this);>거래페이지
                                                </button>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

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