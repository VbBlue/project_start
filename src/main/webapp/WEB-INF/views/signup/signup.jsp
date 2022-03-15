<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">

	<h6 class="heading underline font-x2" id='h6_login' style="font-size:4vw;">회원가입</h6><br>

<!--       <a href="/empsignupform">관리자 회원가입</a><br>
      <a href="/usersignupform">일반 사용자 회원가입</a> -->

		<br>
      <div class="button2">
		<input type="button" id="joinform" value="관리자 회원가입" onclick="location.href='empsignupform'"></div>



      <div class="button2">
		<input type="button" id="joinform" value="일반 사용자 회원가입" onclick="location.href='usersignupform'"></div>

    </div>
  </section>
</div>
<%@ include file="../includes/footer.jsp" %>
