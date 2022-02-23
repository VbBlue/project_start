<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Gleblu</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <div class="fl_left"> 
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><i class="fas fa-phone rgtspace-5"></i> 이미지 바꾸고아이디?</li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
    <div class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="nospace">
        <li><a href="/"><i class="fas fa-home"></i></a></li>
        <li><a href="loginform" title="Login"><i class="fas fa-sign-in-alt"></i></a></li>
        <li><a href="signupform" title="Sign Up"><i class="fas fa-edit"></i></a></li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left"> 
      <!-- ################################################################################################ -->
      <h1><a href="/">헌혈의 집</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li class="active"><a href="/">Home</a></li>
        
        <li><a href="boardform">게시판</a></li>
        <li><a href="mapform">예약페이지</a></li>
        <li><a href="mypageform">마이페이지</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">마이페이지</h6>
      <!-- 마이페이지 내용(테이블) -->
			<table style='text-align:left;'>
				<tr>
					<td><input type='button' value='개인정보변경' id='mem_update'></td>
				</tr>
				<tr>
					<td><span id="Dday"></span><td>
				</tr>
				<tr>
					<td id="blood_cycle"><td>
				</tr>
				<tr>
					<td><input type='button' value='헌혈내역' id='bloodlist'>
				</tr>
				<tr id="reserve_stat"></tr>
				<tr>
					<td>보유 포인트: ${user.point}점</td>
					<td><input type='button' value='게임하기'></td>
				</tr>
				<tr>
					<td><input type='button' value='당첨내역' id='goodslist'></td>
				</tr>
				<tr>
					<td><input type='button' value='회원탈퇴' id='mem_delete'></td>
				</tr>
			</table>
    </div>
  </section>
  <!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var Dday = "${lastDay['Dday']}";
		var bhselect = "${lastDay['bhselect']}"
		$("#Dday").html("현재날짜 - 지난 헌혈일: " + Dday + "<br>지난 헌혈타입: " + bhselect);
		
		$.getJSON("reserv_stat", {"userid":"${user.userid}"}, function(data) {
			$("#reserve_stat").empty();
			if(data != null) {
				$("#reserve_stat").append("<td>헌혈의집: "+data.bhname+"<br>예약날짜: "+data.resdate+"<br>예약시간: "+data.restime+"<br>기념품: "+data.goods+"<br>헌혈종류: "+data.bhselect+"<br>예약상태: "+data.resstate+"</td><td><input type='button' value='예약변경' id='change'</td><td><input type='button' value='예약취소' id='cancel'></td>");
				$('#change').click(function() {
					location.href="/reservation_updateForm";
				});//예약변경 클릭
				$('#cancel').click(function() {
					window.open("/pass_chk?resnum="+data.resnum, "reservation_delete", "width=400px, height=400px");
				});//예약취소 클릭
			}else {
				$("#reserve_stat").append("<td><input type='button' value='예약하기' id='reservation'</td>")
				$('#reservation').click(function() {
					location.href="/mapform";
				});//예약하기 클릭
			}
		});//ajax
		$('#mem_update').click(function() {
			window.open("/pass_chk", "mem_update", "width=400px, height=400px");
		});//개인정보변경 클릭
		$('#mem_delete').click(function() {
			window.open("/pass_chk", "mem_delete", "width=400px, height=400px");
		});//회원탈퇴 클릭
		$('#bloodlist').click(function() {
			location.href="/bloodlist";
		});//헌혈내역 클릭
		$('#goodslist').click(function() {
			location.href="/goodslist";
		});//당첨내역 클릭
	});//ready
</script>
  </div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="one_quarter first">
      <h6 class="heading">2조</h6>
      <ul class="nospace linklist contact btmspace-30">
        <li><i class="fas fa-phone"></i> 뭘 넣죠?</li>
        <li><i class="far fa-envelope"></i> 조원 이름?</li>
      </ul>
     
    </div>
    <div class="one_quarter">
      <h6 class="heading">넣어도 되고 지워도 되고</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <p class="nospace btmspace-10"><a href="#">???</a></p>
            <time class="block font-xs" datetime="2045-04-06">완성날짜?</time>
          </article>
        </li>
      </ul>
    </div>
    
    
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">Domain Name</a></p>
    
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>