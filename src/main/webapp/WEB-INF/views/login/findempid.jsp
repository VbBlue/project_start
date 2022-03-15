<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>

function idsearch() {
	var frm = document.idfindscreen;
	if (frm.empname.value.length < 1) {
		$("#empname").focus();
		alert("이름을 입력해주세요");
		return;
	}

	if (frm.empemail.value.length < 1) {
		$("#empemail").focus();
		alert("이메일을 입력해주세요");
		return;
	}

	window.opener.name="parentPage";
	document.idfindscreen.target="parentPage";

	frm.submit();
	window.close();


}



$(function() {
	/* 'blur': 폼 요소에 포커스를 잃었을 때 이벤트 발생  */
	$("#empname").blur(function() {
		if (!$("#empname").val()) {
			$("#ename").text(" 이름을 입력해 주세요 ").css("color", "red");
			return false;
		}
	});//blur

	$("#empemail").blur(function() {
		if (!$("#empemail").val()) {
			$("#eemail").text(" 이메일을 입력해 주세요 ").css("color", "red");
			return false;
		}
	});//blur


}) ///ready
</script>




<div class="wrapper row2">
	<section class="hoc container clear">
	<div class="center btmspace-80">
	<h6 class="heading underline font-x2" id="h6_login">아이디 찾기</h6>

<form:form action="findempid" method="post" modelAttribute="command" name="idfindscreen" >
<form:errors element="div" />


		<div class="find_button">
			<label for = "empname">이름</label>
			<div class="find_button1">
				<input type="text" name="empname" id="empname" placeholder="이름 입력" >
			</div>
			<span id="ename"></span> <br><br>


			<label for = "useremail">이메일</label>
			<div class="find_button1">
			<input type="email" name="empemail" id="empemail"  placeholder="이메일 입력" >
			</div>
			<span id="eemail"></span>
		</div>

		<br>



			<!-- 버튼  -->

		<div class="find_button">
		<div class="popup_button">
			<input type="button" name="enter" id="enter" value="찾기" onClick="idsearch()"></div>

		<div class="popup_button">
			<input type="button" name="cancel" id="cancel" value="취소" onclick="window.close();"></div>


				</div>


			</form:form>
		</div>
	</section>
</div>
