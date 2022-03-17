<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>
    	
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
		
		
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>