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


    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>


    <!-- 구글 소셜 로그인 -->
    <meta name="google-signin-client_id"
          content="557137904134-232ci9t86836vrm925onj9blpmnh4b2f.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

    <!-- 카카오톡 소셜 로그인 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script type="text/javascript">

        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log(profile);
            console.log("test");
            var googleId = profile.getEmail();
            var googlePw = profile.getId();
            var googleName = profile.getName();

            var auth2 = gapi.auth2.getAuthInstance();

            $.ajax({
                type: "post",
                url: "googlelogin.do",
                data: {
                    usId: googleId,
                    usPw: googlePw
                },
                success: function (res) {
                    if (res == '회원') {
                        alert("등록된 아이디입니다.");

                        location.href = "main.do";
                    } else {
                        alert("등록되지 않은 아이디입니다. 회원가입을 진행해 주세요");

                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut().then(function () {
                            console.log('User signed out');
                        });
                        auth2.disconnect();

                        location.href = "regigoogle.do?usId=" + googleId + "&usPw=" + googlePw + "&usName=" + googleName;
                    }
                },
                error: function () {
                    alert("통신실패");
                }
            });
        }


    </script>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>


        $(document).ready(function () {

            var kakaoInfo = '${kakaoInfo}';

            if (kakaoInfo != "") {
                var data = JSON.parse(kakaoInfo);
                alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
                alert(
                    "user : \n" + "email : "
                    + data['email']
                    + "\n nickname : "
                    + data['nickname']);
            }
        });


    </script>


    <!-- 네이버 스크립트 -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>


</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>


    <div class="content" style="min-height: 1100px;">
        <div class="container" style="margin-top: 100px; margin-bottom: 100px;">
            <div class="row">
                <div class="col-5"></div>
                <!-- Custom styles for this template -->
                <div class="col-3">
                    <form action="login.do" method="post">
                        <img class="mb-4" src="<c:url value="/resources/img_header/logo.png"/>" alt="" width="72"
                             height="57" style="margin-left: 90px">
                        <h1 class="h3 mb-3 fw-normal" style="margin: 0 auto; text-align: center">Please sign in</h1>

                        <input type="text" id="usId" name="usId"
                               style="width: 271px; display: inline-block; margin: 0 auto;"
                               class="form-control"
                               placeholder="ID를 입력해주세요"
                               required>
                        <br>
                        <br>
                        <input type="password" id="usPw" class="form-control" name="usPw"
                               style="width: 271px; display: inline-block; margin: 0 auto;" placeholder="Password"
                               required>
                        <br>
                        <br>
                        <button class="btn btn-primary"
                                style="width: 271px; display: inline-block; margin: 0 auto;"
                                type="submit">로그인
                        </button>


                        <br><br>
                    </form>
					
				<div style="position:relative; left: 40px;">
                    <!-- 구글 로그인 -->
                    <div style="display:inline;" class="g-signin2" data-width="41" data-height="40" data-onsuccess="onSignIn"></div> 

				  <div id="socialArea">
					<div class="shadow1" style="display:inline; width: 41px;">
                        <a style="width:41px; display:block;" href="https://kauth.kakao.com/oauth/authorize?client_id=dbf3216f878ddd57aec90512ab8d985e&redirect_uri=http://localhost:8105/kakaologin.do&response_type=code">
                        	<img width="41" height="40" alt="카카오로그인" src="<c:url value="/resources/img/kakaologo.png"/>">
                        </a>
					</div>

                    <!-- 네이버 로그인 창으로 이동 -->
                    <div id="naver_id_login" class="shadow1" style="display:inline; width: 41px; margin-left: 30px;"> 
                        <a  href="${url}" >
                            <img width="41" height="40" src="<c:url value="/resources/img/naverlogo.png"/>"/>
                        </a>
                    </div>
                    
                  </div>
				</div>

                    <br>


                    <div id="getTest"></div>
                    <a class="loginA" href="regiform.do">회원가입</a><br><br>
                    <a class="loginA" href="finduser.do">아이디 / 비밀번호 찾기</a>
                </div>
                <div class="col-4"></div>
            </div>

        </div>
       
    
    </div>


    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>

</body>
</html>