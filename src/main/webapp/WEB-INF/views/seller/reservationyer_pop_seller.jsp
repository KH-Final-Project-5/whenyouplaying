<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>판매자 예약 관리</title>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet">


<link rel="stylesheet" href="<c:url value="/resources/css/reservation_seller.css"/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/css/reservation_seller.css"/>"></script>

<!-- 캘린더 -->
<link rel="stylesheet" href="<c:url value="/resources/fullcalendar-5.9.0/lib/main.css"/>">
<script src="<c:url value="/resources/fullcalendar-5.9.0/lib/main.js"/>"></script>

<script type="text/javascript">

	$(function(){
		
		$.ajax({
			url: "calendar.do",
			type: "GET",
			data:{
				'prNo': ${calendar.prNo}
			},
			dataType:"json",
			success: function(res){
				console.log(res);
				
				var calendarEl = document.getElementById('calendar');
				
				var calendar = new FullCalendar.Calendar(calendarEl, {
					events : res,
					eventClick : function(info){
						var scTitle = info.event.title;
						var scStart = info.event.start;
						var scEnd = info.event.end;

						if(confirm(scTitle+"을 삭제하시겠습니까?")){
							$.ajax({
								url : "deleteSchedule.do",
								type : "GET",
								data : {
									'scTitle' : scTitle,
									'scStartDate' : scStart,
									'scEndDate' : scEnd
								},
								success: function(res){
									console.log(res);
									alert("삭제되었습니다.");
									location.reload();
								},
								error: function(){
									alert("삭제 실패 ㅠ");
								}
							});															
						}
					},
					eventTimeFormat: { 
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					},
				});
				calendar.render();
			},
			error:function(){
				alert("통신실패");
			}
		});
		
	});
	
	
	
	
	
	
	
	
	
	
	

</script>

<body>
<div class="container" style="width: 850px;">
    <div class="row">
        <div id="calendar" class="sellerCalender col-9"></div>
        <div class="col-3">
            <button class="btn btn-outline-primary" id="calenderUpdate" onclick="window.close();">수정 완료</button>
            <br><br>
            <button class="btn btn-outline-primary" id="closePop" onclick="window.close();">닫기</button>
        </div>
    </div>

<br>
<div class="row">
    <div class="updateCalender col-9">
        
        <form action="insertSchedule.do" method="post">
        	<input type="hidden" name="calNo" value="${calendar.calNo }" >
        	<input type="hidden" name="prNo" value="${calendar.prNo }">
			<input type="hidden" name="usNo" value="${calendar.usNo }">
			        	
            <label>
                <label class="reservation"><b>예약하기</b></label>
            </label>
            <br>
            <input type="text" name="scTitle" placeholder="예약자 이름" id="reserName">
            <br>
            <input type="date" name="scStart">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="inputEndDate" id="inputEndDate2">~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" name="scEnd">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="submit" class="btn btn-outline-dark" value="입력">
        </form>
        
    </div>
    
    <div class="col-3"></div>
</div>
</div>
</body>
</html>