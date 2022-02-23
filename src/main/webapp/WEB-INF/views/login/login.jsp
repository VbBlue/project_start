<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../includes/header.jsp" %>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#findid").click(function() {
		window.open("/findidform", "findid", "width=400px, height=400px");
	});
	$("#findpw").click(function() {
		window.open("/findpwform", "findpw", "width=400px, height=400px");
	});
})
</script>



<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">로그인</h6>





<div class='wrap'>
<form:form action="login" method="post" modelAttribute="command">
<form:errors element="div"/>

		<label for = "username"> 아이디
        <input type='text' id='username' name='userid' placeholder='Please enter your ID.'></label><br>

        <label for = "password"> 비밀번호
        <input type='password' id='password' name='userpw' placeholder='Please enter your password.'></label><br>
		<input type="submit" value="login">


</form:form>

	<a href="/signup">회원가입</a>
	<input type="button" id="findid" value="아이디찾기">
	<input type="button" id="findpw" value="비밀번호찾기">
<!-- 	<a href="/findidform">아이디 찾기</a>
	<a href="/findpwform">비번 찾기</a>

 -->
</div>
</div>
</section>
</div>


<%@ include file="../includes/footer.jsp" %>