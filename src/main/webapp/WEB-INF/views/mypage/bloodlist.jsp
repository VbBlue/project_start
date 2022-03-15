<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear"> 
    <div class="center btmspace-80">
      <%@ include file="../mypage/mypage_menu.jsp" %>
      <div class="list_main">
      	<table class="list_search">
      		<tr class="date">
      			<td class="date_choice" rowspan='2'>기간선택</td>
      			<td class="date_btn"><span style="width:100%; height:100%;"><input type="button" id="last_year" value="작년"></span></td>
	      		<td class="date_btn"><input type="button" id="this_year" value="올해"></td>
	      		<td class="date_btn"><input type="button" id="recent_year" value="최근 1년"></td>
	      	</tr>
	      	<tr class="cal">
	      		<td><input type="date" id="cal1" name="cal1" max=""></td>
	      		<td>~</td>
	      		<td><input type="date" id="cal2" name="cal2" max=""></td>
      		</tr>
      		<tr>
      			<td colspan='4' class="search_btn"><input type="button" value="조회" id="search"></td>
      		</tr>
	     </table>
	    <div id="result">
		    <table id="bloodlist_data"></table>
			<div id="page"></div>
	    </div>
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
  					$("#bloodlist_data").empty();
		  			$("#bloodlist_data").append("<th>순번</th><th>헌혈의집</th><th>헌혈날짜</th><th>헌혈종류</th>");
		  			var page = $(this).text();
		  			var i = (Number(page) - 1) * 10;
		  			var j = pageNum * Number(page);
		  			if(j > count) {
		  				j = count;
		  			}
		  			for(i - 1; i < j; i++){
						$("#bloodlist_data").append("<tr><td>" + (i + 1) + "</td><td>" + data['list'][i].bhname + "</td><td>" + data['list'][i].bhdate + "</td><td>" + data['list'][i].bhselect + "</td></tr>");
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
<%@ include file="../includes/footer.jsp" %>