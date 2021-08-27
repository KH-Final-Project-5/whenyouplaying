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

     <!--css 가져오는 방법-->
	<link rel="stylesheet" href="<c:url value="/resources/css/loginSearch.css"/>">
</head>
<body>
<!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
    <div id="headerArea" style="width: 100%; height: 100px; background-color: darkgray;">heaer영역입니다.</div> 


    <div class="container">
        <div class="row" id="search-box">
            <div class="col-2">
               
            </div>
         
        
            <div class="col-10">
                <div class="row">
                <img src="<c:url value="/resources/questionImg/question.PNG"/>"  class="search-head">
                     <h3 class="search-head">아이디 찾기</h3>   
                </div>

               
            <form action="#" method="#">
                
                 <!--ID찾기 이름 입력폼-->
                <div class="row search-row">
                    <label id="id-name" class="search-label">Name : </label> <input type="text" name="name" placeholder="이름을 입력해주세요" id="id-name-input"> 
                </div>
                 <!--ID찾기 이메일 입력폼-->
                <div class="row search-row">
                    <label id="id-email" class="search-label">E-mail : </label> <input type="email" name="email" placeholder="example@naver.com" id="id-email-input"> 
                    <input class="btn btn-outline-primary" id="id-search-btn"type="submit" value="ID찾기">
                </div>
            </form> 
                
                <div class="row">
                    <img src="<c:url value="/resources/questionImg/question.PNG"/>"  class="search-head"> <h3 class="search-head">비밀번호 찾기</h3>   
                </div>
            <form action="#" method="#">
               
                 <!--ID찾기 이름 입력폼-->
                <div class="row search-row">
                    <label  id="pw-name"class="search-label">Name : </label> <input type="text" name="name" placeholder="이름을 입력해주세요" id="pw-name-input"> 
                </div>
                 <!--PW찾기 ID입력폼-->
                 <div class="row search-row">
                     <label id="pw-id" class="search-label">ID : </label><input type="text" name="id" placeholder="ID를 입력해주세요" id="pw-id-input">
                 </div>
                 <!--PW찾기 이메일 입력폼-->
                <div class="row search-row">
                    <labe  id="pw-email" class="search-label"l>E-mail : </label> <input type="email" name="email" placeholder="example@naver.com" id="pw-email-input"> 
                    <input class="btn btn-outline-primary" id="pw-search-btn" type="submit" value="PW찾기">
                </div>
            </form>    
            




            </div>
        </div>
    </div>

    <!-- footer 영역-->
    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;" >임시 footer 영역입니다.</div>

      
      



</body>
</html>