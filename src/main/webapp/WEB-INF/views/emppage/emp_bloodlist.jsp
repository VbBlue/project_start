<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
    	<h6 class="heading underline font-x2">헌혈리스트</h6>
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
      			<td colspan='3' align="center"><input type="button" value="조회" id="page"></td>
      		</tr>
	     </table>
		<div id="result">
		    <table id="blist"></table>
			<div id="pages"></div>
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
  		$(".wrapper").on("click", "#page", function() {
  			$("#blist").empty();
  			$("div[id='pages']").empty();
  			var cal1 = $("#cal1").val();
  	  		var cal2 = $("#cal2").val();
  	  		var p = $(this).prop("name");
  			$.getJSON("empblist_search", {"p":p, "cal1":cal1, "cal2":cal2}, function(data) {
  				if(data['count'] != 0) {
  					$("#blist").append("<th>순번</th><th>헌혈의집</th><th>사용자아이디</th><th>헌혈일자</th><th>헌혈종류</th><th>직원아이디</th>")
  	  				for(i in data['list']) {
  	  					var resdate = new Date(data['list'][i]['BHDATE']);
  	  					var year = resdate.getFullYear();
  	  					var month = ('0' + (resdate.getMonth() + 1)).slice(-2);
  	  					var day = ('0' + resdate.getDate()).slice(-2);
  	  					var dateString = year + '-' + month  + '-' + day;
  	  					$("#blist").append("<tr><td id='data'>" + data['list'][i]['R'] + "</td><td id='data'>" + 
  	  												  data['list'][i]['BHNAME'] + "</td><td id='data'>" +
  	  												  data['list'][i]['USERID'] + "</td><td id='data'>" +
  	  												  dateString + "</td><td id='data'>" +
  	  												  data['list'][i]['BHSELECT'] + "</td><td id='data'>" +
  	  												  data['list'][i]['EMPID'] + "</td></tr>");
  	  				}
  	  				if(data['begin'] != 1) {
  	  					$("div[id='pages']").append("<a href='javascript:void(0);' id='page' name=" + (data['begin'] - 5) + ">" + "[이전]" + " " + "</a>")
  	  				}
  	  				for(i = data['begin']; i < data['end'] + 1; i++) {
  	  					$("div[id='pages']").append("<a href='javascript:void(0);' id='page' name=" + i + ">" + i + " " + "</a>");
  	  				}
  	  				if(data['count'] / 10 > data['end']) {
  	  					$("div[id='pages']").append("<a href='javascript:void(0);' id='page' name=" + (data['begin'] + 5) + ">" + "[다음]" + " " + "</a>")
  	  				}
  				}else {
  	  				$("#result").empty();
  					$("#result").text("조회내역 없음");
  	  			}
  			})//JSON
  		});//조회버튼 클릭
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>