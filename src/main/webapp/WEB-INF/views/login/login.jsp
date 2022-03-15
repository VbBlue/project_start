<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../includes/header.jsp" %>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>



/* 아이디/비밀번호 찾기 누르면 팝업창  */

$(function(){
	$("#findid").click(function() {
		window.open("/findidform", "findid", "width=400px, height=400px, left=100, top=50");
	});
	$("#findpw").click(function() {
		window.open("/findpwform", "findpw", "width=400px, height=400px, left=100, top=50");
	});
})
</script>



<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
	<h6 class="heading underline font-x2" id='h6_login' style="font-size:4vw;">로그인
</h6><br>



<!-- method에 get을 쓰면 url에 쿼리문으로 전송되며 post쓰는경우는 url + #으로 전송 -->

<div class='wrap'>

<form:form action="login" method="post" modelAttribute="command">
<form:errors element="div"/>


		<div class="login_main">
		<div class="login_main_left">



		<label for = "username">아이디</label>
		<div class= "center1"><input type='text' id='username' name='userid' placeholder='아이디 입력'><br>
		</div>

		<label for = "password">비밀번호</label>
		<div class= "center1"><input type='password' id='password' name='userpw' placeholder='비밀번호 입력'><br>
		</div>



	</div>

	<div class="login_button">
		<input type="submit" value="로그인" ></div>
</div>




	<div class= "find_button">
		<div class="button2">
		<input type="button" id="findid" value="아이디찾기" ></div>

		<div class="button2">
		<input type="button" id="findpw" value="비밀번호찾기"></div>
</div>

</form:form>





</div>
</div>
</section>
</div>
<%@ include file="../includes/footer.jsp" %>
