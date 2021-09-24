<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wj
  Date: 2021/08/19
  Time: 8:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document</title>

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

    <!-- css -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="<c:url value="/resources/css/adminpointout.css"/>">
    <script src="<c:url value="/resources/js/adminpointout.js"/>"></script>


	<script type="text/javascript">
	
	    $(function(){
	        
	    
	    	
	        $("#registerArea").hide();
	        
	        
	        $("#adminOutBtn").click(function(){
	        	
	        	var doName = $("#doName").val();
	        	console.log(doName);
	        	var adminCash = "${user.usCash}";
				console.log(adminCash);
	        	var formSubmit = $("#donateupdate");
				console.log(formSubmit);
	        	var doCash = $("#adminOutBank").val();
	        	console.log(doCash);
	        	
	        	var checkCash = adminCash - doCash;
	        	
	        	if(doName == "" || doName == null){
	        		alert("계좌를 선택해주세요");
	        	}else if(doCash == "" || doCash == null){
	        		alert("기부금을 입력해주세요");
	        	}else if(checkCash < 0){
	        		alert("잔액이 부족합니다");
	        	}else{
	        		formSubmit.submit();
	        	}
	        	
	        });
	    
	    });
		
	    function donateForm(){
	    	
	    	$("#registerArea").show();
	    	$("#opacityArea1, #adminResetBtn").css('opacity','0');
	    	
	    }
	    
	    function cancelForm(){
	    	$("#registerArea").hide();
            $("#opacityArea1, #adminResetBtn").css('opacity','unset');
	    	
	    }
        
	</script>



</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

   <div class="content">

<div class="container" style="margin-top: 60px;">
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
                <span class="menuText"><a class="adA" href="noticemainadmin.do?usNo=${user.usNo }">공지 사항</a></span><br><br>
                <span class="menuText"><a class="adA" href="abilitymain.do">재능 기부 승인</a></span><br><br>
                <span class="menuText"><a class="adA" href="reportMain.do?change=no">신고 내역 확인</a></span><br><br>
                <span class="menuText"><a class="adA" href="userManage.do">회원 목록 확인</a></span><br><br>
                <span class="menuText"><a class="adA" href="adminpointout.do"><u><b>관리자 출금 관리</b></u></a></span><br><br>
                <span class="menuText"><a class="adA" href="donatelist.do">기부처 관리</a></span><br><br>
            </div>
        </div>
        <div class="col-9">
            <br>
            <div id="titleName"><h3>관리자 출금 관리</h3></div>
            <br><br>
            
            <form action="donateupdate.do" id="donateupdate" method="get">
            	<input type="hidden" name="usCash" value="${user.usCash }">
            	<input type="hidden" name="usNo" value="${user.usNo }">
                <div class="row" id="opacityArea1">
                    <div class="col-7">
                        <div class="pointDiv">
                            <div id="cashHave" class="shadow">
                                <div id="cashHaveContentArea">
                                    <div id="cashTitle">
                                        	보유중인 캐시
                                    </div>
                                    <div id="cashContent">
                                        ${user.usCash }
                                    </div>
                                </div>
                            </div>
                            <br><br><br>
                            <div id="selectAccount">
                                	기부처 선택
                                <div id="selectContent">
                                    <style>
                                        select:invalid {
                                            color: gray;
                                        }
                                    </style>
                                    <select id="doName" name="doNo" class="accountInput" required>
                                        <option value="" disabled selected>선택해주세요</option>
   										<c:choose>
   											<c:when test="${empty donateList}">
												<option value="">등록된 기부처가 없습니다.</option>											
   											</c:when>
   											<c:otherwise>
   												<c:forEach items="${donateList }" var="dto">
   													<option value="${dto.doNo }">${dto.doName }</option>
   												</c:forEach>
   											</c:otherwise>
   										</c:choose>
                                    </select>

                                    <input type="text" name="doCash"
                                           id="adminOutBank" style="width:200px;" placeholder="기부금을 입력해주세요"
                                           onkeypress="return checkNumber(event)">
                                    <hr style="margin: 3px; width: 400px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-5">
                        <br><br><br><br><br><br><br><br><br>
                        <input id="adminOutBtn" class="btn btn-primary" type="button" value="기부">
                    </div>
                </div>
            </form>
            
                <div class="row">
                    <div class="col-7"></div>
                    <div class="col-5">
                    	<button id="adminResetBtn" class="btn btn-primary" onclick="donateForm();">기부처 등록</button>
                    </div>
                </div>
            
            <div id="registerArea" class="shadow">
                <form action="insertdonate.do" method="get">
                        
                        <b style="font-size: 20px;">기부처등록</b>
                        <hr style="margin: 3px; margin-top: 5px; margin-bottom: 5px;">
                        
                        <label>기부처 이름</label>
                        <br>
                        <input class="accountInput" style="width: 300px;" type="text" name="doName"  placeholder="기부처를 입력하세요">
                        
                        <hr style="margin: 3px; margin-bottom: 10px;">
                        
                        <input id="submitButton" class="btn btn-sm btn-outline-primary" type="submit" value="등록하기">
                        <input id="cancleButton" class="btn btn-sm btn-outline-primary" type="reset" value="취소하기" onclick="cancelForm();">
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