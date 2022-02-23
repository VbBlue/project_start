<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <%@ include file="../includes/header.jsp" %> --%>

<style>
	#input , #result { display: none}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>




<script>
function pwsearch() {
 	var frm = document.pwfindscreen;


	if (frm.userid.value.length < 1) {
			$("#userid").focus();
			alert("아이디를 입력해주세요");
			return;
		}


	if (frm.username.value.length < 1) {
			$("#username").focus();
			alert("이름을 입력해주세요");
			return;
		}

		frm.method = "post";
		frm.action = "findpw"; //넘어간화면
		frm.submit();
	}
</script>



<script>
$(function(){
	$("#userid").blur(function(){
		if(! $("#userid").val()){
			$("#uid").text(" 아이디를 입력해 주세요 ");
			return false;
		}
	}); //blur

	$("#username").blur(function(){
		if(! $("#username").val()){
			$("#uname").text(" 이름을 입력해 주세요 ");
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
      <h6 class="heading underline font-x2">비밀번호 찾기</h6>


<form:form action="findpw" method="post" modelAttribute="command" name="pwfindscreen" >
<form:errors element="div"/>


		<section class = "form-search">
			<div class = "findpw">
				<label>아이디</label>
				<input type="text" name="userid" id="userid" class = "btn-name" placeholder = "Please enter your ID.">
				<span id = "uid"></span>
			<br>
			</div>


			<br>
			<div class = "findname">
				<label>이름</label>
				<input type="text" name="username" id="username" class = "btn-email" placeholder = "Please enter your EMAIL.">
				<span id = "uname"></span>
			</div>

			<br>
	</section>
	<div class ="btnSearch">

	<input type="button" name="enter" value="찾기"  onClick="pwsearch()">
 	<input type="button" name="cancel" value="취소" id="cancel">
 	</div>

 </form:form>
</div>
</section>
</div>

<%-- <%@ include file="../includes/footer.jsp" %> --%>