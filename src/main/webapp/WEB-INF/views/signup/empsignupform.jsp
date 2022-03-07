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
      			<input type="text" id="empid" name="empid" maxlength="15">
      		</span>
      		<span class="error_next_box" id="error_id" style="color:red;">
      		</span>
      		<h3>
      			<label for="emppw">비밀번호</label>
      		</h3>
      		<span>
      			<input type="password" id="emppw" name="emppw" maxlength="15">
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
      			<input type="text" id="empname" name="empname" maxlength="4">
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
      			<input type="text" id="empbirth" name="empbirth" maxlength="6">
      		</span>
      		<span class="error_next_box" id="error_birth" style="color:red;">
      		</span>
      		<h3>
      			<label for="empbhname">근무 헌혈의집 명</label>
      		</h3>
      		<span>
      			<input type="text" id="bhname" name="bhname" readonly>
      			<input type="button" id="findbh" value="헌혈의 집 검색">
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
	var idpattern = false;
	var idover = false;
	var pwpattern = false;
	var pw2pattern = false;
	var namepattern = false;
	var phonepattern = false;
	var emailpattern = false;
	var birthpattern = false;
	
	$("input#empid").keyup(function(){
		$("#error_id").empty();
		let empid = $("input#empid").val();
		let idcheck = /^(?=.*[A-Za-z])(?=.*\d)?[A-Za-z\d]{5,15}$/;
		if(empid == ""){
			idover = false;
			idpattern = false;
			$("#error_id").append("아이디를 입력해주세요")
		}
		else{
			$.ajax({url:"/empidcheck", data:"empid="+empid, dataType:"text"}
			).done(function(data){
				if(data >= 1){
					idpattern = false;
					idover = true;
					$("#error_id").append("중복된 아이디가 존재합니다.")
				}else{
					if(idcheck.test(empid)){
						idpattern = false;
						idover = false;
						$("#error_id").append("사용 가능한 아이디입니다.")
					}
					else{
						idpattern = true;
						idover = false;
						$("#error_id").append("아이디는 영문 대소문자, 숫자를 포함하여 5~12자리 사이로 입력")
					}
				}
			})
		}
	}) //$("#userphone").keyup(function() 종료
			
	$("input#emppw").keyup(function(){
		$("#error_pw").empty();
		var emppw = $("input#emppw").val();
		var pwcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
		if(emppw==""){
			pwpattern = false;
			$("#error_pw").append("비밀번호를 입력해주세요")
		}
		else{
			if(pwcheck.test(emppw)){
				pwpattern = false;
				$("#error_pw").append("")
			}
			else{
				pwpattern = true;
				$("#error_pw").append("비밀번호는 문자, 숫자, 특수문자를 포함하여 작성해주세요(최소 8 최대 15)")
			}
		}
	})
			
	
	$("#emppw2").keyup(function(){
		$("#error_pw2").empty();
		let emppw = $("#emppw").val();
		let emppw2 = $("#emppw2").val();
		if(emppw != emppw2){
			pw2pattern = true;
			$("#error_pw2").append("비밀번호가 일치하지 않습니다.")
		}else{
			pw2pattern = false;
			$("#error_pw2").append("비밀번호가 일치합니다.")
		}
	})
	
	$("#empname").keyup(function(){
		$("#error_name").empty();
		let empname = $("#empname").val();
		let namecheck = /[가-힣]+/;
		if(empname ==""){
			namepattern = false;
			$("#error_name").append("이름을 입력해주세요");
		}
		else{
			if(namecheck.test(empname)){
				namepattern = false;
				$("#error_name").append("");
			}else{
				namepattern = true;
				$("#error_name").append("이름은 한글만 입력 가능합니다.");
			}
		}
	})
	
	$(document).on("keyup", "#empphone", function()
			{ $(this).val(
					$(this).val()
					.replace(/[^0-9]/g, "")
					.replace(/(^010)([0-9]{4})?([0-9]{4})$/,"$1-$2-$3")
					.replace("--", "-") ); 
			});
	
	$("input#empphone").keyup(function(){
		$("#error_phone").empty();
		var empphone = $("input#empphone").val();
		var phcheck = /(^010)([0-9]{4})+([0-9]{4})$/;
		if(empphone ==""){
			phonepattern = false;
			$("#error_phone").append("전화번호를 입력해주세요")
		}
		else{
			if(phcheck.test(empphone)){
				phonepattern = false;
				$("#error_phone").append("")
			}
			else{
				phonepattern = true;
				$("#error_phone").append("010-xxxx-xxxx")
			}
		}
	})
	$("input#empemail").keyup(function(){
		$("#error_email").empty();
		var empemail = $("input#empemail").val();
		var emailcheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/i;
		if(empemail ==""){
			emailpattern = false;
			$("#error_email").append("이메일을 입력해주세요")
		}
		else{
			if(emailcheck.test(empemail)){
				emailpattern = false;
				$("#error_email").append("")
			}
			else{
				emailpattern = true;
				$("#error_email").append("이메일 형식을 확인해주세요")
			}
		}
	})
	$("input#empbirth").keyup(function(){
		$("#error_birth").empty();
		var empbirth = $("input#empbirth").val();
		var birthcheck = /^[0-9]{6}/;
		if(empbirth ==""){
			birthpattern = false;
			$("#error_birth").append("생년월일을 입력해주세요")
		}
		else{
			if(birthcheck.test(empbirth)){
				birthpattern = false;
				$("#error_birth").append("")
			}
			else{
				birthpattern = true;
				$("#error_birth").append("생년월일은 숫자 6자리를 입력해주세요")
			}
		}
	})
	
	$("#empsignup").click(function(){
		let empid = $("input#empid").val();
		let emppw = $("input#emppw").val();
		let emppw2 = $("input#emppw2").val();
		let empname = $("input#empname").val();
		let empphone = $("input#empphone").val();
		let empemail = $("input#empemail").val();
		let empbirth = $("#empbirth").val();
		let bhname = $("#bhname").val();
		
		$("#error_id").empty();
		$("#error_pw").empty();
		$("#error_pw2").empty();
		$("#error_name").empty();
		$("#error_phone").empty();
		$("#error_email").empty();
		$("#error_birth").empty();
		$("#error_bhname").empty();
		if (!empid){
			$("input#empid").focus();
			$("#error_id").append("아이디를 입력해주세요.");
			return false;
		}
		if(idpattern){
			$("input#empid").focus();
			$("#error_id").append("아이디는 영문 대소문자, 숫자를 포함하여 5~12자리 사이로 입력");
			return false;
		}
		if(idover){
			$("input#empid").focus();
			$("#error_id").append("중복된 아이디가 존재합니다.");
			return false;
		}
		
		if (!emppw){
			$("input#emppw").focus();
			$("#error_pw").append("비밀번호을 입력해주세요.");
			return false;
		}
		if (pwpattern){
			$("input#emppw").focus();
			$("#error_pw").append("비밀번호는 문자, 숫자, 특수문자를 포함하여 작성해주세요(최소 8 최대 15)");
			return false;
		}
		if (!emppw2 || pw2pattern){
			$("input#emppw2").focus();
			$("#error_pw2").append("비밀번호를 확인해주세요.");
			return false;
		}
		if (!empname){
			$("input#empname").focus();
			$("#error_name").append("이름을 입력해주세요.");
			return false;
		}
		if (namepattern){
			$("input#empname").focus();
			$("#error_name").append("이름은 한글만 입력 가능합니다.");
			return false;
		}
		if (!empphone){
			$("input#empphone").focus();
			$("#error_phone").append("전화번호를 입력해주세요.");
			return false;
		}
		if (phonepattern){
			$("input#userphone").focus();
			$("#error_phone").append("010-xxxx-xxxx");
			return false;
		}
		if (!empemail){
			$("input#empemail").focus();
			$("#error_email").append("이메일을 입력해주세요.");
			return false;
		}
		if (emailpattern){
			$("input#empemail").focus();
			$("#error_email").append("이메일 형식을 확인해주세요");
			return false;
		}
		if (!empbirth){
			$("input#empbirth").focus();
			$("#error_birth").append("생년월일을 선택해주세요.");
			return false;
		}
		if (birthpattern){
			$("input#empbirth").focus();
			$("#error_birth").append("생년월일은 숫자 6자리를 입력해주세요");
			return false;
		}
		if (!bhname){
			$("input#bhname").focus();
			$("#error_bhname").append("근무지명을 선택주세요.");
			return false;
		}
	})//$("#usersignup").click(function() 종료
			
	$("#findbh").click(function() {
		window.open("/findbhform", "findid", "width=600px, height=600px");
	});
});

</script>
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>