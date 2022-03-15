<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <%@ include file="../includes/header.jsp" %> --%>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<style>
	#input , #result { display: none}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
function pwsearch() {
 	var frm = document.pwfindscreen;


	if (frm.empid.value.length < 1) {
			$("#empid").focus();
			alert("아이디를 입력해주세요");
			return;
		}


	if (frm.empname.value.length < 1) {
			$("#empname").focus();
			alert("이름을 입력해주세요");
			return;
		}

	window.opener.name="parentPage";
	document.pwfindscreen.target="parentPage";

	frm.submit();
	window.close();

	}

$(function(){
	$("#empid").blur(function(){
		if(! $("#empid").val()){
			$("#eid").text(" 아이디를 입력해 주세요 ").css("color","red");
			return false;
		}
	}); //blur

	$("#empname").blur(function(){
		if(! $("#empname").val()){
			$("#ename").text(" 이름을 입력해 주세요 ").css("color","red");
			return false;
		}
	}); //blur

	$("#cancel").click(function(){
		self.close();
	})

})
</script>


<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2" id="h6_login">비밀번호 찾기</h6>


<form:form action="findemppw" method="post" modelAttribute="command" name="pwfindscreen" >
<form:errors element="div"/>


			<div class = "find_button">
				<label for = "empid">아이디</label>
				<div class="find_button1">
				<input type="text" name="empid" id="empid" placeholder = "아이디 입력">

				</div>
				<span id="eid"></span><br><br>



				<label for = "username">이름</label>
				<div class="find_button1">
				<input type="text" name="empname" id="empname"  placeholder = "이름 입력">
				</div>
				<span id = "ename"></span>
			</div>

			<br>

	<div class="find_button">
	<div class="popup_button">
		<input type="button" name="enter" value="찾기"  onClick="pwsearch()"></div>

 	<div class="popup_button">
 		<input type="button" name="cancel" value="취소" id="cancel"></div>

 	</div>

 </form:form>
</div>
</section>
</div>


