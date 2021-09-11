<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wj
  Date: 2021/08/27
  Time: 12:17 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>

    <title>Login Page</title>
    <!--Made with love by Mutiullah Samim -->

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

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login.css"/>">
	
	<!-- JQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- 구글 소셜 로그인 -->
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="557137904134-232ci9t86836vrm925onj9blpmnh4b2f.apps.googleusercontent.com">
	
	<script src="https://apis.google.com/js/platform.js" async defer></script>

	<script type="text/javascript">

	
	
		function onSignIn() {
				
			  var auth2 = gapi.auth2.getAuthInstance();
			
			  
			  if(auth2.isSignedIn.get()){
				  
				  var profile = auth2.currentUser.get().getBasicProfile();
				  
				  var googleId = profile.getEmail();
				  var googlePw = profile.getId();
				  var googleName = profile.getName();
				  
				  
				  $.ajax({
					  type:"post",
					  url:"googlelogin.do",
					  data:{
					  	 usId:googleId,
					  	 usPw:googlePw
					  },
					  success:function(res){
					    	if(res == '회원'){
					    		location.href="main.do";
					    	}else{
					    		location.href="regigoogle.do?usId="+googleId+"&usPw="+googlePw+"&usName="+googleName;
					    	}
					  },
					  error:function(){
						  alert("통신실패");
					  }
				  });
				  
			  }
				  
			}
			  
		/*  
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			  */
	</script>



</head>
<body style="overflow-y: hidden">
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
    <div class="container">
        <div class="row">
            <div class="col-5"></div>
            <!-- Custom styles for this template -->
            <div class="col-3">
                <form action="login.do" method="post">
                    <img class="mb-4" src="<c:url value="/resources/img_header/logo.png"/>" alt="" width="72" height="57" style="margin-left: 90px">
                    <h1 class="h3 mb-3 fw-normal" style="margin: 0 auto; text-align: center">Please sign in</h1>
                    
                    <input type="text" id="usId" name="usId"
                           style="width: 271px; display: inline-block; margin: 0 auto;"
                           class="form-control"
                           placeholder="ID를 입력해주세요"
                           required autofocus>
                    <br>
                    <br>
                    <input type="password" id="usPw" class="form-control" name="usPw"
                           style="width: 271px; display: inline-block; margin: 0 auto;" placeholder="Password" required>
                    <br>
                    <br>
                    <button class="btn btn-primary"
                            style="width: 271px; display: inline-block; margin: 0 auto;"
                            type="submit">로그인
                    </button>
                    
						                    
                    <br><br>
                </form>
                
                <div class="g-signin2" data-theme="dark" onclick="onSignIn();"></div>
                
				<div id="getTest"></div>
                	<a class="loginA" href="regiform.do">회원가입</a><br><br>
                	<a class="loginA" href="finduser.do">아이디 / 비밀번호 찾기</a>
            	</div>
            <div class="col-4"></div>
        </div>
    </div>
</div>
</body>
</html>