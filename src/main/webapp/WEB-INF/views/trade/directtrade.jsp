<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>직거래/택배거래</title>
</head>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<link href="<c:url value="/resources/css/directtrade.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function paySubmit(){
	    var pay = '${result1}';
	    // console.log($('#orderCheckBox').is(":checked"));
	    var payForm = $('#payForm');
	    if($('#orderCheckBox').is(":checked")===true){
	        if (pay > 0) {
	            if (confirm("결제하시겠습니까?")) {
	
	                payForm.submit();
	            }
	        } else {
	            alert("보유 포인트가 부족합니다.");
	            return false;
	        }
	    }else{
	        alert("주문 확인을 체크해주세요.");
	    }
	}
		
	

	
	
	
	$(function () {
    var user = "<%=session.getAttribute("user")%>";
    var userPhone = "${user.usPhone}";
    console.log(userPhone);
    
    var userPhone1 = userPhone.substr(0,3);
    var userPhone2 = userPhone.substr(3,4);	
    var userPhone3 = userPhone.substr(7,4);	
    
    console.log(userPhone1);

    console.log(userPhone2);

    console.log(userPhone3);
    
    
    $('#tradePhone_1').val(userPhone1);

    $('#tradePhone_2').val(userPhone2);

    $('#tradePhone_3').val(userPhone3);
	});
	
	var result = "${result.result};"
	console.log(result);
	
	
	function newAddr() {
        $('.tradeName').val("");
        $('.tradePhone').val("");
        $('.tradeAddrInput').val("");
    };
		
	
	
    

    function addr() {
    	 var user = "<%=session.getAttribute("user")%>";
    	    var userPhone = "${user.usPhone}";
    	    console.log(userPhone);
    	    
    	    var userPhone1 = userPhone.substr(0,3);
    	    var userPhone2 = userPhone.substr(3,4);	
    	    var userPhone3 = userPhone.substr(7,4);	
    	
    	
    	
    	
        $('.tradeName').val("${user.usName}");
        $('#tradePhone_1').val(userPhone1);
        $('#tradePhone_2').val(userPhone2);
        $('#tradePhone_3').val(userPhone3);
        
        
        
        $('#tradeNewAddr1').val("${user.usAddress1}");
        $('#tradeNewAddr2').val("${user.usAddress2}");
    }
</script>



<script src="../js/directtrade.js"></script>
<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>
<div class="container">
    <div class="row">
        <div class="col-12">
            <label id="payMentLabel">결제하기</label>
        </div>
    </div>
    <form id="payForm" action="directtrade.do" method="post">
    		<input type="hidden" name="usBuyNo" value="${user.usNo}">
            <input type="hidden" name="usSellNo" value="${dto.usNo}">
            <input type="hidden" name="prNo" value="${dto.prNo}">
        <div class="orderContainsDiv row">
            <div class="col-8">
                <div id="marginDiv">
                    <label id="orderLabel">주문 내역</label>
                    <hr class="hrClass1">
                    <img id="orderImg"
                         src="${dto.prImage }">
                    <label id="titleLabel"><a id="titleA" href="Detail.do?prNo=${dto.prNo }">프로젝트명 : ${dto.prTitle }</a>
                    </label>
                    <label id="nameLabel">판매자명 : ${dto.usName }</label>
                </div>
                <br>
                <label id="priceLabel">가격 : (${dto.prPrice })Point</label><br><br>
                <div class="myContentsDiv">
                    <label id="myImformLabel">내 정보</label>
                    <hr class="hrClass1">
                    <div class="labelDiv">
                        <label id="addrLabel">배송지 선택
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="1" id="trade_Addr"
                                                                 name="addr_radio" checked="checked"
                                                                 onclick="addr();">
                            기본 배송지
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="2"
                                                                 id="trade_New_Addr"
                                                                 name="addr_radio"
                                                                 onclick="newAddr();"> 신규 배송지
                        </label>
                        <table id="myInformTable">
                            <colgroup>
                                <col width="120px">
                            </colgroup>
                            <tr>
                                <td class="nameClass">이름&nbsp;&nbsp;&nbsp;</td>
                                <td><input type="text" class="tradeName" name="tradeName" value="${user.usName }"></td>
                            </tr>
                            <tr>
                                <td class="nameClass">전화번호&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                     <input type="text" class="tradePhone" id="tradePhone_1"
                                           value="" name="tradePhone_1"
                                           >&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                                           
                                    <input type="text" class="tradePhone" id="tradePhone_2"
                                           value="" name="tradePhone_2"
                                           >&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="tradePhone" id="tradePhone_3"
                                           value="" name="tradePhone_3"
                                           >
                                </td>
                            </tr>
                            <tr>
                                <td class="nameClass">주소&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <input type="text" class="tradeAddrInput" id="tradeNewAddr1"
                                           name="tradeNewAddr1"
                                           value="${user.usAddress1 }">
                                    <input type="button" value="우편 찾기">
                                </td>
                                <td rowspan="2"></td>
                            </tr>
                            <tr style="height: 0;">
                                <td class="nameClass"></td>
                                <td><input type="text" class="tradeAddrInput" id="tradeNewAddr2"
                                           name="tradeNewAddr2"
                                           placeholder="상세 주소 입력" value="${user.usAddress2 }"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr>
                <div id="directMapDiv">
                    이곳엔 지도가 들어갑니다.
                </div>
            </div>
            <div class="col-1"></div>
            <div class="col-3 orderDiv">
                <div class="labelDiv">
                    <table id="orderTable">
                        <colgroup>
                            <col width="130px">
                            <col width="140px">
                        </colgroup>
                        <tr>
                            <td class="nameClass">보유 포인트</td>
                            <td>${user.usCash } Point</td>
                        </tr>
                        <tr>
                            <td class="nameClass">가격</td>
                            <td>${dto.prPrice } Point</td>
                        </tr>
                        <tr>
                            <td class="nameClass">결제 후 포인트</td>
                            <c:if test="${result1 < 0 }">
                            	<td>보유 포인트가<br>부족합니다.</td>
                            </c:if>
                            <c:if test="${result1 > 0 }">
                            	<td>${result1} Point</td>
                            </c:if>
                        </tr>
                        
                    </table>
                    <hr class="hrClass2">
                </div>
                <br>
                <input type="hidden" name="dealPrice" value="${dto.prPrice}">
                <label id="orderCheckLabel">
                    <input type="checkbox" name="orderCheckBox" id="orderCheckBox">&nbsp;&nbsp;주문 확인(필수)</label><br><br>
                <input type="button" class="btn btn-outline-primary" id="payBtn" value="결제하기"
                       onclick="paySubmit();">
            </div>
        </div>
    </form>
</div>
	<footer>
        <jsp:include page="/WEB-INF/views/header/footer.jsp" flush="false"/>
    </footer>
    </div>
</body>
</html>