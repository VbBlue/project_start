<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
    	<h6 class="heading underline font-x2">예약리스트</h6>
    	<table>
      		<tr>
      			<td><input type="button" id="today" value="오늘"></td>
	      		<td><input type="button" id="month" value="30일"></td>
	      		<td><input type="button" id="quarter" value="120일"></td>
	      	</tr>
	      	<tr>
	      		<td align="left">기간선택</td>
	      		<td><input type="date" id="cal1" name="cal1" min=""></td>
	      		<td><input type="date" id="cal2" name="cal2" min=""></td>
      		</tr>
      		<tr>
      			<td colspan='3' align="center"><input type="button" value="조회" id="page"></td>
      		</tr>
	     </table>
		<div id="result">
			<input type='button' id='check_confirm' value='선택 예약확정'>
			<input type='button' id='check_cancel' value='선택 예약취소'>
		    <table id="reslist"></table>
			<div id="pages"></div>
	    </div>
    </div>
  </section>
<!-- 스크립트 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var date = new Date()
	  	var today = date.toISOString().split("T")[0];
	  	var year = date.getFullYear();
	  	var month = date.getMonth();
	  	var day = date.getDate();
	  	var day_30 = new Date(year, month, day+30).toISOString().split("T")[0]
	  	var day_120 = new Date(year, month, day+120).toISOString().split("T")[0]
	  	$("#cal1").attr("min", today);
	  	$("#cal2").attr("min", today);
	  	var year = new Date();
  		var last_year = year.getFullYear()-1;
  		var this_year = year.getFullYear();
  		$("#today").click(function() {
  			$("#cal1").val(today);
  			$("#cal2").val(today);
  		});//오늘 버튼 클릭
  		$("#month").click(function() {
  	  		$("#cal1").val(today);
  	  		$("#cal2").val(day_30);
  		});//30일 버튼 클릭
  		$("#quarter").click(function() {
  	  		$("#cal1").val(today);
  	  		$("#cal2").val(day_120);
  		});//최근 120일 버튼 클릭
  		$("#today").trigger("click");
  		$(".wrapper").on("click", "#page", function() {
  			$("#reslist").empty();
  			$("div[id='pages']").empty();
  			var cal1 = $("#cal1").val();
  	  		var cal2 = $("#cal2").val();
  	  		var p = $(this).prop("name");
  			$.getJSON("emp_reslist", {"p":p, "cal1":cal1, "cal2":cal2}, function(data) {
  				if(data['count'] != 0) {
  					$("#reslist").append("<th><input type='checkbox' id='all_check'></th><th>순번</th><th>헌혈의집</th><th>아이디</th><th>예약일자</th><th>예약시간</th><th>기념품</th><th>헌혈종류</th><th>예약상태</th><th>예약확정</th><th>예약취소</th>")
  	  				for(i in data['list']) {
  	  					var resdate = new Date(data['list'][i]['RESDATE']);
  	  					var year = resdate.getFullYear();
  	  					var month = ('0' + (resdate.getMonth() + 1)).slice(-2);
  	  					var day = ('0' + resdate.getDate()).slice(-2);
  	  					var dateString = year + '-' + month  + '-' + day;
  	  					$("#reslist").append("<tr><td><input type='checkbox' id='chk'></td><td id='data'>" +
  	  												  data['list'][i]['R'] + "</td><td id='data'>" + 
  	  												  data['list'][i]['BHNAME'] + "</td><td id='data'>" +
  	  												  data['list'][i]['USERID'] + "</td><td id='data'>" +
  	  												  dateString + "</td><td id='data'>" +
  	  												  data['list'][i]['RESTIME'] + "</td><td id='data'>" +
  	  												  data['list'][i]['GOODS'] + "</td><td id='data'>" +
  	  												  data['list'][i]['BHSELECT'] + "</td><td id='data'>" +
  	  												  data['list'][i]['RESSTATE'] + "</td><td style='display:None' id='resnum'>" + 
  	  												  data['list'][i]['RESNUM'] + "</td><td>" +
  	  												  "<input type='button' id='res_confirm' value='예약확정'></td><td>" +
  	  												  "<input type='button' id='res_cancel' value='예약취소'></td>");
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
		
		$("#reslist").on("click", "#res_confirm", function(data) {
			var resnum = $(this).parents("tr").find("#resnum").html();
			$.ajax({Type:"POST", url:"res_confirm", data:{"resnum":resnum}});
			alert("확정 완료");
			$("#page").trigger("click");
		});//예약확정 클릭
		$("#reslist").on("click", "#res_cancel", function() {
			var resnum = $(this).parents("tr").find("#resnum").html();
			$.ajax({Type:"POST", url:"res_cancel", data:{"resnum":resnum}});
			alert("취소 완료");
			$("#page").trigger("click");
		});//예약취소 클릭
		$("#reslist").on("click", "#all_check", function() {
			if($("#all_check").is(":checked")) {
				$("input[id='chk']").prop("checked", true);
				
			}else {
				$("input[id='chk']").prop("checked", false);
			}	
		});//체크박스 전체선택
		$("#reslist").on("click", "#data", function() {
			if($(this).parents("tr").find("#chk").is(":checked")) {
				$(this).parents("tr").find("#chk").prop("checked", false);
			}else {
				$(this).parents("tr").find("#chk").prop("checked", true);
			}
		});//체크박스 하나 선택
		$("#check_confirm").on("click", function() {
			var test = $('#reslist').find('input[id="chk"]');
			for(i = 0; i < test.length; i++) {
				if(test.eq(i).is(":checked")) {
					var resnum = $(test.eq(i)).parents("tr").find("#resnum").html();
					$.ajax({Type:"POST", url:"res_confirm", data:{"resnum":resnum}});
				}
			}
			alert("확정 완료");
			$("#page").trigger("click");
		});//선택 예약확정
		$("#check_cancel").on("click", function() {
			var test = $('#reslist').find('input[id="chk"]');
			for(i = 0; i < test.length; i++) {
				if(test.eq(i).is(":checked")) {
					var resnum = $(test.eq(i)).parents("tr").find("#resnum").html();
					$.ajax({Type:"POST", url:"res_cancel", data:{"resnum":resnum}});
				}
			}
			alert("취소 완료");
			$("#page").trigger("click");
		});//선택 예약취소
	});//ready
</script>
</div>
<%@ include file="../includes/footer.jsp" %>