<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
         
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

    <!--css 가져오는 방법-->
    <link rel="stylesheet" href="<c:url value="/resources/css/loginSearch.css"/>">
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "newPassword.do",
				type : "POST",
				data : {
					id : $("#usId").val(),
					email : $("#usEmail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
</head>
<body>
<div class="wwrap">
	<header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

	<div class="container">
	    <div class="row" id="search-box">
	        <div class="col-3">
	
	        </div>
	
	
	        <div class="col-9">
	            <div class="row">
	            	<div id="idSearchLabel">
	            		<div class="idImgArea">
			                <img src="<c:url value="/resources/questionImg/question.PNG"/>">
	            		</div>
		                <h3 class="h3Display">아이디 찾기</h3>
		            </div>
		            
		           	<form action="findId.do" method="post">
		                <!--ID찾기 이름 입력폼-->
		                <div class="search-row">
		                    <label>Name : </label> 
		                    <input type="text" name="usName" placeholder="이름을 입력해주세요" id="id-name-input">
		                </div>
		                <!--ID찾기 이메일 입력폼-->
		                <div class="search-row">
		                    <label>E-mail : </label> 
		                    <input type="email" name="usEmail" placeholder="example@naver.com" id="id-email-input">
		                    <input class="btn btn-outline-primary" id="id-search-btn" type="submit" value="ID찾기">
		                </div>
	            	</form>
		            
	            </div>
	
	            <div class="row">
	            	<div id="idSearchLabel2">
	            		<div class="idImgArea">
			                <img src="<c:url value="/resources/questionImg/question.PNG"/>">
	            		</div>
		                <h3 class="h3Display">비밀번호 찾기</h3>
		            </div>
		            
		            <form method="post">

		                <div class="search-row">
		                    <label>ID : </label> 
		                    <input type="text" name="usId" placeholder="ID를 입력해주세요" id="pw-id-input">
		                </div>
		                
		              	<div class="search-row">
		                    <label>E-MAIL : </label> 
		                    <input type="text" name="usEmail" placeholder="example@naver.com" id="pw-email-input">
		                    <button type="button" id="findBtn" class="btn btn-outline-primary">찾기</button>
		                </div>

		            </form>
	            </div>
	
	
	        </div>
	    </div>
	</div>

	<!-- footer -->
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>