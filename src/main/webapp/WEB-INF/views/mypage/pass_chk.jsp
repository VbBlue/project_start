<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="from" target="param">
	<label for='pass'>비밀번호 입력: </label>
	<input type='password' id='pass'><br>
	<input type="submit" value='확인' id="btn"><br>
	<span id="result"></span>
</form>
<iframe name="param" style="width:0px; height:0px; border:0px;">
</iframe>

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
</body>
</html>