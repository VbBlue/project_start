<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <!-- 마이페이지 내용(테이블) -->
<%@ include file="../mypage/mypage_menu.jsp" %>

	      <div class="main">
	      	<div>
	      		<h1>내 헌혈정보</h1>
	      		<div class="contents">
	      			<div class="title">혈액형</div><br><div class="content">${user.userbtype }형</div>
					<div class="title">총 헌혈 횟수</div><br><div class="content" id="blist_count"></div>
					<div class="title">최근 헌혈 일자</div><br><div class="content" id="last_bhdate"></div>
					<div class="title">최근 이용한 헌혈의집</div><br><div class="content" id="last_bhname"></div>
					<div class="title">다음 헌혈 가능일까지</div><br><div class="content" id="Dday"></div>
					<div class="title">다음 헌혈 가능일</div><br><div class="content" id="bloodCycle"></div>
	      			
	      		<h1>헌혈 예약정보</h1>
	      		<div class="contents res">
	      			<div id="reserve_stat"></div>
	      			<div id="res_button"></div>
	      		</div>

	      	</div>
<%-- 				<table style='text-align:left;'>
					<tr>
						<td><span id="Dday"></span><td>
					</tr>
					<tr>
						<span id="blood_cycle"></span>
					</tr>
					<tr id="reserve_stat"></tr>
					<tr>
						<td>보유 포인트: ${user.point}점</td>
						<td><input type='button' value='게임하기'></td>
					</tr>
				</table> --%>
			</div>

    </div>
  </section>
</div>
  <!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var Dday = "${lastDay['Dday']}";
		var bhselect = "${lastDay['bhselect']}";
		var blist_count = "${lastDay['blist_count']}";
		var bhdate = "${lastDay['last_bhdate']}";
		var bhname = "${lastDay['bhname']}";
		var next_bhdate = "${lastDay['next_bhdate']}";
		var last_bhdate = bhdate.slice(0, 4) + "-" + bhdate.slice(4, 6) + "-" + bhdate.slice(-2);
		var next_bhdate = next_bhdate.slice(0, 4) + "-" + next_bhdate.slice(4, 6) + "-" + next_bhdate.slice(-2);
		if(Dday == "") {
			Dday = 0;
			blist_count = 0;
		}
		$("#Dday").append(Dday+"일");
		$("#blist_count").append(blist_count+"회");
		$("#last_bhdate").append(last_bhdate);
		$("#last_bhname").append(bhname);
		$("#bloodCycle").append(next_bhdate);
		$.getJSON("reserv_stat", {"userid":"${user.userid}"}, function(data) {
			$("#reserve_stat").empty();
			if(data != null) {
				var resdate = new Date(data.resdate);
				var year = resdate.getFullYear();
				var month = ('0' + (resdate.getMonth() + 1)).slice(-2);
				var day = ('0' + resdate.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;
				//$("#reserve_stat").append("<td>헌혈의집: "+data.bhname+"<br>예약날짜: "+dateString+"<br>예약시간: "+data.restime+"<br>기념품: "+data.goods+"<br>헌혈종류: "+data.bhselect+"<br>예약상태: "+data.resstate+"</td><td><input type='button' value='예약변경' id='change'</td><td><input type='button' value='예약취소' id='cancel'></td>");
				$("#reserve_stat").append("<div class='title'>헌혈의집</div><div class='content'>"+data.bhname+"</div><div class='title'>헌혈종류</div><div class='content'>"+data.bhselect+"</div>" +
										  "<div class='title'>예약날짜</div><div class='content'>"+dateString+"</div><div class='title'>예약시간</div><div class='content'>"+data.restime+"</div>" +
										  "<div class='title'>기념품</div><div class='content'>"+data.goods+"</div><div class='title'>예약상태</div><div class='content'>"+data.resstate+"</div>");

				//$("#res_button").append("<div><input type='button' value='예약변경' id='change'><input type='button' value='예약취소' id='cancel'></div>");#
				$("#res_button").append("<div class='btns'><input type='button' value='예약변경' id='change'><input type='button' value='예약취소' id='cancel'></div>");
				$('#change').click(function() {
					location.href="/reservation_updateForm";
				});//예약변경 클릭
				$('#cancel').click(function() {
					window.open("/pass_chk?resnum="+data.resnum, "reservation_delete", "width=400px, height=400px");
				});//예약취소 클릭
			}else if(parseInt(Dday) >= 0) {
				$("#reserve_stat").append("<div class='title'>예약 가능일입니다.</div><div><input class='res_btn' type='button' value='예약하러가기' id='reservation'></div>")
				$('#reservation').click(function() {
					location.href="/mapform";
				});//예약하기 클릭
			}else {
				$("#reserve_stat").append("<tr><td>예약내역이 없습니다.</td></tr>")
			}
		});//ajax
	});//ready
</script>
<%@ include file="../includes/footer.jsp" %>
