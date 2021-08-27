<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
    <link rel="stylesheet" href="/resources/css/mypage.css">
    
    <script src="<c:url value="/resources/js/messagePopup.js"/>"></script>
    
	
    
   

   
</head>




<body>

    <!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
    <div id="headerArea" style="width: 100%; height: 100px; background-color: darkgray;">heaer영역입니다.</div> 


    <div class="container" id="boardDetail">
        <div class="row">
            <div class="col-3">
                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img class="userImg" src="../image/chunsik.jpg">
                    </div>
                    <div id="userName" style="margin-top: 120px;">
                        user1
                    </div>

                    <div id="message">
                        <button onclick="messagePopup()" class="btn btn-outline-primary btn-lg" style="margin-top: 150px; width: 268px;" >판매자에게 문의하기</button>
                    </div>
                </div>
                
                <hr>
                
                <div id="pageName" style="margin-top: 150px;"><b style="margin-right: 45px;">자기소개</b></div>

                <div id="menuList">
                   <div style="border: black solid 3px; width: 269px; height: 1000px; " >
                        자기소개 글 내용
                    </div>
                </div>
            </div>


        <div class="col-9">
        
        	<form action="#">
                <div class="row">
                    <div class="detail-content">
                        <b id="detail-title">쉽게배우자 Spring</b>
                    </div>
                </div>

                <div class="row">
                    <div class="detail-content">
                        <img id="ai-img" src="../image/AI.jpg"></iframe>
                    </div>
                </div>

                <div class="row">
                    <div class="detail-content">
                        <iframe src="https://www.youtube.com/watch?v=a-y7WIOFLd0"></iframe>
                    </div>
                </div>

                <div class="row">
                    <span class="detail-content"><b>재능 등록 날짜 : &nbsp;</b></span><span class="detail-data">${detail_dto.prDate }</span>
                </div>

                <div class="row">
                    <span class="detail-content"><b>재능 종류 : &nbsp;</b></span><span class="detail-data">${detail_dto.prTalent }</span>
                </div>

                <div class="row">
                    <span class="detail-content"><b>거래 방법 : &nbsp;</b></span>
                    <span class="detail-data">
                       <!--거래방법 선택하기-->
                        
                           <select name="buySelect" style="width: 150px;">
                                <option value="">거래방법</option>
                                <option value="직거래">직거래</option>
                                <option value="택배">택배</option>
                           </select>
                       
                    </span>
                </div>

                
                <div class="row">
                    <span class="detail-content"><b>재능&nbsp;&nbsp;&nbsp; 상세&nbsp;&nbsp;&nbsp; 정보</b></span>
                </div>
                <div class="row" id="detail-content">
                    ${detail_dto.prContent }
                </div>

                <div class="row">
                    <input type="submit" value="구매하기" class="detail-button btn btn-outline-primary btn-lg" id="perchase-button">
                        

                        <!-- class를 detail-button3로 주었으며
                             로그인된 회원의 여부에 따라 class를 추가해줌으로 display를 조절하면 될 것 같아요   -->
                    <!--구매자 일 경우-->    
                    <button onclick="#" class="detail-button btn btn-outline-primary btn-lg detail-button3">예약확인</button> 
                    <!--판매자 일 경우-->
                    <button onclick="#" class="detail-button btn btn-outline-primary btn-lg">예약변경</button>
               </div>
                        <!--거래방법을 통한 구매하기 submit-->
               </form>
                </div>

                
                    <div class="row" id="button-div"> 
                        
                        <button onclick="#" class="detail-button2 btn btn-outline-primary btn-sm detail-button4">글 수정</button>
                        <button onclick="#" class="detail-button2 btn btn-outline-primary btn-sm detail-button4">글 삭제</button>
                       
                        
                    </div> 
                    
        </div>
        <div class="col-12">
            
                <hr> 
            
        </div>

       
        <div class="col-3">
            
            <div class="row" id="review-row2">
                <b id="review-user">000님</b>
            </div>

        </div>
        <div class="col-6">
            
            <div class="row">
                <h3>구매자 후기</h3>

                <!--평점선택-->
                <form action="">
                <div class="star-rating space-x-4 mx-auto">
                    <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
                    <label for="5-stars" class="star pr-4">★</label>
                    <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
                    <label for="4-stars" class="star">★</label>
                    <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
                    <label for="3-stars" class="star">★</label>
                    <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
                    <label for="2-stars" class="star">★</label>
                    <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                    <label for="1-star" class="star">★</label>
                </div>
                

                <textarea cols="60" rows="10" class="text-area"></textarea>
                <input type="submit" class="btn btn-outline-primary btn-sm"value="등록하기" id="review-submit">


                </form>
                
            </div>
            
        </div>
        
       
        </div>
    <hr>
    <div class="row">
        <div class="col-3" style="margin-top: 70px;">
            <b id="review-user">000님</b>
        </div>
        <div class="col-6 review-col">
           
                <div id="review">
                    [구매 후기]<br>
                    후기 작성일 : 0000년/00월/00일 00:00<br>
                    평점 : 5점 [5점만점]
                    -----------------------------------<br>
                    감사합니다<br>
                </div>
                
            </div>

        </div>
    </div>
    <!-- footer 영역-->
    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;" >임시 footer 영역입니다.</div>

      
      



</body>
</html>