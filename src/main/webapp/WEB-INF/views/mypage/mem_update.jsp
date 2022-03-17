<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
<section class="hoc container clear">
<div class="center btmspace-80">
<%@ include file="../mypage/mypage_menu.jsp" %>

<div class="update_center">
<h6 class="heading underline font-x2">개인 정보 변경</h6>

      <form action="/mem_update" method="post">
		<div class="update_main">

      <div class="update_mem_div">

      <div class="update_mem_left">
      	<label for="userid">아이디</label>
      	<input value="${user.userid}" name="userid" class="update_input">
		</div>

      <div class="update_mem_left">
      	<label for="userpw">비밀번호</label>
      	<input value="${user.userpw}" name="userpw" class="update_input">
		</div>

      <div class="update_mem_left">
      	<label for="username">이름</label>
      	<input value="${user.username}" name="username" class="update_input">
		</div>

      <div class="update_mem_left">
      	<label for="userphone">전화번호</label>
      	<input value="${user.userphone}" name="userphone" class="update_input">
	</div>


      <div class="update_mem_left">
      	<label for="useremail">이메일</label>
      	<input value="${user.useremail}" name="useremail" class="update_input">
</div>


      <div class="update_mem_left">
      	<label for="userbtype">혈액형</label>
      	<input value="${user.userbtype}" name="userbtype" class="update_input">
</div>


      <div class="update_mem_left">
      	<label for="userbirth">생년월일</label>
      	<input value="${user.userbirth}" name="userbirth" class="update_input">
</div>

      <div class="update_mem_left">
      	<label for="useraddr">주소</label>
      	<input value="${user.useraddr}" name="useraddr" class="update_input">
      </div>
      </div>







</div>
<div class="update_btn">
<input type="submit" value="개인정보변경" >
</div>
</form>
     </div>
    </div>
  </section>
</div>
<%@ include file="../includes/footer.jsp" %>