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
    <link rel="stylesheet" href="<c:url value="/resources/css/userManage.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
            $('.userstop').click(function () {
                var no = $(this).attr('id');

                $.ajax({
                    type: "post",
                    url: "userstop.do?usNo=" + no,
                    dataType: "json",
                    success: function () {
                        alert("정지 완료");
                        location.reload();
                    }
                })
            });
            $('.userstopcancle').click(function () {
                var no = $(this).attr('id');

                $.ajax({
                    type: "post",
                    url: "userstopcancle.do?usNo=" + no,
                    dataType: "json",
                    success: function () {
                        alert("해지 완료");
                        location.reload();
                    }
                })
            });
        });
    </script>

</head>
<body>

<div class="wwrap">
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
                    <span class="menuText"><a class="menuText"
                                              href="reportMain.do?change=no">신고 내역 확인</a></span><br><br>
                    <span class="menuText"><a class="menuText"
                                              href="userManage.do"><u><b>회원 목록 확인</b></u></a></span><br><br>
                    <span class="menuText"><a class="menuText" href="adminpointout.do">관리자 출금 관리</a></span><br><br>
                    <span class="menuText"><a class="menuText" href="donatelist.do">기부처 관리</a></span><br><br>
                </div>
            </div>
            <div class="col-9">
                <div id="titleName"><h3>회원정보</h3></div>

                <div id="search">
                    <form id="searchId" action="searchId.do" method="post">
                        <input type="text" name="usId" id="searchInput" placeholder="ID검색">
                        <input type="submit" id="searchIdSubmit" class="btn btn-sm btn-outline-primary" value="검색">
                    </form>
                </div>

                <div id="tableArea" style="border: 1px solid black;">
                    <table id="table">
                        <thead>
                        <tr class="table-secondary">
                            <th class="theadclass">No.</th>
                            <th class="theadclass">ID</th>
                            <th class="theadclass">NAME</th>
                            <th class="theadclass">PHONE</th>
                            <th class="theadclass">E-mail</th>
                            <th class="theadclass">TALENT</th>
                            <th class="theadclass">LOGIN</th>
                            <th id="lastTh"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty userList}">
                                <tr>
                                    <td colspan="5">등록된 유저가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${userList}" var="userList">
                                    <tr>
                                        <td>${userList.usNo}</td>
                                        <td>${userList.usId}</td>
                                        <td>${userList.usName}</td>
                                        <td>${userList.usPhone}</td>
                                        <td>${userList.usEmail}</td>
                                        <td>${userList.usTalent}</td>
                                        <td>${userList.usStatus}</td>
                                        <script>console.log('${userList.usStatus}')</script>
                                        <c:if test="${userList.usStatus eq 'N'}">
                                            <td>
                                                <button class="btn btn-secondary btn-sm userstopcancle"
                                                        id="${userList.usNo}">해지
                                                </button>
                                            </td>
                                        </c:if>
                                        <c:if test="${userList.usStatus eq 'Y'}">
                                            <td>
                                                <button class="btn btn-secondary btn-sm userstop"
                                                        id="${userList.usNo}">정지
                                                </button>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>

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
                                                         href="userManage.do${pageMaker.makeQuery(idx)}">${idx}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li class="page-item">
                                    <a class="page-link pagenext"
                                       href="userManage.do${pageMaker.makeQuery(pageMaker.endPage + 1)}"
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
    <br> <br> <br><br> <br> <br>
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>
</body>
</html>