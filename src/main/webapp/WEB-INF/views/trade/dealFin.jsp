<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
            integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
            integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
            crossorigin="anonymous"></script>

    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/dealFin.css"/>">

    <!-- 글씨체-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

</head>
<body>
<div class="wwrap">
    <header>
        <jsp:include page="/WEB-INF/views/header/header.jsp" flush="false"/>
    </header>

    <!-- grid영역, 컬럼은 12줄로 이루어져 있고 갯수 비율로 틀을 잡는다. -->
    <div class="container">
        <div class="row" id="area1">
            <div class="col-7">
                <div id="productImg">
                    <img src="${All.prImage}" class="img-fluid rounded" id="sumnale" alt="섬네일">
                </div>
            </div>
            <div class="col-5">
                <div id="dealContentArea" class="shadow">
                    <div class="card">
                        <div class="card-header">
                            <b>거래 내용</b>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">재능 : ${All.prTitle}</li>
                            <li class="list-group-item">판매자 : ${SellUser.usId}</li>
                            <li class="list-group-item">구매자 : ${All.usId}</li>
                            <li class="list-group-item">가격 : ${All.dealPrice}</li>
                            <li class="list-group-item">기부금 : ${price}</li>
                            <li class="list-group-item">거래상태 : 거래 완료</li>
                            <li class="list-group-item">거래일시 : ${All.finDate}</li>
                        </ul>
                    </div>

                    <div class="card-header" id="buttonArea">
                        <button type="button" class="btn btn-primary" id="button1"
                                onclick="location.href='Detail.do?prNo=${All.prNo}'">리뷰남기기
                        </button>
                        <button type="button" class="btn btn-primary" onclick="location.href='main.do'">메인페이지</button>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <hr>

        <div class="row" id="area2">
            <div class="col-4">
                <div id="sellerArea" class="shadow">
                    <div id="sellerImgArea">
                        <div id="sellerImg" class="rounded-circle">
                            <img src="${SellUser.usImg}" alt="fwa" id="sellerImgg" class="rounded-circle">
                        </div>
                        <div id="sellerName">
                            ${SellUser.usId}
                        </div>
                    </div>
                    <hr class="line">
                    <div id="sellerContent">
                        ${SellUser.usSelfInfo}
                    </div>
                </div>
            </div>

            <div class="col-8">
                <div id="regTitle"><b>추천 재능글</b></div>

                <hr style="opacity: unset;">

                <div id="contentArea">
                    <c:forEach items="${list}" var="list">
                        <figure class="figure float-start shadow">
                            <a href="Detail.do?prNo=${list.prNo}"><img style="height: 200px" src="${list.prImage}"
                                                                       class="figure-img img-fluid rounded twoimg" alt="섬네일1">
                                <figcaption class="figure-cpation atagtext">${list.prTitle}</figcaption>
                            </a>
                        </figure>
                    </c:forEach>




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