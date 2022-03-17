<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>
	      <div class="main">

	      	<div>

	<div class="mypage_h">
	<h6 class="heading underline font-x2" id="h6_login">나의 헌혈 정보</h6>
	</div>
<div class="contents">

	      			<div class="main_left">
	      			<div class="top_left"><div class="title">예약대기: </div><div class="content" id="res_count"></div></div>
	      			</div>
	      			<div class="main_right">
					<div class="top_right"><div class="title">오늘 헌혈예정: </div><div class="content" id="today_count"></div></div>
					</div>
</div>
<div class="contents_1">
<h6 class="heading underline font-x2" id="h6_login">혈액 보유량</h6>
</div>
<div class="res_center">
    				<div id="blood_count"></div>
</div>

</div>

	</div>
		</div>
  </section>
  <!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#res_count").append("<a href='/empres'>" + "${resCount}" + "명</a>")
		$("#today_count").append("<a href='/today_res'>" + "${todayCount}" + "명</a>")
		$("#blood_count").append("<div class='stat_bottom'><div class='title_bottom'>A</div><div class='content_bottom'>"+"${A}"+"</div></div>" +
								 "<div class='stat_bottom'><div class='title_bottom'>B</div><div class='content_bottom'>"+"${B}"+"</div></div>" +
								 "<div class='stat_bottom'><div class='title_bottom'>O</div><div class='content_bottom'>"+"${O}"+"</div></div>" +
								 "<div class='stat_bottom'><div class='title_bottom'>AB</div><div class='content_bottom'>"+"${AB}"+"</div></div>");
		
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>