<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <!-- 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <!-- css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/reportMain.css"/>">
    <script src="<c:url value="/resources/js/reportMain.js"/>"></script>

    <script>
        $(function () {
            $('#selectReport').change(function () {

                var change = null;

                if ($(this).val() == "reportcomplete") {
                    change = "a";
                } else if ($(this).val() == "reportnega") {
                    change = "b";
                } else if ($(this).val() == "reportwait") {
                    change = "c";
                } else {
                    change = "no";
                }

                location.href = 'reportMain.do?change=' + change;

            });
            var url = location.search;
            var urlParam = new URLSearchParams(url);
            var getType = urlParam.get("change");

            if (getType == "a") {
                $('#selectReport').val("reportcomplete").attr('selected', true);
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                $('.pagenumber${idx}').attr('href', 'reportMain.do${pageMaker.makeQuery(idx)}&change=a');
                $('.pagenext').attr("href", 'reportMain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=a');
                </c:forEach>
            } else if (getType == "b") {
                $('#selectReport').val("reportnega").attr('selected', true);
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">

                $('.pagenumber${idx}').attr('href', 'reportMain.do${pageMaker.makeQuery(idx)}&change=b');
                $('.pagenext').attr("href", 'reportMain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=b');
                </c:forEach>

            } else if (getType == "c") {
                $('#selectReport').val("reportwait").attr('selected', true);
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                $('.pagenumber${idx}').attr('href', 'reportMain.do${pageMaker.makeQuery(idx)}&change=c');
                $('.pagenext').attr("href", 'reportMain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=c');
                </c:forEach>

            }

            $('.reason').each(function () {
                if ($(this).text().trim() == "기타") {
                    $(this).css('cursor', 'pointer');
                }
            });


        });
        function openreason(no){
            var decNo = $(no).attr('id');
            // console.log();
            if ($(no).text().trim() == "기타") {
                var popup = window.open('reportCheck.do?decNo=' + decNo, '신고확인', 'width=720px,height=950px,scrollbars=no');
            }
        }
    </script>


</head>
<body>
<div class="wwrap">

    <!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

   <div class="content">
    <div class="container" style="margin-top: 60px;">
        <div class="row">
            <div class="col-3">
                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img id="adminImg"
							 src="${user.usImg }"
                             alt="사진">
                    </div>
                    <div id="userName">
                        ADMIN
                    </div>
                </div>
                <hr>
                <div id="pageName"><b>Admin Page</b></div>

                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="menuText" href="noticemainadmin.do?usNo=${user.usNo }">공지 사항</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="abilitymain.do">재능 기부 승인</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="reportMain.do?change=no"><u><b>신고 내역 확인</b></u></a></span><br><br>
                    <span class="menuText"><a class="menuText" href="userManage.do">회원 목록 확인</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="adminpointout.do">관리자 출금 관리</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="donatelist.do">기부처 관리</a></span><br><br>
                </div>
            </div>

            <div class="col-9">
                <div id="titleName"><h1>신고 글 관리</h1></div>

                <div id="selectBarStatus">
                    <select id="selectReport">
                        <option value="reportall" selected >전체 목록</option>
                        <option value="reportcomplete">삭제 완료</option>
                        <option value="reportnega">삭제 반려</option>
                        <option value="reportwait">삭제 대기</option>
                    </select>
                </div>

                <div class="tableDiv">
                    <table border="1" align="center" class="table">

                        <colgroup>
                            <col width="50"/>
                            <col width="230"/>
                            <col width="70"/>
                            <col width="80"/>
                            <col width="80"/>
                            <col width="60"/>
                            <col width="80"/>
                        </colgroup>

                        <tr>
                            <th>NO</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>신고자</th>
                            <th>상태</th>
                            <th>신고일</th>
                            <th>삭제 사유</th>
                        </tr>
                        <c:choose>
                            <c:when test="${empty decList}">
                                <tr>
                                    <td colspan="5">등록된 게시물이 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${decList}" var="decList" varStatus="status">
                                    <tr class="decListTr">
                                        <td height="50">${decList.decNo}</td>
                                        <td class="tdTitle"><a class="menuText"
                                               href="reportDetail.do?prNo=${decList.prNo}&decNo=${decList.decNo}">${decList.prTitle}</a></td>
                                        <td onclick="suspend()" class="suspend">${decList.usId}</td>
                                        <td>${userList[status.index].usId}</td>
                                        <td id="decStatus">${decList.decStatus}</td>
                                        <td><fmt:formatDate value="${decList.decDate}" pattern="yyyy.MM.dd"/></td>
                                        <td class="reason" id="${decList.decNo}" onclick="openreason(this)">
                                            ${decList.decReason}
                                        </td>
                                    </tr>
                                    <div id="tabl1"></div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>

                    <div id="pagingArea" class="pagingDiv">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="${pageMaker.makeQuery(pageMaker.startPage - 1)}&change=no"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li class="page-item"><a class="page-link pagenumber${idx}"
                                                             href="reportMain.do${pageMaker.makeQuery(idx)}&change=no">${idx}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li class="page-item">
                                        <a class="page-link pagenext"
                                           href="reportMain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=no"
                                           aria-label="Next">
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
    <br><br><br><br>

    <!-- footer 영역-->
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>
</body>
</html>