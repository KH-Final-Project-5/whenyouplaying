<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

   
	<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

<body>
 
    <!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
    <div id="headerArea" style="width: 100%; height: 100px; background-color: darkgray;">heaer영역입니다.</div> 
    <div class="container">
        <div class="row">
            <div class="col-12 userNav">
            <h2>재능 판매 게시판</h2>
            <hr>
            </div>
        </div>    
    </div>

    <!-- grid영역, 컬럼은 12줄로 이루어져 있고 갯수 비율로 틀을 잡는다. -->
    <div class="container">
        <div class="row">
            <div class="col-12" align="right" style="margin-bottom: 90px;">
                <button  class="btn btn-outline-primary" onclick="location.href='talentBoardInsert.html'">재능 등록하기</button>
            </div>
        </div>
    </div>
    <div class="container">
        
        <div class="row">
            <div class="col-4">
                <iframe src="https://www.youtube.com/watch?v=a-y7WIOFLd0"></iframe>          
            </div>
            <div class="col-4">
                <iframe src="https://www.youtube.com/watch?v=a-y7WIOFLd0"></iframe>
            </div>
            <div class="col-4">
                <iframe src="https://www.youtube.com/watch?v=a-y7WIOFLd0"></iframe>
            </div>

            
        </div>
        
        <hr>

        <div class="board-content">
            
           <c:choose>
           	 <c:when test="${empty pr_dto }">
           	 	<h1>---------등록된 게시물이 없습니다------------</h1>
           	 </c:when> 
            
            <c:otherwise>
            	<c:forEach items="${pr_dto }" var="pr_dto">
            <div class="col-12" style="text-align: center;"><h3><a href="#">${pr_dto.prTitle }</a></h3></div>
                <div class="col-12">
                <div class="row" style="border-bottom:1px solid black">
				
				
				
				
					
                        <div class="col-4">
                                    
                                    <img src="<c:url value="/resources/ProjectImg/ImgBox.PNG"/>">
                        </div>
                        
                        <div class="col-5">
                            <p><a href="Detail.do?prNo=${pr_dto.prNo }">${pr_dto.prContent }</a></p>
                        </div>
                        
                        <div class="col-3">

                            <div class="talent-price"><b>${pr_dto.prPrice }</b> <button onclick="#" class="btn btn-outline-primary">글 삭제</button></div>
                                
                        </div>
                    
                           
                        </div>
                        
                    </div>
                    </c:forEach>
               </c:otherwise>     
			</c:choose>
                </div>
          
        
        <!--검색기능-->
        <div class="col-12 search">
         		<form action="#"> 
            <div class="row">
            
                <div class="col-2 search-select">
                    
                       
                        <select style="width: 120px;">
                            <option  disabled selected>카테고리</option>
                            <option value="#">카테고리1</option>
                            <option value="#">카테고리2</option>
                        </select>
                          
                </div>
                <div class="col-2 search-select">
                        
                        <select>
                            <option  disabled selected>검색방법</option>
                            <option value="#">글 제목</option>
                            <option value="#">글 내용</option>
                            <option value="#">글 제목 + 글 내용</option>
                        </select>
                </div>
                <div class="col-8">
                         <img src="<c:url value="/resources/ProjectImg/search.png"/>"  class="search-img">
                        <input type="text" placeholder="검색어를 입력해 주세요." class="search-bar" style="height: 40px;">
                        <input type="submit"  class="btn btn-outline-primary" value="검색하기" id="search-button">
                    
                    <img src="<c:url value="/resources/ProjectImg/mike.jpg"/>"  class="search-img2">
                    <button class="search-img2" onclick="#"></button>
                </div>
            </div>
            	</form>
            <hr>
        </div>







        <!--pagination-->

        <div class="page-nav">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>

    </div>

        



    
    
   


    <!-- footer 영역-->
    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;" >임시 footer 영역입니다.</div>

</body>
</html>