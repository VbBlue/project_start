<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
<%@ include file="../mypage/mypage_menu.jsp" %>
      <div class="update_main">
      <form action="/reservation_update" method="post">
      	<input value="${res.bhname}" name="bhname">
      	<input value="${res.userid}" name="userid">
      	<input value="${res.resdate}" name="resdate">
      	<input value="${res.restime}" name="restime">
      	<input value="${res.goods}" name="goods">
      	<input value="${res.bhselect}" name="bhselect">
      	<input value="${res.resnum}" name="resnum">
      	<input value="${res.resstate}" name="resstate">
      	<input type="submit" value="예약변경">
      </form>
      </div>
    </div>
  </section>
 </div>
<%@ include file="../includes/footer.jsp" %>