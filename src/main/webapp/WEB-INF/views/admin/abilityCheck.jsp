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

    <!-- 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">


    <!-- css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/abilityCheck.css"/>">
    <script src="<c:url value="/resources/js/abilityCheck.js"/>"></script>

    <script>
        $(function () {

            $('#applyBtn').click(function () {
                $("#refuseContent").val($("#refuseContent").val().replace(/(?:\r\n|\r|\n)/g, '<br />'));

                $("#abilitynego").submit();

            });


            var abstatus = '${dto.abStatus}';
            if (abstatus == "승인 대기") {
                $('.btna').show();
            } else {
                $('.btna').hide();
            }


            $('#appBtn').click(function () {
                var usNo = {
                    "usNo": '${dto.usNo}',
                    "abNo": '${dto.abNo}',
                    "usTalent": '${dto.abCate}'
                };

                console.log(usNo);


                if (confirm("승인 하시겠습니까?")) {
                    $.ajax({
                        type: "post",
                        url: "ajaxapprove.do",
                        data: JSON.stringify(usNo),
                        contentType: "application/json",
                        dataType: "json",
                        success: function (result) {
                            if (result.check == true) {
                                alert("승인하였습니다.");
                                location.href = 'abilitymain.do';
                            }
                        },
                        error: function (request, status, error) {
                            alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                        }
                    })
                }
            });


            var cate = '${dto.abCate}';

            if (cate == "design") {
                $('#abCate').text("디자인");
            } else if (cate == "translation") {
                $('#abCate').text("번역/외국어");
            } else if (cate == "document") {
                $('#abCate').text("문서작성");
            } else if (cate == "music") {
                $('#abCate').text("음악/영상");
            } else if (cate == "biz") {
                $('#abCate').text("마케팅/비즈니스");
            } else if (cate == "life") {
                $('#abCate').text("생활서비스");
            }


        });


    </script>

</head>
<body>

<div class="wwrap">

    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
   
   <div class="content" style="min-height: 1500px;">
    <div class="container">
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
                <div id="titleName"><h1>당신의 재능을 보여주세요</h1><br></div>
                <br><br>
                <div id="divBox">

                    <!-- 신청자 정보 -->
                    <h4>사용자정보</h4>
                    <div id="tableArea">
                        <table id="table" border="1">
                            <thead>
                            <tr class="table-secondary">
                                <th>신청자 ID</th>
                                <th>신청자</th>
                                <th>전화번호</th>
                                <th>E-mail</th>
                                <th>신청재능명</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${dto.usId}</td>
                                <td>${dto.usName}</td>
                                <td>${dto.usPhone}</td>
                                <td>${dto.usEmail}</td>
                                <td id="abCate"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <hr>

                    <!-- 글 제목 -->
                    <h3><input type="text" value="${dto.abTitle}" readonly="readonly" disabled></h3><br><br>


                    <!-- 글 내용 -->
                    <div id="textarea">
                        ${dto.abContent}
                    </div>
                    <%--<textarea readonly="readonly" disabled id="textarea">
                    </textarea>--%>

                    <input type="button" value="거절" onclick="refuseForm();" class="btn btn-outline-primary btna">
                    <input type="button" value="승인" id="appBtn" class="btn btn-outline-primary btna">
                    <input type="button" value="보류" onclick="history.back();" class="btn btn-outline-primary btna">

                </div>
                <input type="text" value="첨부서류1" id="fileName1">
                <div id="fileBox1">
                    <img src="${dto.abImg1}" alt=""/>
                </div>

                <input type="text" value="첨부서류2" id="fileName2">
                <div id="fileBox2">
                    <img src="${dto.abImg2}" alt=""/>
                </div>

            </div>
        </div>
    </div>
    <br><br><br>
    
    <!--거절사유-->
    <div id="refuse">
        <form action="abilitynega.do" method="post" id="abilitynego">
            <h2>거절사유</h2><br>

            <textarea rows="10" name="mesContents" id="refuseContent"></textarea><br>
            <input type="hidden" value="${dto.usNo}" name="usNo">
            <input type="hidden" value="${dto.abNo}" name="abNo">
            <input type="hidden" value="${user.usId}" name="usSendId">


            <input type="button" value="취소" onclick="closeWin();" id="cancelBtn" class="btn btn-outline-primary">
            <input type="button" value="확인" id="applyBtn" class="btn btn-outline-primary">


        </form>

    </div>
  </div>
    <br><br><br><br><br><br>
    
    <!-- footer 영역-->
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>