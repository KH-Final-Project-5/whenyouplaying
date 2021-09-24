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
    <link rel="stylesheet" href="<c:url value="/resources/css/noticeListUser.css"/>">
    <script src="<c:url value="/resources/js/noticeListUser.js"/>"></script>
    
    
    <script type="text/javascript">
    	
    	$(function(){
    		
    		var user = "${user.usNo}";
    		
    		if(user == null || user == ""){
    			$("#sideBar").hide();
    			$("#noticeArea").css({"position":"relative", "left":"150px"});
    		}
    		
    	});
    
    
    </script>
    
    
    
    
    
</head>
<body>


<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
   
   <div class="content" style="min-height: 1300px;">
    <div class="container" style="margin-top: 60px; margin-bottom:60px;">
        <div class="row">
            <div class="col-3" id="sideBar">
                <div id="sideBarImgArea">
                    <div id="sideImg">
                        <img id="adminImg"
                             src="${user.usImg}"
                             alt="사진">
                    </div>
                    <div id="userName">
                        ${user.usId}
                    </div>
                </div>
                <hr>
                <div id="pageName"><b>MY PAGE</b></div><br>

                <div id="menuList">
                    <span class="menuText"><a class="noM" href="noticemainuser.do"><b><u>공지사항</u></b></a></span><br><br>
                    <span class="menuText"><a class="noM" href="useredit.do">회원정보</a></span><br><br>
                    <span class="menuText"><a class="noM" href="buylist.do?usNo=${user.usNo }&finStatus=1s">재능 구매내역</a></span><br><br>
                    <span class="menuText"><a class="noM"
                                              href="selllist.do?usNo=${user.usNo }&finStatus=거래취소">재능 판매내역</a></span><br><br>
                    <span class="menuText"><a class="noM"
                                              href="cashrecord.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">충전 내역확인</a></span><br><br>
                    <span class="menuText"><a class="noM"
                                              href="manageaccount.do?usNo=${user.usNo }">계좌 관리</a></span><br><br>
                    <span class="menuText"><a class="noM" href="pointdeposituser.do?usNo=${user.usNo }">포인트 출금</a></span><br><br>
                    <span class="menuText"><a class="noM"
                                              href="withdrawhistory.do?usNo=${user.usNo }&startDate=2021-01-01&endDate=2022-01-01">포인트 출금내역</a></span><br><br>
                    <span class="menuText"><a class="noM" href="closeaccountform.do">회원 탈퇴</a></span><br><br>
                </div>
            </div>
    
    
    

            <div class="col-9" id="noticeArea">
                <div id="titleName"><h1>공지사항</h1></div><br><br>
                <div class="tableDiv" style="margin-bottom: 100px;">
                    <table border="1" align="center" class="table">
                        
                        <colgroup>
                            <col width="50" />
                            <col width="200" />
                            <col width="50" />
                            <col width="80" />
                            <col width="60" />
                        </colgroup>

                        <tr>
                            <th>NO</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>

						<c:choose>
							<c:when test="${empty allList }">
								<tr>
									<td colspan="5" align="center"> ----------- 공지사항이 없습니다 ---------- </td>								
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach items="${allList }" var="dto" >
									<tr>
										<td>${dto.notiNo }</td>
										<td><a class="noM" href="noticedetailuser.do?notiNo=${dto.notiNo }">${dto.notiTitle }</a></td>
										<td>관리자</td>
										<td>${dto.notiDate }</td>
										<td>${dto.notiViews }</td>
									</tr>	
								</c:forEach>
							</c:otherwise>
						</c:choose>
                    </table>

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