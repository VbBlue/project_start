<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <%@ include file="../includes/header.jsp" %>
 --%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function idsearch() {
 	var frm = document.idfindscreen;

 	if (frm.username.value.length < 1) {
		$("#username").focus();
	  alert("이름을 입력해주세요");
	  return;
	 }

	 if (frm.useremail.value.length < 1) {
		 $("#useremail").focus();
		  alert("이메일을 입력해주세요");
		  return;
	 }

 frm.method = "post";
 frm.action = "findid"; //넘어간화면
 frm.submit();
 
 }

</script>


<script>
$(function(){
	 $("#username").blur(function(){
		if(! $("#username").val()){
			$("#uname").text(" 이름을 입력해 주세요 ");
			return false;
		}
	});//blur

	 $("#useremail").blur(function(){
			if(! $("#useremail").val()){
				$("#uemail").text(" 이메일을 입력해 주세요 ");
				return false;
			}
		});//blur

	$("#cancel").click(function(){
		self.close();
	})
}) ///ready

</script>

<div class="wrapper row2">
	<section class="hoc container clear">
		<div class="center btmspace-80">
			<h6 class="heading underline font-x2">아이디찾기</h6>
			<form:form action="findid" method="post" modelAttribute="command"
				name="idfindscreen">
				<form:errors element="div" />


				<section class="form-search">
					<div class="findid">
						<label>이름</label> <input type="text" name="username" id="username"
							class="btn-name" placeholder="Please enter your NAME.">
						<span id="uname"></span> <br>
					</div>


					<br>
					<div class="findemail">
						<label>이메일</label> <input type="email" name="useremail"
							id="useremail" class="btn-email"
							placeholder="Please enter your EMAIL."> <span id="uemail"></span>
					</div>


					<br>
				</section>
				<div class="btnSearch">
					<br> <input type="button" name="enter" value="찾기"
						onClick="idsearch()"> <input type="button" name="cancel"
						value="취소" id="cancel">
				</div>

			</form:form>
		</div>
	</section>
</div>

<%-- <%@ include file="../includes/footer.jsp" %> --%>