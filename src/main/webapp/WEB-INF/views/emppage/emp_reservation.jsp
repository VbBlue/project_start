<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="center btmspace-80">
<%@ include file="../emppage/emp_menu.jsp" %>
<div class="list_main">
				<div class="list_search">


					<div class="date_top">
						<h6 class="heading underline font-x2" id="h6_login">예약리스트</h6>

						<div class="date_btn_main">
							<div class="date_btn">
								<input type="button" class="emp_list_btn" id="today" value="오늘">
							</div>
							<div class="date_btn">
								<input type="button" class="emp_list_btn" id="month" value="30일">
							</div>
							<div class="date_btn">
								<input type="button" class="emp_list_btn" id="quarter" value="120일">
							</div>
						</div>


						<div class="cal">
							<div class="cal_in">
								<input type="date" id="cal1" name="cal1" max="">
							</div>
							<p>~</p>
							<div class="cal_in">
								<input type="date" id="cal2" name="cal2" max="">
							</div>
						</div>


						<div>
							<div class="search_btn">
								<input type="button"  class="page_btn" value="조회" id="page">
							</div>
						</div>
					</div>
						<table id="reslist">
							<tr id="reslist_head">
								<th>순번</th>
								<th>헌혈의집</th>
								<th>아이디</th>
								<th>예약일자</th>
								<th>예약시간</th>
								<th>기념품</th>
								<th>헌혈종류</th>
								<th>예약상태</th>
								<th>예약확정</th>
								<th>예약취소</th>
							</tr>
						</table>
					<div id="pages"></div>
				</div>
			</div>
    
    </div>
  </section>
  
</div>
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
  		$(".page_btn").click(function() {
  			$("#reslist_head").nextAll().remove();
  			$("div[id='pages']").empty();
  			var cal1 = $("#cal1").val();
  	  		var cal2 = $("#cal2").val();
  	  		var p = $(this).prop("name");
  			$.getJSON("emp_reslist", {"p":p, "cal1":cal1, "cal2":cal2}, function(data) {
  				if(data['count'] != 0) {
  	  				for(i in data['list']) {
  	  					var resdate = new Date(data['list'][i]['RESDATE']);
  	  					var year = resdate.getFullYear();
  	  					var month = ('0' + (resdate.getMonth() + 1)).slice(-2);
  	  					var day = ('0' + resdate.getDate()).slice(-2);
  	  					var dateString = year + '-' + month  + '-' + day;
  	  					$("#reslist").append("<tr><td id='data'>" +
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
  				}else if(data['count'] == 0){
  					alert(data['count']);
  					$("#reslist").append("<tr><td colspan='10'>해당 기간에 헌혈 예정이 없습니다.</td></tr>");
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
	});//ready
</script>
<%@ include file="../includes/footer.jsp" %>