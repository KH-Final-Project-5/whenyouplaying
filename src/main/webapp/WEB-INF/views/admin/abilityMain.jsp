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
    <link rel="stylesheet" href="<c:url value="/resources/css/abilityMain.css"/>">
    <%--    <script src="<c:url value="/resources/js/ab"/>"></script>--%>

    <script>
        $(function () {
            $('#selectOption').change(function () {

                var change = null;

                if ($(this).val() == "applySubmit") {
                    change = "a";
                } else if ($(this).val() == "applyNega") {
                    change = "b";
                } else if ($(this).val() == "applyWait") {
                    change = "c";
                }

                location.href = 'ajaxabilitymain.do?change=' + change;

            });
            var url = location.search;
            var urlParam = new URLSearchParams(url);
            var getType = urlParam.get("change");

            if (getType == "a") {
                $('#selectOption').val("applySubmit").attr('selected', true);
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                $('.pagenumber${idx}').attr('href', 'ajaxabilitymain.do${pageMaker.makeQuery(idx)}&change=a');
                $('.pagenext').attr("href", 'ajaxabilitymain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=a');
                </c:forEach>
            } else if (getType == "b") {
                $('#selectOption').val("applyNega").attr('selected', true);
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">

                $('.pagenumber${idx}').attr('href', 'ajaxabilitymain.do${pageMaker.makeQuery(idx)}&change=b');
                $('.pagenext').attr("href", 'ajaxabilitymain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=b');
                </c:forEach>

            } else if (getType == "c") {
                $('#selectOption').val("applyWait").attr('selected', true);
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                $('.pagenumber${idx}').attr('href', 'ajaxabilitymain.do${pageMaker.makeQuery(idx)}&change=c');
                $('.pagenext').attr("href", 'ajaxabilitymain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&change=c');
                </c:forEach>

            }

        });


    </script>


</head>
<body>

<div class="wwrap">

    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
    
   <div class="content" style="min-height: 1100px;">
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
                    <span class="menuText"><a class="menuText"
                                              href="abilitymain.do"><u><b>재능 기부 승인</b></u></a></span><br><br>
                    <span class="menuText"><a class="menuText" href="reportMain.do?change=no">신고 내역 확인</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="userManage.do">회원 목록 확인</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="adminpointout.do">관리자 출금 관리</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="donatelist.do">기부처 관리</a></span><br><br>
                </div>
            </div>


            <div class="col-9">
                <div id="titleName"><h1>재능승인 글 관리</h1></div>

                <div id="selectBar">
                    <select id="selectOption">
                        <option value="" selected >진행 상태</option>
                        <option value="applySubmit">승인 완료</option>
                        <option value="applyNega">승인 거절</option>
                        <option value="applyWait">승인 대기</option>
                    </select>
                </div>
                <div class="tableDiv">
                    <table border="1" align="center" class="table">

                        <colgroup>
                            <col width="50"/>
                            <col width="250"/>
                            <col width="70"/>
                            <col width="100"/>
                            <col width="80"/>
                        </colgroup>

                        <tr id="titleTr">
                            <th>NO</th>
                            <th>제목</th>
                            <th>신청자</th>
                            <th>상태</th>
                            <th>신청일</th>
                        </tr>

                        <c:choose>
                            <c:when test="${empty abList}">
                                <tr>
                                    <td colspan="5">등록된 게시물이 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${abList}" var="abList">
                                    <tr class="abListTr">
                                        <td height="50">${abList.abNo}</td>
                                        <td><a class="menuText"
                                               href="abilitydetail.do?abNo=${abList.abNo}">${abList.abTitle}</a></td>
                                        <td>${abList.usName}</td>
                                        <td id="abStatus">${abList.abStatus}</td>
                                        <td><fmt:formatDate value="${abList.abDate}" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                    <div id="tabl1"></div>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>

                    </table>
                </div>
                <br><br>

                <div id="pagingArea" class="pagingDiv">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${pageMaker.prev}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageMaker.makeQuery(pageMaker.startPage - 1)}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                <li class="page-item"><a class="page-link pagenumber${idx}"
                                                         href="abilitymain.do${pageMaker.makeQuery(idx)}">${idx}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li class="page-item">
                                    <a class="page-link pagenext"
                                       href="abilitymain.do${pageMaker.makeQuery(pageMaker.endPage + 1)}"
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
    <br><br>

    <!-- footer 영역-->
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>


</body>
</html>