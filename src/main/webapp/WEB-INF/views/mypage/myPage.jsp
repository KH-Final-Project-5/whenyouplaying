<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    
	<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">
</head>
<body>
    
    <!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
    <div id="headerArea" style="width: 100%; height: 100px; background-color: darkgray;">heaer영역입니다.</div> 


    <!-- grid영역, 컬럼은 12줄로 이루어져 있고 갯수 비율로 틀을 잡는다. -->
    <div class="container">
        <div class="row">
            <div class="col-12 userNav">
            <h2><img src="../image/UserImg.PNG">00님의 mypage</h2> <hr>
            </div>
        </div>    
    </div>

    </div>

    <div class="container">
        
        <!--첫번째 줄-->
        <div class="row">
            
            <div class="col-4">
                 <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>회원 정보 수정</b></a>
                 </div>
                
                 <div class="col-8">
                <p>[사이트명]에서 가입한<br>회원정보를 수정<br>할 수 있습니다.<br> 
                    
                </div>

                 
            </div>
            <div class="col-4">
                <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>충전 내역확인</b></a>
                 </div>
                
                 <div class="col-8">
                <p>회원님의 충전 내역을<br>확인 할 수 있습니다.<br> 
                    
                </div>
            </div>
            <div class="col-4">
                <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>회원 정보 수정</b></a>
                 </div>
                
                 <div class="col-8">
                <p>[사이트명]에서 가입한 <br>회원정보를 수정<br>할 수 있습니다.<br> 
                    
                </div>
            </div>
        </div>

        <!--두번째 줄-->
        <div class="row">
            
            <div class="col-4">
                 <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>재능 구매 내역</b></a>
                 </div>
                
                 <div class="col-8">
                <p>회원님의 재능 구매 내역을<br>확인 할 수 있습니다.<br> 
                    
                </div>

                 
            </div>
            <div class="col-4">
                <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>재능 판매 내역</b></a>
                 </div>
                
                 <div class="col-8">
                <p>회원님의 재능 판매 내역을<br>확인 할 수 있습니다.<br> 
                    
                </div>
            </div>
            <div class="col-4">
                <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>회원 탈퇴</b></a>
                 </div>
                
                 <div class="col-8">
                <p>회원 탈퇴시 내역은 모두 사라집니다.</p>
                    
                </div>
            </div>
        </div>


        <div class="row">
            
            <div class="col-4">
                 <div class="col-8">
                    <a href="#"><img src="../image/ImgBox.PNG"></a>
                 </div>
                 <div class="col-8">
                    <a href="#"><b>찜 내역 확인</b></a>
                 </div>
                
                 <div class="col-8">
                <p>찜한 내역을 확인<br>할 수 있습니다.<br> 
                    
                </div>

                 
            </div>
            
        </div>

        
    </div>


    <!-- footer 영역-->
    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;" >임시 footer 영역입니다.</div>

</body>
</html>