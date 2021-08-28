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

    
	<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

   <!-- jquery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<c:url value="/resources/js/messagePopup.js"/>"></script>
    


    </script>
</head>
<body>
	  <!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
   


    <div class="container" id="boardDetail">
        <div class="row">
            <div class="col-3">
                
                
                
                
                <div id="pageName"><b>재능 판매 공지사항</b></div>

                <div id="menuList">
                   <div style="border: black solid 3px; width: 200px; height: 1000px;" >
                        *재능 기부자님들에게 안내드립니다*<br>
                        -해당 재능에 대하여 자세하게 작성해주셔야 합니다-<br>
                        -구매자와의 연락 방법<br>
                        -등..<br>
                    </div>
                </div>
            </div>


             <div class="col-9">
                <h2>당신의 재능을 작성해주세요.</h2>
                <div class="row">
                    <form action="#" method="#">
                        <table border="1px" class="deal-table">
                            
                            <!-- 글 제목 input-->
                            <tr>
                                <th id="deal-title-th">글 제목</th>
                                <td><input type="text" name="title" id="deal-title-td" value="#"></td>
                            </tr>
                            

                            <!-- 이미지 미리보기-->
                            <tr>
                                <td colspan="2" id="deal-img"><img src="../image/ImgBox.PNG" class="deal-img"></td>
                            </tr>

                            <!-- 이미지 업로드-->
                            <tr>
                                <th class="deal-th">이미지 업로드</th>
                                <td><input type="file" name="image"></td>
                            </tr>

                            <!--재능 등록 날짜-->
                            <tr>
                                <th class="deal-th">재능 등록 날짜</th>
                                <td><input type="date" name="date" class="deal-input-td" value="#"></td>
                            </tr>

                            <!--재능 종류-->
                            <tr>
                                <th class="deal-th">재능 종류</th>
                                <td>
                                    <select name="" class="accountInput"  required>
                                        <option value="" disabled selected>선택해주세요</option>
                                        <option value="">재능2</option>
                                        <option value="">재능3</option>
                                        <option value="">재능4</option>
                                        <option value="">재능5</option>
                                        <option value="">재능6</option>
                                    </select>
                                    <hr style="margin: 3px;">
                                </td>
                            </tr>

                            <!--거래 방법-->
                            <tr>
                                <th class="deal-th">거래 방법</th>
                                <td>
                                    <select name="" class="accountInput"  required>
                                        <option value="" disabled selected>선택해주세요</option>
                                        <option value="">온라인</option>
                                        <option value="">직거래</option>
                                    </select>
                                    <hr style="margin: 3px;">
                                </td>
                            </tr>

                            <!--유튜브 영상링크-->
                            <tr>
                                <th class="deal-th">유튜브 영상링크</th>
                                <td><input type="text" name="youtube" class="deal-input-td" value="#"></td>
                            </tr>

                            <!--재능 설명-->
                            <tr>
                                <th class="deal-th">재능설명</th>
                                <td><textarea cols="100" rows="25" name="content" class="text-area"></textarea></td>
                            </tr>
                            <tr style="border: none;">
                                <td colspan="2" align="right">
                                    <input type=submit class="btn btn-outline-primary btn-sm text-area" value="글 수정">
                                </td>
                            </tr>



                    </form>        
                        </table>
                </div>
                    
            </div>
        </div>
     </div>           
    <!-- footer 영역-->
    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;" >임시 footer 영역입니다.</div>

      
      


	
</body>
</html>