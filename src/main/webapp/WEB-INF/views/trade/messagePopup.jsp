<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.dto.UserDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

    <script>
        $(function () {
            $('#msg-submit').click(function () {

                var form1 = $('#mesForm').serialize();



                console.log(form1);

                $.ajax({
                    type: "post",
                    url: "messageSend.do",
                    data: form1,
                    dataType: 'json',
                    success: function (data) {
                        alert("쪽지 전송 완료");
                        window.close();
                    },
                    error: function (request, status, error) {

                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
        });
    </script>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form action="" id="mesForm">
                <input type="hidden" value="${user.usNo}" name="usSendNo">
                <input type="hidden" value="${popupDto.usNo}" name="usNo">
                <input type="hidden" value="${popupDto.prNo}" name="prNo">
                <table>
                    <tr>
                        <th>보내는이 :</th>
                        <td><input type="text" value="${user.usId}" class="msgPop-input"
                                   readonly="readonly">
                        </td>
                    </tr>

                    <tr>
                        <th>받는이 :</th>
                        <td><input type="text" value="${popupDto.usId}" readonly class="msgPop-input"></td>
                    </tr>

                    <tr>
                        <th>메시지:</th>
                        <td><textarea cols="40" rows="20" name="mesContents" class="text-area"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input class="btn btn-outline-primary btn-sm msg-button" id="msg-submit" type="button"
                                   value="보내기">
                            <button class="btn btn-outline-primary btn-sm msg-button" onclick="window.close()"
                                    id="msg-button">
                                취소
                            </button>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>