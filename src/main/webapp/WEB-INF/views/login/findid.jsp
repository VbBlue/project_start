<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>


/* 아이디랑 비밀번호 입력하지 않고 찾기 버튼 누르면 alert 창 띄우기. */

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

	window.opener.name="parentPage";
	document.idfindscreen.target="parentPage";

	frm.submit();
	window.close();




	/* method: 사용자가 입력한 내용을 서버 쪽 프로그램을 어떤 방식으로 넘겨줄 것인지 지정한다.
	'post': 입력한 내용의 길이에 제한받지 않고 사용자가 입력한 내용도 드러나지 않는다.*/
	/* frm.method = "post"; */
	/* 'action': 태그 안의 내용을처리해 줄 서버프로그램을 지정한다.*/
	/* frm.action = "findid"; */
	/* frm.submit(); */


}


/* 아이디랑 비밀번호 입력하지 않았을때 blur처리 */

$(function() {
	/* 'blur': 폼 요소에 포커스를 잃었을 때 이벤트 발생  */
	$("#username").blur(function() {
		if (!$("#username").val()) {
			$("#uname").text(" 이름을 입력해 주세요 ").css("color", "red");
			return false;
		}
	});//blur

	$("#useremail").blur(function() {
		if (!$("#useremail").val()) {
			$("#uemail").text(" 이메일을 입력해 주세요 ").css("color", "red");
			return false;
		}
	});//blur


}) ///ready
</script>




<div class="wrapper row2">
	<section class="container clear">
	<div class="center btmspace-80">
	<h6 class="heading underline font-x2" id="h6_login">아이디 찾기</h6>


<form:form action="findid" method="post" modelAttribute="command" name="idfindscreen" >
<form:errors element="div"/>


					<div class="find_button">
						<label for = "username">이름</label>
						<div class="find_button1">
							<input type="text" name="username" id="username"  placeholder="이름 입력" >

						</div>
						<span id="uname"></span><br><br>



						<label for = "useremail">이메일</label>
						<div class="find_button1">
						<input type="email" name="useremail" id="useremail"  placeholder="이메일 입력" >
						</div>
						<span id="uemail"></span>
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
