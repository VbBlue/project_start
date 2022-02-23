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
      <h6 class="heading underline font-x2">헌혈내역</h6>
      	<table>
      		<tr>
      			<td><input type="button" id="last_year" value="작년"></td>
	      		<td><input type="button" id="this_year" value="올해"></td>
	      		<td><input type="button" id="recent_year" value="최근 1년"></td>
	      	</tr>
	      	<tr>
	      		<td align="left">기간선택</td>
	      		<td><input type="date" id="cal1" name="cal1" max=""></td>
	      		<td><input type="date" id="cal2" name="cal2" max=""></td>
      		</tr>
      		<tr>
      			<td colspan='3' align="center"><input type="button" value="조회" id="search"></td>
      		</tr>
	     </table>
	    <div id="result">
		    <table id="bloodlist"></table>
			<div id="page"></div>
	    </div>
      	
    </div>
  </section>
  <!-- 스크립트 -->
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>

  	$(function() {
  		var today = new Date().toISOString().split("T")[0];
  		$("#cal1").attr("max", today);
  		$("#cal2").attr("max", today);
  		var year = new Date();
  		var last_year = year.getFullYear()-1;
  		var this_year = year.getFullYear();
  		$("#recent_year").trigger("click");
  		$("#last_year").click(function() {
  			$("#cal1").val(new Date(last_year, 0, 2).toISOString().split("T")[0]);
  			$("#cal2").val(new Date(this_year, 0).toISOString().split("T")[0]);
  		});//last_year 버튼 클릭
  		$("#this_year").click(function() {
  	  		$("#cal1").val(new Date(this_year, 0, 2).toISOString().split("T")[0]);
  	  		$("#cal2").val(new Date(this_year + 1, 0).toISOString().split("T")[0]);
  		});//this_year 버튼 클릭
  		$("#recent_year").click(function() {
  	  		$("#cal1").val(new Date(year.setFullYear(last_year)).toISOString().split("T")[0]);
  	  		$("#cal2").val(today);
  		});//최근 1년 버튼 클릭
  		$("#recent_year").trigger("click");
  		$("#search").click(function() {
  			var userid = "${user.userid}"
  			var cal1 = $("#cal1").val();
  			var cal2 = $("#cal2").val();
  			$.getJSON("bloodlist_search", {"userid":userid, "cal1":cal1, "cal2":cal2}, function(data) {
  			if(data['count'] != 0) {
  				var pageNum = data['PageNum'];
  				var begin = data['begin'];
  				var count = data['count'];
  				var totalPages = data['totalPages'];
  				var end = data['end'];
		  		$("#page").empty();
  				for(let i = begin; i < end + 1; i++) {
  					$("#page").append("<a href='javascript:void(0);' id='first'>" + i + "</a> ");
  				}
  				if(end < totalPages) {
  					$("#page").append("<a href='javascript:void(0);' id='next'>[다음]</a>");
  				}
  				
  				$("#page").on("click", "#next", function() {
  					$("#page").empty();
  					begin += 10;
  					end = begin + 9;
  					if(end > totalPages) {
  						end = totalPages;
  					}
  	  				if(begin > pageNum) {
  	  					$("#page").append("<a href='javascript:void(0);' id='prev'>[이전]</a> ");
  	  				}
  					for(let i = begin; i < end + 1; i++) {
  						$("#page").append("<a href='javascript:void(0);' id='first'>" + i + "</a> ");
  	  				}
  	  				if(end < totalPages) {
  	  					$("#page").append("<a href='javascript:void(0);' id='next'>[다음]</a>");
  	  				}
  	  				$("#first").trigger("click");
  				})
  				
  				$("#page").on("click", "#prev", function() {
		  	  		$("#page").empty();
	  				begin -= 10;
	  				end = begin + 9;
	  				if(end > totalPages) {
	  					end = totalPages;
	  				}
	  	  			if(begin > pageNum) {
	  	  				$("#page").append("<a href='javascript:void(0);' id='prev'>[이전]</a> ");
	  	  			}
	  	  			for(let i = begin; i < end + 1; i++) {
						$("#page").append("<a href='javascript:void(0);' id='first'>" + i + "</a> ");
	  				}
	  				if(end < totalPages) {
	  					$("#page").append("<a href='javascript:void(0);' id='next'>[다음]</a>");
	  				}
	  				$("#first").trigger("click");
  				});
  				

   				$("#page").on("click", "#first" , function() {
  					$("#bloodlist").empty();
		  			$("#bloodlist").append("<th>순번</th><th>헌혈의집</th><th>헌혈날짜</th><th>헌혈종류</th>");
		  			var page = $(this).text();
		  			var i = (Number(page) - 1) * 10;
		  			var j = pageNum * Number(page);
		  			if(j > count) {
		  				j = count;
		  			}
		  			for(i - 1; i < j; i++){
						$("#bloodlist").append("<tr><td>" + (i + 1) + "</td><td>" + data['list'][i].bhname + "</td><td>" + data['list'][i].bhdate + "</td><td>" + data['list'][i].bhselect + "</td></tr>");
					}
  				});
  		  		$("#first").trigger("click");
  			}else {
  				$("#result").empty();
				$("#result").text("조회내역 없음");
  			}
  				
  			});//JSON
  		});//조회버튼 클릭
  		$("#search").trigger("click");
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