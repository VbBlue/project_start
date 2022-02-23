<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">관리자 회원가입</h6>
      <div>
      <form action="../empsignup" method="post">
      	<div>
      		<h3>
      			<label for="empid">아이디</label>
      		</h3>
      		<span>
      			<input type="text" id="empid" name="empid">
      			<button type="button" id="idcheck">아이디 중복확인</button>
      		</span>
      		<span class="error_next_box" id="error_id" style="color:red;">
      		</span>
      		<h3>
      			<label for="emppw">비밀번호</label>
      		</h3>
      		<span>
      			<input type="password" id="emppw" name="emppw">
      		</span>
      		<span class="error_next_box" id="error_pw" style="color:red;">
      		</span>
      		<h3>
      			<label for="emppw2">비밀번호확인</label>
      		</h3>
      		<span>
      			<input type="password" id="emppw2" name="emppw2">
      		</span>
      		<span class="error_next_box" id="error_pw2" style="color:red;">
      		</span>
      		<h3>
      			<label for="empname">이름</label>
      		</h3>
      		<span>
      			<input type="text" id="empname" name="empname">
      		</span>
      		<span class="error_next_box" id="error_name" style="color:red;">
      		</span>
      		<h3>
      			<label for="empphone">전화번호</label>
      		</h3>
      		<span>
      			<input type="text" id="empphone" name="empphone">
      		</span>
      		<span class="error_next_box" id="error_phone" style="color:red;">
      		</span>
      		<h3>
      			<label for="empemail">이메일</label>
      		</h3>
      		<span>
      			<input type="text" id="empemail" name="empemail">
      		</span>
      		<span class="error_next_box" id="error_email" style="color:red;">
      		</span>
      		<h3>
      			<label for="empbirth">생년월일</label>
      		</h3>
      		<span>
      			<input type="date" id="empbirth" name="empbirth">
      		</span>
      		<span class="error_next_box" id="error_birth" style="color:red;">
      		</span>
      		<h3>
      			<label for="empbhname">근무 헌혈의집 명</label>
      		</h3>
      		<span>
      			<input type="text" id="bhname" name="bhname">
      		</span>
      		<span class="error_next_box" id="error_bhname" style="color:red;">
      		</span>
      		<input type="submit" id="empsignup" value="회원가입">
      	</div>
      	</form>
      </div>
    </div>
  </section>
</div>
<!-- ################################################################################################ -->
<script>
$(function(){
	$("button#idcheck").click(function(){
		$("#error_id").empty();
		let empid = $("input#empid").val();
		if(empid == ""){
			$("#error_id").append("아이디를 입력해주세요")
		}
		else{
			$.ajax({url:"/empidcheck", data:"empid="+empid, dataType:"text"}
			).done(function(data){
				if(data >= 1){
					$("#error_id").append("중복된 아이디가 존재합니다.")
				}else{
					$("#error_id").append("사용 가능한 아이디입니다.")
				}
			})
		}
	}) // $("button#idcheck").click(function() 종료
			
	$("#emppw2").keyup(function(){
		$("#error_pw2").empty();
		let emppw1 = $("#emppw").val();
		let emppw2 = $("#emppw2").val();
		if(emppw1 != emppw2){
			$("#error_pw2").append("비밀번호가 일치하지 않습니다.")
		}else{
			$("#error_pw2").append("비밀번호가 일치합니다.")
		}
	})
});

</script>
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>