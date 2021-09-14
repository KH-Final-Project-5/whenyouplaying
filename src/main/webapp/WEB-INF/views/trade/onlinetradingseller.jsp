<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>title</title>
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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">


    <link rel="stylesheet" href="<c:url value="/resources/css/onlinetradingseller.css"/>">

    <script src="<c:url value="/resources/js/tradingseller.js"/>"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        writer = '${user.usId}';
        dealNo = '${dto.dealNo}';
        buyer = '${dto.usId}';
        var sel_files = [];
        $(function () {
            $("#uploadBtn2").val("");
            $('#uploadBtn2').on("change", handleImgsFilesSelect);
        });

        function handleImgsFilesSelect(e) {
            $("#fileForm").html("");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            /*if (files.length > 6) {
                alert("이미지업로드는 6장까지 가능합니다.");
                return;
            }
            if ($('.figure').length + files.length > 6) {
                alert("이미지업로드는 6장까지 가능합니다.");
                return;
            }*/

            filesArr.forEach(function (f, index, arr2) {
                if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
                sel_files.push(f);

                var reader = new FileReader();
                reader.onload = function (e) {
                    var img_html = '<figure class="figure"><img style="width: 180px; height: 180px;" name="' + index + '" src="' + e.target.result + '" class="figure-img img-fluid' +
                        ' rounded tradingImg" alt=".." /> <figcaption class="figure-caption"><input type="text" class="imgName" name="imgContent" placeholder="설명을 입력해주세요">' +
                        '</figcaption></figure>';
                    $("#fileForm").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }

        function backSite() {
            location.href = 'selllist.do?usNo=${user.usNo}&finStatus=거래취소';
        }

        function delSellImg(a) {
            var dealImgNo = $(a).attr('id');

            location.href = 'deletesellimg.do?dealImgNo=' + dealImgNo + "&dealNo=" +${dto.dealNo};
        }
    </script>
</head>

<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
    <!--채팅 출처-->
    <!--https://dororongju.tistory.com/151-->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <label id="tradingLabel">거래 진행 중</label><br>
                <label id="backLabel" onclick=backSite()>재능 판매 내역(돌아가기)</label> <br>
                <hr class="hrClass1">
                <br>
            </div>
        </div>
        <div class="row">
            <div class="col-3 chatting">
                <div class="chat_wrap">
                    <div class="chatHeader">
                        CHAT
                    </div>
                    <div class="chat">
                        <ul id="chatul">
                            ${chat}
                        </ul>
                    </div>
                    <div class="input-div" style="width: 100%">
                        <textarea id="chatArea" placeholder="Press Enter for send message."></textarea>
                    </div>
                    <!-- format -->

                    <div class="chat format">
                        <ul>
                            <li>
                                <div class="sender">
                                    <span></span>
                                </div>
                                <div class="message">
                                    <span></span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="col-6">
                <form action="onlineSellerImgUpload.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="${dto.dealNo}" name="dealNo">
                    <input type="hidden" value="${dto.prNo}" name="prNo">
                    <input type="hidden" value="${dto.usSellNo}" name="usSellNo">
                    <input type="hidden" value="${dto.usBuyNo}" name="usBuyNo">
                    <input type="button" class="btn btn-outline-dark" id="faceChatBtn" value="화상 채팅"
                           onclick="location.href='videochat.do?dealNo=${dto.dealNo}';">
                    <label class="btn btn-outline-dark" id="uploadBtn" style="margin-top: 10px">
                        파일추가 <input type="file" id="uploadBtn2" name="files" value="업로드" accept="image/*" multiple
                                    style="display: none">
                    </label>
                    <input type="submit" class="btn btn-outline-dark" id="contentBtn" value="설명 및 사진 업로드">
                    <br>
                    <br>
                    <c:choose>
                        <c:when test="${empty list}">
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list}" var="list">
                                <figure class="figure">
                                    <button class="btn btn-danger" style="position: absolute; margin-left: -20px;"
                                            type="button" id="${list.dealImgNo}" onclick="delSellImg(this)">X
                                    </button>
                                    <img src="${list.dealImgSrc}" style="width: 180px; height: 180px;"
                                         class="figure-img img-fluid rounded tradingImg" alt="...">
                                    <figcaption class="figure-caption"><input type="text" disabled class="imgName"
                                                                              value="${list.dealImgContent}">
                                    </figcaption>
                                </figure>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <div id="fileForm" style="display: inline-block">
                    </div>
                </form>
            </div>

            <div class="col-3 tradeAllDiv">
                <div class="tradeDiv">
                    <table id="tradeTable">
                        <colgroup>
                            <col width="130px">
                            <col width="140px">
                        </colgroup>
                        <tr>
                            <th colspan="2" class="tradeAddrTd tradeBuyerInfo">구매자 정보</th>
                        </tr>
                        <tr>
                            <td class="tradeAddrTd tradeBold">이름</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tradeAddrTd tradeContent">
                                ${dto.usName}
                            </td>
                        </tr>
                        <tr>
                            <td class="tradeAddrTd tradeBold">번호</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tradeAddrTd tradeContent">
                                ${dto.usPhone}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tradeAddrTd tradeBold">주소</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tradeAddrTd tradeContent">
                                ${dto.usAddress1} / <br> ${dto.usAddress2}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tradeAddrTd tradeBold">
                                받을 포인트
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tradeAddrTd tradeContent">
                                ${dto.prPrice}
                            </td>
                        </tr>
                    </table>
                    <br>
                    <form action="onlinesellcomplete.do" method="post">
                        <input type="hidden" name="dealNo" value="${dto.dealNo}">
                        <input type="hidden" name="dealPrice" value="${dto.dealPrice}">
                        <input type="hidden" name="usNo" value="${user.usNo}">
                        <button type="submit" class="btn btn-outline-primary" id="sellCompBtn">기부 완료</button>
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