<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
	<div class="wrapper row2">
		<section class="hoc container clear">
			<div class="center btmspace-80">
				<h6 class="heading underline font-x2">예약페이지</h6>
				<form action="reservation" method="post" id="reservationform">
					<div id="comments">
						<ul>
							<li>
								<article>
									<header>
										<address>헌혈의 집 정보</address>
									</header>
									<div class="comcont">
										헌혈의 집 이름 : <input type="text" value="${bh.bhname}" name="bhname" id="bhname"
											readonly="readonly">
										헌혈의 집 위치 : <input type="text"
											value=" ${bh.bhlocation}" name="bhlocation" id="bhlocation"
											readonly="readonly">
									</div>
								</article>
							</li>
						</ul>
					</div>
					<div class="resform">
						<label>이름</label>
						<input type="text" value="${buser.username }" name="username" id="username"
								style="border: none; background-color: transparent;" readonly>
					</div>
					<div class="resform">
						<label>전화번호</label>
						<input type="text" value="${buser.userphone }"
								name="userphone" id="userphone" maxlength="13"
								style="border: none; background-color: transparent;" placeholder="010-xxxx-xxxx">
						<small  id="userphone_error" style="color: red;">
						</small>
					</div>
					<div class="resform">
						<label>나이</label>
						<input type="text" value="${userage}" name="userage" id="userage" readonly
								style="border: none; background-color: transparent;">
					</div>
					<div class="resform">
						<label>혈액형</label>
						<input type="text" value="${buser.userbtype }" name="userbtype" id="userbtype"
								style="border: none; background-color: transparent;">
						<small id="userbtype_error" style="color: red;">
						</small>
					</div>
					<div class="resform">
						<label>예약날짜</label>
						<input type="date" name="resdate" id="resdate" min="" onchange="setMinValue()"
								style="border: none; background-color: transparent;">
						<small id="resdate_error" style="color: red;">
						</small>
					</div>
					<div class="resform">
						<label>예약시간</label><br>
							<input type="radio" class="btn-check" name="restime" id="restime1" value="10:00" autocomplete="off">
							<label class="btn btn-outline-danger" for="restime1">10:00</label>
							<input type="radio" class="btn-check" name="restime" id="restime2" value="11:00" autocomplete="off">
							<label class="btn btn-outline-danger" for="restime2">11:00</label>
							<input type="radio" class="btn-check" name="restime" id="restime3" value="13:00" autocomplete="off">
							<label class="btn btn-outline-danger" for="restime3">13:00</label>
							<input type="radio" class="btn-check" name="restime" id="restime4" value="14:00" autocomplete="off">
							<label class="btn btn-outline-danger" for="restime4">14:00</label>
							<input type="radio" class="btn-check" name="restime" id="restime5" value="15:00" autocomplete="off">
							<label class="btn btn-outline-danger" for="restime5">15:00</label><br>
						<small id="restime_error" style="color: red;">
						</small>
					</div>
					<div class="resform">
						<label>기념품</label>
							<input type="radio" class="goods" id='goods' name='goods' value="영화예매권">영화예매권
							<input type="radio" class="goods" id='goods' name='goods' value="베라 기프티콘">베스킨라빈스 기프티콘<br>
						<small id="goods_error" style="color: red;">
						</small>
					</div>
					<div class="resform">
						<label>피선택</label>
							<input type="radio" class="bhselect" id='bhselect' name='bhselect' value="전혈">전혈
							<input type="radio" class="bhselect" id='bhselect' name='bhselect' value="일반헌혈">일반헌혈<br>
						<small id="bhselect_error" style="color: red;">
						</small>
					</div>
					<div class="resform">
						<label>포인트</label>
							<input type="text" value="0" name="point" id="point" readonly
							style="border: none; background-color: transparent;">
					</div>
					<input type="submit"  value="예약" id="reservation">
				</form>
			</div>
		</section>
	</div>
		<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- JAVASCRIPTS -->

<script>
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '-' + month  + '-' + day;

var dateElement = document.getElementById('resdate');
dateElement.setAttribute("min", dateString);
function setMinValue() {
    if(dateElement.value <= dateString) {
        alert('당일예약은 불가능 합니다.');
        dateElement.value = dateString;
    }
}
$(function(){
	var firstphone = $("input#userphone").val();
	var firstbtype = $("input#userbtype").val();
	var btypepattern = false;
	var phonepattern = false;
	var btypechange = false;
	var phonechange = false;
	
	$(document).on("keyup", "#userphone", function()
			{ $(this).val(
					$(this).val()
					.replace(/[^0-9]/g, "")
					.replace(/(^010)([0-9]{4})+([0-9]{4})$/,"$1-$2-$3")
					.replace("--", "-") ); 
			});
	
	$("input#userphone").keyup(function(){
		$("small#userphone_error").empty();
		var userphone = $("input#userphone").val();
		var phcheck = /(^010)([0-9]{4})+([0-9]{4})$/;
		if (phcheck.test(userphone)){
			if(userphone == firstphone){
				phonepattern = false;
				phonechange = false;
				$("small#userphone_error").append("");
			}
			else{
				phonepattern = false;
				phonechange = true;
				$("small#userphone_error").append("전화번호가 변경되었습니다.");
			}
		}
		else{
			phonepattern = true;
			phonechange = false;
			$("small#userphone_error").append("010-xxxx-xxxx");
		}
	})	//$("#userphone").keyup(function() 종료 */
	
	
	
	$("input#userbtype").keyup(function(){
		$("small#userbtype_error").empty();
		let userbtype = $("input#userbtype").val();
		if((userbtype.toLowerCase() !="a") && (userbtype.toLowerCase() !="b") && (userbtype.toLowerCase() !="o") && (userbtype.toLowerCase() !="ab")){
			btypepattern = true;
			$("small#userbtype_error").append("A,B,O,AB 중에 선택해주세요");
		}
		else{
			if(userbtype.toLowerCase() == firstbtype.toLowerCase()){
				btypepattern = false;
				$("small#userbtype_error").append("");
			}
			else{
				btypepattern = false;
				$("small#userbtype_error").append("혈액형이 변경되었습니다.");
			}
		}
	}) //$("#userbtype").keyup(function() 종료
	
	 $("#reservation").click(function(){
		let userphone = $("input#userphone").val();
		let userbtype = $("input#userbtype").val();
		let resdate = $("input#resdate").val();
		let restime = $(".btn-check").is(":checked");
		let goods = $(".goods").is(":checked");
		let bhselect = $(".bhselect").is(":checked");
		
		$("small#userphone_error").empty();
		$("small#userbtype_error").empty();
		$("small#resdate_error").empty();
		$("small#restime_error").empty();
		$("small#goods_error").empty();
		$("small#bhselect_error").empty();
		if (!userphone){
			$("input#userphone").focus();
			$("small#userphone_error").append("전화번호를 입력해주세요.");
			return false;
		}
		if (phonepattern){
			$("input#userphone").focus();
			$("small#userphone_error").append("010-xxxx-xxxx");
			return false;
		}
		
		if (!userbtype){
			$("input#userbtype").focus();
			$("small#userbtype_error").append("혈액형을 입력해주세요.");
			return false;
		}
		if (btypepattern){
			$("input#userbtype").focus();
			$("small#userbtype_error").append("A,B,O,AB 중에 선택해주세요");
			return false;
		}
		if (!resdate){
			$("small#resdate_error").append("날짜를 선택해주세요.");
			return false;
		}
		if (!restime){
			$("small#restime_error").append("시간를 선택해주세요.");
			return false;
		}
		if (!goods){
			$("small#goods_error").append("기념품를 선택해주세요.");
			return false;
		}
		if (!bhselect){
			$("small#bhselect_error").append("헌혈종류을 선택해주세요.");
			return false;
		}
		
		if(phonechange){
			$.ajax({url:"/res/phoneup", data:"userphone="+userphone, method:"get"}
			).done(function(){
				alert("비밀번호가 변경되었습니다.");
			})
		}
		
		if(btypechange){
			$.ajax({url:"/res/btypeup", data:"userbtype="+userbtype, method:"get"}
			).done(function(){
				alert("혈액형이 변경되었습니다.");
			})
		}
	})//$("#reservation").click(function() 종료
});

</script>
<%@ include file="../includes/footer.jsp" %>
