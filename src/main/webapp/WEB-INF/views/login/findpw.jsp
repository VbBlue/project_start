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
			alert("���̵� �Է����ּ���");
			return;
		}


	if (frm.username.value.length < 1) {
			$("#username").focus();
			alert("�̸��� �Է����ּ���");
			return;
		}

		frm.method = "post";
		frm.action = "findpw"; //�Ѿȭ��
		frm.submit();
	}
</script>



<script>
$(function(){
	$("#userid").blur(function(){
		if(! $("#userid").val()){
			$("#uid").text(" ���̵� �Է��� �ּ��� ");
			return false;
		}
	}); //blur

	$("#username").blur(function(){
		if(! $("#username").val()){
			$("#uname").text(" �̸��� �Է��� �ּ��� ");
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
      <h6 class="heading underline font-x2">��й�ȣ ã��</h6>


<form:form action="findpw" method="post" modelAttribute="command" name="pwfindscreen" >
<form:errors element="div"/>


		<section class = "form-search">
			<div class = "findpw">
				<label>���̵�</label>
				<input type="text" name="userid" id="userid" class = "btn-name" placeholder = "Please enter your ID.">
				<span id = "uid"></span>
			<br>
			</div>


			<br>
			<div class = "findname">
				<label>�̸�</label>
				<input type="text" name="username" id="username" class = "btn-email" placeholder = "Please enter your EMAIL.">
				<span id = "uname"></span>
			</div>

			<br>
	</section>
	<div class ="btnSearch">

	<input type="button" name="enter" value="ã��"  onClick="pwsearch()">
 	<input type="button" name="cancel" value="���" id="cancel">
 	</div>

 </form:form>
</div>
</section>
</div>

<%-- <%@ include file="../includes/footer.jsp" %> --%>