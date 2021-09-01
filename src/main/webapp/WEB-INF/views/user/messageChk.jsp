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

    <!--messageChk.css-->
    <!--css 가져오는 방법-->
    <link rel="stylesheet" href="<c:url value="/resources/css/messageChk.css"/>">

    <!--messageChk.js-->
    <script src="<c:url value="/resources/js/messageChk.js"/>"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(function () {
            <c:choose>
            <c:when test="${empty mesList}">

            </c:when>
            <c:otherwise>
            <c:forEach var="mesList" items="${mesList}">
            var a = '${mesList.mesContents}';
            if (a.length > 10) {
                a = a.substring(0, 15);
                console.log(a.substring(0, 8));
                a += "  ...";
                $('.mescontents${mesList.mesNo}').text(a);
            } else {
                $('.mescontents${mesList.mesNo}').text(a);
            }
            </c:forEach>
            </c:otherwise>
            </c:choose>
            $('#msgContent').hide();
        });

        function msgChk(a) {
            $('#msgContent').show();
            var no = $(a).attr('class');
            var td = $(a).children('td').attr('class');
            console.log(td);
            var contents = $(a).children('.' + no + 'contents').val();
            var name = $(a).children('.' + no + 'name').val();
            var date = $(a).children('.' + no + 'date').val();

            // $('.resendbtn').removeAttribute('id');
            $('.resendbtn').attr('id', no);
            $('.delbtn').attr('id', no);

            // console.log($('.resendbtn').attr('id'));

            $.ajax({
                type:"post",
                url:"StatusUpdate.do?mesNo="+no,
                dataType:"json",
                success: function (data) {
                    $(a).children('td').attr('class', 'statusY mescontents' + no);
                }
            })

            $('#sendName').text(name);
            $('#msgContents').text(contents);
            $('#sendDate').text(date);
        }

        function mesPopup(a) {
            // console.log();
            var no = $(a).attr('id');
            console.log(no);
            if (no == "" || no==null) {
                alert("쪽지를 선택하셔야 합니다.");
                return;
            }
            var option ="width=800, height =1000, top =100, left =200,location=no";
            window.open("popupResend.do?mesNo="+no,"",option)
        }

        function mesDel(a) {
            var no = $(a).attr('id');
            console.log(no);
            if (no == "" || no==null) {
                alert("쪽지를 선택하셔야 합니다.");
                return;
            }
            if (confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type:"post",
                    url:"delMessage.do?mesNo="+no,
                    dataType:"json",
                    success: function (data) {
                        alert("삭제 완료");
                        location.reload();
                    }
                })
            }
        }

    </script>

</head>
<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="true"/>
    </header>

    <div class="container">
        <div class="row" id="msgList">
            <div class="col-4" id="msgContent2">
                <div id="msgChkHead">
                    <b>쪽지목록</b>
                </div>
                <table border="1" id="msgListTable">


                    <colgroup>
                        <col width="30%">
                        <col width="70%">


                    </colgroup>
                    <c:choose>
                        <c:when test="${empty mesList}">
                            <tr>
                                <td colspan="2">쪽지가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${mesList}" var="mesList">
                                <tr class="${mesList.mesNo}" onclick="msgChk(this)">
                                    <th class="msgListTh">보낸이</th>
                                    <td>${mesList.usSendId}</td>
                                </tr>
                                <tr class="${mesList.mesNo}" onclick="msgChk(this)">
                                    <th class="msgListTh">쪽지 내용</th>
                                    <td class="status${mesList.mesStatus} mescontents${mesList.mesNo}">
                                    </td>
                                    <input type="hidden" value="${mesList.mesContents}"
                                           class="${mesList.mesNo}contents"/>
                                    <input type="hidden" value="${mesList.usSendId}" class="${mesList.mesNo}name"/>
                                    <input type="hidden" value="${mesList.mesDateSt}" class="${mesList.mesNo}date"/>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <br><br>
                <div id="pagingArea" class="pagingDiv" style="width: 312px; margin: 0 auto">
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
                                                         href="messagechk.do${pageMaker.makeQuery(idx)}&usNo=${user.usNo}">${idx}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li class="page-item">
                                    <a class="page-link pagenext"
                                       href="messagechk.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&usNo=${user.usNo}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-8" id="msgContent">
                <div class="msgContent2">
                    <b>보낸이 : </b>
                    <p id="sendName"></p>
                    <b>받은시간 : </b>
                    <p id="sendDate">0000-00-00 [00:00]</p>
                </div>
                <hr>
                <div class="msgContent">
                    <div><b>쪽지내용</b></div>
                    <p id="msgContents">
                    </p>
                </div>
            </div>
            <div class="msgButton">
                <br>
                <button class="btn btn-outline-primary btn-lg resendbtn" id="" onclick="mesPopup(this);">답장</button>
                <button class="btn btn-outline-primary btn-lg delbtn" style="margin-left: 50px" id="" onclick="mesDel(this)">삭제</button>
            </div>
        </div>

    </div>

</div>

<!-- footer 영역-->
<%--    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;">임시 footer 영역입니다.</div>--%>
<footer>
    <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="true"/>
</footer>
</div>
</body>
</html>