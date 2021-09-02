<%@ page import="com.dto.UserDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Insert title here</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

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

    <link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

    <!--  <script src="<c:url value="/resources/js/messagePopup.js"/>"></script> -->
	<script>
		
		function messagePopup() {
			var option ="width=800, height =1000, top =100, left =200,location=no"
			window.open("popup.do?prNo=${detail_dto.prNo}","",option)
						
		
		}
		
	</script>
	
<script>
    $(function () {
        var user = "<%=session.getAttribute("user")%>";
        var userNo = "${user.usNo}"
        var projectUsNo ="${detail_dto.usNo}"
        var userId = "${user.usId}"
        console.log(user);
        if(projectUsNo!==userNo){
        	 $("#deleteBtn").hide();
        	 $("#updateBtn").hide();
        	 $("#reserbtn").hide();
        }else if(projectUsNo==userNo){
        	$("#reserChk").hide();
        }
        
        console.log(userNo);
        if(userId==null||userId==""){
        	$("#perchase-button1").hide();
        	$("#perchase-button2").hide();
        	$("#reserChk").hide();
        }else if(userId=='admin'){
        	$("#reserChk").hide();
        }
        
        
    });

</script>
</head>



<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="true"/>
    </header>


    <div class="container">
        <div class="row">
            <div class="col-3">
                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img id="ai-img" src="<c:url value="/resources/img_header/logo.png"/>" alt="">
                    </div>
                    <div id="userName" style="margin-top: 120px;">
                        ${detail_dto.usName }
                    </div>

                    <div id="message">
                        <button onclick="messagePopup()" class="btn btn-outline-primary btn-lg"
                                style="margin-top: 150px; width: 268px;">판매자에게 문의하기
                        </button>
                    </div>
                </div>

                <hr>

                <div id="pageName" style="margin-top: 150px;"><b style="margin-right: 45px;">자기소개</b></div>

                <div id="menuList">
                    <div style="border: black solid 3px; width: 269px; height: 1000px; ">
                        자기소개 글 내용
                    </div>
                </div>
            </div>


            <div class="col-9">

                <form>
                
                <input type="hidden" name="prNo" value="${detail_dto.prNo }">
                <input type="hidden" name="usNo" value="${detail_dto.usNo }">
                <input type="hidden" name="loginUsNo" value="${user.usNo }">
                    <div class="row">
                        <div class="col-12">
                            <div class="detail-content">
                                <b id="detail-title">${detail_dto.prTitle }</b>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="detail-content">
                                <img id="ai-img" src="${detail_dto.prImage }" alt="사진">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">

                            <div class="detail-content">
                               <iframe id="gangnamStyleIframe" width="350" height="300"
                        src="https://www.youtube.com/embed/0I2hBTj1rVY?rel=0&enablejsapi=1" frameborder="0"
                        allow="autoplay; fullscreen" allowfullscreen></iframe>

                <script type="text/javascript">
                    /**
                     * Youtube API 로드
                     */
                    var tag = document.createElement('script');
                    tag.src = "https://www.youtube.com/iframe_api";
                    var firstScriptTag = document.getElementsByTagName('script')[0];
                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                    /**
                     * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
                     * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
                     * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
                     */
                    var player;

                    function onYouTubeIframeAPIReady() {
                        player = new YT.Player('gangnamStyleIframe', {
//                height: '315',            // <iframe> 태그 지정시 필요없음
//                width: '560',             // <iframe> 태그 지정시 필요없음
//                videoId: '9bZkp7q19f0',   // <iframe> 태그 지정시 필요없음
//                playerVars: {             // <iframe> 태그 지정시 필요없음
//                    controls: '2'
//                },
                            events: {
                                'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                                'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                            }
                        });
                    }

                    function onPlayerReady(event) {
                        console.log('onPlayerReady 실행');

                        // 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
                        event.target.playVideo();
                    }

                    var playerState;

                    function onPlayerStateChange(event) {
                        playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                            event.data == YT.PlayerState.PLAYING ? '재생 중' :
                                event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                                    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                                        event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                                            event.data == -1 ? '시작되지 않음' : '예외';

                        console.log('onPlayerStateChange 실행: ' + playerState);
                    }
                </script>
                            </div>
                        </div>
                    </div>
					
					<div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>판매자 : &nbsp;</b></span><span
                                class="detail-data">${detail_dto.usName }</span>
                        </div>
                    </div>
					
					
					
                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>재능 등록 날짜 : &nbsp;</b></span><span
                                class="detail-data">${detail_dto.prDate }</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>재능 종류 : &nbsp;</b></span><span
                                class="detail-data">${detail_dto.prTalent }</span>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>가격 : &nbsp;</b></span><span
                                class="detail-data">${detail_dto.prPrice }</span>
                        </div>
                    </div>

                   


                    <div class="row">
                        <div class="col-12">

                            <span class="detail-content"><b>재능&nbsp;&nbsp;&nbsp; 상세&nbsp;&nbsp;&nbsp; 정보</b></span>
                        </div>
                        <div class="row" id="detail-content">
                            ${detail_dto.prContent }
                        </div>
                    </div>
                    
                    
                    <div class="row" style="margin-left:200px;">
                    	<div class="col-12">
                    		<span class="detail-content"><b>거래 지역</b></span>
                    	</div>
                    		<div id="map" style="width:500px;height:400px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ab159e5abb2442cfed56949c9439ba9"></script>
							<script>
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(33.450701, 126.570667),
									level: 3
								};
						
								var map = new kakao.maps.Map(container, options);
							</script>
                    	
                    </div>
                    
                    
                    <div class="row">
                        <div class="col-12">

                            <input type="submit" value="온라인 구매" class="detail-button btn btn-outline-primary btn-lg"
                                   id="perchase-button1" formaction="online.do" style="margin-left:200px">
                            <input type="submit" value="직거래 구매" class="detail-button btn btn-outline-primary btn-lg"
                                 	id="perchase-button2" formaction="direct.do" style="margin-left:200px" >


                            <!-- class를 detail-button3로 주었으며
                                 로그인된 회원의 여부에 따라 class를 추가해줌으로 display를 조절하면 될 것 같아요   -->
                            <!--구매자 일 경우-->
                            <button onclick="" id="reserChk" class="detail-button btn btn-outline-primary btn-lg detail-button3" style="margin-left:555px;">예약확인
                            </button>
                            <!--판매자 일 경우-->
                            <button onclick="" id="reserbtn" class="detail-button btn btn-outline-primary btn-lg" style="margin-left:555px;">예약변경</button>
                        </div>
                    </div>
                    <!--거래방법을 통한 구매하기 submit-->
                </form>
                <div class="row" id="button-div">
                    <div class="col-12">
                        <button onclick="location.href='ProjectUpdate.do?prNo=${detail_dto.prNo}'" class="detail-button2 btn btn-outline-primary btn-sm detail-button4" id="updateBtn">글 수정
                        </button>
                        <button onclick="location.href='ProjectDelete.do?prNo=${detail_dto.prNo}'" class="detail-button2 btn btn-outline-primary btn-sm detail-button4" id="deleteBtn">글 삭제
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-3">
                <div class="row" id="review-row2">
                    <div class="col-12">
                    </div>
                </div>
            </div>
            <div class="col-9"></div>
        </div>
        <div class="row">
            <div class="col-3">
                <br><br><br><br>
                <br><br><br><br>
                <b id="review-write-user">${user.usName }</b>
            </div>
            <!--평점선택-->
            <div class="col-9">
                <h3>구매자 후기</h3>
                <form action="review.do">
                	<input type="hidden" name="prNo" value="${detail_dto.prNo }">
                	<input type="hidden" name="usNo" value="${detail_dto.usNo }">
                	<input type="hidden" name="usWriterNo" value="${user.usNo }">
                    <div class="star-rating space-x-4 mx-auto">
                        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                        <label for="5-stars" class="star pr-4">★</label>
                        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                        <label for="4-stars" class="star">★</label>
                        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                        <label for="3-stars" class="star">★</label>
                        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                        <label for="2-stars" class="star">★</label>
                        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings"/>
                        <label for="1-star" class="star">★</label>
                    </div>
                    <textarea style="width: 510px; height: 200px; margin-left: 68px;" name="reviewContent" class="text-area"></textarea>
                    <input type="submit" class="btn btn-outline-primary btn-sm" value="등록하기" id="review-submit">
                    <button onclick="" class="btn btn-outline-primary btn-sm">수정</button>
                    <button onclick="" class="btn btn-outline-primary btn-sm">삭제</button>
                </form>
            </div>
        </div>
        <br><hr><br>
        <div class="row">
            <div class="col-3">
                <b class="review-user">000님</b>
            </div>
            <div class="col-9 review-col">
                <div class="review">
                    [구매 후기]<br>
                    후기 작성일 : <br>
                    평점 : 5점 [5점만점]
                    -----------------------------------<br>
                    감사합니다<br>
                </div>
            </div>
        </div>
        <br>
        
    </div>
    <!-- footer 영역-->
    
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="true"/>
    </footer>
</div>
</body>
</html>

