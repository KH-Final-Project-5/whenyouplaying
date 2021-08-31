<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dto.UserDto" %>

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

    <!-- css -->
     <!--css 가져오는 방법-->
	<link rel="stylesheet" href="<c:url value="/resources/css/mypage.css"/>">

   <!-- jquery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script src="<c:url value="/resources/js/messagePopup.js"/>"></script>
    <!-- <script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script> -->
    <script type="text/javascript"
            src="<c:url value="/resources/smarteditor2/js/service/HuskyEZCreator.js"/>"
            charset="utf-8"></script>

 
    <script>
    $(function () {
        var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "prContent",
            sSkinURI: "/resources/smarteditor2/SmartEditor2Skin.html",
            fCreator: "createSEditor2",
            htParams: {
                bUseToolbar: true,
                bUseVerticalResizer: false,
                bUseModeChanger: true
            },
            

        });
        $("#completeBtn").click(function () {
            oEditors.getById["prContent"].exec("UPDATE_CONTENTS_FIELD", []);

            $("#projectForm").submit();
        });
       
    });
    </script>
 

	<script>
	$(document).on("change", ".file-input", function () {

	    $filename = $(this).val();

	    if ($filename == "")
	        $filename = "파일을 선택해주세요.";

	    $(".filename").text($filename);

	})


	function setThumbnail1(event) {
	    var reader = new FileReader();
	    reader.onload = function (event) {
	        var img = document.createElement("img");
	        img.style.width=200+"px";
	        img.style.height=200+"px";
	        img.setAttribute("src", event.target.result);
	        document.querySelector("div#blah1").appendChild(img);

	        
	    };
	    reader.readAsDataURL(event.target.files[0]);
	}
	</script>

    
</head>
<%
    UserDto dto = (UserDto) session.getAttribute("user");
%>
<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="true"/>
    </header>
<!-- header가 들어갈 영역 임시로 height: 100px로 잡는다. -->
  


    <div class="container" id="boardDetail">
        <div class="row">
        
            <div class="col-3">
                
                
                
                
                <div id="pageName"><b>재능 판매 공지사항</b></div>

                <div id="menuList">
                   <div style="border: black solid 3px; width: 262px; height: 1000px;" >
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
                
                    <form action="insertProjectRes.do" method="post" id="projectForm" enctype="multipart/form-data">
                       <input type="hidden" name="usNo" value="<%=dto.getUsNo() %>">
                       <input type="hidden" name="usId" value="<%=dto.getUsId() %>">
                        <table  class="deal-table" style="height: 1100px;">
                            
                            <!-- 글 제목 input-->
                            <tr>
                                <th id="deal-title-th" >글 제목</th>
                                <td><input type="text" name="prTitle" id="deal-title-td"></td>
                            </tr>
                            

                            <!-- 이미지 미리보기-->
                            <tr>
                                <td colspan="2" id="deal-img" class="fileBox1">
	                                <div id="blah1"></div>


	                            		
	                       			
                       			</td>
                            </tr>

                            <!-- 이미지 업로드-->
                            <tr>
                                <th class="deal-th">이미지 업로드</th>
                                <td>
	                                
	                                <div class="box-file-input">
		                                
		                                <input type="file" onchange="setThumbnail1(event);" 
		                                		name="prImage2" class="file-input"
		                                        accept="image/*">
		                                
	                                <span class="filename">재능을 설명할 파일을 선택해주세요.</span>
	                                </div>
                                 </td>
                            </tr>

                           

                            <!--재능 종류-->
                            <tr>
                                <th class="deal-th">재능 종류</th>
                                <td>
                                    <select name="prTalent" class="accountInput"  required>
                                        <option value="" disabled selected>선택해주세요</option>
                                        <option value="design">디자인</option>
                                        <option value="translation">번역/외국어</option>
                                        <option value="document">문서작성</option>
                                        <option value="music">음악/영상</option>
                                        <option value="program">프로그램개발</option>
                                        <option value="biz">마케팅/비지니스</option>
                                        <option value="life">생활서비스</option>
                                    </select>
                                    <hr style="margin: 3px;">
                                </td>
                            </tr>

                            <!--거래 방법-->
                            <tr>
                                <th class="deal-th">거래 방법</th>
                                <td>
                                    <select name="prDeal" class="accountInput"  required>
                                        <option value="" disabled selected>선택해주세요</option>
                                        <option value="online">온라인</option>
                                        <option value="direct">직거래</option>
                                    </select>
                                    <hr style="margin: 3px;">
                                </td>
                            </tr>
							
							 <!--가격 링크-->
                            <tr>
                                <th class="deal-th">가격</th>
                                <td><input type="text" name="prPrice" class="deal-input-td"></td>
                            </tr>
							
                            <!--유튜브 영상링크-->
                            <tr>
                                <th class="deal-th">유튜브 영상링크</th>
                                <td><input type="text" name="prYoutube" class="deal-input-td"></td>
                            </tr>

                            <!--재능 설명-->
                            <tr>
                                <th class="deal-th">재능설명</th>
                                <td><textarea cols="100" rows="25" name="prContent" class="text-area" id="prContent"  style="margin-left:0px;"></textarea></td>
                            	
                            </tr>

                            

                            <tr style="border: none;">
                                <td colspan="2" align="right">
                                    <button id="completeBtn" class="btn btn-outline-primary btn-sm">완료</button>
                                </td>
                            </tr>



                        
                        </table>
                       </form> 
                    </div>
                </div>
                
                       
            
        </div>
     </div>           
    <!-- footer 영역-->
    <div id="footerArea" style="width: 100%; height: 300px; background-color: darkgray;" >임시 footer 영역입니다.</div>
   <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="true"/>
    </footer>
</div>
      
      
</body>
</html>