<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dto.UserDto" %>

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
    <!--css 가져오는 방법-->
    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

    <!-- jquery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <%--주소 찾기--%>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <%--카카오맵--%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ab159e5abb2442cfed56949c9439ba9&libraries=services"></script>

    <script src="<c:url value="/resources/js/messagePopup.js"/>"></script>
    <!-- <script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script> -->
   
    <script type="text/javascript" src="<c:url value="/resources/smarteditor2/js/service/HuskyEZCreator.js"/>" charset="utf-8"></script>


    <script>
        function checkNumber(event, type) {
            if (type == 'numbers') {
                if (event.keyCode < 48 || event.keyCode > 57) return false;
            }
        }

        function fn_press_han(obj) {
            obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        }

        $(function () {
            var oEditors = [];
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "prContent",
                sSkinURI: "/resources/smarteditor2/SmartEditor2Skin.html",
                fCreator: "createSEditor2",
                htParams: {
                    bUseToolbar: true,
                    bUseVerticalResizer: false,
                    bUseModeChanger: true
                },
            });

            $("#completeBtn").click(function () {
                oEditors.getById["prContent"].exec("UPDATE_CONTENTS_FIELD", []);

                $("#projectForm").submit();
            });

        });
    </script>

    <script>
        $(document).on("change", ".file-input", function () {

            $filename = $(this).val();

            if ($filename == "")
                $filename = "파일을 선택해주세요.";

            $(".filename").text($filename);

        });
        // $prlatitude = $('#prLatitude');
        // $prlongitude = $("#prLongitude");
        let addr = null;
        let longitude = null;
        let latitude = null;
        $(function () {
            /*$('#map_tr').hide();
            $('#prLati').hide();
            $('#prLongi').hide();
            $('#addrBtn').hide();*/
            $("#selectTrade").change(function () {
                var result = $('#selectTrade option:selected').val();

                if (result == 'online') {
                    $('#map_tr').hide();
                    $('#prLati').hide();
                    $('#prLongi').hide();
                    $('#addrBtn').hide();
                } else if (result == 'direct') {
                    $('#map_tr').show();
                    $('#prLati').show();
                    $('#prLongi').show();
                    $('#addrBtn').show();
                }
            });

            var user = "<%=session.getAttribute("user")%>";
            var userTalent = '${user.usTalent}';
            $('#addrBtn').hide();

            if (userTalent == "design") {
                $('#usTalent').text("디자인");
            } else if (userTalent == "translation") {
                $('#usTalent').text("번역/외국어");
            } else if (userTalent == "document") {
                $('#usTalent').text("문서작성");
            } else if (userTalent == "music") {
                $('#usTalent').text("음악/영상");
            } else if (userTalent == "biz") {
                $('#usTalent').text("마케팅/비즈니스");
            } else if (userTalent == "life") {
                $('#usTalent').text("생활서비스");
            }

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            function searchAddrFromCoords(coords, callback) {
                // 좌표로 행정동 주소 정보를 요청합니다
                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
            }

            function searchDetailAddrFromCoords(coords, callback) {
                // 좌표로 법정동 상세 주소 정보를 요청합니다
                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            }

            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            function displayCenterInfo(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var infoDiv = document.getElementById('centerAddr');

                    for (var i = 0; i < result.length; i++) {
                        // 행정동의 region_type 값은 'H' 이므로
                        if (result[i].region_type === 'H') {
                            infoDiv.innerHTML = result[i].address_name;
                            break;
                        }
                    }
                }
            }

            var geocoder = new kakao.maps.services.Geocoder();

            var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                infowindow = new kakao.maps.InfoWindow({zindex: 1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

            $("#addrBtn").click(function () {
                new daum.Postcode({
                    oncomplete: function (data) { //선택시 입력값 세팅
                        addr = data.address;
                        var geocoder = new kakao.maps.services.Geocoder();

                        // 주소로 좌표를 검색합니다
                        geocoder.addressSearch(addr, function (result, status) {

                            // 정상적으로 검색이 완료됐으면
                            if (status === kakao.maps.services.Status.OK) {

                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                longitude = result[0].x;
                                latitude = result[0].y;

                                $("#prLatitude").val(latitude);
                                $("#prLongitude").val(longitude);


                                // 결과값으로 받은 위치를 마커로 표시합니다
                                marker = new kakao.maps.Marker({
                                    map: map,
                                    position: coords
                                });

                                // 인포윈도우로 장소에 대한 설명을 표시합니다
                                var content = '<div style="width:150px;text-align:center;padding:6px 0;">직거래 장소</div>'
                                infowindow.setContent(content);
                                infowindow.open(map, marker);

                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                            }
                        });
                    }
                }).open();
            });

            kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
                searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var content = '<div style="width:150px;text-align:center;padding:6px 0;">직거래 장소</div>';

                        // 마커를 클릭한 위치에 표시합니다
                        marker.setPosition(mouseEvent.latLng);
                        marker.setMap(map);
                        var latlng = mouseEvent.latLng;
                        latitude = latlng.getLat();
                        longitude = latlng.getLng();

                        $("#prLatitude").val(latitude);
                        $("#prLongitude").val(longitude);

                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                        infowindow.setContent(content);
                        infowindow.open(map, marker);


                        // console.log(result[0]);
                    }
                });
            });


        });


        function setThumbnail1(event) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var img = document.createElement("img");
                img.style.width = 200 + "px";
                img.style.height = 200 + "px";
                img.setAttribute("src", event.target.result);
                document.querySelector("div#blah1").appendChild(img);


            };
            reader.readAsDataURL(event.target.files[0]);
        }

    </script>


</head>
<%
    UserDto dto = (UserDto) session.getAttribute("user");
%>
<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

<div class="content" style="min-height: 2500px;">
    <div class="container" id="boardDetail" style="margin-top: 60px; margin-bottom: 60px;">
        <div class="row">

            <div class="col-3">


                <div id="pageName"><b>재능 판매 공지사항</b></div>

                <div id="menuList">
                    <div style="border: black solid 3px; width: 262px; height: 1000px;">
                        *재능 기부자님들에게 안내드립니다*<br>
                        -해당 재능에 대하여 자세하게 작성해주셔야 합니다-<br>
                        -구매자와의 연락 방법<br>
                        -등..<br>
                    </div>
                </div>
            </div>


            <div class="col-9">

                <h2>당신의 재능을 작성해주세요.</h2>

                <div class="row">

                    <form action="insertProjectRes.do" method="post" id="projectForm" enctype="multipart/form-data">
                        <input type="hidden" name="usNo" value="<%=dto.getUsNo() %>">
                        <input type="hidden" name="usId" value="<%=dto.getUsId() %>">
                        <table class="deal-table" style="height: 1100px;">

                            <!-- 글 제목 input-->
                            <tr>
                                <th id="deal-title-th">글 제목</th>
                                <td><input type="text" name="prTitle" id="deal-title-td"></td>
                            </tr>


                            <!-- 이미지 미리보기-->
                            <tr>
                                <td colspan="2" id="deal-img" class="fileBox1">
                                    <div id="blah1"></div>


                                </td>
                            </tr>

                            <!-- 이미지 업로드-->
                            <tr>
                                <th class="deal-th">이미지 업로드</th>
                                <td>

                                    <div class="box-file-input">

                                        <input type="file" onchange="setThumbnail1(event);"
                                               name="prImage2" class="file-input"
                                               accept="image/*">

                                        <span class="filename">재능을 설명할 파일을 선택해주세요.</span>
                                    </div>
                                </td>
                            </tr>


                            <!--재능 종류-->
                            <tr>
                                <th class="deal-th">재능 종류</th>
                                <td id="usTalent">


                                </td>
                            </tr>

                            <input type="hidden" name="prTalent" value="${user.usTalent }">

                            <!--거래 방법-->
                            <tr>
                                <th class="deal-th">거래 방법</th>
                                <td>
                                    <select name="prDeal" class="accountInput" id="selectTrade" required>
                                        <option value="" disabled selected>선택해주세요</option>
                                        <option value="online">온라인</option>
                                        <option value="direct">직거래</option>
                                    </select>
                                    <button type="button" id="addrBtn" class="btn btn-outline-dark">직거래 위치 찾기</button>
                                    <hr style="margin: 3px;">
                                </td>
                            </tr>
                            <tr id="map_tr">


                                <th class="deal-th">직거래 지도</th>
                                <td>
                                    <div id="map" style="width:500px;height:400px;"></div>
                                </td>

                            </tr>

                            <tr id="prLati">

                                <td>
                                    <input type="hidden" name="prLatitude" id="prLatitude">
                                </td>
                            </tr>

                            <tr id="prLongi">

                                <td>
                                    <input type="hidden" name="prLongitude" id="prLongitude">
                                </td>
                            </tr>


                            <!--가격 링크-->
                            <tr>
                                <th class="deal-th">가격</th>
                                <td><input type="text" name="prPrice" class="deal-input-td"
                                           onkeypress="return checkNumber(event, 'numbers');"
                                           onkeydown="fn_press_han(this)"
                                ></td>
                            </tr>

                            <!--유튜브 영상링크-->
                            <tr>
                                <th class="deal-th">유튜브 영상링크</th>
                                <td><input type="text" name="prYoutube" class="deal-input-td"></td>
                            </tr>

                            <!--재능 설명-->
                            <tr>
                                <th class="deal-th">재능설명</th>
                                <td><textarea cols="100" rows="25" name="prContent" class="text-area" id="prContent"
                                              style="margin-left:0px;"></textarea></td>

                            </tr>


                            <tr style="border: none;">
                                <td colspan="2" align="right">
                                    <button id="completeBtn" class="btn btn-outline-primary btn-sm">완료</button>
                                </td>
                            </tr>


                        </table>
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