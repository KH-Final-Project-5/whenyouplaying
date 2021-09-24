<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>title</title>
</head>
<!-- bootstrap css -->
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous">

<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">


<link href="<c:url value="/resources/css/onlinetrade.css"/>"
      rel="stylesheet">
<script src="<c:url value="/resources/js/onlinetrade.js"/>"></script>
<script>

    let buyer = '${user.usId}';
    let seller = '${dto.usId}';


    function paySubmit() {
        var pay = '${result1}';
        // console.log($('#orderCheckBox').is(":checked"));
        var payForm = $('#payForm');
        if ($('#orderCheckBox').is(":checked") === true) {
            if (pay > 0) {
                if (confirm("결제하시겠습니까?")) {
                    let msg = {'buyer': buyer, 'seller': seller};
                    if (isStomp) {
                        socket.send('/MES', {}, JSON.stringify(msg));
                    } else {
                        socket.send(msg);
                    }

                    $.ajax({
                        url: "smsSend2.do",
                        data: {receiver: $("#phone").val(), usId: $("#buyId").val()},
                        type: "post",
                        success: function () {
                            alert("문자발송 완료");
                        }, error: function (request, status, error) {
                            alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                        }
                    });

                    payForm.submit();
                }
            } else {
                alert("보유 포인트가 부족합니다.");
                return false;
            }
        } else {
            alert("주문 확인을 체크해주세요.");
        }
    }
</script>
<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
    
   <div class="content" style="min-height: 1700px;">
    <div class="container" style="margin-top: 60px; margin-bottom: 60px;">
        <div class="row">
            <div class="col-12" style="margin-top: 50px">
                <label id="payMentLabel">결제하기</label>
            </div>
        </div>
        <form action="onlinetrade.do" method="post" id="payForm">
            <input type="hidden" name="usBuyNo" value="${user.usNo}"> <input
                type="hidden" name="usSellNo" value="${dto.usNo}"> <input
                type="hidden" name="prNo" value="${dto.prNo}"> <input
                type="hidden" name="dealPrice" value="${dto.prPrice}">

            <div class="orderContainsDiv row">
                <div class="col-8">
                    <div id="marginDiv">
                        <label id="orderLabel">주문 내역</label>
                        <hr class="hrClass1">
                        <img id="orderImg" src="${dto.prImage }"> <label
                            id="titleLabel"><a id="titleA"
                                               href="Detail.do?prNo=${dto.prNo }">${dto.prTitle }</a> </label> <label
                            id="nameLabel">${dto.usName }</label>
                    </div>
                    <br> <label id="priceLabel">가격 : (${dto.prPrice })Point</label><br>
                    <br>
                    <div class="myContentsDiv">
                        <label id="myImformLabel">내 정보</label>
                        <hr class="hrClass1">
                        <div class="labelDiv">
                            <table id="myInformTable">
                                <colgroup>
                                    <col width="120px">
                                </colgroup>
                                <tr>
                                    <td class="nameClass">이름&nbsp;&nbsp;&nbsp;</td>
                                    <td>${user.usName }</td>
                                </tr>
                                <tr>
                                    <td class="nameClass">전화번호&nbsp;&nbsp;&nbsp;</td>
                                    <td>${user.usPhone }</td>
                                </tr>
                                <tr>
                                    <td class="nameClass">주소&nbsp;&nbsp;&nbsp;</td>
                                    <td>${user.usAddress1 }&nbsp;${user.usAddress2 }</td>
                                </tr>
                            </table>
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="col-3 orderdiv">
                    <div class="labelDiv">
                        <table id="orderTable">
                            <colgroup>
                                <col width="130px">
                                <col width="140px">
                            </colgroup>
                            <tr>
                                <td class="nameClass">보유 포인트</td>
                                <td>${user.usCash }Point</td>
                            </tr>
                            <tr>
                                <td class="nameClass">가격</td>
                                <td>${dto.prPrice }Point</td>
                            </tr>
                            <tr>
                                <td class="nameClass">결제 후 포인트</td>
                                <c:if test="${result1 < 0}">
                                    <td>보유 포인트가<br>부족합니다.
                                    </td>
                                </c:if>
                                <c:if test="${result1 > 0}">
                                    <td>${result1}Point</td>
                                </c:if>
                            </tr>
                        </table>
                    </div>
                    <hr>
                    <br> <label id="orderCheckLabel"> <input
                        type="checkbox" name="orderCheckBox" id="orderCheckBox">&nbsp;&nbsp;주문
                    확인(필수)
                </label><br>
                    <br> <input type="hidden" name="buyId" id="buyId"
                                value="${user.usId }"> <input type="hidden" name="phone"
                                                              id="phone" value="${dto.usPhone }"> <input type="button"
                                                                                                         class="btn btn-outline-primary"
                                                                                                         id="payBtn"
                                                                                                         value="결제하기"
                                                                                                         onclick="paySubmit();">
                </div>
            </div>
        </form>

    </div>
   </div> 
    
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>