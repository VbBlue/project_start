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
      			<input type="text" id="userbirth" name="userbirth" maxlength="6">
      		</span>
      		<span class="error_next_box" id="error_birth" style="color:red;">
      		</span>
      		<h3>
      			<label for="sample6_detailAddress">주소</label>
      		</h3>
      		<span>
      			<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input class="useraddr_front" type="text" name="useraddr_front" id="sample6_address" placeholder="주소"><br>
				<input class="useraddr_back" type="text" name="useraddr_back" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	$("input#userid").keyup(function(){
		$("#error_id").empty();
		let userid = $("input#userid").val();
		let idcheck = /^(?=.*[A-Za-z])(?=.*\d)?[A-Za-z\d]{5,15}$/;
		if(userid == ""){
			idpattern = false;
			idover = false;
			$("#error_id").append("아이디를 입력해주세요")
		}
		else{
			$.ajax({url:"/useridcheck", data:"userid="+userid, dataType:"text"}
			).done(function(data){
				if(data >= 1){
					idpattern = false;
					idover = true;
					$("#error_id").append("중복된 아이디가 존재합니다.")
				}else{
					if(idcheck.test(userid)){
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
			
	$("input#userpw").keyup(function(){
		$("#error_pw").empty();
		var userpw = $("input#userpw").val();
		var pwcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
		if(userpw==""){
			pwpattern = false;
			$("#error_pw").append("비밀번호를 입력해주세요")
		}
		else{
			if(pwcheck.test(userpw)){
				pwpattern = false;
				$("#error_pw").append("")
			}
			else{
				pwpattern = true;
				$("#error_pw").append("비밀번호는 문자, 숫자, 특수문자를 포함하여 작성해주세요(최소 8 최대 15)")
			}
		}
	})
			
	
	$("#userpw2").keyup(function(){
		$("#error_pw2").empty();
		let userpw1 = $("#userpw").val();
		let userpw2 = $("#userpw2").val();
		if(userpw1 != userpw2){
			pw2pattern = true;
			$("#error_pw2").append("비밀번호가 일치하지 않습니다.")
		}else{
			pw2pattern = false;
			$("#error_pw2").append("비밀번호가 일치합니다.")
		}
	})
	
	$("#username").keyup(function(){
		$("#error_name").empty();
		let username = $("#username").val();
		let namecheck = /[가-힣]+/;
		if(username ==""){
			namepattern = false;
			$("#error_name").append("이름을 입력해주세요");
		}
		else{
			if(namecheck.test(username)){
				namepattern = false;
				$("#error_name").append("");
			}else{
				namepattern = true;
				$("#error_name").append("이름은 한글만 입력 가능합니다.");
			}
		}
	})
	
	$(document).on("keyup", "#userphone", function()
			{ $(this).val(
					$(this).val()
					.replace(/[^0-9]/g, "")
					.replace(/(^010)([0-9]{4})?([0-9]{4})$/,"$1-$2-$3")
					.replace("--", "-") ); 
			});
	
	$("input#userphone").keyup(function(){
		$("#error_phone").empty();
		var userphone = $("input#userphone").val();
		var phcheck = /(^010)([0-9]{4})+([0-9]{4})$/;
		if(userphone ==""){
			phonepattern = false;
			$("#error_phone").append("전화번호를 입력해주세요")
		}
		else{
			if(phcheck.test(userphone)){
				phonepattern = false;
				$("#error_phone").append("")
			}
			else{
				phonepattern = true;
				$("#error_phone").append("010-xxxx-xxxx")
			}
		}
	})
	$("input#useremail").keyup(function(){
		$("#error_email").empty();
		var useremail = $("input#useremail").val();
		var emailcheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/i;
		if(useremail ==""){
			emailpattern = false;
			$("#error_email").append("이메일을 입력해주세요")
		}
		else{
			if(emailcheck.test(useremail)){
				emailpattern = false;
				$("#error_email").append("")
			}
			else{
				emailpattern = true;
				$("#error_email").append("이메일 형식을 확인해주세요")
			}
		}
	})
	$("input#userbirth").keyup(function(){
		$("#error_birth").empty();
		var userbirth = $("input#userbirth").val();
		var birthcheck = /^[0-9]{6}/;
		if(userbirth ==""){
			birthpattern = false;
			$("#error_birth").append("생년월일을 입력해주세요")
		}
		else{
			if(birthcheck.test(userbirth)){
				birthpattern = false;
				$("#error_birth").append("")
			}
			else{
				birthpattern = true;
				$("#error_birth").append("생년월일은 숫자 6자리를 입력해주세요")
			}
		}
	})
	
	$("#usersignup").click(function(){
		let userid = $("input#userid").val();
		let userpw = $("input#userpw").val();
		let userpw2 = $("input#userpw2").val();
		let username = $("input#username").val();
		let userphone = $("input#userphone").val();
		let useremail = $("input#useremail").val();
		let userbtype = $(".btype-check").is(":checked");
		let userbirth = $("#userbirth").val();
		let useraddr1 = $("input.useraddr_front").val();
		let useraddr2 = $("input.useraddr_back").val();
		
		$("#error_id").empty();
		$("#error_pw").empty();
		$("#error_pw2").empty();
		$("#error_name").empty();
		$("#error_phone").empty();
		$("#error_email").empty();
		$("#error_btype").empty();
		$("#error_birth").empty();
		$("#error_addr").empty();
		if (!userid){
			$("input#userid").focus();
			$("#error_id").append("아이디를 입력해주세요.");
			return false;
		}
		if(idpattern){
			$("input#userid").focus();
			$("#error_id").append("아이디는 영문 대소문자, 숫자를 포함하여 5~12자리 사이로 입력");
			return false;
		}
		
		if(idover){
			$("input#userid").focus();
			$("#error_id").append("중복된 아이디가 존재합니다.");
			return false;
		}
		
		if (!userpw){
			$("input#userpw").focus();
			$("#error_pw").append("비밀번호을 입력해주세요.");
			return false;
		}
		if (pwpattern){
			$("input#userpw").focus();
			$("#error_pw").append("비밀번호는 문자, 숫자, 특수문자를 포함하여 작성해주세요(최소 8 최대 15)");
			return false;
		}
		if (!userpw2 || pw2pattern){
			$("input#userpw2").focus();
			$("#error_pw2").append("비밀번호를 확인해주세요.");
			return false;
		}
		if (!username){
			$("input#username").focus();
			$("#error_name").append("이름을 입력해주세요.");
			return false;
		}
		if (namepattern){
			$("input#username").focus();
			$("#error_name").append("이름은 한글만 입력 가능합니다.");
			return false;
		}
		if (!userphone){
			$("input#userphone").focus();
			$("#error_phone").append("전화번호를 입력해주세요.");
			return false;
		}
		if (phonepattern){
			$("input#userphone").focus();
			$("#error_phone").append("010-xxxx-xxxx");
			return false;
		}
		if (!useremail){
			$("input#useremail").focus();
			$("#error_email").append("이메일을 입력해주세요.");
			return false;
		}
		if (emailpattern){
			$("input#useremail").focus();
			$("#error_email").append("이메일 형식을 확인해주세요");
			return false;
		}

		if (!userbtype){
			$("input#userbtype").focus();
			$("#error_btype").append("혈액형을 선택해주세요.");
			return false;
		}
		if (!userbirth){
			$("input#userbirth").focus();
			$("#error_birth").append("생년월일을 선택해주세요.");
			return false;
		}
		if (birthpattern){
			$("input#userbirth").focus();
			$("#error_birth").append("생년월일은 숫자 6자리를 입력해주세요");
			return false;
		}
		if (!useraddr1){
			$("input.useraddr_front").focus();
			$("#error_addr").append("주소를 해주세요.");
			return false;
		}
		if (!useraddr2){
			$("input.useraddr_back").focus();
			$("#error_addr").append("상세주소를 해주세요.");
			return false;
		}
	})//$("#usersignup").click(function() 종료
			
	
});

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}; // 주소api

</script>
<!-- ################################################################################################ -->
<%@ include file="../includes/footer.jsp" %>