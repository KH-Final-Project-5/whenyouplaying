<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="com.commons.Criteria" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dto.WithDrawDto" %>

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
    <link rel="stylesheet" href="<c:url value="/resources/css/withdrawHistory.css"/>">
    <script src="<c:url value="/resources/js/withdrawHistory.js"/>"></script>


</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="true"/>
    </header>

   <div class="content" style="min-height: 1500px;">
    <div class="container" style="margin-top: 60px; margin-bottom: 60px;">
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
                <br>

                <div id="menuList">
                    <span class="menuText"><a class="wiA" href="noticemainuser.do">공지사항</a></span><br><br>
                    <span class="menuText"><a class="wiA" href="useredit.do">회원정보</a></span><br><br>
                    <span class="menuText"><a class="wiA"
                                              href="buylist.do?usNo=${user.usNo }&finStatus=1">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="wiA"
                                              href="selllist.do?usNo=${user.usNo }&finStatus=거래취소">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="wiA"
                                              href="cashrecord.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="wiA"
                                              href="manageaccount.do?usNo=${user.usNo }">계좌 관리</a></span><br><br>
                    <span class="menuText"><a class="wiA"
                                              href="pointdeposituser.do?usNo=${user.usNo }">포인트 출금</a></span><br><br>
                    <span class="menuText"><a class="wiA"
                                              href="withdrawhistory.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01"><u><b>포인트 출금내역</b></u></a></span><br><br>
                    <span class="menuText"><a class="wiA" href="closeaccountform.do">회원 탈퇴</a></span><br><br>
                </div>
            </div>

            <%
                Criteria cri = (Criteria) request.getAttribute("criDate");

                String start = cri.getStartDate();
                String start1 = start.substring(0, 4);
                String start2 = start.substring(4, 6);
                String start3 = start.substring(6);

                String startDate = start1 + "-" + start2 + "-" + start3;

                String end = cri.getEndDate();
                String end1 = end.substring(0, 4);
                String end2 = end.substring(4, 6);
                String end3 = end.substring(6);

                String endDate = end1 + "-" + end2 + "-" + end3;

                //출금금액 total
                int totalPrice = 0;

                List<WithDrawDto> list = (List<WithDrawDto>) request.getAttribute("totalPriceList");

                for (int i = 0; i < list.size(); i++) {

                    WithDrawDto tmp = list.get(i);

                    totalPrice += tmp.getWiCash();
                }

                System.out.println("totalPrice : " + totalPrice);

            %>


            <div class="col-9">
                <div id="titleName"><h1>출금내역</h1></div>
                <br><br>
                <div id="divBox">
                    <p>재능 수익/ 출금 관리</p>
                    <p>판매 수수료율: 30%</p>
                    <p>★출금 금액의 30%는 기부 단체에 후원 됩니다.</p>
                    <hr>
                    <div id="amount">
                        <input type="text" value="총 출금액" id="bold"><br>
                        <input type="text" value="<%=totalPrice %>원">
                    </div>
                    <div id="point">
                        <input type="text" value="현재 잔여 Point" id="bold"><br>
                        <input type="text" value="${user.usCash }Point">
                    </div>
                    <hr>

                    <h2 id="h2">출금내역 확인</h2><br>
                    <form action="withdrawhistory.do" method="get">
                        <input type="hidden" name="usNo" value="${user.usNo }">
                        <span id="fromDateSpan">조회 시작일</span>
                        <input type="date" max="9999-12-31" id="fromDate" name="startDate" value="<%=startDate %>">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <span id="toDateSpan">~ 조회 종료일</span>
                        <input type="date" max="9999-12-31" id="toDate" name="endDate" value="<%=endDate%>">

                        <input type="submit" value="조회" id="btn" class="btn btn-secondary btn-sm">

                    </form>
                    <br>


                    <div class="tableDiv">
                        <table border="1" align="center" class="table">

                            <colgroup>
                                <col width="130"/>
                                <col width="110"/>
                                <col width="120"/>
                                <col width="160"/>
                            </colgroup>

                            <tr>
                                <th>출금 일자</th>
                                <th>출금 번호</th>
                                <th>은행 명</th>
                                <th>출금 금액</th>

                            </tr>

                            <c:choose>
                                <c:when test="${empty pointList}">
                                    <tr>
                                        <td colspan="4" align="center">--------- 기록이 없습니다 ----------</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${pointList }" var="dto">
                                        <tr>
                                            <td>${dto.wiDate}</td>
                                            <td>${dto.wiNo }</td>
                                            <td>${dto.wiBank }</td>
                                            <td>${dto.wiCash }</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </table>

                        <div id="pagingArea" class="pagingDiv">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">

                                    <c:if test="${pointPageMaker.prev}">
                                        <li class="page-item">
                                            <a class="page-link" aria-label="Previous"
                                               href="${pointPageMaker.makeQuery(pointPageMaker.startPage - 1)}">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="${pointPageMaker.startPage}" end="${pointPageMaker.endPage}"
                                               var="idx">
                                        <li class="page-item">
                                            <a class="page-link"
                                               href="withdrawhistory.do${pointPageMaker.makeQuery2(idx)}">${idx}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pointPageMaker.next && pointPageMaker.endPage > 0 }">
                                        <li class="page-item">
                                            <a class="page-link" aria-label="Next"
                                               href="withdrawhistory.do${pointPageMaker.makeQuery(pointPageMaker.endPage + 1)}">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    </div>
    <br><br>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="true"/>
    </footer>
</div>


</body>
</html>