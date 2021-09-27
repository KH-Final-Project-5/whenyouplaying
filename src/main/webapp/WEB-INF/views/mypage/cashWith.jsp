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
    <link rel="stylesheet" href="<c:url value="/resources/css/cashWith.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">


    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="resources/ajax-cross-origin/js/jquery.ajax-cross-origin.min.js"></script>

    <script type="text/javascript">


        $(function () {


            $("#submitButton").click(function () {

                var selectBank = $("#bankSelect").val();
                var point = $("#pointInput").val();
                var havePoint = "${user.usCash}";

                var chkCash = havePoint - point;

                var usNo = "${user.usNo}";

                if (selectBank == null || point == "" || point == null) {
                    alert("계좌/금액를 선택해주세요");
                } else if (chkCash < 0) {
                    alert("잔액이 부족합니다.");
                } else {
                    var bankInfo = null;

                    //첫번재 ajax
                    function promise_function() {
                        return new Promise(function (resolve, reject) {
                            $.ajax({
                                url: "getaccount.do",
                                type: "post",
                                data: {
                                    "baNo": selectBank
                                },
                                success: function (result) {
                                    bankInfo = result;
                                    resolve();
                                }
                            });
                        });
                    }

                    //두번째 ajax
                    function secondAjax() {
                        return new Promise(function (resolve, reject) {
                            console.log("두번째 ajax실행");

                            $.ajax({
                                url: "https://testapi.openbanking.or.kr/oauth/2.0/token",
                                type: "post",
                                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                                dataType: "json",
                                data: {
                                    client_id: "b16b6e96-be84-4b16-bbde-4a9ffe23c677",
                                    client_secret: "6fcd2c91-14fd-48aa-aca3-bf9150983320",
                                    scope: "oob",
                                    grant_type: "client_credentials"
                                },
                                success: function (result) {
                                    console.log(result);
                                    var authToken = result.access_token;
                                    resolve(authToken);
                                }
                            });
                        });
                    }

                    //3번째 ajax
                    function thirdAjax(authToken) {
                        return new Promise(function (resolve, reject) {
                            console.log("세번째 ajax실행");
                            console.log(authToken);

                            var math = Math.floor(Math.random() * 900000000) + 1;

                            var jsonData = {
                                "cntr_account_type": "N",
                                "cntr_account_num": "56791037318807",
                                "wd_pass_phrase": "NONE",
                                "wd_print_content": "포인트출금",
                                "name_check_option": "on",
                                "tran_dtime": "20210915101921",
                                "req_cnt": "1",
                                "req_list": [
                                    {
                                        "tran_no": "1",
                                        "bank_tran_id": "M202113208U" + math,
                                        "bank_code_std": bankInfo.baBankCode,
                                        "account_num": bankInfo.baBankNumber,
                                        "account_holder_name": bankInfo.baOwner,
                                        "print_content": "포인트출금",
                                        "tran_amt": point,
                                        "req_client_name": bankInfo.baOwner,

                                        "req_client_bank_code": bankInfo.baBankCode,
                                        "req_client_account_num": bankInfo.baBankNumber,
                                        "req_client_num": "HONGGILDONG1234",
                                        "transfer_purpose": "TR"
                                    }
                                ]
                            };

                            $.ajax({
                                url: "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/acnt_num",
                                type: "post",
                                contentType: "application/json; charset=UTF-8",
                                headers: {'Authorization': 'Bearer ' + authToken},
                                dataType: "json",
                                data: JSON.stringify(jsonData),
                                success: function (result) {
                                    console.log(result);
                                    alert(bankInfo.baBankNumber + "(" + bankInfo.baNickName + ") 계좌로 " + point + "원 정산되었습니다.");
                                    resolve();
                                }
                            });
                        });

                    }


                    function firthAjax() {
                        return new Promise(function (resolve, reject) {
                            console.log("4번재 ajax");

                            $.ajax({
                                url: "adjustpoint.do",
                                type: "post",
                                data: {
                                    "usNo": usNo,
                                    "usCash": chkCash
                                },
                                success: function (result) {
                                    if (result > 0) {
                                        console.log("업데이트 성공");

                                    } else {
                                        console.log("업데이트 실패");
                                    }

                                    resolve();
                                }
                            });
                        });
                    }
                    
                    function fifthAjax() {
                    	return new Promise(function (resolve, reject) {
                    		
                    		console.log("5번째 ajax");
                    		
                    		$.ajax({
                    			url: "insertwithdraw.do",
                    			type: "post",
                    			data: {
                    				"usNo" : usNo,
                    				"wiCash" : point,
                    				"wiBank" : selectBank
                    			},
                    			success: function (result) {
                    				if (result > 0) {
                    					console.log("테이블 생성");
                    				} else {
                    					console.log("테이블 생성 실패");
                    				}

                    				resolve();
                    			}
                    		});
                    	});
                    	
                    }


                    function successFunction() {
                        window.location.reload();
                        return false;
                    }

                    function errorFunction() {
                        alert('에러');
                        return false;
                    }

                    promise_function()
                        .then(secondAjax)
                        .then(thirdAjax)
                        .then(firthAjax)
                        .then(fifthAjax)
                        .then(successFunction)
                        .catch(errorFunction);

                }

            });
        });


    </script>


</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

   <div class="content" style="min-height: 1300px;">
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
                <div id="pageName"><b>My Page</b></div>

                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="colorA" href="noticemainuser.do">공지사항</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="useredit.do">회원정보</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="buylist.do?usNo=${user.usNo }&finStatus=1s">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="selllist.do?usNo=${user.usNo }&finStatus=거래취소">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="cashrecord.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="manageaccount.do?usNo=${user.usNo }">계좌 관리</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="pointdeposituser.do?usNo=${user.usNo }"><b><u>포인트 출금</u></b></a></span><br><br>
                    <span class="menuText"><a class="colorA"
                                              href="withdrawhistory.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">포인트 출금내역</a></span><br><br>
                    <span class="menuText"><a class="colorA" href="closeaccountform.do">회원 탈퇴</a></span><br><br>
                </div>
            </div>
            <div class="col-9">
                <div id="titleName"><h3>포인트 출금</h3></div>


                <div id="cashHave" class="shadow">
                    <div id="cashHaveContentArea">
                        <div id="cashTitle">
                            보유중인 캐시
                        </div>
                        <div id="cashContent">
                            ${user.usCash }원
                        </div>
                    </div>
                </div>
                <div id="contentTitle2">
                    <b>계좌선택</b>
                </div>
                <hr id="line2" class="line">

                <div id="pointInputArea">
                    정산 금액
                    <input id="pointInput" type="text" placeholder="정산금액을 입력해주세요">
                </div>


                <div id="selectAccount">
                    계좌선택
                    <div id="selectContent">
                        <style>
                            select:invalid {
                                color: gray;
                            }
                        </style>

                        <select id="bankSelect" name="baNo" class="accountInput" required>
                            <option value="" disabled selected>선택해주세요</option>
                            <c:choose>
                                <c:when test="${empty accountList }">
                                    <option value="">등록된 계좌가 없습니다.</option>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${accountList }" var="dto">
                                        <option value="${dto.baNo }">${dto.baNickName }(${dto.baBankNumber })</option>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </select>
                        <hr style="margin: 3px;">
                    </div>


                    <input id="submitButton" type="button" value="정산하기" class="btn btn-sm btn-primary">


                </div>
				<br><br><br><br>
                <div id="noticeArea">
       				안녕하세요. 놀면뭐하니입니다. <br><br>

					1. 포인트 충전신청은 24시간 가능합니다. <br><br>
					
					1. 포인트 충전 신청 후 환불 요청은 대표번호로 연락주시길 바랍니다., 가급적 포인트 신청 후 (당일) 이내에 연락주시면 감사하겠습니다. <br><br>
					
					   포인트 충전신청일 기준, 입금 확인 건에 한해서만 [환불] 업무를 지원해드립니다. <br><br>
					
					  (업무시간에만 환불업무 가능 : 09:00~15:00) <br><br>
					
					※ 15시 이후 포인트충전를 완료한 회원사의 경우 명일 오전에 [환불] 업무가 지원되오니, 서비스 이용에 착오없으시길 바랍니다. <br><br>
       
       
                </div>

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