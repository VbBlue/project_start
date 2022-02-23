<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">사용자 회원가입</h6>
      <div>
      <form action="../usersignup" method="post">
      	<div>
      		<h3>
      			<label for="userid">아이디</label>
      		</h3>
      		<span>
      			<input type="text" id="userid" name="userid" maxlength="15">
      		</span>
      		<span class="error_next_box" id="error_id" style="color:red;">
      		</span>
      		<h3>
      			<label for="userpw">비밀번호</label>
      		</h3>
      		<span>
      			<input type="password" id="userpw" name="userpw" maxlength="15">
      		</span>
      		<span class="error_next_box" id="error_pw" style="color:red;">
      		</span>
      		<h3>
      			<label for="userpw2">비밀번호확인</label>
      		</h3>
      		<span>
      			<input type="password" id="userpw2" name="userpw2">
      		</span>
      		<span class="error_next_box" id="error_pw2" style="color:red;">
      		</span>
      		<h3>
      			<label for="username">이름</label>
      		</h3>
      		<span>
      			<input type="text" id="username" name="username" maxlength="4">
      		</span>
      		<span class="error_next_box" id="error_name" style="color:red;">
      		</span>
      		<h3>
      			<label for="userphone">전화번호</label>
      		</h3>
      		<span>
      			<input type="text" id="userphone" name="userphone" maxlength="13">
      		</span>
      		<span class="error_next_box" id="error_phone" style="color:red;">
      		</span>
      		<h3>
      			<label for="useremail">이메일</label>
      		</h3>
      		<span>
      			<input type="text" id="useremail" name="useremail">
      		</span>
      		<span class="error_next_box" id="error_email" style="color:red;">
      		</span>
      		<h3>
      			<label for="userbtype">혈액형</label>
      		</h3>
      		<span>
      			<label for="userbtype_A">A형</label>
      			<input type="radio" class="btype-check" id="userbtype_A" name="userbtype" value="A">
      			<label for="userbtype_O">O형</label>
      			<input type="radio" class="btype-check" id="userbtype_O" name="userbtype" value="O">
      			<label for="userbtype_B">B형</label>
      			<input type="radio" class="btype-check" id="userbtype_B" name="userbtype" value="B">
      			<label for="userbtype_AB">AB형</label>
      			<input type="radio" class="btype-check" id="userbtype_AB" name="userbtype" value="AB">
      		</span>
      		<span class="error_next_box" id="error_btype" style="color:red;">
      		</span>
      		<h3>
      			<label for="userbirth">생년월일</label>
      		</h3>
      		<span>
      			<input type="date" id="userbirth" name="userbirth">
      		</span>
      		<span class="error_next_box" id="error_birth" style="color:red;">
      		</span>
      		<h3>
      			<label for="useraddr">주소</label>
      		</h3>
      		<span>
      			<input type="text" id="useraddr" name="useraddr">
      		</span>
      		<span class="error_next_box" id="error_addr" style="color:red;">
      		</span>
      		<input type="submit" id="usersignup" value="회원가입">
      	   </div>
      	</form>
      </div>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<script>
$(function(){
	$("input#userid").keyup(function(){
		$("#error_id").empty();
		let userid = $("input#userid").val();
		let idcheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,15}$/;
		if(userid == ""){
			$("#error_id").append("아이디를 입력해주세요")
		}
		else{
			$.ajax({url:"/useridcheck", data:"userid="+userid, dataType:"text"}
			).done(function(data){
				if(data >= 1){
					$("#error_id").append("중복된 아이디가 존재합니다.")
				}else{
					if(idcheck.test(userid)){
						$("#error_id").append("사용 가능한 아이디입니다.")
					}
					else{
						$("#error_id").append("아이디는 영문 대소문자, 숫자를 포함하여 5~12자리 사이로 입력")
					}
				}
			})
		}
	}) //$("#userphone").keyup(function() 종료
	
	/* $("input#userid").keyup(function(){
		$("#error_id").empty();
		let userid = $("input#userid").val();
		let idcheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,15}$/;
		if(idcheck.test(userid)){
			$("#error_id").append("")
		}
		else{
			$("#error_id").append("아이디는 영문 대소문자, 숫자를 포함하여 5~12자리 사이로 입력")
		}
	}) */
	
	$("#userpw2").keyup(function(){
		$("#error_pw2").empty();
		let userpw1 = $("#userpw").val();
		let userpw2 = $("#userpw2").val();
		if(userpw1 != userpw2){
			$("#error_pw2").append("비밀번호가 일치하지 않습니다.")
		}else{
			$("#error_pw2").append("비밀번호가 일치합니다.")
		}
	})
	
	$("#username").keyup(function(){
		$("#error_name").empty();
		let username = $("#username").val();
		let namecheck = /[가-힣]+/;
		if(namecheck.test(username)){
			$("#error_name").append("");
		}else{
			$("#error_name").append("이름은 한글만 입력 가능합니다.");
		}
	})
	
	$(document).on("keyup", "#userphone", function()
			{ $(this).val(
					$(this).val()
					.replace(/[^0-9]/g, "")
					.replace(/(^010)([0-9]{4})?([0-9]{4})$/,"$1-$2-$3")
					.replace("--", "-") ); 
			});
	
	$("input#userphone").blur(function(){
		$("#error_phone").empty();
		var userphone = $("input#userphone").val();
		var phcheck = /(^010)-([0-9]{4})-?([0-9]{4})$/;
		if(phcheck.test(userphone)){
			$("#error_pw2").append("")
		}
		else{
			$("#error_phone").append("010-xxxx-xxxx")
		}
	})
});

</script>
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>