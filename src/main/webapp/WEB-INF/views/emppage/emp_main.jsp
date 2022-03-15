<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">관리자페이지</h6>
    	<div>
    		<ul>
    			<li><input type="button" id="reservation" value="예약내역"></li>
    			<li><input type="button" id="today_res" value="헌혈예정"></li>
    			<li><input type="button" id="bloodlist" value="헌혈내역"></li>
    			<li><input type="button" id="board" value="공지사항"></li>
    			<li><input type="button" id="setting" value="영업시간 설정"></li>
    		</ul>
    	</div>
    	<div>
    		<table>
    			<tr>
    				<td>예약대기: </td>
    				<td id="res_count"></td>
    			</tr>
    			<tr>
    				<td>오늘 헌혈예정: </td>
    				<td id="today_count"></td>
    			</tr>
    			<tr>
    				<td>혈액 보유량: </td>
    				<td id="blood_count"></td>
    			</tr>
    		</table>
    	</div>
	</div>
  </section>
  <!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#res_count").append("<a href='/empres'>" + "${resCount}" + "명</a>")
		$("#today_count").append("<a href='/today_res'>" + "${todayCount}" + "명</a>")
		$("#blood_count").append("A: " + "${A}" + "<br>" + 
								 "B: " + "${B}" + "<br>" +
								 "O: " + "${O}" + "<br>" +
								 "AB: " + "${AB}")
		
		$("#reservation").click(function () {
			location.href = "/empres";
		});//예약내역 클릭
		$("#today_res").click(function () {
			location.href = "/today_res";
		});//헌혈예정 클릭
		$("#bloodlist").click(function () {
			location.href = "/empblist";
		});//헌혈내역 클릭
		$("#board").click(function () {
			location.href = "/empboard";
		});//공지사항 클릭
		$("#setting").click(function () {
			location.href = "/empset";
		});//시간설정 클릭
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>