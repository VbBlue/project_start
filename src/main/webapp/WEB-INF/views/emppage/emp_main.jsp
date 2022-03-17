<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>

    	<div class="main_emp">
    		<div class="main_emp_l">
    			<div class="main_emp_s">
    				<label for="res_count">예약대기:</label>
    				<input type="text" id="res_count"></div>


    			<div class="main_emp_s">
    				<label for="today_count">오늘 헌혈예정: </label>
    				<input type="text" id="today_count"></div>
				</div>


    			<div class="main_emp_s">
    				<label for="blood_count">혈액 보유량: </label>
    				<input type="text" id="blood_count"></div>
    			</div>
    		</div>

  </section>
  </div>
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


	});//ready
</script>

<%@ include file="../includes/footer.jsp" %>