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
			alert("���̵� �Է����ּ���");
			return;
		}


	if (frm.empname.value.length < 1) {
			$("#empname").focus();
			alert("�̸��� �Է����ּ���");
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
			$("#eid").text(" ���̵� �Է��� �ּ��� ").css("color","red");
			return false;
		}
	}); //blur

	$("#empname").blur(function(){
		if(! $("#empname").val()){
			$("#ename").text(" �̸��� �Է��� �ּ��� ").css("color","red");
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
      <h6 class="heading underline font-x2" id="h6_login">��й�ȣ ã��</h6>


<form:form action="findemppw" method="post" modelAttribute="command" name="pwfindscreen" >
<form:errors element="div"/>


			<div class = "find_button">
				<label for = "empid">���̵�</label>
				<div class="find_button1">
				<input type="text" name="empid" id="empid" placeholder = "���̵� �Է�">

				</div>
				<span id="eid"></span><br><br>



				<label for = "username">�̸�</label>
				<div class="find_button1">
				<input type="text" name="empname" id="empname"  placeholder = "�̸� �Է�">
				</div>
				<span id = "ename"></span>
			</div>

			<br>

	<div class="find_button">
	<div class="popup_button">
		<input type="button" name="enter" value="ã��"  onClick="pwsearch()"></div>

 	<div class="popup_button">
 		<input type="button" name="cancel" value="���" id="cancel"></div>

 	</div>

 </form:form>
</div>
</section>
</div>


