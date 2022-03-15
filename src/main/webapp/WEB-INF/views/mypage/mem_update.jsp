<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
<%@ include file="../mypage/mypage_menu.jsp" %>
	<div class="update_main">
      <form action="/mem_update" method="post">
      	<input value="${user.userid}" name="userid">
      	<input value="${user.userpw}" name="userpw">
      	<input value="${user.username}" name="username">
      	<input value="${user.userphone}" name="userphone">
      	<input value="${user.useremail}" name="useremail">
      	<input value="${user.userbtype}" name="userbtype">
      	<input value="${user.userbirth}" name="userbirth">
      	<input value="${user.useraddr}" name="useraddr">
      	<input type="hidden" value="${user.bcount}" name="bcount">
      	<input type="hidden" value="${user.point}" name="point">
      	<input type="submit" value="개인정보변경">
      </form>
     </div>
    </div>
  </section>
</div>
<%@ include file="../includes/footer.jsp" %>