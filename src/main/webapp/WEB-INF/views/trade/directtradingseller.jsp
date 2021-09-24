<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>title</title>
</head>
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


<link rel="stylesheet" href="<c:url value="/resources/css/directtradingseller.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/js/directtradingseller.js"/>"></script>

<script>
    writer = '${user.usId}';
    dealNo = '${dto.dealNo}';
    buyer = '${dto.usId}';
</script>


<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
<!--채팅 출처-->
<!--https://dororongju.tistory.com/151-->

<div class="content" style="min-height: 1700px;">
	<div class="container" style="margin-top: 60px; margin-bottom: 60px;">
    <div class="row">
        <div class="col-12">
            <label id="tradingLabel">거래 진행 중</label><br>
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

            </div>

        </div>

        <div class="col-6">
            <form id="sellerForm" action="" method="post" style="height: 350px">
                <input type="hidden" value="${dto.dealNo}" name="dealNo">
                <input type="hidden" value="${dto.prNo}" name="prNo">
                <input type="hidden" value="${dto.usSellNo}" name="usSellNo">
                <input type="hidden" value="${dto.usBuyNo}" name="usBuyNo">
                <input type="button" class="btn btn-outline-dark" id="faceChatBtn" value="화상 채팅">
                
                <br>
                <br>
                
                <div id="map" style="width:100%;height:150%;"></div>

                <script type="text/javascript"
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36484ecb4bc45702e85b48b3ddeabe57"></script>
                <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(${dto.prLatitude}, ${dto.prLongitude}), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption);
                    map.setDraggable(false);

                    // 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
                    function setDraggable() {
                        // 마우스 드래그로 지도 이동 가능여부를 설정합니다
                        map.setDraggable(false);
                    }
                    
                 	// 마커가 표시될 위치입니다 
                    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });

                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map);
                </script>
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
                    <form action="directsellcomplete.do" method="post">
                        <input type="hidden" name="dealNo" value="${dto.dealNo}">
                        <input type="hidden" name="dealPrice" value="${dto.dealPrice}">
                        <input type="hidden" name="usNo" value="${user.usNo}">
                        <button type="submit" class="btn btn-outline-primary" id="sellCompBtn">기부 완료</button>
                    </form>
                    
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