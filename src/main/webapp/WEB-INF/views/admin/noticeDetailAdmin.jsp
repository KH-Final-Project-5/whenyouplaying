<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <!-- 글씨체 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/noticeDetailAdmin.css"/>">

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
						     src="${user.usImg }"
                             alt="사진">
                    </div>
                    <div id="userName">
                        ADMIN
                    </div>
                </div>
                <hr>
                <div id="pageName"><b>Admin Page</b></div>
    
                <div id="menuList">
                    <br>
                    <span class="menuText"><a class="noA" href="noticemainadmin.do?usNo=${user.usNo }"><u><b>공지 사항</b></u></a></span><br><br>
                    <span class="menuText"><a class="noA" href="abilitymain.do">재능 기부 승인</a></span><br><br>
                    <span class="menuText"><a class="noA" href="reportMain.do?change=no">신고 내역 확인</a></span><br><br>
                    <span class="menuText"><a class="noA" href="userManage.do">회원 목록 확인</a></span><br><br>
                    <span class="menuText"><a class="noA" href="adminpointout.do">관리자 출금 관리</a></span><br><br>
                    <span class="menuText"><a class="noA" href="donatelist.do">기부처 관리</a></span><br><br>
                </div>
            </div>
    

            <div class="col-9">
                <div id="title">
                    <div id="titleName"><h3>${noticeDetail.notiTitle }</h3></div>
                </div>

                <div id="divBox">
                	${noticeDetail.notiContent }
                </div>

				<div id="buttonArea">
		                <input type="button" value="목록으로" id="listbtn" class="btn btn-outline-primary" onclick="location.href='noticemainadmin.do?usNo=${user.usNo}'">
		
	    	            <input type="button" value="수정하기" id="btn1" class="btn btn-outline-primary" onclick="location.href='noticeupdate.do?notiNo=${noticeDetail.notiNo}'">
	        	        <input type="button" value="삭제하기" id="btn" class="btn btn-outline-primary" onclick="location.href='noticedelete.do?notiNo=${noticeDetail.notiNo}&usNo=${user.usNo }'">
	        	</div>
            </div>
        </div>
       </div>
    </div><br><br><br>

    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
    
</div>
	
</body>
</html>