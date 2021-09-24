<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 화면 샘플 - Bootstrap</title>
    <!-- Bootstrap CSS -->

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

    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/regi.css"/>" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
          
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
          
    <script type="text/javascript">
		function fn_idChk(){
			$.ajax({
				url : "/idChk.do",
				type : "post",
				dataType : "json",
				data : {"usId" : $("#usId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
						$("#usId").val("");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
		$(function(){
			$("#alert-success").hide(); 
			$("#alert-danger").hide(); 
			$("input").keyup(function(){ var usPW=$("#usPW").val(); 
			var usPW2=$("#usPW2").val();
			if(usPW != "" || usPW2 != "")
			{ if(usPW == usPW2){ $("#alert-success").show(); 
			
			$("#alert-danger").hide(); 
			
			$("#submit").removeAttr("disabled"); 
			}else{ 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
				
			} 
			}
			});
			});


		//비밀번호 검사

		 

	</script>      
    
    
    
    
    
    
          
          
</head>
<body>

<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

<div class="content" style="min-height: 1500px;" >
    <div class="container" style="">

        <div class="input-form-backgroud row">

            <div class="col-2">

            </div>

            <div class="col-8">

                <div id="titleName"><h1>회원가입</h1></div>

                <form action="regi.do" method="post" class="validation-form">
					<input type="hidden" name="usEmail" value="${naverDto.usId }">

                    <div class="row">


                        <div class="col-md-6 mb-3">

                            <br>
                            <br>
                            <label for="usID">ID</label>

                            <br>
                            <input type="text" class="form-control" id="usId" placeholder="" value="${naverDto.usId }" required
                                   name="usId" readonly>
							
                            
                        </div>


                        <div class="col-md-6 mb-3">
                            <br>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="usPW">PW</label>
                            <br>
                            <password>
                            </password>
                            <input type="password" class="form-control" id="usPW" placeholder="" value="${naverDto.usPw }" required name="usPw" readonly>
                        </div>


                        <div class="col-md-6 mb-3">

                            <label for="usPW2">PW 확인</label>
                            <br>
                            <input type="password" class="form-control" id="usPW2" placeholder="" value="${naverDto.usPw }" required readonly>

                         <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                         <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

                        </div>
						
						<div class="col-md-6 mb-3">

                            <label for="usName">이름</label>
                            <br>
                            <input type="text" class="form-control" id="usName" placeholder="" value="${naverDto.usName }" required
                                   name="usName" readonly>


                        </div>
                        

                    </div>
					
					

                    <div class="mb-3">

                        <label for="usPhone">휴대전화</label><br>
                        <input type="text" style="display: inline" class="form-control phone" id="usPhone" required
                               name="usPhone">
                        -
                        <input type="text" style="display: inline" class="form-control phone" id="usPhone2" required
                               name="usPhone2">
                        -
                        <input type="text" style="display: inline" class="form-control phone" id="usPhone3" required
                               name="usPhone3">
                        <div class="invalid-feedback"> 휴대전화를 입력해주세요.
                        </div>

                        <br>
                        <br>

                        

                        <br>
                        <div class="mb-3"><label for="prAddress">주소</label>
                            <br>
                            <input type="text" class="form-control" id="praddress" placeholder="서울특별시 강남구" required
                                   name="usAddress1">

                            <input type="button" class="btn btn-primary" value="우편 찾기">
                            <div class="invalid-feedback"> 주소를 입력해주세요.
                            </div>

                        </div>
                      </div>

                        <div class="mb-3">

                            <label for="praddress2">상세주소<span class="text-muted">&nbsp;</span>
                            </label>
                            <br>
                            <input type="text" class="form-control" id="praddress2" placeholder="상세주소를 입력해주세요."
                                   name="usAddress2" required>


                            <hr class="mb-4">

                            <div class="custom-control custom-checkbox"><input type="checkbox"
                                                                               class="custom-control-input"
                                                                               id="aggrement" required>

                                <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label></div>
                            <div class="mb-4">


                            </div>
                            <button class="btn btn-primary btn-lg btn-block" type="submit" id="regisubmit">가입 완료
                            </button>
						</div>
                </form>
						
            </div>

        </div>
        <div class="col-2">

        </div>


    </div>
    
    </div>
    <footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
</div>





</body>


</html>
