<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function() {
		$("#btn").click(function() {
			if($("#pass").val() != "${user.userpw}") {
				$("#pass").val('');
				$("#result").html("비밀번호 다름");
			}else {
				if(self.name=="mem_update") {
					opener.location.href = "/mem_updateForm";
					self.close();
				}else if(self.name=="mem_delete") {
					opener.location.href = "/mem_delete"
					self.close();
				}else if(self.name=="reservation_delete") {
					opener.location.href = "/reservation_delete"+location.search+"&userid="+"${user.userid}"
					self.close();
				}
			}
		});//버튼 클릭
	});//ready
</script>



<div class="wrapper row2">
	<section class="container clear">
	<div class="center btmspace-80">
	<h6 class="heading underline font-x2" id="h6_login">비밀번호 입력</h6>


<form id="from" target="param">

<div class="chk_inp">
	<input type='password' id='pass'>
	</div>

	<div class="chk_btn">
	<input type="submit" value='확인' id="btn"><br>
	</div>
	<span id="result"></span>
</form>
<iframe name="param" style="width:0px; height:0px; border:0px;">
</iframe>

</div>
</section>
</div>
