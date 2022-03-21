<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
	<section class="hoc container clear">
		<div class="center btmspace-80">
			<%@ include file="../mypage/mypage_menu.jsp"%>

			<div class="update_center">
				<div class="update_c">
					<form action="/mem_update" method="post">
						<div class="update_main">
							<h6 class="heading underline font-x2">
								개인정보<br>변경
							</h6>
							<div class="update_mem_div">
								<div class="update_mem_left">
									<span class="up_span">
										<label for="userid">아이디</label>
										<input value="${user.userid}" name="userid" class="update_input" readonly="readonly">
									</span>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="userpw">비밀번호</label>
										<input type="password" id="userpw" name="userpw" maxlength="15" class="update_input" placeholder="비밀번호 입력">
									</span>
									<small class="error_next_box" id="error_pw" style="color: red;">
									</small>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="username">이름</label>
										<input value="${user.username}" name="username" class="update_input" readonly="readonly">
									</span>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="userphone">전화번호</label>
										<input type="text" id="userphone" name="userphone" maxlength="13" class="update_input" maxlength="13" placeholder="전화번호 입력 010-xxxx-xxxx"><br>
									</span>
									<small class="error_next_box" id="error_phone" style="color: red;">
									</small>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="useremail">이메일</label>
										<input type="text" id="useremail" name="useremail" class="update_input" placeholder="이메일 입력"><br>
									</span>
									<small class="error_next_box" id="error_email" style="color: red;">
									</small>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="userbtype">혈액형</label>
										<span id="signup_bloodtype" style="width: 100%;">
											<div class="sign_btype-check">
												<input type="radio" class="btype-check" id="userbtype_A" name="userbtype" value="A">
												<label class="btn1" for="userbtype_A">A형</label>
											</div>
											<div class="sign_btype-check">
												<input type="radio" class="btype-check" id="userbtype_O" name="userbtype" value="O">
												<label class="btn1" for="userbtype_O">O형</label>
											</div>
											<div class="sign_btype-check">
												<input type="radio" class="btype-check" id="userbtype_B" name="userbtype" value="B">
												<label class="btn1" for="userbtype_B">B형</label>
											</div>
											<div class="sign_btype-check">
												<input type="radio" class="btype-check" id="userbtype_AB" name="userbtype" value="AB">
												<label class="btn1" for="userbtype_AB">AB형</label>
											</div>
										</span>
									</span>	
									<small class="error_next_box" id="error_btype" style="color: red;">
									</small>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="userbirth">생년월일</label>
										<input value="${userbirth}" name="userbirth" class="update_input">
									</span>
								</div>
								<div class="update_mem_left">
									<span class="up_span">
										<label for="sample6_detailAddress" class="signup_label" style="text-align: center; display: flex; flex-direction: column; align-self: center;">주소</label>
										<span style="width: 100%;">
											<div id="addr_div">
												<input type="text" id="sample6_postcode" placeholder="우편번호" class="sign_addr" readonly="readonly" style="width: 30%; margin-right: 10px;">
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="addr_button">
											</div>
											<input class="useraddr_front" type="text" name="useraddr_front" readonly="readonly" id="sample6_address" placeholder="주소" style="width: 100%">
											<input class="useraddr_back" type="text" name="useraddr_back" id="sample6_detailAddress" placeholder="상세주소" style="width: 100%">
											<input type="text" id="sample6_extraAddress" readonly="readonly" placeholder="참고항목" class="sign_addr">
										</span>
									</span>
									<small class="error_next_box" id="error_addr" style="color: red;">
									</small>
								</div>
							</div>
						</div>
						<div class="update_btn">
							<input type="submit" value="개인정보변경" id="search">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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

$(function(){
	var pwpattern = false;
	var phonepattern = false;
	var emailpattern = false;
	
	$("input#userpw").keyup(function(){
		$("#error_pw").empty();
		var userpw = $("input#userpw").val();
		var pwcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
		if(userpw==""){
			pwpattern = false;
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
	
	$("#search").click(function(){
		let userpw = $("input#userpw").val();
		let userphone = $("input#userphone").val();
		let useremail = $("input#useremail").val();
		let useraddr1 = $("input.useraddr_front").val();
		let useraddr2 = $("input.useraddr_back").val();

		$("#error_pw").empty();
		$("#error_phone").empty();
		$("#error_email").empty();
		$("#error_btype").empty();
		$("#error_addr").empty();

		if (userpw){
			if (pwpattern){
				$("input#userpw").focus();
				$("#error_pw").append("비밀번호는 문자, 숫자, 특수문자를 포함하여 작성해주세요(최소 8 최대 15)");
				return false;
			}
		}
		if (userphone){
			if (phonepattern){
				$("input#userphone").focus();
				$("#error_phone").append("010-xxxx-xxxx");
				return false;
			}
		}
		if (useremail){
			if (emailpattern){
				$("input#useremail").focus();
				$("#error_email").append("이메일 형식을 확인해주세요");
				return false;
			}
		}
		
		if(useraddr1 || useraddr2){
			$("#error_addr").append("주소를 입력 해주세요.");
			return false;
		}
		alert("수정하신 정보가 변경되었습니다.")
	})//$("#usersignup").click(function() 종료
});
</script>
<%@ include file="../includes/footer.jsp" %>